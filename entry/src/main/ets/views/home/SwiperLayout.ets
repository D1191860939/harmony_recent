import { SwiperDataSource } from '../../lazyds/home/SwiperDataSource'
import { IBannerData } from '../../model/HomePageData'

@Component
export struct SwiperLayout {
  @ObjectLink bannerDataSource: SwiperDataSource

  build() {
    Swiper() {
      LazyForEach(this.bannerDataSource, (item: IBannerData) => {
        Image(item.imageURL)
          .width("100%")
          .height(211)
      }, (item: IBannerData) => item.id.toString())
    }
    .autoPlay(true)
    .indicator(Indicator.dot().color('#CCCBCB').selectedColor($r('app.color.primary')))
  }
}