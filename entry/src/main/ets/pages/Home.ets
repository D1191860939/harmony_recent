import { ScrollContainer } from '../components/ScrollContainer';
import { PADDING } from '../constants/Size';
import { getHomeApiData } from '../http/HomeApi';
import { SwiperDataSource } from '../lazyds/home/SwiperDataSource';
import { INavItem, IPlanItem, ITileItem } from '../model/HomePageData';
import { INavColor } from '../model/INavColor';
import { getWindowTopHeight } from '../utils/SystemUtil';
import { AdCard } from '../views/home/AdCard';
import { NavList } from '../views/home/NavList';
import { PlanList } from '../views/home/PlanList';
import { RecommendRoom } from '../views/home/RecommendRoom';
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
  @State planList: IPlanItem[] = []
  @State adPicture: string = ""

  async getHomeData() {
    const homePageData = await getHomeApiData();
    console.log("home data: " + JSON.stringify(homePageData));
    this.swiperDataSource.setData(homePageData.bannerList);
    this.navList = homePageData.navList;
    this.tileList = homePageData.tileList;
    this.planList = homePageData.planList;
    this.adPicture = homePageData.adPicture;
  }

  aboutToAppear(): void {
    this.getHomeData();
  }

  build() {
    ScrollContainer({
      contentBuilder: () => {
        this.contentBuilder()
      },
      navBuilder: this.navBuilder
    })
  }

  @Builder
  contentBuilder() {
    Column() {
      // 轮播图
      SwiperLayout({ bannerDataSource: this.swiperDataSource })
      Column() {
        // 金刚圈快速入口
        NavList({ navList: this.navList })
          .margin({ top: 24 })
        TileList({ tileList: this.tileList })
          .margin({ top: 10 })
        PlanList({ planList: this.planList })
          .margin({ top: 18 })
        AdCard({ adPicture: this.adPicture })
          .margin({ top: 9 })
      }
      .width("100%")
      .backgroundColor($r("app.color.white"))
      .padding({ left: PADDING, right: PADDING })

      // 推荐房源
      RecommendRoom().margin({ top: 8 })
    }
  }

  @Builder
  navBuilder($$: INavColor) {
    SearchBar({ bgColor: $$.bgColor, fontColor: $$.fontColor })
  }
}