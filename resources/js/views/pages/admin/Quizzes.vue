<template>
  <div>
    <base-content-header
      category="Quiezz"
      title="Questions"
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
              <b-th class="d-none d-sm-table-cell font-w700">Date</b-th>
              <b-th class="font-w700">State</b-th>
              <b-th
                class="d-none d-sm-table-cell font-w700 text-right"
                style="width: 120px;"
                >Total</b-th
              >
              <b-th class="font-w700 text-center" style="width: 60px;"></b-th>
            </b-tr>
          </b-thead>
          <b-tbody>
            <b-tr v-for="order in latestOrders" :key="order.id">
              <b-td>
                <a class="font-w600" href="javascript:void(0)"
                  >#{{ order.id }}</a
                >
              </b-td>
              <b-td class="d-none d-sm-table-cell">
                {{ order.date }}
              </b-td>
              <b-td>
                <span class="font-w600" :class="`text-${order.stateVariant}`">{{
                  order.state
                }}</span>
              </b-td>
              <b-td class="d-none d-sm-table-cell text-right">
                {{ order.total }}
              </b-td>
              <b-td class="text-center">
                <a
                  href="javascript:void(0)"
                  v-b-tooltip.hover.nofade.left="'Manage'"
                >
                  <i class="fa fa-fw fa-pencil-alt"></i>
                </a>
              </b-td>
            </b-tr>
          </b-tbody>
        </b-table-simple>
      </base-block>
      <CreateModal />
    </div>
  </div>
</template>

<script>
import CreateModal from "@/views/components/admin/quizzes/CreateModal";
export default {
  components: { CreateModal },
  data: () => ({
    latestOrders: [
      {
        id: 7835,
        date: "today",
        state: "Pending..",
        stateVariant: "warning",
        total: "$999,99"
      },
      {
        id: 7834,
        date: "today",
        state: "Pending..",
        stateVariant: "warning",
        total: "$2.299,00"
      },
      {
        id: 7833,
        date: "today",
        state: "Success",
        stateVariant: "success",
        total: "$1200,00"
      },
      {
        id: 7832,
        date: "today",
        state: "Cancelled",
        stateVariant: "danger",
        total: "$399,00"
      },
      {
        id: 7831,
        date: "today",
        state: "Success",
        stateVariant: "success",
        total: "$349,00"
      },
      {
        id: 7830,
        date: "today",
        state: "Success",
        stateVariant: "success",
        total: "$999,00"
      },
      {
        id: 7829,
        date: "today",
        state: "Success",
        stateVariant: "success",
        total: "$39,99"
      },
      {
        id: 7828,
        date: "today",
        state: "Success",
        stateVariant: "success",
        total: "$499,00"
      },
      {
        id: 7827,
        date: "today",
        state: "Success",
        stateVariant: "success",
        total: "$325,00"
      }
    ]
  }),
  mounted() {
    this.getInitialData();
  },
  methods: {
    newQuiz() {
      this.$bvModal.show("create_quiz_modal");
    },
    getInitialData() {
      this.$store.dispatch("admin-quiz/getQuizTypes").then(res => {
        console.log(res);
      });
    }
  }
};
</script>
