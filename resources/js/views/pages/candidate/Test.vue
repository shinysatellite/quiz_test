<template>
  <div class="container mt-5 bg-white" v-if="quizzes">
    <h2 class="time text-danger">Remaining Time: {{ timerCount }}</h2>
    <div>
      <div>
        <h2>Question:{{ this.quizzes[current].text }}</h2>
      </div>
      <div v-if="this.quizzes[current].type_id == 1" class="mt-5">
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
            value="1"
          >
            {{}}
          </b-form-radio>
          <b-form-radio
            v-model="answer"
            :aria-describedby="ariaDescribedby"
            name="some-radios"
            value="2"
            >No
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
    </div>

    <div
      class="block-content block-content-full text-right border-top"
      id="my-container"
    >
      <b-button variant="primary" class="mr-1" @click="next">
        Next
      </b-button>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  mounted() {
    this.getInitialData();
  },
  data: () => ({
    current: 0,
    timerCount: 0,
    answer: ""
  }),
  computed: {
    ...mapGetters({
      quizzes: "admin-quiz/active_quizzes"
    }),
    count() {
      if (this.quizzes) {
      }
      return 0;
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
      let total = 0;
      this.quizzes.map(item => {
        total += item.limit_time * 1;
      });
      this.timerCount = total;
    },
    stopTest() {
      console.log("stopTest");
    },
    next() {
      this.current++;
    }
  },
  watch: {
    timerCount: {
      handler(value) {
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
