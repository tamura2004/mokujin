<template>
  <div id="app">
    <app-chart
      :title="title"
      :chart_data="chart_data"
    ></app-chart>
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
import AppChart from "components/app_chart";

export default {
  components: {
    AppHandsontable,
    AppChart,
  },
  data() {
    return {
      title: {
        text: "My First Chart in CanvasJS",
      },
    };
  },
  mounted() {
    this.$store.dispatch("load_assigns");
  },
  computed: {
    ...mapGetters([
      "hot_data",
      "hot_columns",
      "chart_data",
    ]),
  },
  methods: {
    change(cell) {
      console.log(cell);
    }
  }
}
</script>

<style scoped>
#chart {
  height: 400px;
}
</style>
