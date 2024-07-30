import { connection, http } from '@kit.NetworkKit';
import { ArkTSUtils, JSON } from '@kit.ArkTS';
import router from '@ohos.router'
import { promptAction } from '@kit.ArkUI';

@Entry
@Component

struct AlarmControlPage {
  build() {
    Column(){
      Text('警报控制')
        .fontSize(40)
        .margin({top:140})
      Column({space:70}){
        Button('设置警报')
          .width(200)
          .height(60)
          .fontSize(20)
          .onClick(()=>{
            this.SendHttpRequest("ON")
            promptAction.showToast({
              message:"正在控制中……",
              duration:2000
            })
          })
        Button('解除警报')
          .width(200)
          .height(60)
          .fontSize(20)
          .onClick(()=>{
            this.SendHttpRequest("OFF")
            promptAction.showToast({
              message:"正在控制中……",
              duration:2000
            })
          })
      }.margin({top:100})
    }
    .width('100%')
  }

  SendHttpRequest(status:string){

    let httpRequest = http.createHttp();
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      "http://20.78.209.54:8000/alarm/",
      {
        method: http.RequestMethod.POST,
        header: {
          'Content-Type': 'application/json'
        },
        extraData: {
          "message":status
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
        console.info('cookies:' + (data.cookies)); // 8+
        let jsondata = JSON.parse((data.result as string))
        if((jsondata as object)?.["message"] == "failed")
        {
          AlertDialog.show({
            title: '警告',
            message: '控制失败：设备可能不在线',
            autoCancel: false,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -20 },
            confirm: {
              value: '确认',
              action: () => {}
            }
          })
        }
        else{
          AlertDialog.show({
            title: '提示',
            message: '控制成功',
            autoCancel: false,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -20 },
            confirm: {
              value: '确认',
              action: () => {}
            }
          })
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

}