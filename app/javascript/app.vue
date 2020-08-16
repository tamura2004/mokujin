<template>
  <div id="app">
    <div id="chart" ref="chart"></div>
    <div class="row">
      <app-handsontable
        :hotColumns="hot_columns"
        :hotData="hot_data"
        @change="change"
      ></app-handsontable>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import AppHandsontable from "components/app_handsontable";
// import { ColumnChart } from "canvasjs";
import CanvasJS from "canvasjs.min";

export default {
  components: {
    AppHandsontable,
  },
  mounted() {
    this.$store.dispatch("load_assigns");
    // require("./canvasjs.min");
    document.chart = new CanvasJS.Chart(this.$refs.chart, {
      title: {
        text: "My First Chart in CanvasJS",
      },
      data: [
        {
          type: "column",
          dataPoints: [
            { label: "apple", y: 10 },
            { label: "orange", y: 15 },
            { label: "banana", y: 25 },
            { label: "mango", y: 30 },
            { label: "grape", y: 28 },
          ],
        },
      ],
    });
    document.chart.render();
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
#chart {
  height: 400px;
}
</style>
