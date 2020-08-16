<template>
  <div id="app">
    <div ref="hot"></div>
  </div>
</template>

<script>
import Handsontable from "handsontable";
import "handsontable/dist/handsontable.full.css";
import { mapGetters } from "vuex";

export default {
  props: [
    "hotData",
    "hotColumns",
  ],
  data() {
    return {
      hot: null,
    }
  },
  mounted() {
    this.hot = new Handsontable(this.$refs.hot, {
      licenseKey: "non-commercial-and-evaluation",      
      colHeaders: true,
      columns: this.hotColumns,
      data: this.hotData,
      afterChange: this.afterChange,
    })
  },
  watch: {
    hotData(newData) {
      this.hot.loadData(newData); 
    }
  },
  methods: {
    afterChange(changes, source) {
      console.log(changes, source);
      if (source !== "edit") return;
      const rows = this.hot.getSourceData();
      for (const [row, name, oldVal, newVal] of changes) {
        // name := "10月.cost" -> col := "10月"
        const col = name.replace(/\..*$/,"");
        const cell = rows[row][col];
        this.$emit("change", { row, col, cell });
      }
    }
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
