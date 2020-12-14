pragma experimental SMTChecker;

contract C {
	bytes b;
	function f() public {
		b.push() = b.push();
		uint length = b.length;
		assert(length >= 2);
		assert(b[length - 1] == 0);
		assert(b[length - 1] == b[length - 2]);
		// Fails
		assert(b[length - 1] == byte(uint8(1)));
	}
}
// ----
// Warning 6328: (236-275): CHC: Assertion violation happens here.\nCounterexample:\nb = [0, 0]\n\n\n\nTransaction trace:\nconstructor()\nState: b = []\nf()
