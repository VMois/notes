#include <thread>
#include <algorithm>
#include <iostream>

class WorkerThread
{
public:
    void operator()()     
    {
        std::cout<<"Worker Thread "<<std::endl;
    }
};
int main()  
{
    std::thread threadObj( (WorkerThread()) );
    // Program will terminate as we have't called either join or detach with the std::thread object.
    // Hence std::thread's object destructor will terminate the program
    threadObj.join();
    return 0;
}
