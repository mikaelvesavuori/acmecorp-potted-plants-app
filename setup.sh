#!/bin/sh

# Welcome
echo "Initializing a basic React boilerplate for you using React, Webpack, and Styled Components. Hang tight!"

# Create readme
echo "# acmecorp-potted-plants" >> README.md

# Initialize with npm
npm init -y

# Install dependencies
npm install react react-dom prop-types -S
npm install webpack webpack-cli webpack-dev-server @types/node @babel/core @babel/preset-env @babel/preset-react babel-loader file-loader html-loader html-webpack-plugin eslint prettier -D

# Create some basic folders and files
mkdir -p src
touch src/index.jsx
touch .env
touch .gitignore
echo 15.12.0 >> .nvmrc

# Create basic gitignore
cat << EOT > .gitignore
*.lock
.env
.env.*
.figmagicrc
/.figmagic
dist/
node_modules/
.vscode/
EOT

# Create babel config
cat << EOT > babel.config.js
module.exports = {
  presets: [
    ['@babel/preset-env', { targets: { node: 'current' } }],
    '@babel/preset-react'
  ]
};
EOT

# Create prettier config
cat << EOT > .prettierrc
{
  "useTabs": false,
  "printWidth": 100,
  "tabWidth": 2,
  "singleQuote": true,
  "trailingComma": "none"
};
EOT

# Create eslint config
cat << EOT > .eslintrc.js
{
  "env": {
    "node": true
  }
};
EOT

# Create webpack config
cat << EOT > webpack.config.js
const path = require('path');

const assetsDir = path.resolve(__dirname, 'src/assets/');
const srcDir = path.resolve(__dirname, 'src/');
const distDir = path.resolve(__dirname, 'dist');

module.exports = {
  mode: 'production',
  context: srcDir,
  entry: './index.jsx',
  output: {
    path: distDir,
    filename: 'index.js',
    publicPath: '/',
    library: {
      name: 'component-library',
      type: 'umd',
    },
  },
  externals: {
    react: "React",
    'react-dom': "ReactDOM",
    "styled-components": "styled-components",
    "prop-types": "prop-types"
  },
  resolve: {
    modules: [
      path.resolve(__dirname, 'node_modules'),
      path.resolve(__dirname, 'src'),
      path.resolve(__dirname, './')
    ],
    extensions: [
      '.js',
      '.jsx',
      '.ts',
      '.tsx',
      '.mjs',
      '.html',
      '.jpg',
      '.jpeg',
      '.svg',
      '.png',
      '.woff2',
      '.woff'
    ]
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        use: [
          {
            loader: 'babel-loader'
          }
        ],
        exclude: /node_modules/
      },
      {
        test: /\.tsx?$/,
        use: [
          {
            loader: 'ts-loader',
            options: {
              configFile: path.resolve('./tsconfig.json')
            }
          }
        ],
        exclude: /node_modules/
      },
      {
        test: /\.(jpg|jpeg|svg|png|woff2|woff)$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[path][name].[ext]',
              emitFile: false
            }
          }
        ],
        include: assetsDir,
        exclude: /node_modules/
      },
    ]
  },
  plugins: []
};
EOT

# Create HTML base
cat << EOT > src/index.html
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>React App</title>
   </head>

   <body>
      <div id="root"></div>
      <script type="text/javascript" src="app.js"></script>
   </body>
</html>
EOT

# Create React app base
cat << EOT > src/index.jsx
import React from 'react';
import ReactDOM from 'react-dom';

import { Button } from 'component-library';

ReactDOM.render(
  <React.StrictMode>
    <Button>asdf</Button>
  </React.StrictMode>,
  document.querySelector('#root')
);
EOT


# Create GitHub Actions workflow
cat << EOT > .github/workflows/main.yml
name: main

on:
  push:
    branches:
      - "main"
  pull_request:
    branches:
      - "main"

jobs:
  build-unix:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: ["ubuntu-latest"]
        node-version: [14.x]
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        id: checkout

      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}
        id: node
      - run: npm ci
      - run: npm audit fix
EOT


# Initialize Figmagic config
node ./node_modules/figmagic/build/index.js init

# Use npm link so we can use the component library locally
npm link component-library

# Initialize git repo
git init
git branch -m main

# Prompt for manual steps
cat << EOF
Nice work!

You need to do two things on your own.

1. Update your scripts block (in package.json) to contain:

"scripts": {
  "start": "npx webpack serve --mode development --open --hot",
  "build": "npx webpack --mode production"
}

2. Then add your Figmagic file ID/URL and Figma API token to the .env file that is generated for you.
For more information go to --> https://github.com/mikaelvesavuori/figmagic#running-figmagic
EOF