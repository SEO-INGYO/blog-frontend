// plugins/google-analytics.ts
export default defineNuxtPlugin((nuxtApp) => {
    if (process.env.NODE_ENV === 'production') {
      nuxtApp.hook('page:finish', () => {
        if (typeof (window as any).gtag === 'function') {
          (window as any).gtag('config', 'UA-XXXXX-Y', { page_path: nuxtApp.$router.currentRoute.value.fullPath });
        }
      });
    }
  });  