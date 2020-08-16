import hot_data  from "getters/hot_data";

test("generate handsontable settings data", () => {
  const input = {
    assigns: [
      {
        project_name: "one",
        month: "2020-01-01",
        cost: 0.1,
        assign_id: 1,
        alloc_id: 11,
      },
      {
        project_name: "one",
        month: "2020-02-01",
        cost: 0.2,
        assign_id: 1,
        alloc_id: 12,
      },
      {
        project_name: "two",
        assign_id: 2,
        alloc_id: null,
        month: null,
        cost: null
      }
    ]
  }

  const got = hot_data(input);

  const want = [
    {
      project_name: "one",
      "01月": { cost: 0.1, assign_id: 1, alloc_id: 11 },
      "02月": { cost: 0.2, assign_id: 1, alloc_id: 12 },
    },
    {
      project_name: "two",
    },
  ];

  expect(got).toEqual(want);
});
