import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
import core


def test_select():
    con, cur, db = core.get_db()
    db("select * from employee LIMIT 1;")
    result_record = cur.fetchall()
    group_id = result_record[0][0]
    con.commit()
    return group_id

