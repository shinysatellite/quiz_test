<template>
  <span>
    <b-button
      class="mr-1"
      @click="removeToQuiz"
      :disabled="isLoading"
      size="sm"
    >
      <span v-if="isLoading">
        <i class="fa fa-cog fa-spin"></i>&nbsp;Please wait...
      </span>
      <span v-else>Remove</span>
    </b-button>
  </span>
</template>

<script>
export default {
  props: ["id"],
  data: () => ({
    isLoading: false
  }),
  methods: {
    removeToQuiz() {
      this.isLoading = true;
      axios.post("quiz/activeQuiz", { id: this.id, value: 0 }).then(res => {
        this.isLoading = false;
        this.$store.dispatch("admin-quiz/getQuizActiveLists");
      });
    }
  }
};
</script>
