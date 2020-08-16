<template>
  <div id="app">
    <app-handsontable
      :hotColumns="hot_columns"
      :hotData="hot_data"
      @change="change"
    ></app-handsontable>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import AppHandsontable from "components/app_handsontable";

export default {
  components: {
    AppHandsontable,
  },
  mounted() {
    this.$store.dispatch("load_assigns");
  },
  computed: {
    ...mapGetters(["hot_data", "hot_columns"]),
  },
  methods: {
    change(cell) {
      console.log(cell);
    }
  }
}
</script>

<style scoped>
</style>
