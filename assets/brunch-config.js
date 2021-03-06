exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        'js/app.js': 'js/app/**/*.js',
        'js/admin.js': 'js/admin/**/*.js'
      },
      order: {
        before: [
          'js/admin/vendor/*.js'
        ]
      }
    },
    stylesheets: {
      joinTo: {
        'css/app.css': 'css/app/**/*.css',
        'css/admin.css': 'css/admin/**/*.css'
      },
      order: {
        before: [
          'css/admin/vendor/*.css',
          'css/admin/phoenix.css'
        ]
      }
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app/app"],
      "js/admin.js": ["js/admin/admin"]
    }
  },

  npm: {
    enabled: true
  }
};
