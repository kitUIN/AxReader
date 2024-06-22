import router from '@ohos.router'

@Entry
@Component
struct Index {
  jumpToLogin() {
    router.replaceUrl({
      url: 'pages/login/Login'
    })
  }

  aboutToAppear() {
    this.jumpToLogin()
  }

  build() {
    Column()
  }
}