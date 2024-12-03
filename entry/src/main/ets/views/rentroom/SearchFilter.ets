import { SearchFilterModel } from '../../model/RentRoomSearchData'

@Component
export struct SearchFilter {
  @State searchFilterModelList: SearchFilterModel[] = [
    new SearchFilterModel("位置"),
    new SearchFilterModel("支付方式"),
    new SearchFilterModel("租金"),
    new SearchFilterModel("排序")
  ]

  build() {
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
            .objectFit(ImageFit.Contain)
        }
      }, (model: SearchFilterModel) => model.text)
    }.padding({ left: 16, right: 16 })
    .width("100%")
    .height(44)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}