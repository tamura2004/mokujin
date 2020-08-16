import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);

import state from "./state";
import getters from "getters/getters";
import actions from "actions/actions";
import mutations from "mutations/mutations";

export default function store() {
  return new Vuex.Store({
    state,
    getters,
    mutations,
    actions,
  });
}