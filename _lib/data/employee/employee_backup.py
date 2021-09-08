import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
import core
import json


def create_employee_backup_table():
    con, cur, db = core.get_db()
    db(
        """
            CREATE TABLE IF NOT EXISTS employee_backup
            (
                employeeId          SERIAL           NOT null	PRIMARY KEY,
                fname       		VARCHAR(100)     NOT NULL,
                lname       		VARCHAR(100)     NOT NULL,
                address     		JSON             NULL,
                salary        		BIGINT      	 NOT NULL,
                phoneNo        		VARCHAR(20)      NULL
            );
        """
    )
    con.commit()


def drop_employee_backup_table():
    con, cur, db = core.get_db()
    db("DROP TABLE employee_backup;")
    con.commit()


def insert_employee_backup(firstname, lastname, address, salary):
    con, cur, db = core.get_db()
    # json.dumps for converting json to string format
    db(
        "INSERT INTO employee_backup (fname, lname, address, salary) VALUES (%s, %s, %s, %s)",
        (firstname, lastname, json.dumps(address), salary)
    )
    con.commit()


def find_employee_backup(firstname, lastname):
    con, cur, db = core.get_db()
    db(
        "select fname, lname, address, salary from employee_backup where fname = %s and lname = %s;",
        (firstname, lastname)
    )
    result_record = cur.fetchone()
    return result_record

