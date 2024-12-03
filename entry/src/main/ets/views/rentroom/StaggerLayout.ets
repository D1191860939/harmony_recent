import { BORDER_RADIUS } from '../../constants/Size'
import { getFilterRentRoom } from '../../http/api/SearchRentRoomApi'
import { SearchHouseRequest } from '../../http/request/SearchHouseRequest'
import { IRecommendItemTag } from '../../http/response/HomePageData'
import { ISearchHouseActivityData, ISearchHouseItemData } from '../../http/response/SearchHouseData'
import { SearchHouseDataSource } from '../../lazyds/SearchHouseDataSource'

@Component
export struct StaggerLayout {
  @State dataSource: SearchHouseDataSource = new SearchHouseDataSource()

  aboutToAppear(): void {
    this.requestData()
  }

  async requestData() {
    const filterRoomData = await getFilterRentRoom(new SearchHouseRequest(1, 20))
    this.dataSource.setData(filterRoomData.records)
  }

  getActivityText(activity: ISearchHouseActivityData): string {
    return Reflect.get(activity, "#text")
  }

  build() {
    WaterFlow() {
      FlowItem().width("100%")
        .height(8)
      FlowItem().width("100%")
        .height(8)
      LazyForEach(this.dataSource, (item: ISearchHouseItemData) => {
        FlowItem() {
          Column() {
            if (item.activity) {
              Column({ space: 3 }) {
                Row({ space: 4 }) {
                  Image(item.activity.icon)
                    .width(26)
                    .height(26)

                  Text(item.activity.title)
                    .fontWeight(700)
                    .fontColor(Color.Black)
                    .fontSize(14)
                }

                Text(this.getActivityText(item.activity))
                  .fontSize(12)
                  .fontColor(item.activity.textColor)
                  .backgroundColor(item.activity.textBackGroundColor)
              }
              .width("100%")
              .alignItems(HorizontalAlign.Start)
              .padding({ top: 12, bottom: 5 })
            }

            Stack() {
              Image(item.housePicture)
                .border({
                  radius: {
                    topLeft: BORDER_RADIUS,
                    topRight: BORDER_RADIUS,
                    bottomLeft: item.activity ? BORDER_RADIUS : 0,
                    bottomRight: item.activity ? BORDER_RADIUS : 0
                  }
                })
                .objectFit(ImageFit.Fill)
                .width("100%")
                .height("100%")

              Image($r('app.media.room_text_bg'))
                .width("100%")
                .height("100%")
                .border({
                  radius: {
                    bottomLeft: item.activity ? BORDER_RADIUS : 0,
                    bottomRight: item.activity ? BORDER_RADIUS : 0
                  }
                })

              Row({ space: 4 }) {
                Image($r("app.media.location"))
                  .width(16)
                  .height(16)

                Text(item.address)
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
                Text(item.rentPriceListing)
                  .fontColor("#E03810")
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)

                Text(item.rentPriceUnit)
                  .fontColor("#E03810")
                  .fontSize(12)
                  .fontWeight(FontWeight.Medium)

                Blank()

                Text(item.rentArea + "㎡")
                  .fontColor($r("app.color.gray"))
                  .fontSize(10)
                  .fontWeight(FontWeight.Medium)

              }.width("100%")

              Text(item.houseTitle)
                .fontWeight(FontWeight.Medium)
                .fontColor($r("app.color.black"))
                .fontSize(12)
                .maxLines(1)
                .width("100%")
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .textAlign(TextAlign.Start)
                .margin({ top: 6 })

              Row({ space: 6 }) {
                ForEach(item.tags.slice(0, 2), (itemTag: IRecommendItemTag, index: number) => {
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
              .margin({ top: 10 })
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
          .backgroundColor(Color.White)
          .borderRadius(8)
          .padding({ left: item.activity ? 10 : 0, right: item.activity ? 10 : 0 })
        }.width("100%")

      }, (item: ISearchHouseItemData) => item.id)
    }
    .width("100%")
    .height("100%")
    .columnsTemplate("1fr 1fr")
    .columnsGap(8)
    .rowsGap(8)
    .padding({ left: 16, right: 16 })
    .backgroundColor($r('app.color.bg_gray'))
  }
}