# C++

Static, object oriented language. Released in 1985. Designed by Bjarne Stroustrup.

## Basics

Each C++ program consist of two parts:

- the preprocessor directives (starts with *#*)
- main function

## Style guide

The most simple to follow is [Modern C++ stylyguide](https://github.com/Microsoft/AirSim/blob/master/docs/coding_guidelines.md). Other, more complex:

- [Google C++ styleguide](https://google.github.io/styleguide/cppguide.html)

Simple program:

```c++
#include <iostream>  // preprocessor with brackets
#include "iostream"  // preprocessor with double quotes

int main()
{
    std::cout << "Hello world, I am ready for C++";
    return 0;
}
```

Meaning of the brackets in preprocessor *"Look for this file in the directory where all the standard libraries are stored"*.

Meaning of the double quotes in preprocessor *"Look in the current directory, if the file is not there, then look in the directory where the standard libraries are stored"*.

To compile:

```bash
g++ main.cpp -o main.out
```

### Namespaces

You can use namespace to indicate that we want to use a specific library. For example:

```c++
using namespace std;

int main()
{
}
```

Tells compiler to use standard library by default.

### Constant

Use `const` keyword. Example:

```c++
const int NUMBER_OF_RETRIES = 5;
```

Example for enumerated constants:

```c++
#include <iostream>

using namespace std;

int main()
{
    // define MONTHS as having 12 possible values
    enum MONTHS {Jan, Feb, Mar, Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec};

    MONTHS bestMonth;

    bestMonth = Jan;

    // now we can check the value of bestMonths just like any other variable
    if (bestMonth == Jan)
    {
        cout << "I'm not so sure January is the best month\n";
    }
    return 0;
}
```

## FAQ

### 1. What is the difference between gcc and g++ in Linux?

`gcc` is used to compile C program while `g++` is used to compile C++ program. Since, a C program can also be compile through g++, because it is the extended or we can say advance compiler for C programming language.
