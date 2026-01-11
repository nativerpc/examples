import nativerpc
from common import Service, Msg


class MyService(Service):
    def heya(self, param: dict) -> dict:
        print("Saying heya")
        return {"a": 1}

    def hello(self, param: Msg) -> Msg:
        print("Saying hello")
        return Msg(a=1)


def main():
    nativerpc.Server({
        "host": ["localhost", 9001],
        "service": MyService,
    }).listen()


main()
