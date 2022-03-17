import * as types from "../mutation-types";

// state
export const state = {
  types: null,
  quizzes: null,
  active_quizzes: null
};

// getters
export const getters = {
  types: state => state.types,
  quizzes: state => state.quizzes,
  active_quizzes: state => state.active_quizzes
};

// mutations
export const mutations = {
  [types.SAVE_TYPES](state, { types }) {
    state.types = types;
  },
  [types.SAVE_QUIZ_LIST](state, { quizzes }) {
    state.quizzes = quizzes;
  },
  [types.SAVE_QUIZ_ACITVE_LIST](state, { quizzes }) {
    state.active_quizzes = quizzes;
  }
};

// actions
export const actions = {
  async getQuizTypes({ commit }, payload) {
    try {
      const { data } = await axios.post("/quiz_types", payload);
      if (data?.success) {
        commit(types.SAVE_TYPES, { types: data.types });
        return true;
      }
      return false;
    } catch (e) {
      console.error(e);
    }
  },
  async getQuizLists({ commit }) {
    try {
      const { data } = await axios.post("/quiz/lists");
      if (data?.success) {
        commit(types.SAVE_QUIZ_LIST, { quizzes: data.quizzes });
        return true;
      }
      return false;
    } catch (e) {
      console.error(e);
    }
  },
  async getQuizActiveLists({ commit }) {
    try {
      const { data } = await axios.post("/quiz/active_lists");
      if (data?.success) {
        commit(types.SAVE_QUIZ_ACITVE_LIST, { quizzes: data.quizzes });
        return true;
      }
      return false;
    } catch (e) {
      console.error(e);
    }
  }
};
