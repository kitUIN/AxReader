@Entry
@Component
struct Login {
  @State smsButtonText: string = "发送验证码"
  @State timer: number = 0
  @State smsButtonEnabled: boolean = true


  SendSMS() {
    let time = 60
    this.timer = setInterval(function(){
      time--
      this.smsButtonText = time.toString() + "秒后重试"
      if (time <= 1) {
        clearInterval(this.timer)
      }
    }.bind(this), 1000)
  }

  build() {
    Column() {

      Row() {
        Text($r("app.string.EntryAbility_label"))
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 10 })
      }.width('100%').justifyContent(FlexAlign.Center)

      // 手机号框
      Row() {
        Text("手机号")
          .fontSize(20)
          .margin({ left: 10 })
          .fontColor('#A1A1A1')
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({ top: 40 })

      Row() {
        TextInput({ placeholder: "请输入手机号码" })
          .backgroundColor('#fff')
          .placeholderColor('#cfcfcf')
          .placeholderFont({ size: 20 })
          .height(60)
          .fontSize(20)
          .borderRadius(0)
      }
      .width('100%')
      .border({ width: { bottom: 2 }, color: "#dadada" })

      // 验证码框
      Row() {
        Text("验证码")
          .fontSize(20)
          .margin({ left: 10 })
          .fontColor('#A1A1A1')
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({ top: 40 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        TextInput({ placeholder: "请输入验证码" })
          .backgroundColor('#fff')
          .placeholderColor('#cfcfcf')
          .placeholderFont({ size: 20 })
          .height(60)
          .fontSize(20)
          .borderRadius(0)
        Button(this.smsButtonText)
          .fontColor('#a1a1a1')
          .fontSize(20)
          .backgroundColor('#00000000')
          .width('100%')
          .height('100%')
          .enabled(this.smsButtonEnabled)
          .onClick(() => this.SendSMS())
      }
      .width('100%')
      .height(60)
      .border({ width: { bottom: 2 }, color: "#dadada" })

      Row() {
        Text("登录即代表您同意")
          .fontSize(18)
          .margin({ left: 10 })

        Text("《用户与隐私协议》")
          .fontSize(18)
          .margin({ left: 10 })
      }
      .width('100%')
      .margin({ top: 20 })

      Row() {
        Button("登录", { type: ButtonType.Normal })
          .fontSize(22)
          .width('100%')
          .height(50)
          .backgroundColor('#666666')
      }.margin({ top: 36, left: 10, right: 10 })

    }
    .margin({ top: 100 })
    .padding({ left: 20, right: 20 })
  }
}