import zhCN from './zh-CN.json'
import enUS from './en-US.json'
import { map } from 'lodash'
import VueI18n from 'vue-i18n'
import Vue from 'vue'

Vue.use(VueI18n)

const langKey = 'user-lang'
type Lang = 'zh-CN' | 'en-US'

export const currentLang = (localStorage.getItem(langKey) || navigator.language) as Lang
export const setLang = (lang: Lang) => {
  localStorage.setItem(langKey, lang)
  location.reload()
}

console.log(Object.fromEntries(map({
  'zh-CN': Object.fromEntries(map(zhCN, (_: string, key: string) => [key, key])),
  'en-US': enUS
}, (el: Record<string, unknown>, key: Lang) => ([key, { message: el }])) as any[]))

// Create VueI18n instance with options
export const i18n = new VueI18n({
  locale: 'zh-CN', // set locale
  messages: Object.fromEntries(map({
    'zh-CN': Object.fromEntries(map(zhCN, (_: string, key: string) => [key, key])),
    'en-US': enUS
  }, (el: Record<string, unknown>, key: Lang) => ([key, { message: el }])) as any[])
})

export const t = i18n.t
