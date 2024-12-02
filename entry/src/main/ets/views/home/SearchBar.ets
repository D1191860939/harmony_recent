import { getWindowTopHeight } from "../../utils/SystemUtil"
import router from "@ohos.router"

@Component
export struct SearchBar {
  @Prop bgColor: ResourceColor
  @Prop fontColor: ResourceColor

  build() {
    Row({ space: 16 }) {
      Text("北京")
        .fontColor(this.fontColor)
        .fontSize(14)

      Row() {
        Image($r('app.media.search'))
          .width(18)
          .height(18)

        TextInput({ placeholder: "公司/地铁/小区，马上搜索" })
          .placeholderColor($r('app.color.gray'))
          .placeholderFont({ size: 10 })
          .fontSize(10)
          .layoutWeight(1)
          .margin({ left: 10 })
          .padding({ left: 0, right: 9 })
          .caretColor($r('app.color.gray'))
          .backgroundColor(Color.Transparent)
          .focusable(false)
          .onClick(() => {
            router.pushUrl({ url: "pages/rentroom/RentRoomList" })
          })

        Column()
          .backgroundColor("#D7D7D7")
          .width(1)
          .height(18)
          .margin({ left: 10 })

        Image($r('app.media.position'))
          .width(18)
          .height(18)
          .margin({ left: 16 })

      }
      .layoutWeight(1)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Color.White)
      .border({ color: "#D7D7D7", width: 1, radius: 52 })

      Image($r('app.media.message'))
        .width(24)
        .height(24)
        .fillColor(this.fontColor)
    }
    .width("100%")
    .height(48 + getWindowTopHeight())
    .padding({
      top: 4 + getWindowTopHeight(),
      bottom: 4,
      left: 16,
      right: 16
    })
    .backgroundColor(this.bgColor)
  }
}