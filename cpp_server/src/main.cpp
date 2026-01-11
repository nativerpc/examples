#include "common.h"

class MyService : public Service {
public:
    json heya(json param) {
        std::cout << "Saying heya" << std::endl;
        return json({"a", 3});
    }
    Msg hello(Msg param) {
        std::cout << "Saying hello" << std::endl;
        return Msg(3);
    }
};

int main() {
    nativerpc::Server({
        {"host", {"localhost", 9003}},
        {"service", {"Service", nativerpc::Typing::name<MyService>()}}
    }).listen();
}
