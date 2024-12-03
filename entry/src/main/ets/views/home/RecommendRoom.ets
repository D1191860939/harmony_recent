import { BORDER_RADIUS, PADDING } from '../../constants/Size'
import { getRecommendRoomApiData } from '../../http/api/HomeApi'
import { IRecommendItemTag, IRecommendRoomItemData } from '../../http/response/HomePageData'

@Component
export struct RecommendRoom {
  @State recommendRoomData: IRecommendRoomItemData[] = []
  getRecommendRoomData = async () => {
    this.recommendRoomData = await getRecommendRoomApiData()
  }

  aboutToAppear(): void {
    this.getRecommendRoomData()
  }

  build() {
    Column() {
      Row() {
        Text() {
          Span("周边房源")
            .fontColor($r('app.color.black'))
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Span("推荐")
            .fontColor($r('app.color.primary'))
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
        }

        Row({ space: 6 }) {
          Text("更多推荐")
            .fontColor($r("app.color.gray_second"))
            .fontSize(10)

          Image($r("app.media.arrow_right"))
            .width(4)
            .height(8)
        }

      }
      .width("100%")
      .padding({ left: PADDING, right: PADDING, top: 15 })
      .backgroundColor($r('app.color.white'))
      .justifyContent(FlexAlign.SpaceBetween)
      .height(60)

      Grid() {
        ForEach(this.recommendRoomData, (itemData: IRecommendRoomItemData) => {
          GridItem() {
            Column() {
              Stack() {
                Image(itemData.housePicture)
                  .border({ radius: { topLeft: BORDER_RADIUS, topRight: BORDER_RADIUS } })
                  .objectFit(ImageFit.Fill)
                  .width("100%")
                  .height("100%")

                Image($r('app.media.room_text_bg'))
                  .width("100%")
                  .height("100%")

                Row({ space: 4 }) {
                  Image($r("app.media.location"))
                    .width(16)
                    .height(16)

                  Text(itemData.address)
                    .fontColor($r("app.color.white"))
                    .fontSize(10)
                    .fontWeight(FontWeight.Medium)
                }
                .margin({ left: 6, bottom: 6 })
              }
              .width("100%")
              .height(120)
              .alignContent(Alignment.BottomStart)

              Column() {
                Row() {
                  Text(itemData.rentPriceListing)
                    .fontColor("#E03810")
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)

                  Text(itemData.rentPriceUnit)
                    .fontColor("#E03810")
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)

                  Blank()

                  Text(itemData.rentArea + "㎡")
                    .fontColor($r("app.color.gray"))
                    .fontSize(10)
                    .fontWeight(FontWeight.Medium)

                }.width("100%")

                Text(itemData.houseTitle)
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r("app.color.black"))
                  .fontSize(12)
                  .maxLines(1)
                  .width("100%")
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .textAlign(TextAlign.Start)
                  .margin({ top: 6 })

                Row({space: 6}) {
                  ForEach(itemData.tags.slice(0, 2), (itemTag: IRecommendItemTag, index: number) => {
                    Text(itemTag.name)
                      .fontSize(10)
                      .fontWeight(FontWeight.Medium)
                      .fontColor(index == 0 ? $r('app.color.white') : "#b3b3b3")
                      .backgroundColor(index == 0 ? $r('app.color.primary') : $r('app.color.bg_gray'))
                      .borderRadius(2)
                      .padding({
                        left: 6,
                        right: 6,
                        top: 2,
                        bottom: 2
                      })
                  }, (itemTag: IRecommendItemTag) => itemTag.name)
                }.width("100%")
                .justifyContent(FlexAlign.Start)
                .margin({top: 10})
              }.width("100%")
              .padding({
                left: 10,
                right: 10,
                bottom: 12,
                top: 12
              })
              .border({ radius: { bottomLeft: BORDER_RADIUS, bottomRight: BORDER_RADIUS } })
              .backgroundColor($r("app.color.white"))
            }
          }
        }, (item: IRecommendRoomItemData) => item.id)
      }
      .columnsTemplate("1fr 1fr")
      .columnsGap(8)
      .rowsGap(8)
      .width("100%")
      .backgroundColor($r('app.color.bg_gray'))
      .padding({ left: PADDING, right: PADDING, top: PADDING, bottom: PADDING })

    }.width("100%")
  }
}