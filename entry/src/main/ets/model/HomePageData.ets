export interface IHomePageData {
  bannerList: IBannerData[];
  navList: INavItem[];
  tileList: ITileItem[];
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