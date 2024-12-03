import { IBannerData } from '../../http/response/HomePageData';
import { BaseDataSource } from '../BaseDataSource';

@Observed
export class SwiperDataSource extends BaseDataSource<IBannerData> {
}