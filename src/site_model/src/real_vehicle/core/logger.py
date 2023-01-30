import logging
import os.path
import time


class Logger(object):
    def __init__(self, logger):
        self.logger = logging.getLogger(logger)
        self.logger.setLevel(logging.DEBUG)

        log_title = time.strftime("%Y%m%d%H%M", time.localtime(time.time()))
        log_path = os.path.abspath(".") + "/logs/"
        log_name = log_path + log_title + ".log"

        file_handler = logging.FileHandler(log_name)
        file_handler.setLevel(logging.INFO)

        stream_handler = logging.StreamHandler()
        stream_handler.setLevel(logging.INFO)

        formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
        file_handler.setFormatter(formatter)
        stream_handler.setFormatter(formatter)

        self.logger.addHandler(file_handler)
        self.logger.addHandler(stream_handler)

    def getlog(self):
        return self.logger