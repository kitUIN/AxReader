import HomeViewModel from '../../api/HomeViewModel'
import homeViewModel from '../../api/HomeViewModel'
import ProList from '../../components/ProList'
import TabBar from '../../components/TabBar'
import { CartItem } from '../../model/CartItem'
// import { CartLine } from '../../model/CartLine'
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

  @State cartList : CartItem[] = []
  private scroller: Scroller = new Scroller();
  @State scrollTop: number = 0
  aboutToAppear() {
    HomeViewModel.getCartLineList().then((data: CartItem[]) => {
      this.cartList = data;
    })
  }
  build() {
    Column({space: 20}) {
      Column() {
        Row() {
          Text("分类")
          // Text("111Reached~      listLength: " + this.cartList.length).width("100%").height(100)

        }.width("100%").height(50).backgroundColor("#fff").justifyContent(FlexAlign.Center);

        Scroll(this.scroller) {
          Column() {
            // Flex 貌似更好...
            Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceEvenly }) {
              // Text("Reached~      listLength: " + this.cartList.length).width("100%").height(100)
              if (this.cartList.length > 0) {
                ForEach(this.cartList, item => {
                  // Column() {
                    Row({space: 20}) {
                      Row({space: 10}) {
                        Text(item.name).fontSize(20)
                        Image(item.img).height(50)
                        // Text(item.describe)
                      }.width("100%").onClick(item.url).height(100)
                      .backgroundColor(Color.White)
                    }.width("40%").height(150)
                  // }.height(150)
                })
              }
            }
          }
        }.onScroll(() => {
          this.scrollTop = this.scroller.currentOffset().yOffset
        })
        .onScrollEdge((value) => {

        })
        //   }.height(75).backgroundColor(Color.Yellow).width(150)
        // }.height(90).justifyContent(FlexAlign.SpaceEvenly).width("100%")
      }.layoutColumnContainer()

      TabBar({tabBarIndex: 2})
    }.fullColumnContainer()
  }
}