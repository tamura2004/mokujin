import axios from "axios";

export default async function load_assigns({ commit }) {
  const { data } = await axios.get("/api/v1/assigns");
  commit("set_assigns", { assigns: data });
}