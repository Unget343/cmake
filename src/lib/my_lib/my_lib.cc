#include <iostream>
#include "my_lib.h"
#include <cstdint>
using namespace std;

#ifdef PRINTER_ACTIVE
void print_hello()
{ cout << "Hello, World!" << endl; }
#endif

std::uint32_t factorial(std::uint32_t number)
{ return number <= 1 ? number : factorial(number - 1) * number; }
