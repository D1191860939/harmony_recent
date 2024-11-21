import { IBannerData } from '../../model/HomePageData'

@Component
export struct SwiperLayout {
  @Prop bannerList: IBannerData[]

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: IBannerData) => {
        Image(item.imageURL)
      }, (item: IBannerData) => item.id.toString())
    }.width("100%")
    .height(217)
    .autoPlay(true)
  }
}