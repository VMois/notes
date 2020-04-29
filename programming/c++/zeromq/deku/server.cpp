#include <iostream>
#include <thread>
extern "C" {
#include <czmq.h>
}

void work()
{
    zsock_t *workers = zsock_new(ZMQ_REP);
    zsock_connect(workers, "inproc://workers");

    while (true) {
        zmsg_t *request = zmsg_recv (workers);
    }
}

int main (int argc, char *argv [])
{
    int verbose = 1;

    //  Prepare server socket with predictable identity
    char *bind_endpoint = "tcp://*:5556";
    char *connect_endpoint = "tcp://localhost:5556";
    zsock_t *server = zsock_new(ZMQ_ROUTER);
    zsock_t *workers = zsock_new(ZMQ_DEALER);
    zsock_bind(workers, "inproc://workers");
    zsock_set_identity(server, connect_endpoint);
    zsock_bind(server, bind_endpoint);
    printf ("I: service is ready at %s\n", bind_endpoint);

    /*for (int thread_nbr = 0; thread_nbr != 2; thread_nbr++) {
        std::thread worker(work);
        worker.detach();
    }*/

    while (!zctx_interrupted) {
        zmsg_t *request = zmsg_recv (server);
        if (verbose && request)
            zmsg_dump(request);
        if (!request)
            break;          //  Interrupted

        //  Frame 0: identity of client
        //  Frame 1: PING, or client control frame
        //  Frame 2: request body
        zframe_t *identity = zmsg_pop (request);
        zframe_t *control = zmsg_pop (request);
        zmsg_t *reply = zmsg_new ();
        if (zframe_streq (control, "PING")) {
            zmsg_addstr (reply, "PONG");
        } else {
            zmsg_add (reply, control);
            zmsg_addstr (reply, "OK");
        }
        zmsg_destroy (&request);
        zmsg_prepend (reply, &identity);
        if (verbose && reply)
            zmsg_dump (reply);
        zmsg_send (&reply, server);
        zclock_sleep(1000);
    }
    if (zctx_interrupted)
        printf ("W: interrupted\n");
    return 0;
}
