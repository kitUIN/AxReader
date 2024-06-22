import router from '@ohos.router'
import tabBarList from '../model/TabBarList'

@Component
export default struct TabBar {
  @Prop tabBarIndex: number
  build() {
    Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
      ForEach(
        tabBarList,
        (item, index) => {
          Column({ space: 10 }) {
            Image(this.tabBarIndex === index ? item.selectIcon : item.icon).width(20)
            Text(item.title)
              .fontColor(this.tabBarIndex === index ? '#2c2c2c' : '#707070')
              .fontWeight(this.tabBarIndex === index ? '800' : '300')
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
