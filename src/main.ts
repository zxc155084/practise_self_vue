import { createApp } from 'vue'
import App from './App.vue'


// 下面是 element+ full import
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

const app = createApp(App)
app.use(ElementPlus)
app.mount('#app')
