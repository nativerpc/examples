from common import Msg, Service
import nativerpc
import time

def main():
    client = nativerpc.Client({
        "host": ["localhost", 9001],
        "service": Service
    })
    service: Service = client.connect()
    while True:
        time.sleep(1)
        resp = service.heya({"a": 11})
        time.sleep(1)
        resp2 = service.hello(Msg(11))
        print(f"Said heya: {resp}")
        print(f"Said hello: {client.serializer.toJson(resp2)}")


main()
