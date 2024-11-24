export interface IHomePageData {
  bannerList: IBannerData[];
  navList: INavItem[];
}

export interface IBannerData {
  id: number;
  name: string;
  imageURL: string;
}

export interface INavItem {
  "id": number,
  "title": string,
  "imageURL": string
}