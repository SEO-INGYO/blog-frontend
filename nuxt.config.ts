import vuetify from 'vite-plugin-vuetify'
import { transformAssetUrls } from 'vite-plugin-vuetify'

export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },
  build: {
    transpile: ['vuetify'],
  },
  modules: [
    'vite-plugin-vuetify',
  ],
  vite: {
    plugins: [
      vuetify({ autoImport: true }),
    ],
    vue: {
      template: {
        transformAssetUrls,
      },
    },
  },
  plugins: ['~/plugins/google-analytics.ts'],
  css: ['~/assets/stylesheet/style.css']
})  