import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import LoginViewModel from '../../api/LoginViewModel'
import ResponseResult from '../../model/ResponseResult'
import Constants from '../../common/Constants'


@Extend(TextInput) function inputStyle() {
  .backgroundColor('#fff')
  .placeholderColor('#cfcfcf')
  .placeholderFont({ size: 20 })
  .height(60)
  .fontSize(20)
  .borderRadius(0)
}
@Extend(Row) function rowInputStyle() {
  .width('100%')
  .height(60)
  .border({ width: { bottom: 2 }, color: "#dadada" })
}

@Extend(Text) function headerStyle() {

  .fontSize(20)
  .margin({ left: 10 })
  .fontColor('#A1A1A1')
}
@Extend(Row) function rowHeaderStyle() {

  .width('100%')
  .justifyContent(FlexAlign.Start)
  .margin({ top: 40 })
}

PersistentStorage.PersistProp('isLogin', 'false')
@Entry
@Component
struct Login {
  @StorageLink('isLogin')  isLogin: string = 'false'
  @State smsButtonText: string = "发送验证码"
  @State timer: number = 0
  @State code: string = ''
  @State phone: string = ''
  @State smsButtonEnabled: boolean = true

  aboutToAppear(){
    if (this.isLogin === 'true') {
      this.jumpToHome()
    }
  }

  clickSendSMS() {
    if (this.timer != 0) {
      return
    }
    let time = 60
    this.timer = setInterval(function(){
      this.smsButtonText = time.toString() + "秒后重试"
      time--
      if (time == 0) {
        clearInterval(this.timer)
        this.timer = 0
      }
    }.bind(this), 1000)
  }
  jumpToHome() {
    router.replaceUrl({
      url: 'pages/home/Home'
    })
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
        Text("手机号").headerStyle()
      }.rowHeaderStyle()

      Row() {
        TextInput({ placeholder: "请输入手机号码" })
          .inputStyle()
          .onChange((value) => {
            this.phone = value;
          })
      }.rowInputStyle()

      // 验证码框
      Row() {
        Text("验证码").headerStyle()
      }.rowHeaderStyle()

      Row() {
        TextInput({ placeholder: "请输入验证码" })
          .inputStyle()
          .width('50%')
          .onChange((value) => {
            this.code = value;
          })
        Button(this.smsButtonText)
          .fontColor('#a1a1a1')
          .fontSize(20)
          .backgroundColor('#00000000')
          .width('50%')
          .height('100%')
          .enabled(this.smsButtonEnabled)
          .onClick(() => this.clickSendSMS())
      }.rowInputStyle()
      .justifyContent(FlexAlign.SpaceAround)
      Row() {
        Text("登录即代表您同意")
          .fontSize(18)
          .margin({ left: 10 })

        Text("《用户与隐私协议》")
          .fontColor("#4d88ff")
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
          .onClick(() => {
            LoginViewModel.login(this.phone,this.code).then((res:ResponseResult)=>{
              if (res.code === Constants.HTTP_CODE_200) {
                promptAction.showToast({
                  message: res.msg,
                  duration: 1000
                })
                this.isLogin = 'true';
                this.jumpToHome()
              } else {
                promptAction.showToast({
                  message: res.msg,
                  duration: 2000
                })
              }

            })

          })
      }.margin({ top: 36, left: 10, right: 10 })

    }
    .margin({ top: 100 })
    .padding({ left: 20, right: 20 })
  }
}