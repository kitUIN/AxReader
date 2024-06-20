import TabBar from '../../components/TabBar'
import { NavItemType } from '../../model/NavItem';

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

@Extend(Grid) function navStyle () {
  .width('94%')
  .height(70)
  .margin({ top: 10, left: '3%' })
  .rowsTemplate('1fr')
  .columnsTemplate('1fr 1fr')
}
@Extend(GridItem) function navItemStyle () {
  .width('94%')
  .height(70)
  .backgroundColor('#fff')
  .borderRadius(20)
}
@Entry
@Component
struct Home {
  private scroller: Scroller = new Scroller();
  private navList: NavItemType[] =  [
    { navId: '1', title: '排行榜', img: $rawfile('home/ranking.png') },
    { navId: '2', title: '完结', img: $rawfile('home/over.png') },

  ]
  @State scrollTop: number = 0


  // 排行榜 完本
  @Builder navBuilder() {
    Grid() {
      ForEach(
        this.navList,
        item => {
          GridItem(){
            Row({ space: 5 }){
              Image(item.img).width(30)
              Text(item.title).fontSize(20)
            }
          }.navItemStyle()
        },
        item => item.navId
      )
    }.navStyle()
  }

  build() {
    Column() {
      Column() {
        Scroll(this.scroller) {
          Column() {
            this.navBuilder()

          }.layoutColumnContainer()
        }.onScroll(() => {
          this.scrollTop = this.scroller.currentOffset().yOffset
        })

      }.layoutColumnContainer()

      TabBar({ tabBarIndex: 1 })
    }.fullColumnContainer()
  }
}