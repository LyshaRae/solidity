type I16 is int16;
using {
    bitor as |, bitand as &, bitxor as ^, bitnot as ~,
    add as +, sub as -, unsub as -, mul as *, div as /, mod as %,
    eq as ==, noteq as !=, lt as <, gt as >, leq as <=, geq as >=
} for I16;

function bitor(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) | I16.unwrap(y)); }
function bitand(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) & I16.unwrap(y)); }
function bitxor(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) ^ I16.unwrap(y)); }
function bitnot(I16 x) pure returns (I16) { return I16.wrap(~I16.unwrap(x)); }

function add(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) + I16.unwrap(y)); }
function sub(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) - I16.unwrap(y)); }
function unsub(I16 x) pure returns (I16) { return I16.wrap(-I16.unwrap(x)); }
function mul(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) * I16.unwrap(y)); }
function div(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) / I16.unwrap(y)); }
function mod(I16 x, I16 y) pure returns (I16) { return I16.wrap(I16.unwrap(x) % I16.unwrap(y)); }

function eq(I16 x, I16 y) pure returns (bool) { return I16.unwrap(x) == I16.unwrap(y); }
function noteq(I16 x, I16 y) pure returns (bool) { return I16.unwrap(x) != I16.unwrap(y); }
function lt(I16 x, I16 y) pure returns (bool) { return I16.unwrap(x) < I16.unwrap(y); }
function gt(I16 x, I16 y) pure returns (bool) { return I16.unwrap(x) > I16.unwrap(y); }
function leq(I16 x, I16 y) pure returns (bool) { return I16.unwrap(x) <= I16.unwrap(y); }
function geq(I16 x, I16 y) pure returns (bool) { return I16.unwrap(x) >= I16.unwrap(y); }

contract C {
    function testBitwise(I16 x, I16 y) public pure {
        assert(x | y == bitor(x, y)); // FIXME: should hold
        assert(x & y == bitand(x, y)); // FIXME: should hold
        assert(x ^ y == bitxor(x, y)); // FIXME: should hold
        assert(~x == bitnot(x)); // FIXME: should hold
    }

    function testArithmetic(I16 x, I16 y) public pure {
        assert(x + y == add(x, y)); // FIXME: should hold
        assert(x - y == sub(x, y)); // FIXME: should hold
        assert(-x == unsub(x)); // FIXME: should hold
        assert(x * y == mul(x, y)); // FIXME: should hold
        //assert(x / y == div(x, y)); // FIXME: ICE due to https://github.com/ethereum/solidity/issues/13900
        assert(x % y == mod(x, y)); // FIXME: should hold
    }

    function testComparison(I16 x, I16 y) public pure {
        assert((x == y) == eq(x, y)); // FIXME: should hold
        assert((x != y) == noteq(x, y)); // FIXME: should hold
        assert((x < y) == lt(x, y)); // FIXME: should hold
        assert((x > y) == gt(x, y)); // FIXME: should hold
        assert((x <= y) == leq(x, y)); // FIXME: should hold
        assert((x >= y) == geq(x, y)); // FIXME: should hold
    }
}
// ====
// SMTEngine: all
// ----
// Warning 3944: (672-701): CHC: Underflow (resulting value less than -32768) happens here.
// Warning 4984: (672-701): CHC: Overflow (resulting value larger than 32767) happens here.
// Warning 3944: (770-799): CHC: Underflow (resulting value less than -32768) happens here.
// Warning 4984: (770-799): CHC: Overflow (resulting value larger than 32767) happens here.
// Warning 3944: (946-975): CHC: Underflow (resulting value less than -32768) happens here.
// Warning 4984: (946-975): CHC: Overflow (resulting value larger than 32767) happens here.
// Warning 4281: (1142-1171): CHC: Division by zero happens here.
// Warning 6328: (1789-1817): CHC: Assertion violation happens here.
// Warning 6328: (1849-1878): CHC: Assertion violation happens here.
// Warning 6328: (1910-1939): CHC: Assertion violation happens here.
// Warning 6328: (1971-1994): CHC: Assertion violation happens here.
// Warning 6328: (2089-2115): CHC: Assertion violation happens here.
// Warning 6328: (2147-2173): CHC: Assertion violation happens here.
// Warning 6328: (2205-2227): CHC: Assertion violation happens here.
// Warning 6328: (2259-2285): CHC: Assertion violation happens here.
// Warning 6328: (2426-2452): CHC: Assertion violation happens here.
// Warning 6328: (2547-2575): CHC: Assertion violation happens here.
// Warning 6328: (2607-2638): CHC: Assertion violation happens here.
// Warning 6328: (2670-2697): CHC: Assertion violation happens here.
// Warning 6328: (2729-2756): CHC: Assertion violation happens here.
// Warning 6328: (2788-2817): CHC: Assertion violation happens here.
// Warning 6328: (2849-2878): CHC: Assertion violation happens here.
