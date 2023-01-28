type U is uint;
using {div as /} for U;

function div(U x, U y) pure returns (U) {
    return U.wrap(U.unwrap(x) / U.unwrap(y));
}

contract C {
    function f(U x, U y) public pure returns (U) {
        return x / y; // FIXME: should detect div by zero
    }
}
// ====
// SMTEngine: all
// ----
