from robot.api import logger
from datetime import datetime


def write_to_console(level, message):
    now = datetime.now()
    logger.console(str(now) + " " + level + " " + message)
