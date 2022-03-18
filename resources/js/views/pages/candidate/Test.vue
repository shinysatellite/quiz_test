<template>
  <div class="container mt-5 bg-white" v-if="quizzes">
    <h2 class="time text-danger">Remaining Time: {{ timerCount }}</h2>
    <div>
      <div>
        <h2>Question:{{ quizzes[current].text }}</h2>
        current: {{ current }} count: {{ count }}
      </div>
      <div v-if="quizzes[current].type_id == 1" class="mt-5">
        <b-form-group label="Answers" v-slot="{ ariaDescribedby }">
          <b-form-radio
            v-model="answer"
            :aria-describedby="ariaDescribedby"
            name="some-radios"
            value="1"
            >Yes
          </b-form-radio>
          <b-form-radio
            v-model="answer"
            :aria-describedby="ariaDescribedby"
            name="some-radios"
            value="2"
            >No
          </b-form-radio>
        </b-form-group>
      </div>
      <div v-else>
        <b-form-group label="Answers" v-slot="{ ariaDescribedby }">
          <b-form-radio
            v-model="answer"
            :aria-describedby="ariaDescribedby"
            name="some-radios"
            :value="quizzes[current].answers[0].value"
          >
            {{ quizzes[current].answers[0].text }}
          </b-form-radio>
          <b-form-radio
            v-model="answer"
            :aria-describedby="ariaDescribedby"
            name="some-radios"
            :value="quizzes[current].answers[1].value"
          >
            {{ quizzes[current].answers[1].text }}
          </b-form-radio>
          <b-form-radio
            v-model="answer"
            :aria-describedby="ariaDescribedby"
            name="some-radios"
            :value="quizzes[current].answers[2].value"
          >
            {{ quizzes[current].answers[2].text }}
          </b-form-radio>
        </b-form-group>
      </div>
    </div>

    <div
      class="block-content block-content-full text-right border-top"
      id="my-container"
      v-if="current < count - 1"
    >
      <b-button variant="primary" class="mr-1" @click="next" v-if="answer">
        Next
      </b-button>
      <b-button variant="primary" class="mr-1" @click="skip">
        Skip
      </b-button>
    </div>
    <div
      class="block-content block-content-full text-right border-top"
      id="my-container"
      v-if="current == count - 1"
    >
      <b-button variant="primary" class="mr-1" @click="submit">
        Submit
      </b-button>
    </div>
    <ResultModal :result="result" />
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import ResultModal from "@/views/components/candidate/test/ResultModal";

export default {
  components: { ResultModal },
  mounted() {
    this.getInitialData();
  },
  data: () => ({
    current: 0,
    timerCount: 0,
    answer: "",
    answers: [],
    unanswered_count: 0,
    result: null,
    finish_time: 0
  }),
  computed: {
    ...mapGetters({
      quizzes: "admin-quiz/active_quizzes",
      user: "auth/user"
    }),
    count() {
      if (this.quizzes) {
        return this.quizzes.length;
      }
      return 0;
    },
    total_time() {
      let total = 0;
      if (this.quizzes) {
        this.quizzes.map(item => {
          total += item.limit_time * 1;
        });
      }
      return total;
    },
    convertedTime() {}
  },
  methods: {
    getInitialData() {
      this.$store.dispatch("admin-quiz/getQuizActiveLists").then(res => {
        this.startTest();
      });
    },
    startTest() {
      this.timerCount = this.total_time;
    },
    stopTest() {
      let total_score = 0;
      this.answers.map(item => (total_score += item));

      let unanswered_count = 0;
      if (this.current == this.count - 1) {
        unanswered_count = this.unanswered_count;
      } else {
        unanswered_count =
          this.unanswered_count * 1 + this.count * 1 - 1 - this.current;
      }
      this.result = {
        count: this.count,
        score: (total_score * 1) / this.count,
        unanswered_count: unanswered_count,
        take_time: this.total_time * 1 - this.finish_time * 1
      };
      this.$bvModal.show("result_modal");

      const sendingData = { ...this.result, id: this.user.id };
      this.$store.dispatch("admin-quiz/saveTest", sendingData);
    },
    next() {
      const correct = this.quizzes[this.current].correct_answer;
      if (correct == this.answer) {
        this.answers.push(5);
      } else {
        this.answers.push(0);
      }
      this.current++;
      this.answer = "";
    },
    skip() {
      this.answers.push(0);
      this.answer = "";
      this.current++;
      this.unanswered_count++;
    },
    submit() {
      const correct = this.quizzes[this.current].correct_answer;
      if (correct == this.answer) {
        this.answers.push(5);
      } else {
        this.answers.push(0);
      }
      this.finish_time = this.timerCount;
      this.stopTest();
    }
  },
  watch: {
    timerCount: {
      handler(value) {
        console.log("value", value);
        if (value > 0) {
          setTimeout(() => {
            this.timerCount--;
          }, 1000);
        } else {
          this.stopTest();
        }
      }
    }
  }
};
</script>
