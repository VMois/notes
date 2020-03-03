#include <iostream> 

using namespace std;

int main() 
{
    cout << "Variable type size in bytes:" << endl;
    cout << "Int: " << sizeof(int) << endl;
    cout << "Short: " << sizeof(short) << endl;
    cout << "Long: " << sizeof(long) << endl;
    cout << "char: " << sizeof(char) << endl;
    cout << "Float: " << sizeof(float) << endl;
    cout << "Double: " << sizeof(double) << endl;
    cout << "Bool: " << sizeof(bool) << endl;
    return 0;
}