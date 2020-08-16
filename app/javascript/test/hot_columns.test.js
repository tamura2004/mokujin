import hot_columns  from "getters/hot_columns";

test("generate handsontable column settings correctly", () => {
  const got = hot_columns("2020-08-16");

  const want = [
    { title: "案件", data: "project_name" },
    { title: "08月", data: "08月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "09月", data: "09月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "10月", data: "10月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "11月", data: "11月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "12月", data: "12月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "01月", data: "01月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "02月", data: "02月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "03月", data: "03月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "04月", data: "04月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "05月", data: "05月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "06月", data: "06月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
    { title: "07月", data: "07月.cost", type: "numeric", numericFormat: { pattern: "0.0" }},
  ];

  expect(got).toEqual(want);
});
