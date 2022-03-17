<template>
  <div>
    <base-content-header
      category="Quiezz"
      title="Management"
    ></base-content-header>
    <div class="content">
      <base-block rounded title="Latest Orders" header-bg content-full>
        <template #options>
          <b-button
            variant="alt-primary"
            class="mr-1"
            v-click-ripple
            @click="newQuiz"
          >
            <i class="fa fa-plus-square opacity-50 mr-1"></i> New Quiz
          </b-button>
        </template>

        <b-table-simple
          striped
          hover
          borderless
          class="table-vcenter font-size-sm mb-0"
        >
          <b-thead>
            <b-tr>
              <b-th class="font-w700">ID</b-th>
              <b-th class="font-w700">Question</b-th>
              <b-th class="font-w700">Type</b-th>
              <b-th class="font-w700">Limit Time(s)</b-th>
              <b-th class="font-w700">Created Date</b-th>
              <b-th class="font-w700">Status</b-th>
              <b-th class="font-w700">Action</b-th>
            </b-tr>
          </b-thead>
          <b-tbody>
            <b-tr v-for="quiz in quizzes" :key="quiz.id">
              <b-td>
                {{ quiz.id }}
              </b-td>
              <b-td>
                {{ quiz.text }}
              </b-td>
              <b-td>
                <span v-if="quiz.type_id == 1">Binary</span>
                <span v-else>Multi Choice</span>
              </b-td>
              <b-td>
                {{ quiz.limit_time }}
              </b-td>
              <b-td>
                {{ quiz.created_at }}
              </b-td>
              <b-td>
                <b-badge variant="primary" v-if="quiz.active">
                  true
                </b-badge>
                <b-badge variant="info" v-else>
                  false
                </b-badge>
              </b-td>
              <b-td>
                <RemoveButton :id="quiz.id" />
              </b-td>
            </b-tr>
          </b-tbody>
        </b-table-simple>
      </base-block>
    </div>
  </div>
</template>

<script>
import RemoveButton from "@/views/components/admin/quiz-management/RemoveButton";
import { mapGetters } from "vuex";

export default {
  components: { RemoveButton },
  data: () => ({}),
  computed: {
    ...mapGetters({
      quizzes: "admin-quiz/active_quizzes"
    })
  },
  mounted() {
    this.getInitialData();
  },
  methods: {
    newQuiz() {
      this.$bvModal.show("create_quiz_modal");
    },
    getInitialData() {
      this.$store.dispatch("admin-quiz/getQuizTypes");
      this.$store.dispatch("admin-quiz/getQuizActiveLists");
    }
  }
};
</script>
