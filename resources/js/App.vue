<template>
  <router-view></router-view>
</template>

<script>
export default {
  watch: {
    $route() {
      $("#navbarCollapse").collapse("hide");
    }
  }
};
</script>
