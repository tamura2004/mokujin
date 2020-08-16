export default function hot_settings({}, { hot_columns, hot_data }) {
  return {
    columns: hot_columns,
    data: hot_data,
    colHeaders: true,
    licenseKey: "non-commercial-and-evaluation",
    afterChange,
  }
}

function afterChange(change, source) {
  console.log(change, source);
}