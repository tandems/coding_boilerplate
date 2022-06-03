import { resolve } from 'path'
import { defineConfig } from 'vite'
import handlebars from 'vite-plugin-handlebars'

const path = require('path')

export default defineConfig({
  root: 'src',
  server: {
    host: true,
    hmr: {
      clientPort: 8080
    }
  },
  build: {
    outDir: '../dist'
  },
  plugins: [
    handlebars({
      partialDirectory: resolve(__dirname, 'src/partials'),
      context: {
        title: 'Coding Boilerplate'
      }
    })
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src')
    }
  }
})
