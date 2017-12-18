var path = require('path');

module.exports = {
  entry: "./frontend/todo_redux.jsx",
  context: __dirname,
  output: {
    filename: './bundle.js',
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
