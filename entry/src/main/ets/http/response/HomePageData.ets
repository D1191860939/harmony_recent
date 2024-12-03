// 首页数据

export interface IHomePageData {
  bannerList: IBannerData[];
  navList: INavItem[];
  tileList: ITileItem[];
  planList: IPlanItem[];
  adPicture: string;
}

export interface IBannerData {
  id: number;
  name: string;
  imageURL: string;
}

export interface INavItem {
  "id": number;
  "title": string;
  "imageURL": string;
}

export interface ITileItem {
  "id": number;
  "imageURL": string;
  "title": string;
  "sub_title": string;
}

export interface IPlanItem {
  "id": number,
  "imageURL": string
}

export interface IRecommendRoomItemData {
  "id": string,
  "housePicture": string,
  "tags": IRecommendItemTag[]
  "houseTitle": string,
  "address": string,
  "rentPriceUnit": string,
  "rentPriceListing": string,
  "rentArea": string
}

export interface IRecommendItemTag {
  name: string
}