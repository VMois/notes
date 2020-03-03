# C++

Static, object oriented language. Released in 1985. Designed by Bjarne Stroustrup (nice [podcast](https://www.youtube.com/watch?v=uTxRF5ag27A) with Lex Fridman and Bjarne Stroustrup)

## Style guide

The most simple to follow is [Modern C++ styleguide](https://github.com/Microsoft/AirSim/blob/master/docs/coding_guidelines.md). Other, more complex:

- [Google C++ styleguide](https://google.github.io/styleguide/cppguide.html)

## Basics

Each C++ program consist of two parts:

- the preprocessor directives (starts with *#*)
- main function

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

How to compile on Linux:

```bash
g++ main.cpp -o main.out
```

### References

More, later...

### Constants

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

### Classes

A class is user-defined data type which defines:

- in-memory data structure
- data and operations
- how to initializate and release
- how to execure operations

Example of simple class:

```c++
class Point {
    public:
        int x, y;  // public attributes of a class
    void draw() {}  // public method
};

int main() {
    Point A;
    A.x = 20;
    A.y = 50;
    A.draw();
    return 0;
}
```

Another example:

```c++
class Point {
    public:
        int x, y;
    void SetX(int nx) {
        x = nx;
    }
};

int main() {
    Point A;
    A.x = 20;
    A.y = 50;
    A.SetX(56); // A.x == 56
    return 0;
}
```

We have two methods to write classes in C++:

- Inline method
- Separately, simply code (.cpp) + header (.h or .hpp)

How to write separately?

We need two files: header and implementation (code).

Header (`A.h`):

```c++
class A {
    public:
        int x;
        void SetX(int nx);
};
```

Implementation (`A.cpp`):

```c++
#include "A.h"

void A::SetX(int nx) { x = nx; }  // :: is a scope operator
```

#### Keyword this

More later...

#### Data hiding

- public, all items denoted are visible for anyone
- protected, access only from inside of the class **and** inhereted classes
- private, access only from inside the class

By default, in C++, all attributes and methods **are private** unless other specified.

#### Constructor and destructor

Costructor is a special class method that is called automatically right after object is created. Few stuff about constructor:

- constructor method **must** have the same name as class
- no return type
- if no constructor is created, compiler will include "empty" constructor by default

Example:

```c++
class Point {
    private:
        int x, y;
    public:
        Point(int nx, int ny) { x = nx; y = ny; }  // constructor with multiple arguments
        Point(int nx) { x = nx; y = 0; }  // conversion constructor
        Point() {x = 0; y = 0; } // default constructor
        // Point(int nx = 0; int ny = 0) {x = nx; y = ny}  <- simplified version of three constructors above

        // Point() {}  <- example of "empty" constructor

        void draw() {}
        void SetX(int nx) {
            x = nx;
        }
};

int main() {
    Point A; // A.x == 0, A.y == 0
    Point B(4); // B.x == 4, B.y == 0
    Point C(4, 5); // C.x == 4, C.y == 5

    A.SetX(56); // A.x == 56
    return 0;
}
```

Types of constructor:

- default
- conversion (one parameter, usage example, for casting)
- multiple parameter
- copy constructor

##### Copy constructor

When copy constructor is called?

- explicitly
- passing object as function parameter **by value**
- return value
- complex expressions as temporary values

Example:

```c++
class Point {  // B point
    private:
        int x, y;
    public:
        Point() {x = 0; y = 0;}
        Point(const Point &p) {  // A point
            x = p.x;  // inside of Point class we can access p Point
            y = p.y;
        }
};

int main() {
    Point A;
    Point B(A);
    return 0;
}
```

In C++, we have default copy constructor that copies object bit by bit from one memory area (point A) to another (point B). What is a problem with this approach?
If we have a dynamic memory management it can introduce **very** dangerous runtime bugs and **memory leakage**.

##### Destructor

**Destructor** is a special class method which is called automatically when object is released.

```c++
~Point() {...}  // IMPORTANT! No parameters.
```

### Dynamic Memory Management

Example in C:

```c++
int *p = (int*) malloc(sizeof(int) * 5);  // allocate 4 * 5 = 20 bytes and cast it to int
// default pointer type is void. Means can be anything.
free(p);
```

New way in C++:

```c++
int *p = new int[5];  // [?,?,?,?,?]
delete[] p;  // free all elements of allocated memory, [x,x,x,x,x]
// or
delete p;  // free first element of allocated memory, [x,?,?,?,?]

// IMPORTANT! be careful when use delete or delete[]. Always use delete[] if you have dynamic array
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

## FAQ

### 1. What is the difference between gcc and g++ in Linux?

`gcc` is used to compile C program while `g++` is used to compile C++ program. Since, a C program can also be compile through g++, because it is the extended or we can say advance compiler for C programming language.
