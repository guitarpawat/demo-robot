import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
import core
import json


def create_employee_table():
    con, cur, db = core.get_db()
    db(
        """
            CREATE TABLE IF NOT EXISTS employee
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


def drop_employee_table():
    con, cur, db = core.get_db()
    db("DROP TABLE employee;")
    con.commit()


def insert_employee(firstname, lastname, address, salary):
    con, cur, db = core.get_db()
    # json.dumps for converting json to string format
    db(
        "INSERT INTO employee (fname, lname, address, salary) VALUES (%s, %s, %s, %s)",
        (firstname, lastname, json.dumps(address), salary)
    )
    con.commit()


def find_employee(firstname, lastname):
    con, cur, db = core.get_db()
    db(
        "select fname, lname, address, salary from employee where fname = %s and lname = %s;",
        (firstname, lastname)
    )
    result_record = cur.fetchone()
    return result_record


def test_select():
    con, cur, db = core.get_db()
    db("select * from employee LIMIT 1;")
    result_record = cur.fetchall()
    id = result_record[0][0]
    return id

