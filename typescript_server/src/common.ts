type int = number;
type float = number;

export class Inner {
    d: float;
    e: object;

    constructor(d = 0.0, e = {}) {
        this.d = d;
        this.e = e;
    }
}

export class Msg {
    a: int;
    b: string;
    c: Inner;


    constructor(a = 0, b = "", c = new Inner()) {
        this.a = a;
        this.b = b;
        this.c = c;
    }
}

export abstract class Service {
    abstract heya(param: object): Promise<object>;
    abstract hello(param: Msg): Promise<Msg>;
}