const elementWrap = document.getElementById('wrap');

const params = new URLSearchParams(document.location.search);

const {
  width,
  height,
  animation,
  focusInput,
  autoMappingRoad,
  autoMappingJibun,
  shorthand,
  pleaseReadGuide,
  pleaseReadGuideTimer,
  maxSuggestItems,
  showModeHName,
  hideMapBtn,
  hideEngBtn,
  alwaysShowEngAddr,
  submitMode,
  useBannerLink,
  theme,
} = Object.fromEntries(params);

new daum.Postcode({
  oncomplete: function (data) {
    const msg = JSON.stringify(data);
    try {
      onComplete.postMessage(msg);
    } catch (err) { }
  },
  width: width ?? '100%',
  height: height ?? '100%',
  animation: Boolean(animation),
  focusInput: Boolean(focusInput),
  autoMappingRoad: Boolean(autoMappingRoad),
  autoMappingJibun: Boolean(autoMappingJibun),
  shorthand: Boolean(shorthand),
  pleaseReadGuide: +pleaseReadGuide,
  pleaseReadGuideTimer: +pleaseReadGuideTimer,
  maxSuggestItems: +maxSuggestItems,
  showModeHName: Boolean(showModeHName),
  hideMapBtn: Boolean(hideMapBtn),
  hideEngBtn: Boolean(hideEngBtn),
  alwaysShowEngAddr: Boolean(alwaysShowEngAddr),
  submitMode: Boolean(submitMode),
  useBannerLink: Boolean(useBannerLink),
  theme: theme ? JSON.parse(theme) : undefined,
}).embed(wrap);