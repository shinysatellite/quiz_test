import Csrf from "@/service/csrf.service";
import Cookies from "js-cookie";
import * as types from "../mutation-types";

// state
export const state = {
  types: null,
  quizzes: null
};

// getters
export const getters = {
  types: state => state.types,
  quizzes: state => state.quizzes
};

// mutations
export const mutations = {
  [types.SAVE_TYPES](state, { types }) {
    state.types = types;
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
      commit(types.FETCH_USER_FAILURE);
    }
  }
};
