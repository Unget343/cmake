#include <iostream>

#include <nlohmann/json.hpp>

#include "../lib/my_lib/my_lib.h"
#include "../config/config.hpp.in"
using namespace std;

int main()
{
    cout << project_name << endl;
    cout << project_version << endl;

    print_hello();
    return 0;
}
