import { IHomePageData, IRecommendRoomItemData } from "../response/HomePageData";
import { http } from "../Index";

/**
 * 获取首页数据
 */
export function getHomeApiData(): Promise<IHomePageData> {
  return http.get<IHomePageData>("/home/info")
}

/**
 * 获取附近推荐房源
 */
export function getRecommendRoomApiData(): Promise<Array<IRecommendRoomItemData>> {
  return http.get<Array<IRecommendRoomItemData>>("/house/nearbyHouses")
}