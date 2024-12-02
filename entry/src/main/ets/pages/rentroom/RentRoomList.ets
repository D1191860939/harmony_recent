import { NavBar } from '../../components/NavBar';
import { SearchFilterModel } from '../../model/RentRoomSearchData';
import { applyStatusBarDark, getWindowTopHeight } from '../../utils/SystemUtil';

@Entry
@Component
struct RentRoomList {
  @State searchFilterModelList: SearchFilterModel[] = [
    new SearchFilterModel("位置"),
    new SearchFilterModel("支付方式"),
    new SearchFilterModel("租金"),
    new SearchFilterModel("排序")
  ]

  aboutToAppear(): void {
    applyStatusBarDark()
  }

  build() {
    Column() {
      NavBar({ title: "房源推荐" })
      Row() {
        ForEach(this.searchFilterModelList, (model: SearchFilterModel) => {
          Row({ space: 3 }) {
            Text(model.text)
              .fontWeight(FontWeight.Medium)
              .fontColor("#333333")
              .fontSize(14)
            Image($r('app.media.arrow_down_3'))
              .width(12)
              .height(12)
          }
        }, (model: SearchFilterModel) => model.text)
      }.padding({ left: 16, right: 16 })
      .width("100%")
      .height(44)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding({ top: getWindowTopHeight() })
    .width("100%")
  }
}