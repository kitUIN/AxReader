import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import HomeViewModel from '../../api/HomeViewModel';
import ProList from '../../components/ProList';
import TabBar from '../../components/TabBar'
import { Banner } from '../../model/Banner';
import { Book } from '../../model/Book';
import { NavItemType } from '../../model/NavItem';
import { StateIcon } from '../../model/StateIcon';
import tabBarList from '../../model/TabBarList';

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

@Extend(Column) function recommendColumnContainer() {
  .width("94%")
  .margin({ top: 10, left: '3%' })
  .padding({ top: 20 })
  .alignItems(HorizontalAlign.Start)
  .backgroundColor('#fff')
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
  .width('100%')
  .height(400)
  .margin({ top: 10 })
  .rowsTemplate('1fr 1fr')
  .columnsTemplate('1fr 1fr 1fr')

}

@Extend(GridItem) function recommendItemStyle() {
  .width('94%')
  .height('100%')
}


@Extend(Swiper) function swiperStyle() {
  .width('94%')
  .height(150)
  .borderRadius(20)
  .padding({ top: 10 })
  .margin({ left: '3%' })
}

@Styles function bannerBox() {
  .width('100%')
  .height(150)
  .backgroundColor('#fff')
  .borderRadius({ topLeft: 16, topRight: 16 })
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
  @State proList: Book[] = []
  @State scrollTop: number = 0
  @State count: number = 2

  aboutToAppear() {
    HomeViewModel.getBannerList().then((data: Banner[]) => {
      this.bannerList = data
    })
    HomeViewModel.getRecommendList().then((data: Book[]) => {
      this.recommendList = data
    })
    HomeViewModel.getProList().then((data: Book[]) => {
      this.proList = data
    })
  }

  @Builder swiperBuilder() {
    Stack() {
      Swiper() {
        if (this.bannerList.length > 0) {
          ForEach(
            this.bannerList,
            item => {
              Image(item.img).width('100%').borderRadius({ topLeft: 16, topRight: 16 })
            },
            item => item.banner_id
          )
        } else {
          Row() {
          }.bannerBox()
        }
      }.swiperStyle()
    }
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
    Column({ space: 5 }) {
      Text("今日推荐")
        .fontSize(22)
        .margin({ left: 20 })

      Grid() {
        ForEach(
          this.recommendList,
          item => {
            GridItem() {
              Column({ space: 5 }) {
                Image(item.img).width(100).height(120).borderRadius(4)
                Column() {
                  Text(item.name).fontSize(17)
                }
                .width('94%')
                .height(80)
              }
            }.recommendItemStyle()
            .onClick(() => {
              router.pushUrl({
                url: 'pages/detail/Detail',
                params: {
                  id: item.id
                }
              })
            })
          },
          item => item.id
        )
      }.recommendStyle()
    }.recommendColumnContainer()

  }

  tabBarIndex: number = 1;
  @State tabBarIcon: StateIcon = new StateIcon(tabBarList[this.tabBarIndex].selectIcon)

  build() {
    Column() {
      Column() {
        Scroll(this.scroller) {
          Column() {
            this.swiperBuilder()
            this.navBuilder()
            this.todayRecommendBuilder()
            ProList({ list: $proList })
          }.layoutColumnContainer()
        }.onScroll(() => {
          this.scrollTop = this.scroller.currentOffset().yOffset
          if (this.scrollTop > 0) {
            this.tabBarIcon.src = $rawfile("home/TOP.png")
          } else if (this.scrollTop == 0) {
            this.tabBarIcon.src = tabBarList[1].selectIcon
          }
        })
        .onScrollEdge((value) => {
          if (value === 2) {
            HomeViewModel.getProList(this.count).then((data: Book[]) => {
              if (data.length === 0) {
                promptAction.showToast({
                  message: '没有更多的数据了',
                  duration: 2000
                })
              } else {
                this.proList = [...this.proList, ...data]
                this.count++
              }
            })
          }
        })
      }.layoutColumnContainer()

      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        ForEach(
          tabBarList,
          (item, index) => {
            Column({ space: 10 }) {
              Image(this.tabBarIndex === index ? this.tabBarIcon.src : item.icon).width(20)
              Text(item.title)
                .fontColor(this.tabBarIndex === index ? '#2c2c2c' : '#707070')
                .fontWeight(this.tabBarIndex === index ? '800' : '300')
            }
            .onClick(() => {
              if (item.url === tabBarList[this.tabBarIndex].url) {
                this.scroller.scrollEdge(Edge.Top)
              } else {
                router.replaceUrl({ url: item.url })
              }
            })
          },
          item => item.title
        )
      }.width('100%').height(80).backgroundColor('#fff')
    }

    .fullColumnContainer()
  }
}