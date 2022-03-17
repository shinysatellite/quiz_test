<template>
  <base-page-heading :title="title" :subtitle="subtitle">
    <template #extra v-if="category">
      <b-breadcrumb class="breadcrumb-alt">
        <b-breadcrumb-item active>
          {{ category }}
        </b-breadcrumb-item>
        <b-breadcrumb-item active>{{ title }}</b-breadcrumb-item>
      </b-breadcrumb>
    </template>
  </base-page-heading>
</template>

<script>
export default {
  name: "BaseContentHeader",
  props: {
    category: {
      type: String
    },
    title: {
      type: String
    },
    subtitle: {
      type: String
    }
  }
};
</script>
