import { IPlanItem } from "../../model/HomePageData"

@Component
export struct PlanList {
  @Prop planList: IPlanItem[]

  build() {
    Row({ space: 5 }) {
      ForEach(this.planList, (planItem: IPlanItem) => {
        Image(planItem.imageURL)
          .layoutWeight(1)
          .height("100%")
          .objectFit(ImageFit.Fill)
      }, (planItem: IPlanItem) => planItem.id.toString())
    }
    .width("100%")
    .height(60)
  }
}