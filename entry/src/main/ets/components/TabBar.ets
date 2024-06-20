
import { TabBarItem } from '../model/TabBar'
import router from '@ohos.router'
// @Preview
@Component
export default struct TabBar {
  // 新建一份底部选项卡的数据
  private tabBarList: TabBarItem[] = [

    {
      title: '书架',
      url: 'pages/bookshelf/BookShelf',
      icon: $rawfile('tabBar/bookshelf.png'),
      selectIcon: $rawfile('tabBar/bookshelf_active.png')
    },
    {
      title: '书城',
      url: 'pages/home/Home',
      icon: $rawfile('tabBar/home.png'),
      selectIcon: $rawfile('tabBar/home_active.png')
    },
    {
      title: '分类',
      url: 'pages/kind/Kind',
      icon: $rawfile('tabBar/kind.png'),
      selectIcon: $rawfile('tabBar/kind_active.png')
    },
    {
      title: '我的',
      url: 'pages/user/User',
      icon: $rawfile('tabBar/my.png'),
      selectIcon: $rawfile('tabBar/my_active.png')
    }
  ]

  @Prop tabBarIndex: number

  build () {
    Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
      ForEach(
        this.tabBarList,
        (item, index) => {
          Column({ space: 10 }) {
            Image(this.tabBarIndex === index ? item.selectIcon : item.icon).width(30)
          }
          .onClick(() => {
            router.replaceUrl({ url: item.url })
          })
        },
        item => item.title
      )
    }.width('100%').height(80).backgroundColor('#fff')
  }
}
