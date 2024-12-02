import { INavColor } from '../model/INavColor';
import { window } from '@kit.ArkUI';

// toolbar 滑动渐变总距离
const TOOLBAR_GRADIENT_OFFSET = 80

@Component
export struct ScrollContainer {
  @BuilderParam contentBuilder: () => void
  @BuilderParam navBuilder: ($$: INavColor) => void
  @State toolbarBgColor: string = `rgba(255, 255, 255, 0)`
  @State toolbarFontColor: string = `rgba(255, 255, 255, 1)`
  private scroller = new Scroller()
  setWindowStatusColor = async (offsetPercent: number) => {
    const windowClass = await window.getLastWindow(getContext())
    this.checkOffset(offsetPercent, () => {
      windowClass.setWindowSystemBarProperties({
        statusBarColor: "#00FFFFFF",
        statusBarContentColor: "#FFFFFFFF"
      })
    }, () => {
      windowClass.setWindowSystemBarProperties({
        statusBarColor: "#FFFFFFFF",
        statusBarContentColor: "#FF000000"
      })
    })
  }

  build() {
    Stack() {
      Scroll(this.scroller) {
        this.contentBuilder()
      }
      .width("100%")
      .height("100%")
      .align(Alignment.TopStart)
      .onDidScroll(() => {
        this.onScroll();
      })
      .scrollBar(BarState.Off)
      .backgroundColor($r('app.color.bg_gray_second'))

      this.navBuilder({ fontColor: this.toolbarFontColor, bgColor: this.toolbarBgColor })
    }
    .width("100%")
    .height("100%")
    .alignContent(Alignment.TopStart)
  }

  private onScroll() {
    const offsetPercent = Math.min(this.scroller.currentOffset().yOffset / TOOLBAR_GRADIENT_OFFSET, 1);
    this.updateToolbarColor(offsetPercent);
    this.setWindowStatusColor(offsetPercent);
  }

  private updateToolbarColor(offsetPercent: number) {
    this.toolbarBgColor = `rgba(255, 255, 255, ${offsetPercent})`;
    this.checkOffset(offsetPercent, () => {
      this.toolbarFontColor = `rgba(255, 255, 255, 1)`;
    }, () => {
      this.toolbarFontColor = `rgba(0, 0, 0, 1)`
    })
  }

  private checkOffset(offsetPercent: number, reachTop: () => void, reachEnd: () => void) {
    if (offsetPercent <= 0.05) {
      reachTop()
    } else if (offsetPercent >= 0.95) {
      reachEnd()
    }
  }
}