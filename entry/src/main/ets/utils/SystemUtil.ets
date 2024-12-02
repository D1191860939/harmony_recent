import { StorageKey } from "../constants/StorageKey"
import { window } from "@kit.ArkUI"

export const getWindowTopHeight = () => {
  return px2vp(AppStorage.get(StorageKey.STATUSBAR_HEIGHT.valueOf()) as number || 0)
}

export const getWindowBottomHeight = () => {
  return px2vp(AppStorage.get(StorageKey.NAV_BOTTOM_HEIGHT.valueOf()) as number || 0)
}

export const applyStatusBarDark = async () => {
  const windowClass = await window.getLastWindow(getContext())
  windowClass.setWindowSystemBarProperties({
    statusBarColor: "#FFFFFFFF",
    statusBarContentColor: "#FF000000"
  })
}