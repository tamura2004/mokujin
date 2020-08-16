import months  from "getters/months";

test("1 equal 1", () => {
  const got = months("2020-08-16");
  const want = ["08月", "09月", "10月", "11月", "12月", "01月",
    "02月", "03月", "04月", "05月", "06月", "07月"];
  expect(got).toEqual(want);
});
