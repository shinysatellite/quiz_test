<template>
  <div>
    <base-content-header
      category="Quiezz"
      title="Questions and Answers"
    ></base-content-header>
    <div class="content">
      <base-block rounded title="Latest Orders" header-bg content-full>
        <b-table-simple
          striped
          hover
          borderless
          class="table-vcenter font-size-sm mb-0"
        >
          <b-thead>
            <b-tr>
              <b-th class="font-w700">Name</b-th>
              <b-th class="font-w700">Email</b-th>
              <b-th class="font-w700">Score</b-th>
              <b-th class="font-w700">Take Time(s)</b-th>
              <b-th class="font-w700">Unanswered Count</b-th>
            </b-tr>
          </b-thead>
          <b-tbody>
            <b-tr v-for="result in results" :key="result.id">
              <b-td>
                {{ result.user.name }}
              </b-td>
              <b-td>
                {{ result.user.email }}
              </b-td>
              <b-td>
                {{ result.score }}
              </b-td>
              <b-td>
                {{ result.take_time }}
              </b-td>
              <b-td>
                {{ result.unanswered_count }}
              </b-td>
            </b-tr>
          </b-tbody>
        </b-table-simple>
      </base-block>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data: () => ({}),
  computed: {
    ...mapGetters({
      results: "admin-result/results"
    })
  },
  mounted() {
    this.getInitialData();
  },
  methods: {
    getInitialData() {
      this.$store.dispatch("admin-result/getResultList");
    }
  }
};
</script>
