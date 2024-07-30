import router from '@ohos.router'
import { connection, http } from '@kit.NetworkKit';
import { ArkTSUtils, JSON } from '@kit.ArkTS';
import '@system.app'
import { BusinessError } from '@kit.BasicServicesKit';


@Entry
@Component

struct Index {

  onPageShow(){
    connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
      connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
        if (error) {
          console.error(`Failed to get net capabilities. Code:${error.code}, message:${error.message}`);
          AlertDialog.show(
            {
              title: '警告',
              message: '服务器连接失败，错误：网络异常',
              autoCancel: false,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              confirm: {
                value: '确认',
                action: () => {
                  router.back()
                  setTimeout(()=>{
                    router.clear()
                  },500)
                }
              }
            }
          )
          return;
        }
        console.info("Succeeded to get data: " + JSON.stringify(data));
        let httpRequest = http.createHttp();
        httpRequest.on('headersReceive', (header) => {
          console.info('header: ' + JSON.stringify(header));
        });
        httpRequest.request(
          "http://20.78.209.54:8000/checkNetwork/",
          {
            method: http.RequestMethod.GET,
            header: {
              'Content-Type': 'application/json'
            },
            expectDataType: http.HttpDataType.STRING,
            usingCache: true,
            priority: 1,
            connectTimeout: 2000,
            readTimeout: 2000,
            usingProtocol: http.HttpProtocol.HTTP1_1,
          }, (err, data) => {
          if (!err) {
            console.info('Result:' + data.result);
            console.info('code:' + data.responseCode);
            console.info('header:' + data.header);
            console.info('cookies:' + data.cookies); // 8+

            if(data.responseCode==200){
            }
            else{
              AlertDialog.show(
                {
                  title: '警告',
                  message: '服务器连接失败,错误：'+data.responseCode,
                  autoCancel: false,
                  alignment: DialogAlignment.Bottom,
                  offset: { dx: 0, dy: -20 },
                  confirm: {
                    value: '确认',
                    action: () => {
                      router.back()
                      setTimeout(()=>{
                        router.clear()
                      },500)
                    }
                  }
                }
              )
            }

            httpRequest.off('headersReceive');
            httpRequest.destroy();
          }
          else {
            console.info('error:' + JSON.stringify(err));
            AlertDialog.show(
              {
                title: '警告',
                message: '服务器连接失败,错误：无法连接到服务器',
                autoCancel: false,
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -20 },
                confirm: {
                  value: '确认',
                  action: () => {
                    router.back()
                    setTimeout(()=>{
                      router.clear()
                    },500)
                  }
                }
              }
            )
            httpRequest.off('headersReceive');
            httpRequest.destroy();
          }
        }
        )
      })
    });

  }

  login(){
    let httpRequest = http.createHttp();
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      "http://20.78.209.54:8000/login_verify/",
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
        connectTimeout: 6000,
        readTimeout: 6000,
        usingProtocol: http.HttpProtocol.HTTP1_1,
      }, (err, data) => {
      if (!err) {
        console.info('Result:' + data.result);
        console.info('code:' + data.responseCode);
        console.info('header:' + data.header);
        console.info('cookies:' + (data.cookies)); // 8+
        let jsondata = JSON.parse((data.result as string))
        if((jsondata as object)?.["message"] == "failed")
        {
          AlertDialog.show(
            {
              title: '警告',
              message: '账户或密码错误',
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
        }else if((jsondata as object)?.["message"] == "successful")
        {
          AlertDialog.show(
            {
              title: '欢迎使用',
              message: '欢迎使用本应用',
              autoCancel: false,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              confirm: {
                value: '确认',
                action: () => {
                  setTimeout(() => {
                    router.pushUrl({
                      url: "pages/HomePage"
                    });
                    setTimeout(()=>{
                      router.clear()
                    },500);
                  });
                }
              }
            }
          );
        }
        else{
          AlertDialog.show(
            {
              title: '警告',
              message: '服务错误',
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



  build(){
    Column(){
      Row(){}.height('10%')
      Column({space:20}){
        Text('欢迎使用')
          .fontSize(40)
          .margin({top:100})
      }.height('23%')
      Column({space:40}) {
        TextInput({ placeholder: "请输入用户名" })
          .onChange((value) => {
            this.username=value
          })
        TextInput({ placeholder: "请输入密码"})
          .type(InputType.Password)
          .onChange((value) => {
            this.password=value
          })
        Row(){
          Text("注册账户")
            .width(100)
            .height(40)
            .margin({left:20,top:-20})
            .onClick(()=>{
              router.pushUrl({
                url:"pages/SignupPage"
              })
            })
        }
        .justifyContent(FlexAlign.SpaceBetween).width("100%")
        .height('9%')
      }.margin({top:70})
      .height('25%')
      .width('83%')
      Button('登录', { type: ButtonType.Capsule, stateEffect: true })
        .fontSize(20)
        .width(150).height(60)
        .onClick(()=>{
          if(this.username==""||this.password=="")
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

          }else{
            this.login()
          }
        })
      Text($r('app.string.version'))
        .margin({top:80})
        .fontSize(14)

    }
    .height('100%')
    .width('100%')

  }
}