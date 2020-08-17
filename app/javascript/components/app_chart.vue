<template>
  <div
    id="chart"
    ref="chart"
    :style="{ height: height + 'px' }"
  ></div>
</template>

<script>
import CanvasJS from "canvasjs.min";

export default {
  props: [
    "title",
    "chart_data",
    "height",
  ],
  data() {
    return {
      chart: null,
    }
  },
  mounted() {
    const { title, chart_data: data, height } = this;
    this.chart = new CanvasJS.Chart(this.$refs.chart, {
      title,
      data,
      height,
    });
    this.chart.render();
  },
  watch: {
    chart_data() {
      this.chart.options.data = this.chart_data;
      this.chart.render();
    }
  }
}
</script>

<style scoped>
#chart {
  margin-bottom: 20px;
}

</style>
