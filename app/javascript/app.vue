<template>
  <div id="app">
    <div class="ht" ref="htbl"></div>
  </div>
</template>

<script>
import axios from "axios";
import Handsontable from "handsontable";
import "handsontable/dist/handsontable.full.css";

export default {
  data: function () {
    return {
      data: null,
    }
  },
  async mounted() {
    const container = this.$refs.htbl;
    const { data } = await axios.get("/api/v1/allocs");
    this.data = data;
    this.hot = new Handsontable(container, data);
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.ht {
  margin-top: 12px;
}
</style>
