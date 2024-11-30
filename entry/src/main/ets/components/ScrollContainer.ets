import { INavColor } from '../model/INavColor';

// toolbar 滑动渐变总距离
const TOOLBAR_GRADIENT_OFFSET = 80

@Component
export struct ScrollContainer {
  @BuilderParam contentBuilder: () => void
  @BuilderParam navBuilder: ($$: INavColor) => void
  @State toolbarBgColor: ResourceColor = Color.Transparent
  @State toolbarFontColor: ResourceColor = Color.White
  private scroller = new Scroller()

  build() {
    Stack() {
      Scroll(this.scroller) {
        this.contentBuilder()
      }
      .width("100%")
      .height("100%")
      .align(Alignment.TopStart)
      .onDidScroll(() => {
        this.updateToolbarColor();
      })
      .scrollBar(BarState.Off)
      .backgroundColor($r('app.color.bg_gray_second'))

      this.navBuilder({ fontColor: this.toolbarFontColor, bgColor: this.toolbarBgColor })
    }
    .width("100%")
    .height("100%")
    .alignContent(Alignment.TopStart)
  }

  private updateToolbarColor() {
    let offset = this.scroller.currentOffset();
    let alpha = Math.min(offset.yOffset / TOOLBAR_GRADIENT_OFFSET, 1);
    this.toolbarBgColor = `rgba(255, 255, 255, ${alpha})`;
    if (alpha <= 0.05) {
      this.toolbarFontColor = Color.White;
    } else if (alpha >= 0.95) {
      this.toolbarFontColor = Color.Black;
    }
  }
}