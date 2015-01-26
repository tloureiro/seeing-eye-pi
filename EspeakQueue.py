import subprocess
from Queue import Queue
import threading
import time

class EspeakQueue:

    def __init__(self):
        self.queue = Queue()

    def add(self, output):
        self.queue.put(output)

    def reset(self):
        self.p_aplay.kill()
        while not self.queue.empty():
            self.queue.get(False)

    def start(self):
        self.t = threading.Thread(target=self.work)
        self.t.daemon = True
        self.t.start()

    def work(self):
        while True:
            line = self.queue.get()
            p = subprocess.Popen(["/usr/bin/espeak", line, "--stdout"], stdout=subprocess.PIPE)
            self.p_aplay = subprocess.Popen(["aplay", "-q"], stdin=p.stdout)
            self.p_aplay.wait()