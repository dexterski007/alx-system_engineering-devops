#!/usr/bin/python3
""" gather data from api then export to json2 """
import json
import requests
import sys


def main():
    """ main function """
    base_url = "https://jsonplaceholder.typicode.com/"
    userlist = requests.get("{}/users".format(base_url))
    userdata = userlist.json()

    with open("todo_all_employees.json", 'w') as jsonfile:
        for user in userdata:
            user_id = user['id']
            url_todos = 'https://jsonplaceholder.typicode.com/todos/'
            todos_r = requests.get("{}".format(url_todos),
                                   params={'userId': user_id})
            todos_js = todos_r.json()
            tasks = []
            for todo in todos_js:
                task = {
                "username": user['username'],
                "task": todo['title'],
                "completed": todo['completed']
                }
                tasks.append(task)
            json.dump({str(user_id): tasks}, jsonfile)


if __name__ == '__main__':
    main()
