import HomeViewModel from '../../api/HomeViewModel';
import TabBar from '../../components/TabBar'
import { Banner } from '../../model/Banner';
import { Book } from '../../model/Book';
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

@Extend(Grid) function navStyle() {
  .width('94%')
  .height(70)
  .margin({ top: 10, left: '3%' })
  .rowsTemplate('1fr')
  .columnsTemplate('1fr 1fr')
}

@Extend(GridItem) function navItemStyle() {
  .width('94%')
  .height(70)
  .backgroundColor('#fff')
  .borderRadius(10)
}
@Extend(Grid) function recommendStyle() {
  .width('94%')
  .height(200)
  .margin({ top: 10, left: '3%' })
  .rowsTemplate('1fr 1fr')
  .columnsTemplate('1fr 1fr 1fr')
}
@Entry
@Component
struct Home {
  private scroller: Scroller = new Scroller();
  private navList: NavItemType[] = [
    { navId: '1', title: '排行榜', img: $rawfile('home/ranking.png') },
    { navId: '2', title: '完本', img: $rawfile('home/over.png') },
  ]
  @State bannerList: Banner[] = []
  @State recommendList: Book[] = []
  @State scrollTop: number = 0
  aboutToAppear() {
    HomeViewModel.getBannerList().then((data: Banner[]) => {
      this.bannerList = data
    })
    HomeViewModel.getRecommendList().then((data: Book[]) => {
      this.recommendList = data
    })
  }

  // 排行榜 完本
  @Builder navBuilder() {
    Grid() {
      ForEach(
        this.navList,
        item => {
          GridItem() {
            Row({ space: 5 }) {
              Image(item.img).width(28)
              Text(item.title).fontSize(20)
            }
          }.navItemStyle()
        },
        item => item.navId
      )
    }.navStyle()
  }
  // 推荐
  @Builder todayRecommendBuilder() {
    Grid() {
      ForEach(
        this.recommendList,
        item => {
          GridItem() {
            Row({ space: 5 }) {
              Image(item.img).width(50).height(60)
              Text(item.name).fontSize(20)
            }
          }
        },
        item => item.id
      )
    }.recommendStyle()
  }

  build() {
    Column() {
      Column() {
        Scroll(this.scroller) {
          Column() {
            this.navBuilder()
            this.todayRecommendBuilder()
          }.layoutColumnContainer()
        }.onScroll(() => {
          this.scrollTop = this.scroller.currentOffset().yOffset
        })

      }.layoutColumnContainer()

      TabBar({ tabBarIndex: 1 })
    }.fullColumnContainer()
  }
}