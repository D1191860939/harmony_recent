import { SearchFilterModel } from '../../model/RentRoomSearchData'

@Component
export struct SearchFilter {
  @State searchFilterModelList: SearchFilterModel[] = [
    new SearchFilterModel("位置"),
    new SearchFilterModel("支付方式"),
    new SearchFilterModel("租金"),
    new SearchFilterModel("排序")
  ]
  @State currentFilterIndex: number = -1

  onFilterItemClick(index: number) {
    console.log("onClick currentFilterIndex " + this.currentFilterIndex + ", index = " + index)
    if (this.currentFilterIndex == index) {
      this.currentFilterIndex = -1
    } else {
      this.currentFilterIndex = index
    }
  }

  build() {
    Column() {
      Row() {
        ForEach(this.searchFilterModelList, (model: SearchFilterModel, index: number) => {
          Row({ space: 3 }) {
            Text(model.text)
              .fontWeight(FontWeight.Medium)
              .fontColor("#333333")
              .fontSize(14)
            Image(this.currentFilterIndex == index ? $r('app.media.arrow_down_3_active') : $r('app.media.arrow_down_3'))
              .width(12)
              .height(12)
              .objectFit(ImageFit.Contain)
          }.onClick(() => {
            this.onFilterItemClick(index)
          })
        }, (model: SearchFilterModel) => model.text)
      }.padding({ left: 16, right: 16 })
      .width("100%")
      .height(44)
      .justifyContent(FlexAlign.SpaceBetween)

      if (this.currentFilterIndex >= 0) {
        Column() {
          Text(this.searchFilterModelList[this.currentFilterIndex].text)
            .width("100%")
            .height(200)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)

          Row()
            .width("100%")
            .layoutWeight(1)
            .backgroundColor("#B2000000")
            .onClick(() => {
              this.onFilterItemClick(-1)
            })
        }
      }
    }
    .width("100%")
    .height(this.currentFilterIndex == -1 ? 44 : "100%")
  }
}