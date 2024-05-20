#!/usr/bin/python3
""" gather data from api then export to json """
import json
import requests
import sys


def main(id):
    """ main function """
    base_url = "https://jsonplaceholder.typicode.com/"
    response = requests.get("{}/users/{}".format(base_url, id))
    data = response.json()
    userid = data['id']
    username = data['username']
    todo_r = requests.get("{}/todos".format(base_url), params={'userId': id})
    todo = todo_r.json()

    tasks = {str(userid): []}
    for row in todo:
        tasks[str(userid)].append({
            "task": row['title'],
            "completed": row['completed'],
            "username": username 
            })

    with open("{}.json".format(id), 'w') as jsonfile:
        json.dump(tasks, jsonfile)


if __name__ == '__main__':
    id = int(sys.argv[1])
    main(id)
