import dayjs from "dayjs";

export default function chart_data(state, { months }) {
  const acc = new Map();
  for (const assign of state.assigns) {
    const id = assign.project_id;
    if (!acc.has(id)) acc.set(id, new Map());
    const month = dayjs(assign.month).format("MM月");
    acc.get(id).set(month, assign.cost);
  }

  const chart_data = [];
  acc.forEach((value, key) => {
    const dataPoints = [];
    for (const label of months) {
      const y = value.has(label) ? value.get(label) : 0;
      dataPoints.push({ label, y })
    }
    chart_data.push({
      type: "stackedArea",
      dataPoints,
    });
  });

  return chart_data;
}
