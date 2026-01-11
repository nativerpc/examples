
#pragma one
#include <nativerpc/main.h>
using namespace std;
using namespace nlohmann;

class Inner
{
public:
    float d;
    json e;

    Inner(float d = 0.0, json e = json({}))
    {
        this->d = d;
        this->e = e;
    }
};

class Msg
{
public:
    int a;
    string b;
    Inner c;
    Msg(int a = 0, string b = "", Inner c = Inner())
    {
        this->a = a;
        this->b = b;
        this->c = c;
    }
};

class Service
{
public:
    virtual json heya(json param) = 0;
    virtual Msg hello(Msg param) = 0;
};
