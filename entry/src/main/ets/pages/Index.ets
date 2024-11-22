import { Discover } from './Discover';
import { Home } from './Home';
import { Me } from './Me';
import { See } from './See';
import { Service } from './Service';

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0;

  build() {
    Tabs() {
      TabContent() {
        Home()
      }
      .tabBar(this.tabBarBuilder(0, "首页", $r('app.media.tabbar_home'), $r('app.media.tabbar_home_active')))

      TabContent() {
        See()
      }.tabBar(this.tabBarBuilder(1, "想看", $r('app.media.tabbar_see'), $r('app.media.tabbar_see_active')))

      TabContent() {
        Service()
      }.tabBar(this.tabBarBuilder(2, "服务", $r('app.media.tabbar_service'), $r('app.media.tabbar_service_active')))

      TabContent() {
        Discover()
      }.tabBar(this.tabBarBuilder(3, "发现", $r('app.media.tabbar_discover'), $r('app.media.tabbar_discover_active')))

      TabContent() {
        Me()
      }.tabBar(this.tabBarBuilder(4, "我的", $r('app.media.tabbar_my'), $r('app.media.tabbar_my_active')))
    }
    .barPosition(BarPosition.End)
    .barHeight(50)
    .onChange((index: number) => {
        this.currentTabIndex = index;
    })
    // .onContentWillChange((currentIndex: number, comingIndex: number) => {
    //   this.currentTabIndex = comingIndex;
    //   return true
    // })
  }

  @Builder
  tabBarBuilder(index: number, text: string, icon: Resource, selectedIcon: Resource) {
    Column() {
      Image(this.currentTabIndex == index ? selectedIcon : icon)
        .width(28)
        .height(28)

      Text(text)
        .fontSize(10)
        .fontColor(this.currentTabIndex == index ? $r('app.color.black') : $r('app.color.color_a0a0a0'))
    }
  }
}