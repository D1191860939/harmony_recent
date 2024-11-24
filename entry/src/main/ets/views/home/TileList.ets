import { ITileItem } from "../../model/HomePageData"

@Component
export default struct TileList {
  @Prop tileList: ITileItem[]

  build() {
    Row({ space: 32 }) {
      ForEach(this.tileList, (tileItem: ITileItem) => {
        Column() {
          Image(tileItem.imageURL)
            .width("100%")
            .height(58)
            .borderRadius(8)

          Row({space: 5}) {
            Text(tileItem.title)
              .fontColor($r("app.color.black"))
              .fontSize(12)
              .fontWeight(500)
            Text(tileItem.sub_title)
              .fontColor($r("app.color.gray"))
              .fontSize(10)
              .fontWeight(500)
          }
          .margin({ top: 8 })
          .alignItems(VerticalAlign.Bottom)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }, (tileItem: ITileItem) => tileItem.id.toString())
    }
  }
}