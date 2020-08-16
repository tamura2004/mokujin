export default function hot_columns(state, { months }) {
  const acc = [{ title: "案件", data: "project_name" }];
  for (const month of months) {
    acc.push({
      title: month,
      data: month + ".cost",
      type: "numeric",
      numericFormat: {
        pattern: "0.0",
      },
    });
  }
  return acc;
}
