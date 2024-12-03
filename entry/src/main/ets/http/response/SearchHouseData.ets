import { IRecommendRoomItemData } from "./HomePageData"

export interface ISearchHouseData {
  records: ISearchHouseItemData[]
  total: number
}

export interface ISearchHouseItemData extends IRecommendRoomItemData {
  activity: ISearchHouseActivityData
}

export interface ISearchHouseActivityData {
  title: string,
  textColor: string,
  textBackGroundColor: string,
  text: string,
  icon: string
}