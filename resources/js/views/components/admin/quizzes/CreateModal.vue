<template>
  <b-modal
    id="create_quiz_modal"
    size="xl"
    body-class="p-0"
    hide-footer
    hide-header
  >
    <div class="block block-rounded block-themed block-transparent mb-0">
      <div class="block-header bg-primary-dark">
        <h3 class="block-title">Title</h3>
        <div class="block-options">
          <button
            type="button"
            class="btn-block-option"
            @click="$bvModal.hide('create_quiz_modal')"
          >
            <i class="fa fa-fw fa-times"></i>
          </button>
        </div>
      </div>
      <div class="card-box block-content"></div>
      <div
        class="block-content block-content-full text-right border-top"
        id="my-container"
      >
        <b-button
          variant="alt-primary"
          class="mr-1"
          @click="$bvModal.hide('create_quiz_modal')"
          >Close</b-button
        >
      </div>
    </div>
  </b-modal>
</template>

<script>
export default {};
</script>
