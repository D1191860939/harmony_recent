import { getHomeApiData } from '../http/HomeApi';
import { SwiperDataSource } from '../lazyds/home/SwiperDataSource';
import { INavItem, ITileItem } from '../model/HomePageData';
import { NavList } from '../views/home/NavList';
import { SearchBar } from '../views/home/SearchBar';
import { SwiperLayout } from '../views/home/SwiperLayout';
import TileList from '../views/home/TileList';

/**
 * 首页 tab
 */
@Component
export struct Home {
  @State swiperDataSource: SwiperDataSource = new SwiperDataSource();
  @State navList: INavItem[] = []
  @State tileList: ITileItem[] = []

  async getHomeData() {
    const homePageData = await getHomeApiData();
    console.log("home data: " + JSON.stringify(homePageData));
    this.swiperDataSource.setData(homePageData.bannerList);
    this.navList = homePageData.navList;
    this.tileList = homePageData.tileList;
  }

  aboutToAppear(): void {
    this.getHomeData();
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          // 轮播图
          SwiperLayout({ bannerDataSource: this.swiperDataSource })
          // 金刚圈快速入口
          NavList({ navList: this.navList })
            .margin({ top: 24 })
          TileList({ tileList: this.tileList })
            .margin({ top: 10 })
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