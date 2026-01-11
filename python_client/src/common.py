class Inner:
    d: float
    e: dict

    def __init__(self, d=0.0, e={}):
        self.d = d
        self.e = e


class Msg:
    a: int
    b: str
    c: Inner

    def __init__(self, a=0, b="", c=Inner()):
        self.a = a
        self.b = b
        self.c = c


class Service:
    def heya(self, param: dict) -> dict: ...
    def hello(self, param: Msg) -> Msg: ...
