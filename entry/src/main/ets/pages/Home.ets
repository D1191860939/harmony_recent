import { getHomeApiData } from "../http/HomeApi";
import { IBannerData } from "../model/HomePageData";
import { SwiperLayout } from "../views/home/SwiperLayout";

/**
 * 首页 tab
 */
@Component
export struct Home {
  @State bannerList: IBannerData[] = []

  async getHomeData() {
    const homePageData = await getHomeApiData();
    console.log("home data: " + JSON.stringify(homePageData));
    this.bannerList = homePageData.bannerList;
  }

  aboutToAppear(): void {
    this.getHomeData();
  }

  build() {
    Scroll() {
      Column() {
        SwiperLayout({ bannerList: this.bannerList })
      }
    }
    .width("100%")
    .height("100%")
    .align(Alignment.TopStart)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}