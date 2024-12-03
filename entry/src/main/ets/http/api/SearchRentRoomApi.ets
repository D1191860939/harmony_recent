import { http } from "../Index";
import { SearchHouseRequest } from "../request/SearchHouseRequest";
import { ISearchHouseData, ISearchHouseItemData } from "../response/SearchHouseData";

/**
 * 搜索房源
 */
export function getFilterRentRoom(request: SearchHouseRequest): Promise<ISearchHouseData> {
  return http.get("/house/search", request)
}