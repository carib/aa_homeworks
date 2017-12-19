var path = require('path');

module.exports = {
  entry: "./frontend/todo_redux.jsx",
  context: __dirname,
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'bundle.js',
    devtoolModuleFilenameTemplate: '[resourcePath]',
    devtoolFallbackModuleFilenameTemplate: '[resourcePath]?[hash]'
  },
    module: {
      loaders: [
        {
          test: [/\.jsx?$/],
          exclude: /(node_modules)/,
          loader: 'babel-loader',
          query: {
            presets: ['env', 'react']
          }
        }
      ]
    },
    devtool: 'source-map',
    resolve: {
      extensions: ['.js', '.jsx', '*']
    }
  };
