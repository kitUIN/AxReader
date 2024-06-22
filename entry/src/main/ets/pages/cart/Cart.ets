import TabBar from '../../components/TabBar'
@Styles function headerContainer () {
  .width('100%')
  .height(44)
  .backgroundColor('#fff')
}

@Extend(Column) function layoutColumnContainer () {
  .width('100%')
  .layoutWeight(1)
  .alignItems(HorizontalAlign.Start)
}

@Extend(Column) function fullColumnContainer () {
  .width('100%')
  .height('100%')
  .alignItems(HorizontalAlign.Start)
  .backgroundColor('#efefef')
}

@Entry
@Component

struct Cart {
  build() {

    Column({space: 20}) {
      Column() {
        Column(){
          Row() {
            Text("分类")
          }.width("100%").height(50).backgroundColor("#fff").justifyContent(FlexAlign.Center);
/*
    * ForEach(CartList, item=> {
    *   Row() {
    *     一个item代表一行的分类,
    *     一行有两个分类,
    *     每一个分类有一个img, url, name, describe
    *   }
    * })
 */
          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")

          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")

          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")

          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")

          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")

          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")

          Row() { // 元素换成图片
            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)

            Row() {

            }.height(75).backgroundColor(Color.Yellow).width(150)
          }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")
        }.layoutColumnContainer()
        TabBar({ tabBarIndex: 1 })
      }
    }.fullColumnContainer()
  }
}