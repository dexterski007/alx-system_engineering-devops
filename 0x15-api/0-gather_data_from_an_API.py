#!/usr/bin/python3
""" gather data from api """
import requests
import sys


def main(id):
    """ main function """
    base_url = "https://jsonplaceholder.typicode.com/"
    response = requests.get("{}/users/{}".format(base_url, id))
    data = response.json()
    EMPLOYEE_NAME = data['name']
    todo_r = requests.get("{}/todos".format(base_url), params={'userId': id})
    todo = todo_r.json()

    TOTAL_NUMBER_OF_TASKS = len(todo)
    DONE_TASKS = [task for task in todo if task['completed']]
    NUMBER_OF_DONE_TASKS = len(DONE_TASKS)
    print("Employee {} is done with tasks({}/{}):"
          .format(EMPLOYEE_NAME, NUMBER_OF_DONE_TASKS, TOTAL_NUMBER_OF_TASKS))

    for task in DONE_TASKS:
        print("\t{}".format(task['title']))


if __name__ == '__main__':
    id = int(sys.argv[1])
    main(id)
