#include <thread>
#include <iostream>

void thread_function()
{
    std::cout << std::this_thread::get_id() << std::endl;
    for (int i = 0; i < 10; i++)
        std::cout << "function thread execution" << std::endl;
}

class DisplayThread
{
public:
    void operator()()     
    {
        for(int i = 0; i < 10; i++)
            std::cout<<"Display Thread Executing"<<std::endl;
    }
};
 
int main()  
{
    
    std::thread thread_1(thread_function);
    for(int i = 0; i < 10; i++)
        std::cout << "Display From MainThread" <<std::endl;
    thread_1.join(); 

    std::thread thread_2((DisplayThread()));
    thread_2.join();


    std::cout<<"exit of main function"<<std::endl;
    return 0;
}
