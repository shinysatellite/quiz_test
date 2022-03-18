import * as types from "../mutation-types";

// state
export const state = {
  results: null
};

// getters
export const getters = {
  results: state => state.results
};

// mutations
export const mutations = {
  [types.SAVE_RESULTS](state, { results }) {
    state.results = results;
  }
};

// actions
export const actions = {
  async getResultList({ commit }) {
    try {
      const { data } = await axios.post("/result/get_result_list");
      if (data?.success) {
        commit(types.SAVE_RESULTS, { results: data.results });
        return true;
      }
      return false;
    } catch (e) {
      console.error(e);
    }
  }
};
