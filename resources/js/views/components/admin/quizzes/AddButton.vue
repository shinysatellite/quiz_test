<template>
  <span>
    <b-button class="mr-1" @click="addToQuiz" :disabled="isLoading" size="sm">
      <span v-if="isLoading">
        <i class="fa fa-cog fa-spin"></i>&nbsp;Please wait...
      </span>
      <span v-else>Add To Quiz</span>
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
    addToQuiz() {
      this.isLoading = true;
      axios.post("quiz/activeQuiz", { id: this.id, value: 1 }).then(res => {
        console.log(res);
        this.isLoading = false;
        this.$store.dispatch("admin-quiz/getQuizLists");
      });
    }
  }
};
</script>
