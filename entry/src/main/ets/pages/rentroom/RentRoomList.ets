import { NavBar } from '../../components/NavBar';
import { applyStatusBarDark, getWindowTopHeight } from '../../utils/SystemUtil';
import { SearchFilter } from '../../views/rentroom/SearchFilter';
import { StaggerLayout } from '../../views/rentroom/StaggerLayout';

@Entry
@Component
struct RentRoomList {
  aboutToAppear(): void {
    applyStatusBarDark()
  }

  build() {
    Column() {
      NavBar({ title: "房源推荐" })
      Stack() {
        StaggerLayout()
          .position({ top: 44 })
        SearchFilter()
      }.layoutWeight(1)
      .alignContent(Alignment.TopStart)
    }
    .padding({ top: getWindowTopHeight() })
    .width("100%")
  }
}