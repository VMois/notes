#include <iostream>
#include <thread>
void threadCallback(int const & x)
{
    int & y = const_cast<int &>(x);
    y++;
    std::cout<<"Inside Thread x = "<<x<<std::endl;
}
int main()
{
    int x = 9;
    std::cout<<"In Main Thread : Before Thread Start x = "<<x<<std::endl;
    // std::thread threadObj(threadCallback, x); before x = 9, inside thread x = 10, after x = 9
    std::thread threadObj(threadCallback, std::ref(x)); // before x = 9, inside thread x = 10, after x = 10
    threadObj.join();
    std::cout<<"In Main Thread : After Thread Joins x = "<<x<<std::endl;
    return 0;
}
