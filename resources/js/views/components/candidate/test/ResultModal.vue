<template>
  <b-modal id="result_modal" size="xl" body-class="p-0" hide-footer hide-header>
    <div class="block block-rounded block-themed block-transparent mb-0">
      <div class="block-header bg-primary-dark">
        <h3 class="block-title">Result</h3>
        <div class="block-options">
          <button
            type="button"
            class="btn-block-option"
            @click="$bvModal.hide('result_modal')"
          >
            <i class="fa fa-fw fa-times"></i>
          </button>
        </div>
      </div>
      <div class="card-box block-content" v-if="result">
        <p>Quiz Number : {{ result.count }}</p>
        <p>Time : {{ result.take_time }}</p>
        <p>Score : {{ result.score }}</p>
        <p>unanswered_count : {{ result.unanswered_count }}</p>
      </div>
      <div
        class="block-content block-content-full text-right border-top"
        id="my-container"
      >
        <b-button variant="alt-primary" class="mr-1" to="welcome"
          >Restart</b-button
        >
      </div>
    </div>
  </b-modal>
</template>

<script>
export default {
  props: ["result"]
};
</script>
