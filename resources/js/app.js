/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");

window.Vue = require("vue").default;

import router from "./router/index";
import App from "./App.vue";
import store from "./store";
require("./service/axios.service");

// Bootstrap Vue
import BootstrapVue from "bootstrap-vue";
// Custom components
import BaseLayoutModifier from "@/components/BaseLayoutModifier";
import BaseBlock from "@/components/BaseBlock";
import BaseBackground from "@/components/BaseBackground";
import BasePageHeading from "@/components/BasePageHeading";
import BaseNavigation from "@/components/BaseNavigation";

// Custom directives
import clickRipple from "@/directives/clickRipple";
import toggleClass from "@/directives/toggleClass";

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

// Register global components
Vue.component(BaseLayoutModifier.name, BaseLayoutModifier);
Vue.component(BaseBlock.name, BaseBlock);
Vue.component(BaseBackground.name, BaseBackground);
Vue.component(BasePageHeading.name, BasePageHeading);
Vue.component(BaseNavigation.name, BaseNavigation);

// Register global plugins
Vue.use(BootstrapVue);
// Vue.component(
//     "example-component",
//     require("./components/ExampleComponent.vue").default
// );

// Register global directives
Vue.directive("click-ripple", clickRipple);
Vue.directive("toggle-class", toggleClass);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
  router,
  store,
  el: "#app",
  render: h => h(App)
});
