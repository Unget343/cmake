#define CATCH_CONFIG_MAIN

#include "catch.hpp"

#include "my_lib.h"

TEST_CASE("Factorial are compted", "[factorial]")
{
    REQUIRE(factorial(0) == 0);
    REQUIRE(factorial(1) == 1);
    REQUIRE(factorial(2) == 2);
    REQUIRE(factorial(3) == 6);
    REQUIRE(factorial(4) == 24);    
}
