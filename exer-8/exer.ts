const faker = require("faker");

interface Patient {
	caseID: string; // string length of 20
	sex: string; // F or M
	status: number; // 0, 1, 2
	date: string; // 11-length string, mm/dd/yyyy
}

const record: Patient[] = [];

for (let i = 0; i < 5; i++) {
	// basta imitate input dito
	record.push({
		caseID: faker.datatype.string(),
		sex: faker.name.gender(),
		status: faker.random.number(),
		date: faker.date.recent(),
	});
}

for (let i = 0; i < 5; i++) {
	console.log(record[i]);
}
