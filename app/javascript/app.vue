<template>
  <div id="app">
    <div ref="hot"></div>
  </div>
</template>

<script>
import axios from "axios";
import dayjs from "dayjs";
import Handsontable from "handsontable";
import "handsontable/dist/handsontable.full.css";

export default {
  data() {
    return {
      assigns: [],
      months: [],
      settings: {
        data: [],
        columns: [],
        colHeaders: true,
        licenseKey: "non-commercial-and-evaluation",
        afterChange: this.afterChange,
      }
    }
  },
  async mounted() {
    this.initMonths();
    const { data } = await axios.get("/api/v1/assigns");
    this.assigns = data;
    this.initColumns();
    this.initData();
    document.hot = new Handsontable(this.$refs.hot, this.settings);
  },
  methods: {
    initMonths() {
      for (let i = 0; i < 12; i++) {
        const month = dayjs().add(i, "month").format("MM月");
        this.months.push(month);
      }
    },
    afterChange(change, source) {
      console.log(change, source);
    },
    initColumns() {
      this.settings.columns.push({ title: "案件", data: "project_name" });
      for (const label of this.months) {
        this.settings.columns.push({
          title: label,
          data: label + ".cost",
          type: "numeric",
          numericFormat: {
            pattern: "0.0",
          },
        });
      }
    },
    initData() {
      const wrk = {};
      for (const assign of this.assigns) {
        const key = assign.project_name;
        if (!wrk[key]) wrk[key] = { project_name: key };
        const month = dayjs(assign.month).format("MM月");
        wrk[key][month] = {
          id: assign.alloc_id,
          cost: assign.cost,
        };
      }
      this.settings.data = Object.values(wrk);
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
