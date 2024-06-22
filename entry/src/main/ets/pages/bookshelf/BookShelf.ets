
import HomeViewModel from '../../api/HomeViewModel'
import { Book } from '../../model/Book'


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
      Stack() {
        Column({space: 30}) {
          Stack({ alignContent: Alignment.End }) {
            Column() {
              Text("书架").height(200).fontSize(40)
            }.width("100%")

            Button("搜索")

          }.width("100%").height(200).backgroundColor("#797979")

          Flex({ wrap: FlexWrap.Wrap }) {
            if (this.books.length > 0) {
              ForEach(this.books, book => {
                Column() {
                  Image(book.img)
                  Text(book.name)
                  Text(book.author)
                }.width("30%")
              })
            }
            Button("添加book")
          }.width("80%")
        }

        // 放一个轮播图
        Stack({ alignContent: Alignment.BottomEnd }) {
          // 获取轮播的内容
          Column() {
            Text("轮播内容...").width("90%").height("40%").textAlign(TextAlign.Center)
              .alignSelf(ItemAlign.Center).backgroundColor("#f2f2f2")
          }.width("100%")
          Button("签到")
        }.width("80%").height(100)

      }
    }
  }
}