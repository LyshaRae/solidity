type U is uint;
using {L.add as +} for U;

library L {
    using {gt as >} for U;

    function add(U x, U y) public pure returns (U) {
        assert(x > U.wrap(1000)); // should fail
        assert(U.unwrap(y) > 1000); // should fail
        return U.wrap(U.unwrap(x) + U.unwrap(y)); // overflow possible
    }

    function gt(U x, U y) private pure returns (bool) {
        return U.unwrap(x) > U.unwrap(y);
    }
}

contract C {
    U x = U.wrap(2) + U.wrap(2);
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (144-168): CHC: Assertion violation happens here.
// Warning 6328: (193-219): CHC: Assertion violation happens here.
// Warning 4984: (258-283): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
