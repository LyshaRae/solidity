type U is uint;
using {div as /} for U;

function div(U x, U y) pure returns (U) {
    if (U.unwrap(y) == 0)
        return U.wrap(0);

    return U.wrap(U.unwrap(x) / U.unwrap(y));
}

contract C {
    function f(U x, U y) public pure returns (U) {
        return x / y; // no div by zero possible here
    }
}
// ====
// SMTEngine: all
// ----
