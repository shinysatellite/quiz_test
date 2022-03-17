import Csrf from "@/service/csrf.service";
import Cookies from "js-cookie";
import * as types from "../mutation-types";

// state
export const state = {
  user: null,
  active: Cookies.get("active"),
  type: Cookies.get("user_type"),
  token: Cookies.get("token")
};

// getters
export const getters = {
  user: state => state.user,
  token: state => state.token,
  active: state => state.active,
  type: state => state.type,
  check: state => state.user !== null
};

// mutations
export const mutations = {
  [types.SAVE_TOKEN](state, { token, remember }) {
    state.token = token;
    Cookies.set("token", token, { expires: remember ? 365 : null });
  },

  [types.FETCH_USER_SUCCESS](state, { user, remember }) {
    state.user = user;
    state.type = user.type;
    Cookies.set("user_type", user.type, { expires: remember ? 365 : null });
  },

  [types.SAVE_USER_ACTIVE](state, { active, remember }) {
    state.active = active;
    Cookies.set("active", active, { expires: remember ? 365 : null });
  },

  [types.FETCH_USER_FAILURE](state) {
    state.token = null;
    state.user = null;
    Cookies.remove("token");
    Cookies.remove("XSRF-TOKEN");
  }
};

// actions
export const actions = {
  saveToken({ commit, dispatch }, payload) {
    commit(types.SAVE_TOKEN, payload);
  },

  async signup({ commit }, payload) {
    try {
      await Csrf.getCookie();
      const { data } = await axios.post("/register-email", payload);
      if (data?.success) {
        return true;
      }
      return false;
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  },

  async register({ commit }, payload) {
    try {
      await Csrf.getCookie();
      const { data } = await axios.post("/register", payload);
      if (data?.success) {
        commit(types.SAVE_TOKEN, { token: data.token });
        commit(types.FETCH_USER_SUCCESS, { user: data.user });
        commit(types.SAVE_USER_ACTIVE, {
          active: data.active_sub_user
        });
        return true;
      }
      return false;
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  },

  async signin({ commit }, payload) {
    try {
      await Csrf.getCookie();
      const { data } = await axios.post("/signin", payload);
      if (data?.success) {
        commit(types.SAVE_TOKEN, { token: data.token });
        commit(types.FETCH_USER_SUCCESS, { user: data.user });
        commit(types.SAVE_USER_ACTIVE, {
          active: data.active_sub_user
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  },

  async fetchUser({ commit }) {
    try {
      const { data } = await axios.post("/user");
      commit(types.FETCH_USER_SUCCESS, { user: data.user });
      commit(types.SAVE_USER_ACTIVE, {
        active: data.active_sub_user
      });
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  },

  async logout({ commit }) {
    try {
      const { data } = await axios.post("/logout");
      if (data.success) commit(types.FETCH_USER_FAILURE);
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  },
  async resetPasswordLink({ commit }, payload) {
    try {
      await Csrf.getCookie();
      const { data } = await axios.post("/reset-password", payload);
      return data;
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  },
  async resetPassword({ commit }, payload) {
    try {
      await Csrf.getCookie();
      const { data } = await axios.post("/reset/password", payload);
      return data;
    } catch (e) {
      commit(types.FETCH_USER_FAILURE);
    }
  }
};
