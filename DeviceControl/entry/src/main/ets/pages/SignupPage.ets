import router from '@ohos.router'
import { http } from '@kit.NetworkKit';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct Register {


  register(){
    let httpRequest = http.createHttp();
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      "http://20.78.209.54:8000/regster/",
      {
        method: http.RequestMethod.POST,
        header: {
          'Content-Type': 'application/json'
        },
        extraData: {
          "username":this.username,
          "password":this.password
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: true,
        priority: 1,
        connectTimeout: 60000,
        readTimeout: 60000,
        usingProtocol: http.HttpProtocol.HTTP1_1,
      }, (err, data) => {
      if (!err) {
        console.info('Result:' + data.result);
        console.info('code:' + data.responseCode);
        console.info('header:' + data.header);
        console.info('cookies:' + data.cookies); // 8+
        let jsondata = JSON.parse(data.result as string)

        if((jsondata as object)?.["message"]=="failed")
        {
          AlertDialog.show(
            {
              title: '警告',
              message: '注册失败：用户已存在',
              autoCancel: false,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              confirm: {
                value: '确认',
                action: () => {
                }
              }
            }
          )
        }else if((jsondata as object)?.["message"]=="successful")
        {
          AlertDialog.show(
            {
              title: '提示',
              message: '注册成功',
              autoCancel: false,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              confirm: {
                value: '确认',
                action: () => {
                  setTimeout(() => {
                    router.back({
                      url: "pages/LoginPage"
                    });
                  }, 300);
                }
              }
            }
          )
        }
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁。
        httpRequest.destroy();
      }
    }
    );
  }
  @State username:string = ""
  @State password:string = ""
  @State repassword:string = ""
  build(){
    Column(){
      Row(){}.height('10%')
      Column({space:20}){
        Text('注册账户')
          .fontSize(40)
          .margin({top:50})
      }.height('20%')
      Column({space:30}) {
        TextInput({ placeholder: "请输入注册账号" })
          .onChange((value) => {
            this.username=value
          })
          .margin({top:50})
        TextInput({ placeholder: "请输入密码", text: "" })
          .type(InputType.Password)
          .onChange((value) => {
            this.password=value
          })
        TextInput({ placeholder: "请再次输入密码", text: "" })
          .type(InputType.Password)
          .onChange((value) => {
            this.repassword=value
          })
        Row(){
          Text("返回登录")
            .margin({left:10})
            .width(100)
            .height(40)
            .onClick(()=>{
              router.back({
                url:"pages/LoginPage"
              })
            })

        }
        .justifyContent(FlexAlign.SpaceBetween).width("100%")
        .height('9%')

      }
      .width('83%')
      .height('33%')
      Button('注册账户', { type: ButtonType.Capsule, stateEffect: true })
        .width(150).height(60).fontSize(20)
        .onClick(()=>{
          if(this.username==""||this.password==""||this.repassword=="")
          {
            AlertDialog.show(
              {
                title: '警告',
                message: '账户和密码不得为空',
                autoCancel: false,
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -20 },
                confirm: {
                  value: '确认',
                  action: () => {
                  }
                }
              }
            )
          }
          else if(this.password!=this.repassword)
          {
            AlertDialog.show(
              {
                title: '警告',
                message: '两次密码输入不一致',
                autoCancel: false,
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -20 },
                confirm: {
                  value: '确认',
                  action: () => {
                  }
                }
              }
            )
          }else{
            this.register()
          }


        })
        .margin({top:60})

    }

    .height('100%')
    .width('100%')

  }
}