import { IHomePageData } from "../model/HomePageData";
import { http } from "./Index";


export function getHomeApiData(): Promise<IHomePageData> {
  return http.get<IHomePageData>("/home/info")
}