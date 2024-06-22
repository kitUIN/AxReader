
import HomeViewModel from '../../api/HomeViewModel'
import { Book } from '../../model/Book'
import TabBar from '../../components/TabBar'

@Extend(Column) function layoutColumnContainer() {
  .width('100%')
  .layoutWeight(1)
  .alignItems(HorizontalAlign.Start)
}
@Entry
@Component
struct BookShelf {
  @State books: Book[] = []
  aboutToAppear() {
    HomeViewModel.getBooksOnBookShelf().then((data : Book[]) => {
      this.books = data;
    })
  }

  build() {
    Column() {
      Column() {
        Stack({ alignContent: Alignment.Top}) {
          Column() {

          }.width("100%").height(230).backgroundColor("#797979")

          Column() {
            Column({space: 5}) {
              Stack({ alignContent: Alignment.End}) {
                Column() {
                  Text("书架").height(200).fontSize(30)
                    .fontColor(Color.White)
                }.width("100%")

                Image($r("app.media.search")).height(20).margin(20)

              }.width("100%").height(200)
              Stack({ alignContent: Alignment.End }) {
                Text("当前书架 " + this.books.length + " 本书在读").width("100%").height("100%").textAlign(TextAlign.Center)
                  .alignSelf(ItemAlign.Center).backgroundColor("#f2f2f2")
                Image($r("app.media.sign")).height(30).margin({right:10})
              }.width("84%").height(50)
              Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
                if (this.books.length > 0) {
                  ForEach(this.books, book => {
                    Column() {
                      Image(book.img).height(100).borderRadius(10)
                      Text(book.name).fontSize(18).textAlign(TextAlign.Center)
                        .fontColor("#515151")
                    }.width("33%").height(150)
                  })
                }
                Column() {
                  Text("+").height(150).width("100%").backgroundColor("#f6f6f6").borderRadius(10)
                    .fontSize(50).textAlign(TextAlign.Center)
                    .fontColor("#e9e9e9")
                  // Text().fontSize(18).textAlign(TextAlign.Center)
                  //   .fontColor("#515151")
                }.width("33%").height(150)
              }.width("90%")
            }
          }
        }
      }.layoutColumnContainer()
      TabBar({tabBarIndex: 0})
    }
  }
}