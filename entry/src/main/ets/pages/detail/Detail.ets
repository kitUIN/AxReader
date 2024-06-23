import router from '@ohos.router'
import DetailViewModel from '../../api/DetailViewModel'
import BookDetailBox from '../../components/BookDetailBox'
import BookDetailTag from '../../components/BookDetailTag'

@Entry
@Component
struct Detail {
  @State bookId: string = router.getParams()['id']
  @State bookName: string = '' // 书名
  @State author: string = '' // 作者
  @State img: string = '' // 封面
  @State abstract: string = '' // 简介
  @State score: string = '' // 评分
  @State wordNumber: string = '' // 品牌
  @State category: string = '' // 分类
  @State tags: string[] = [] // 轮播图
  @State serialCount: string = '' // 章节数
  @State lastChapter: string = '' // 最后更新
  @State updateStatus: boolean = true // 是否连载

  aboutToAppear() {
    DetailViewModel.getProDetail(this.bookId).then(res => {
      console.log(JSON.stringify(res))
      this.bookName = res.bookName
      this.author = res.author
      this.img = res.img
      this.abstract = res.abstract
      this.score = res.score
      this.wordNumber = res.wordNumber
      this.category = res.category
      this.tags = res.tags
      this.serialCount = res.serialCount
      this.lastChapter = res.lastChapter
      this.updateStatus = res.updateStatus
    })
  }

  private scroller: Scroller = new Scroller()
  @State scrollTop: number = 0
  @State currentIndex: number = 0
  @State tabCurrentIndex: number = 0

  build() {
    Column() {
      Stack({ alignContent: Alignment.Top }) {
        Row() {
          Image($r('app.media.back')).width(24).onClick(() => router.back())
        }
        .zIndex(99)
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({ left: 10, right: 10 })
        .backgroundColor(Color.Transparent)

        Scroll(this.scroller) {
          Column() {
            Row({ space: 10 }) {
              Image(this.img).width(120).height(160)
              // 顶部
              Column({ space: 4 }) {
                Text(this.bookName)
                  .fontSize(24)
                  .maxLines(3)
                  .fontColor('#ffffff')
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(this.author)
                  .fontSize(18)
                  .fontColor('#ffffff')
                Text(this.category)
                  .fontSize(16)
                  .fontColor('#acacac')
              }.alignItems(HorizontalAlign.Start)
            }
            .padding(10)
            .width('100%')
            .alignItems(VerticalAlign.Top)

            // 信息
            Column({ space: 10 }) {
              Row() {
                BookDetailBox({ title: $wordNumber, sub: (this.updateStatus ? "连载": "完本")  })
                BookDetailBox({ title: $score, sub: "评分" })
              }
              .width('100%')
              .height(60)
              .justifyContent(FlexAlign.SpaceEvenly)

              // Tags
              BookDetailTag({ tags: $tags })
              // 简介
              Text(this.abstract)
              // 目录
              Row() {
                Text("目录")
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                Text((this.updateStatus ? "连载至 ": "已完本 ") + this.lastChapter).fontColor('#9e9e9e')
              }
              .padding({ left: 10, right: 10 })
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .padding({ top: 20, left: 10, right: 10 })
            .borderRadius({ topLeft: 20, topRight: 20 })
            .backgroundColor('#ffffff')
            .height('80%')
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }.margin({ top: 30 })
        }.layoutWeight(1).onScroll(() => {
          this.scrollTop = this.scroller.currentOffset().yOffset
        })
        .scrollBar(BarState.Off)
      }.layoutWeight(1).padding({ top: 10 })


      Row() {
        Row({ space: 4 }) {
          Image($r('app.media.add_bookshelf')).width(16)
          Text('加入书架').fontSize(14).fontColor('#515151')
        }
        .padding({ left: 4, right: 4 })
        .width(80)
        .height(50)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)

        Column() {
          Text('听书').fontSize(15).fontColor('#e9575e')
        }
        .height(34)
        .width(100)
        .margin({left:20})
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .border({ radius: 20 })
        .backgroundColor('#FFE7E7')

        Column() {
          Text('立即阅读').fontSize(16).fontColor('#ffffff')
        }
        .height(34)
        .width(120)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .border({ radius: 20 })
        .backgroundColor('#e5353f')
      }
      .padding({ left: 20, right: 20 })
      .width('100%')
      .height(50)
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height('100%')
    .backgroundColor('#59575C')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}