import psycopg2
import sys
from datetime import datetime
from configparser import ConfigParser

con = cur = db = DATABASE_PASSWORD = DATABASE_NAME = DATABASE_USERNAME = DATABASE_URL = None


def _write(level, message):
    now = datetime.now()
    message = message.replace("\n", "")
    sys.__stdout__.write(str(now) + " " + level + " " + message + "\n")
    sys.__stdout__.flush()


def init():
    global con, cur, db
    try:
        config = ConfigParser()
        config.read('config.ini')
        db_password = config.get('main', 'password')
        db_host = config.get('main', 'url')
        db_user = config.get('main', 'username')
        db_database = config.get('main', 'database')
        db_port = config.get('main', 'port')

        con = psycopg2.connect(user = db_user,
                                    password = db_password,
                                    host = db_host,
                                    port = db_port,
                                    database = db_database)
        cur = con.cursor()
        db = cur.execute
    except (Exception, psycopg2.Error) as error :
        if con:
            con.rollback()
        _write("ERROR","Unexpected error from %s " % (error))


def get_db():
    if not (con and cur and db):
        init()
    return (con, cur, db)


def db_query(query):
    try:
        init()
        _write("INFO", query)
        db(query)
    except (Exception, psycopg2.Error) as error :
        _write("ERROR","Unexpected error from %s " % (error))


def db_close():
    cur.close()
    con.close()
