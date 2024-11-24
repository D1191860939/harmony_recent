import { INavItem } from '../../model/HomePageData'

@Component
export struct NavList {
  @Prop navList: INavItem[]

  build() {
    Grid() {
      ForEach(this.navList, (item: INavItem) => {
        GridItem() {
          Column({ space: 8 }) {
            Image(item.imageURL)
              .width("100%")
              .height(56)
              .objectFit(ImageFit.Fill)
              .borderRadius(4)

            Text(item.title)
              .fontColor($r('app.color.black'))
              .fontWeight(500)
              .fontSize(12)
          }
        }
      }, (item: INavItem) => item.id.toString())
    }
    .width("100%")
    .rowsGap(14)
    .columnsGap(32)
    .padding({ left: 16, right: 16 })
    .columnsTemplate("1fr 1fr 1fr 1fr")
  }
}