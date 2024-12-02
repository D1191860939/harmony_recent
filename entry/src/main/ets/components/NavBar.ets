import router from '@ohos.router'

@Component
export struct NavBar {
  @Prop title: string = ""
  finish: () => void = () => {
    router.back()
  }

  build() {
    Row() {
      Image($r('app.media.back'))
        .width(24)
        .height(24)
        .onClick(() => {
          this.finish()
        })

      Text(this.title)
        .fontWeight(FontWeight.Medium)
        .fontSize(16)
        .fontColor(Color.Black)

      Image($r('app.media.back'))
        .width(24)
        .height(24)
        .visibility(Visibility.Hidden)
        .onClick(() => {
          this.finish()
        })
    }
    .width("100%")
    .height(44)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({left: 16, right: 16})
    .backgroundColor(Color.White)
  }
}