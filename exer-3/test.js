const a = 21,
  b = 15,
  c = 7;
let greatest = 0;
let largestLetter = "A";
// test cases passed: 6

if (a >= b) {
  // a is greatest
  greatest = a;
} else if (a >= c) {
  // a is greatest
  greatest = a;
}

if (b >= a) {
  greatest = b;
  largestLetter = "B";
} else if (b >= c) {
  greatest = b;
  largestLetter = "B";
}

if (c >= a) {
  largest = c;
  largestLetter = "C";
} else if (c >= b) {
  largest = c;
  largestLetter = "C";
}

/*
if (a >= b && a >= c) {
  // a is greatest
  greatest = a;
} else if (b >= a && b >= c) {
  // b is greatest
  greatest = b;
  largestLetter = "B";
} else if (c >= a && c >= b) {
  // c is greatest?
  greatest = c;
  largestLetter = "C";
}
*/
console.log(greatest, largestLetter);
