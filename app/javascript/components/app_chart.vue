<template>
  <div id="app">
    <div id="chart" ref="chart"></div>
  </div>
</template>

<script>
import CanvasJS from "canvasjs.min";

export default {
  props: ["title", "chart_data"],
  mounted() {
    document.chart = new CanvasJS.Chart(this.$refs.chart, {
      title: this.title,
      data: this.chart_data,
    });
    document.chart.render();
  },
  watch: {
    chart_data() {
      document.chart.options.data = this.chart_data;
      document.chart.render();
    }
  }
}
</script>

<style scoped>
#chart {
  height: 400px;
}
</style>
