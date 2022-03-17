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
      <div class="card-box block-content">
        <b-form-group label="Question" class="mb-3">
          <b-form-textarea
            v-model="question"
            placeholder="Please type the Question"
            rows="3"
            max-rows="6"
          ></b-form-textarea>
        </b-form-group>

        <b-form-group label="Type" class="mb-3">
          <b-form-select
            v-model="type"
            :options="types"
            class="mb-3"
            value-field="id"
            text-field="types"
            disabled-field="notEnabled"
          ></b-form-select>
        </b-form-group>

        <div v-if="type == 1">
          <b-form-group label="Answers" v-slot="{ ariaDescribedby }">
            <b-form-radio
              v-model="correct_answer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="1"
              >Yes
            </b-form-radio>

            <b-form-radio
              v-model="correct_answer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="2"
              >No
            </b-form-radio>
          </b-form-group>
        </div>
        <div v-else-if="type == 2">
          <b-form-group label="Answers" v-slot="{ ariaDescribedby }">
            <b-form-radio
              v-model="correct_answer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="1"
              class="mt-2"
            >
              <b-form-input
                v-model="answer1"
                placeholder="Enter answer1"
              ></b-form-input>
            </b-form-radio>

            <b-form-radio
              v-model="correct_answer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="2"
              class="mt-2"
            >
              <b-form-input
                v-model="answer2"
                placeholder="Enter answer2"
              ></b-form-input>
            </b-form-radio>

            <b-form-radio
              v-model="correct_answer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="3"
              class="mt-2"
            >
              <b-form-input
                v-model="answer3"
                placeholder="Enter answer3"
              ></b-form-input>
            </b-form-radio>
          </b-form-group>
        </div>
      </div>

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
import VueSelect from "vue-select";
import { mapGetters } from "vuex";

export default {
  components: { "v-select": VueSelect },
  data: () => ({
    type: null,
    question: "",
    answer1: "",
    answer2: "",
    answer3: "",
    correct_answer: ""
  }),
  computed: {
    ...mapGetters({
      types: "admin-quiz/types"
    })
  },
  methods: {
    reset() {
      this.answer1 = "";
      this.answer2 = "";
      this.answer3 = "";
      this.correct_answer = "";
    }
  },
  watch: {
    type() {
      this.reset();
    }
  }
};
</script>
