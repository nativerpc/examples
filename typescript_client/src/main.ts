import * as nativerpc from 'nativerpc';
import { Service, Msg } from './common';

async function main() {
    const client = new nativerpc.Client({
        host: ["localhost", 9002],
        service: Service
    })
    const service = await client.connect<Service>();

    while (true) {
        await new Promise(resolve => setTimeout(resolve, 1000));
        const resp = await service.heya({ a: 22 });
        await new Promise(resolve => setTimeout(resolve, 1000));
        const resp2 = await service.hello(new Msg(22));
        console.log(`Said heya: ${JSON.stringify(resp)}`)
        console.log(`Said hello: ${JSON.stringify(resp2)}`)
    }
    service.close()
}

main()