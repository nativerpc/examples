import * as nativerpc from 'nativerpc';
import {Service, Msg} from './common';

class MyService extends Service {
    async heya(param: object): Promise<object> {
        console.log("Saying heya")
        return {"a": 2}
    }
    async hello(param: Msg): Promise<Msg> {
        console.log("Saying hello")
        return new Msg(2);
    }
}

function main() {
    new nativerpc.Server({
        host: ["localhost", 9002],
        service: MyService,
    }).listen();
}

main()