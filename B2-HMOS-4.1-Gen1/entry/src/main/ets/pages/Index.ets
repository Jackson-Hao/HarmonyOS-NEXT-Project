@Entry
@Component
export struct MainPage {
  @State mCurrentPage: number = 0;
  mIndex:number = 0;
  private mTabController: TabsController = new TabsController()
  build() {
    //Pages entry
    Tabs({ barPosition: BarPosition.End, controller: this.mTabController }) {

      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder(0,'首页',$r('app.media.app'),$r('app.media.app_selected')))

      TabContent() {
        StorePage()
      }
      .tabBar(this.TabBuilder(1,'商城',$r('app.media.appstore'),$r('app.media.appstore_selected')))

      TabContent() {
        MyPage()
      }
      .tabBar(this.TabBuilder(2,'我的',$r('app.media.contacts'),$r('app.media.contacts_selected')))

    }
    .scrollable(true)
    .vertical(false)
    .barMode(BarMode.Fixed)
    .onChange((index) => {
      this.mCurrentPage = index;
    })

  }
  //Customize navigation bar
  @Builder
  TabBuilder(index: number,name:string,image_raw:Resource,image_selected:Resource) {
    Column() {
      Image(this.mCurrentPage === index ? image_selected:image_raw)
        .width('24vp')
        .height('24vp')
        .objectFit(ImageFit.Contain)
      Text(name)
        .fontSize(15)
        .fontWeight(500)
        .fontColor(this.mCurrentPage === index ? '#000000': '#999999')
        .margin({ top: '4vp' })
    }.justifyContent(FlexAlign.Center)
  }
}

@Component
//Page of store
struct StorePage{
  build(){
    Column(){
      Text('精品推荐')
        .fontSize(35)
      List({ space: 20, initialIndex: 0 }) {
        // Using list component to display series infomation
        this.Single_Info($r('app.media.honor_magic_v2_rsr'),"HONOR Magic v2 RSR",1,'12999','11999')
        this.Single_Info($r('app.media.honor_magicbook_x16'),'HONOR MagicBook x16',0,'6999')
        this.Single_Info($r('app.media.honor_pad_9'),'HONOR MagicPad 9',0,'3999')
        this.Single_Info($r('app.media.honor_watch_4'),'HONOR Watch 4',1,'6999','6799')
        this.Single_Info($r('app.media.honor_magic_6'),'HONOR Magic 6 Pro',1,'5999','5888')
      }.width('80%')
    }.width('100%').height('90%')
  }
  @Builder
  // Define one piece of info
  Single_Info(image:Resource,info:string,discount_status:number,price:string,after_discount?:string){
      Column({space:5}){
        Row({space:20}) {
        Image(image)
          .height('10%')
        Text(info)
          .fontSize(16)
        }.width("100%")
        .margin(5)
        if(discount_status == 0){
          Text('售价: '+price)
            .fontSize(15)
            .fontColor('#111111')
            .margin(5)
        }
        else {
          Text('原价：'+price)
            .fontSize(13)
            .fontColor('#999999')
            .fontStyle(FontStyle.Italic)
            .decoration({ type: TextDecorationType.LineThrough, color: Color.Gray })
            .margin(5)
          Text('活动价：'+after_discount)
            .fontSize(15)
            .fontColor('#111111')
            .fontWeight(FontWeight.Bold)
            .margin(5)
        }
      }
    .backgroundColor('#eeeeee')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)
    .borderRadius(10)

  }
}

@Component
//Page of Home
struct HomePage{
  private arr: number[] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
  build(){
    Column(){
      Text('最新产品')
        .fontSize(30)
      Grid(){
        ForEach(this.arr, (item:number) => {
          GridItem() {
            Text('产品：' + item)
              .width('80%').height(110).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xEEEEEE)
          }
        })
      }.rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr 1fr')
    }
  }
}

@Component
// My Page
struct MyPage{
  @State a:number = 0
  @State b:number = 0
  @State message: string = '点下面的按钮'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Button("点我")
          .width(150)
          .height(45)
          .fontWeight(30)
          .onClick(() => {
            this.a++
            this.b=(this.a)%5
            switch(this.b){
              case 1:
                this.message='遥遥领先'
                break
              case 2:
                this.message='我们继续领先'
                break
              case 3:
                this.message='领先同行超过15%'
                break
              case 4:
                this.message='遥遥领先于同行'
                break
              default:
                this.message='遥遥领先'
                break
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}