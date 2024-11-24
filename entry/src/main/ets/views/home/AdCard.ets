@Component
export struct AdCard {
  @Prop adPicture: string

  build() {
    Image(this.adPicture)
      .shadow({
        offsetX: 0,
        offsetY: 0,
        radius: 8,
        color: `rgba(0, 0, 0, 0.14)`
      })
      .objectFit(ImageFit.Fill)
      .height(61)
      .width("100%")
  }
}