import { Book } from '../model/Book'
import router from '@ohos.router'

@Extend(Column) function proListStyle() {
  .width('94%')
  .margin({ left: '3%', top: 10 })
}

@Extend(Image) function itemImage() {
  .width(100)
  .height(120)
  .backgroundColor('#acacac')
  .borderRadius(6)
}

@Extend(Column) function itemInfo() {
  .height(130)
  .width('100%')
  .padding({ top: 5, bottom: 5, left: 8, right: 8 })
  .alignItems(HorizontalAlign.Start)
}

@Component
export default struct ProList {
  @Link list: Book[]

  build() {
    Column({space:5}) {
      if (this.list.length > 0) {
        ForEach(
          this.list,
          item => {
            Row() {
              Image(item.img).itemImage()
              Column() {
                Text(item.name)
                  .fontSize(22)
                  .maxLines(1)
                  .width('80%')
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(item.author)
                  .fontColor('#5e5e5e')
                Text(item.category)
                  .fontColor('#acacac')
                Text(item.abstract)
                  .fontColor('#828282')
                  .maxLines(3)
                  .width('74%')
                  .fontSize(16)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }.itemInfo()
            }
            .padding(10)
            .width('100%')
            .backgroundColor('#fff')
            .onClick(() => {
              // 编程式跳转
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
      }
    }.proListStyle()
  }
}