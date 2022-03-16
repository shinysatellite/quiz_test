import Vue from "vue";
import store from "@/store";
import Meta from "vue-meta";
import routes from "./routes";
import Router from "vue-router";
import { sync } from "vuex-router-sync";
import alertMessage from "@/service/message.service";

Vue.use(Meta);
Vue.use(Router);

const router = createRouter();

sync(store, router);

export default router;

/**
 * Create a new router instance.
 *
 * @return {Router}
 */
function createRouter() {
  const router = new Router({
    scrollBehavior,
    mode: "history",
    routes
  });

  router.beforeEach(beforeEach);
  router.afterEach(afterEach);

  return router;
}

const isLoggedIn = () => {
  if (store.getters["auth/token"]) {
    if (!store.getters["auth/check"]) {
      store.dispatch("auth/fetchUser");
    }
    return true;
  } else {
    return false;
  }
};

const isActive = () => {
  if (store.getters["auth/active"]) {
    return true;
  } else {
    return false;
  }
};
/**
 * Global router guard.
 *
 * @param {Route} to
 * @param {Route} from
 * @param {Function} next
 */
async function beforeEach(to, from, next) {
  if (to.fullPath == "/") {
    if (!isLoggedIn()) {
      next({
        path: "/login"
      });
    } else {
      next({
        path: "/dashboard"
      });
    }
  }
  if (to.matched.some(record => record.meta.authOnly)) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    if (!isLoggedIn()) {
      next({
        path: "/login"
      });
    } else {
      if (store.getters["auth/type"] == "merchant") {
        if (to.matched.some(record => record.meta.activeOnly)) {
          if (store.getters["auth/active"]) {
            next();
          } else {
            alertMessage("error", "Please check your card");
            next({
              path: "/subscription-settings"
            });
          }
        } else {
          next();
        }
      } else {
        if (to.name == "SubscriptionSettings") {
          next({
            path: "/dashboard"
          });
        } else {
          next();
        }
      }
    }
  } else if (to.matched.some(record => record.meta.guestOnly)) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    if (isLoggedIn()) {
      next({
        path: "/dashboard"
      });
    } else {
      next();
    }
  } else {
    next(); // make sure to always call next()!
  }
}

/**
 * Global after hook.
 *
 * @param {Route} to
 * @param {Route} from
 * @param {Function} next
 */
async function afterEach(to, from, next) {}

/**
 * Scroll Behavior
 *
 * @link https://router.vuejs.org/en/advanced/scroll-behavior.html
 *
 * @param  {Route} to
 * @param  {Route} from
 * @param  {Object|undefined} savedPosition
 * @return {Object}
 */
function scrollBehavior(to, from, savedPosition) {
  if (savedPosition) {
    return savedPosition;
  }

  if (to.hash) {
    return { selector: to.hash };
  }

  const [component] = router.getMatchedComponents({ ...to }).slice(-1);

  if (component && component.scrollToTop === false) {
    return {};
  }

  return { x: 0, y: 0 };
}
