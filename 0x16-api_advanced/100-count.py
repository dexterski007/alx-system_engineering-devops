#!/usr/bin/python3
"""
recursion for hot articles with keywords
"""
import requests


def count_words(subreddit, word_list):
    """ search function with keywords """
    for word in word_list:
        word = word.lower()
    new_dic = recursive(subreddit, word_list, None, None)
    sorted_dic = dict(sorted(new_dic.items()))
    if sorted_dic is not None:
        for key, value in sorted_dic.items():
            print("{}: {}".format(key, value))


def recursive(subreddit, word_list, after=None, new_dic=None):
    """ recursive function """
    if new_dic is None:
        new_dic = {word: 0 for word in word_list}
    headers = {
        'User-Agent': 'Python:subreddit.testing.for.alx'
    }
    url = ("https://www.reddit.com/r/{}/hot.json".format(subreddit))
    params = {'limit': 100}
    if after:
        params['after'] = after

    response = requests.get(url, headers=headers,
                            params=params, allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        posts = data['data']['children']
        for post in posts:
            title = post['data']['title']
            lower = [word.lower() for word in title.split(' ')]
            for word in new_dic.keys():
                new_dic[word] += lower.count(word)
        after = data['data'].get('after')
        if after:
            return recursive(subreddit, word_list, after, new_dic)
        else:
            return new_dic
    else:
        return None
