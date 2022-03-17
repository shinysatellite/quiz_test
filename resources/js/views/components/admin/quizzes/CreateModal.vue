<template>
  <b-modal
    id="create_quiz_modal"
    size="xl"
    body-class="p-0"
    hide-footer
    hide-header
    @show="initData"
  >
    <div class="block block-rounded block-themed block-transparent mb-0">
      <div class="block-header bg-primary-dark">
        <h3 class="block-title">Create Quiz</h3>
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
            v-model="$v.form.question.$model"
            placeholder="Please type the Question"
            rows="3"
            max-rows="6"
          ></b-form-textarea>
          <span v-if="$v.form.question.$error">
            <small v-if="!$v.form.question.required" class="text-danger"
              >Question is required.</small
            >
          </span>
        </b-form-group>

        <b-form-group label="Type" class="mb-3">
          <b-form-select
            v-model="$v.form.type.$model"
            :options="types"
            class="mb-3"
            value-field="id"
            text-field="types"
            disabled-field="notEnabled"
          ></b-form-select>
          <span v-if="$v.form.type.$error">
            <small v-if="!$v.form.type.required" class="text-danger"
              >Question type is required.</small
            >
          </span>
        </b-form-group>

        <b-form-group label="Estimated Time" class="mb-3">
          <b-form-input
            v-model="$v.form.limit_time.$model"
            placeholder="Please type the Question"
            rows="3"
            max-rows="6"
          ></b-form-input>
          <span v-if="$v.form.limit_time.$error">
            <small v-if="!$v.form.limit_time.required" class="text-danger"
              >Estimated time is required.</small
            >
          </span>
        </b-form-group>

        <div v-if="form.type == 1">
          <b-form-group label="Answers" v-slot="{ ariaDescribedby }">
            <b-form-radio
              v-model="$v.form.correct_answer.$model"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="1"
              >Yes
            </b-form-radio>
            <b-form-radio
              v-model="$v.form.correct_answer.$model"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="2"
              >No
            </b-form-radio>
            <span v-if="$v.form.correct_answer.$error">
              <small v-if="!$v.form.correct_answer.required" class="text-danger"
                >Correct Answer is required.</small
              >
            </span>
          </b-form-group>
        </div>
        <div v-else-if="form.type == 2">
          <b-form-group label="Answers" v-slot="{ ariaDescribedby }">
            <b-form-radio
              v-model="$v.form.correct_answer.$model"
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
              v-model="$v.form.correct_answer.$model"
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
              v-model="$v.form.correct_answer.$model"
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
            <span v-if="$v.form.correct_answer.$error">
              <small v-if="!$v.form.correct_answer.required" class="text-danger"
                >Correct Answer is required.</small
              >
            </span>
          </b-form-group>
        </div>
      </div>

      <div
        class="block-content block-content-full text-right border-top"
        id="my-container"
      >
        <b-button
          variant="primary"
          class="mr-1"
          @click="submit"
          :disabled="isLoading"
        >
          <span v-if="isLoading">
            <i class="fa fa-cog fa-spin"></i>&nbsp;Please wait...
          </span>
          <span v-else>Create</span>
        </b-button>
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
import { validationMixin } from "vuelidate";
import { required, email } from "vuelidate/lib/validators";

export default {
  mixins: [validationMixin],
  components: { "v-select": VueSelect },
  validations: {
    form: {
      type: { required },
      question: { required },
      correct_answer: { required },
      limit_time: { required }
    }
  },
  data: () => ({
    form: {
      type: null,
      question: "",
      correct_answer: "",
      limit_time: 0
    },
    isLoading: false,
    answer1: "",
    answer2: "",
    answer3: ""
  }),
  computed: {
    ...mapGetters({
      types: "admin-quiz/types"
    }),
    watch_type() {
      return this.form.type;
    }
  },
  methods: {
    reset() {
      this.answer1 = "";
      this.answer2 = "";
      this.answer3 = "";
      this.form.correct_answer = "";
    },
    initData() {
      this.reset();
      this.form.type = null;
      this.form.question = "";
      this.form.limit_time = 0;
    },
    submit() {
      this.$v.form.$touch();

      if (this.$v.form.$anyError) {
        return;
      }
      let requestData = null;
      if (this.form.type == 1) {
        requestData = this.form;
      } else {
        if (this.answer1 == "" || this.answer2 == "" || this.answer3 == "") {
          this.$swal("", "Please complete all the answers", "error");
        } else {
          let answers = [
            {
              value: 1,
              text: this.answer1
            },
            {
              value: 2,
              text: this.answer2
            },
            {
              value: 3,
              text: this.answer3
            }
          ];
          requestData = { ...this.form, answers: answers };
        }
      }
      this.isLoading = true;
      axios.post("quiz/store", requestData).then(res => {
        const { data } = res;
        if (data.success) {
          this.$swal("", "Successfully Created!", "success");
        } else {
          this.$swal("", "Something went wrong", "error");
        }
        this.isLoading = false;
        this.$bvModal.hide("create_quiz_modal");
        this.$store.dispatch("admin-quiz/getQuizLists");
      });
    }
  },
  watch: {
    watch_type() {
      this.reset();
    }
  }
};
</script>
