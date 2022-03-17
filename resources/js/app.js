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
import VueSweetalert2 from "vue-sweetalert2";

// Custom components
import BaseLayoutModifier from "@/components/BaseLayoutModifier";
import BaseBlock from "@/components/BaseBlock";
import BaseBackground from "@/components/BaseBackground";
import BasePageHeading from "@/components/BasePageHeading";
import BaseNavigation from "@/components/BaseNavigation";
import BaseContentHeader from "@/components/BaseContentHeader";

// Custom directives
import clickRipple from "@/directives/clickRipple";
import toggleClass from "@/directives/toggleClass";

// Register global components
Vue.component(BaseLayoutModifier.name, BaseLayoutModifier);
Vue.component(BaseBlock.name, BaseBlock);
Vue.component(BaseBackground.name, BaseBackground);
Vue.component(BasePageHeading.name, BasePageHeading);
Vue.component(BaseNavigation.name, BaseNavigation);
Vue.component(BaseContentHeader.name, BaseContentHeader);

const options = {
  buttonsStyling: false,
  customClass: {
    confirmButton: "btn btn-success m-1",
    cancelButton: "btn btn-danger m-1",
    input: "form-control"
  }
};
Vue.use(VueSweetalert2, options);

// Register global plugins
Vue.use(BootstrapVue);
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
