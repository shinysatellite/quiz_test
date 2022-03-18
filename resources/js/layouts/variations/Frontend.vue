<template>
  <div
    id="page-container"
    class="enable-page-overlay page-header-fixed side-trans-enabled side-scroll"
  >
    <!-- Page Loader -->
    <div
      id="page-loader"
      :class="{ show: $store.state.settings.pageLoader }"
    ></div>
    <!-- END Page Loader -->

    <!-- Header -->
    <base-header v-if="$store.state.layout.header">
      <slot name="header"></slot>
    </base-header>
    <!-- END Header -->

    <div id="main-container">
      <slot name="content"></slot>
      <transition name="fade" mode="out-in">
        <router-view></router-view>
      </transition>
    </div>

    <!-- END Main Container -->
  </div>
</template>

<style lang="scss">
// Custom router view transition
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>

<script>
// Import main layout components
import BaseHeader from "@/layouts/partials/Header";
import BaseFooter from "@/layouts/partials/Footer";

export default {
  name: "BaseLayout",
  components: {
    BaseHeader,
    BaseFooter
  },
  props: {
    layoutClasses: Object
  },
  computed: {
    classContainer() {
      return {
        "sidebar-r":
          this.$store.state.layout.sidebar &&
          !this.$store.state.settings.sidebarLeft,
        "sidebar-mini":
          this.$store.state.layout.sidebar &&
          this.$store.state.settings.sidebarMini,
        "sidebar-o":
          this.$store.state.layout.sidebar &&
          this.$store.state.settings.sidebarVisibleDesktop,
        "sidebar-o-xs":
          this.$store.state.layout.sidebar &&
          this.$store.state.settings.sidebarVisibleMobile,
        "sidebar-dark":
          this.$store.state.layout.sidebar &&
          this.$store.state.settings.sidebarDark,
        "side-overlay-o":
          this.$store.state.layout.sideOverlay &&
          this.$store.state.settings.sideOverlayVisible,
        "side-overlay-hover":
          this.$store.state.layout.sideOverlay &&
          this.$store.state.settings.sideOverlayHoverable,
        "enable-page-overlay":
          this.$store.state.layout.sideOverlay &&
          this.$store.state.settings.pageOverlay,
        "page-header-fixed":
          this.$store.state.layout.header &&
          this.$store.state.settings.headerFixed,
        "page-header-dark":
          this.$store.state.layout.header &&
          this.$store.state.settings.headerDark,
        "main-content-boxed":
          this.$store.state.settings.mainContent === "boxed",
        "main-content-narrow":
          this.$store.state.settings.mainContent === "narrow",
        "rtl-support": this.$store.state.settings.rtlSupport,
        "side-trans-enabled": this.$store.state.settings.sideTransitions,
        "side-scroll": true
      };
    }
  },
  created() {
    // Set default color theme
    this.$store.commit("setColorTheme", {
      theme: this.$store.getters.appColorTheme
    });
  },
  mounted() {
    let winResize = false;

    // Remove side transitions on window resizing
    window.addEventListener("resize", () => {
      clearTimeout(winResize);

      this.$store.commit("setSideTransitions", { transitions: false });

      winResize = setTimeout(() => {
        this.$store.commit("setSideTransitions", { transitions: true });
      }, 500);
    });
  }
};
</script>
