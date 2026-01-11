#include "common.h"

int main()
{
    nativerpc::Client client({{"host", {"localhost", 9003}},
                              {"service", "Service"}});
    auto service = client.connect<Service>();
    while (true)
    {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        auto resp = service->heya({{"a", 33}});
        std::this_thread::sleep_for(std::chrono::seconds(1));
        auto resp2 = service->hello(Msg(33));
        std::cout << "Said heya: " << resp << std::endl;
        std::cout << "Said hello: " << client._serializer->toJson(resp2) << std::endl;
    }
    return 0;
}