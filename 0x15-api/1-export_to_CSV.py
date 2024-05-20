#!/usr/bin/python3
""" gather data from api then export to csv """
import csv
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

    with open("{}.csv".format(id), 'w') as csvfile:
        fields = ['USERID', 'USERNAME', 'STATUS', 'TITLE']
        writer = csv.DictWriter(csvfile,
                                fieldnames=fields, quoting=csv.QUOTE_ALL)
        for row in todo:
            writer.writerow({
                'USERID': userid,
                'USERNAME': username,
                'STATUS': str(row['completed']),
                'TITLE': row['title']
                })


if __name__ == '__main__':
    id = int(sys.argv[1])
    main(id)
