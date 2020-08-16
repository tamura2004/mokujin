import dayjs from "dayjs";

export default function months(startMonth) {
  const acc = [];
  for (let i = 0; i < 12; i++) {
    const month = dayjs(startMonth).add(i, "month").format("MM月");
    acc.push(month);
  }
  return acc;
}
