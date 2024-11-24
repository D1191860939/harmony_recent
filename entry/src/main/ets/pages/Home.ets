import { getHomeApiData } from '../http/HomeApi';
import { SwiperDataSource } from '../lazyds/home/SwiperDataSource';
import { SearchBar } from '../views/home/SearchBar';
import { SwiperLayout } from '../views/home/SwiperLayout';

/**
 * 首页 tab
 */
@Component
export struct Home {
  @State swiperDataSource: SwiperDataSource = new SwiperDataSource();

  async getHomeData() {
    const homePageData = await getHomeApiData();
    console.log("home data: " + JSON.stringify(homePageData));
    this.swiperDataSource.setData(homePageData.bannerList);
  }

  aboutToAppear(): void {
    this.getHomeData();
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          SwiperLayout({ bannerDataSource: this.swiperDataSource })
        }
      }
      .width("100%")
      .height("100%")
      .align(Alignment.TopStart)

      SearchBar()
    }
    .width("100%")
    .height("100%")
    .alignContent(Alignment.TopStart)
  }
}