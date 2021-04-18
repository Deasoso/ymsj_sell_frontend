import zhCN from './zh-CN.json'
import enUS from './en-US.json'

const langKey = 'user-lang'
type Lang = 'zh-CN' | 'en-US'

export const currentLang = (localStorage.getItem(langKey) || navigator.language) as Lang
export const setLang = (lang: Lang) => {
  localStorage.setItem(langKey, lang)
  location.reload()
}

export const t = (key: string) => {
  const langFile = ({
    'zh-CN': zhCN,
  } as any)[currentLang] || enUS
  return langFile[key] || (zhCN as any)[key]
}
