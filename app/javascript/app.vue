<template>
  <div id="app">
    <hot-table
      ref="hot"
      :columns="hot_columns"
      :data="hot_data"
      :colHeaders="true"
      licenseKey="non-commercial-and-evaluation"
      @afterChange="afterChange"
    ></hot-table>
  </div>
</template>

<script>
// import Handsontable from "handsontable";
import "handsontable/dist/handsontable.full.css";
import { mapGetters } from "vuex";
import { HotTable } from "@handsontable/vue";

export default {
  components: {
    HotTable,
  },
  async mounted() {
    await this.$store.dispatch("load_assigns");
    console.log("store!", this.$store);
    console.log("getters!", this.$store.getters);
    console.log("attension!", this.hot_data);
    this.$refs.hot.hotInstance.loadData(this.hot_data);
  },
  computed: {
    hot_columns() {
      return this.$store.getters.hot_columns;
    },
    hot_data() {
      this.$store.getters.hot_data;
    },
  },
  methods: {
    afterChange(change, source) {
      console.log(change, source);
    }
  }
  // async mounted() {
  //   const { getters } = await this.$store;
  //   document.hot = new Handsontable(this.$refs.hot, getters.hot_settings);
  // },
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
