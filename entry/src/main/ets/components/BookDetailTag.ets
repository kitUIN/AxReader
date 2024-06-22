@Component
export default struct BookDetailTag {
  @Link tags: string[]
  @State scrollLeft: number = 0
  private scroller: Scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Row({ space: 5 }) {
        if (this.tags.length > 0) {
          ForEach(
            this.tags,
            item => {
              Column() {
                Text(item)
                  .fontSize(14)
                  .fontColor('#9e9e9e')
              }
              .borderRadius(20)
              .padding({ left: 20, right: 20, top: 10, bottom: 10 })
              .backgroundColor('#f5f5f5')
            },
            item => item
          )
        }
      }
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .onScroll(() => {
      this.scrollLeft = this.scroller.currentOffset().xOffset
    })
  }
}