module.exports = {
  devServer: {
    disableHostCheck: true,
  },

  chainWebpack: config => {
    config.module.rules.delete('eslint');
  },

  transpileDependencies: ['vuetify'],

  pluginOptions: {
    i18n: {
      locale: 'en',
      fallbackLocale: 'en',
      localeDir: 'locales',
      enableInSFC: false,
    },
  },
}
