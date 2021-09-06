from configparser import ConfigParser
import sys

# The reason why we need config.py file because file py cannot use value from .robot

cmd_args = sys.argv
env = cmd_args[1]

# Real env will get this one from vault
DATABASE_CONFIG = {
    'local': {
        'password': 'password',
        'url': 'localhost',
        'username': 'postgres',
        'name': 'postgres',
        'port': '5432'
    }
}

config = ConfigParser()

database_value = DATABASE_CONFIG[env.lower()]

config.read('config.ini')
config.add_section('main')
config.set('main', 'password', database_value['password'])
config.set('main', 'url', database_value['url'])
config.set('main', 'username', database_value['username'])
config.set('main', 'database', database_value['name'])
config.set('main', 'port', database_value['port'])
config.set('main', 'env', env)

with open('config.ini', 'w') as f:
    config.write(f)

