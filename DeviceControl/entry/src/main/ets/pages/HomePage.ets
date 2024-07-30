import { router } from '@kit.ArkUI';

@Entry
@Component
struct HomePage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Row() {
        Text('控制中心')
          .fontSize(40)
      }.height('40%')
      Column({space:40}){
        Button("灯光控制")
          .fontSize(20)
          .width(200).height(55)
          .onClick(()=> {
            setTimeout(()=>{
              router.pushUrl({
                url:"pages/LightControlPage"
              })
            })
          })
        Button("警报控制")
          .fontSize(20)
          .width(200).height(55)
          .onClick(()=> {
            setTimeout(()=>{
              router.pushUrl({
                url:"pages/AlarmControlPage"
              })
            })
          })
        Button("更多功能")
          .fontSize(20)
          .width(200).height(55)
          .onClick(()=>{
            AlertDialog.show(
              {
                title: '提示',
                message: '更多功能正在开发中',
                autoCancel: false,
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -20 },
                confirm: {
                  value: '确认',
                  action: () => {}
                }
              }
            )
          })
      }
    }.width('100%')

  }
}