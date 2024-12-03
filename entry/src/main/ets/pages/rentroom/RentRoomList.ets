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
      SearchFilter()
      StaggerLayout()
        .layoutWeight(1)
    }
    .padding({ top: getWindowTopHeight() })
    .width("100%")
  }
}