import HomeViewModel from '../../api/HomeViewModel'
import homeViewModel from '../../api/HomeViewModel'
import TabBar from '../../components/TabBar'
import { CartLine } from '../../model/CartLine'
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
  @State cartLineList : CartLine[] = []

  aboutToAppear() {
    HomeViewModel.getCartLineList().then((data: CartLine[]) => {
      this.cartLineList = data;
    })
  }
  build() {
    Column({space: 20}) {
      Column() {
        Row() {
          Text("分类")
        }.width("100%").height(50).backgroundColor("#fff").justifyContent(FlexAlign.Center);

        // Flex 貌似更好...
        Row() {
          Text("Reached~      listLength: " + this.cartLineList.length)
          if (this.cartLineList.length > 0) {
            ForEach(this.cartLineList, item => {
              Column() {
                Row() {
                  Stack() {
                    Image(item.cart1.img)
                    Text(item.cart1.name)
                    Text(item.cart1.describe)
                  }.width("50%").onClick(item.cart1.url)
                  Stack() {
                    Image(item.cart2.img)
                    Text(item.cart2.name)
                    Text(item.cart2.describe)
                  }.width("50%").onClick(item.cart2.url)
                }.width("100%")
              }
            })
          }
        }
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

      // TabBar({tabBarIndex: 2})
    }.fullColumnContainer()
  }
}