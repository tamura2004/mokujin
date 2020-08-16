<template>
  <div id="app">
    <div ref="hot"></div>
  </div>
</template>

<script>
import axios from "axios";
import Handsontable from "handsontable";
import "handsontable/dist/handsontable.full.css";
import hot_columns from "./getters/hot_columns";
import hot_data from "./getters/hot_data";

export default {
  data() {
    return {
      assigns: [],
      settings: {
        columns: [],
        data: [],
        colHeaders: true,
        licenseKey: "non-commercial-and-evaluation",
        afterChange: this.afterChange,
      }
    }
  },
  async mounted() {
    this.settings.columns = hot_columns();
    const { data } = await axios.get("/api/v1/assigns");
    this.assigns = data;
    this.settings.data = hot_data(this);
    document.hot = new Handsontable(this.$refs.hot, this.settings);
  },
  methods: {
    afterChange(change, source) {
      console.log(change, source);
    },
  }
}
</script>

<style scoped>
body {
  font-family: Meiryo;
  margin-top: 72px;
  margin-bottom: 72px;
}

.handsontable {
  font-size: 12px;
}

.handsontable th, .handsontable td {
  height: 12px;
}

ul.nav.nav-tabs {
  margin-bottom: 8px;
}

</style>
