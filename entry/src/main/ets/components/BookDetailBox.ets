
@Component
export default struct BookDetailBox {
  @Link title: string
  sub: string

  build() {
    Column(){
      Text(this.title).fontSize(22).fontWeight(FontWeight.Bold)
      Text(this.sub).fontSize(16).fontColor('#7e7e7e')
    }.alignItems(HorizontalAlign.Start)
  }
}