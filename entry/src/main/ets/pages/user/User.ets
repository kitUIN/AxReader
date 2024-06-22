import TabBar from '../../components/TabBar'
@Extend(Column) function fullColumnContainer() {
  .width('100%')
  .height('100%')
  .alignItems(HorizontalAlign.Start)
  .backgroundColor('#efefef')
}

@Extend(Column) function layoutColumnContainer() {
  .width('100%')
  .layoutWeight(1)
  .alignItems(HorizontalAlign.Start)
}

@Entry
@Component
struct User {
  @State message: string = 'Hello World'

  build() {
    Column({ space: 10 }) {
      Column({space: 2}) {
        Row({space: 20}) {
          Image($r("app.media.icon")).width("15%").borderRadius(1)
            .borderStyle(BorderStyle.Solid).borderColor(Color.Grey)
          Text("186****6666").width("28%");
          Text("设置").width("30%").textAlign(TextAlign.End).fontColor(Color.Grey)
        }.width("100%").height(150).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceAround)
        Row({space: 2}) {
          Column() {
            Text("126").fontSize(30);
            Text("阅读小时").fontSize(20);
          }.width("50%").height("100%").backgroundColor(Color.White).justifyContent(FlexAlign.SpaceEvenly);

          Column() {
            Text("600").fontSize(30);
            Text("阅读积分").fontSize(20);
          }.width("50%").height("100%").backgroundColor(Color.White).justifyContent(FlexAlign.SpaceEvenly);
        }.width("100%").height(100).backgroundColor("#f2f2f2")
      }.width("100%").height(250);
      Column({space: 2}) {
        Text("\t\t\t\t邀请好友").textAlign(TextAlign.Start).fontSize(20).fontColor("#666").backgroundColor(Color.White)
          .width("100%").height("25%")
        Text("\t\t\t\t邀请好友").textAlign(TextAlign.Start).fontSize(20).fontColor("#666").backgroundColor(Color.White)
          .width("100%").height("25%")
        Text("\t\t\t\t邀请好友").textAlign(TextAlign.Start).fontSize(20).fontColor("#666").backgroundColor(Color.White)
          .width("100%").height("25%")
        Text("\t\t\t\t邀请好友").textAlign(TextAlign.Start).fontSize(20).fontColor("#666").backgroundColor(Color.White)
          .width("100%").height("25%")
      }.height(300).backgroundColor('#f2f2f2').width("100%").alignItems(HorizontalAlign.Start)
      .layoutColumnContainer()
      TabBar({ tabBarIndex: 4 })
    }.fullColumnContainer().backgroundColor("#f2f2f2")
  }
}