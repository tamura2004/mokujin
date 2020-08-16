import dayjs from "dayjs";

export default function hot_data({ assigns }) {
  const acc = {};
  for (const assign of assigns) {
    const key = assign.project_name;
    if (!acc[key]) acc[key] = { project_name: key };
    const month = dayjs(assign.month).format("MM月");
    acc[key][month] = {
      alloc_id: assign.alloc_id,
      assign_id: assign.assign_id,
      cost: assign.cost,
    };
  }
  return Object.values(acc);  
}
