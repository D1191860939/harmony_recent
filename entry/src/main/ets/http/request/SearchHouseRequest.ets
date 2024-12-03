export class SearchHouseRequest {
  page: number
  limit: number
  provinceCode: string = ""
  cityCode: string = ""
  districtCode: string = ""
  minRent: string = ""
  maxRent: string = ""
  paymentType: string = ""
  orderBy: string = ""
  orderType: string = ""

  constructor(page: number, limit: number) {
    this.page = page
    this.limit = limit
  }
}