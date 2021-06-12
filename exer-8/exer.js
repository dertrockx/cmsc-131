var faker = require("faker");
var record = [];
for (var i = 0; i < 5; i++) {
    // basta imitate input dito
    record.push({
        caseID: faker.datatype.string(),
        sex: faker.name.gender(),
        status: faker.random.number(),
        date: faker.date.recent()
    });
}
for (var i = 0; i < 5; i++) {
    console.log(record[i]);
}
