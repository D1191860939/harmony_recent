export class SearchFilterModel {
  text: string
  isSelected: boolean = false

  constructor(text: string) {
    this.text = text;
  }
}