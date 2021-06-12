const gcf = (a = 0, b = 0) => {
  if (a === b) return a;
  if (a === 0 || b === 0) return 0;
  if (a > b) return gcf(a - b, b);
  return gcf(a, b - a);
};

const a = 10,
  b = 15;

console.log(`GCF of ${a} and ${b} is ${gcf(a, b)}`);
