# VERSION: 1.2
# AUTHORS: you should try estrogen
# LICENSING INFORMATION

from helpers import download_file, retrieve_url
from novaprinter import prettyPrinter
from urllib.parse import urlencode, unquote
import re
import json
# some other imports if necessary


class yts_mx(object):
    """
    `url`, `name`, `supported_categories` should be static variables of the engine_name class,
     otherwise qbt won't install the plugin.

    `url`: The URL of the search engine.
    `name`: The name of the search engine, spaces and special characters are allowed here.
    `supported_categories`: What categories are supported by the search engine and their corresponding id,
    possible categories are ('all', 'anime', 'books', 'games', 'movies', 'music', 'pictures', 'software', 'tv').
    """

    url = 'https://yts.mx/'
    api_url = 'https://yts.mx/api/v2/list_movies.json?'
    name = 'YTS.MX'
    supported_categories = {
        'all': '0',
        'movies': '1'
    }

    def __init__(self):
        """
        Some initialization
        """

    def download_torrent(self, info):
        """
        Providing this function is optional.
        It can however be interesting to provide your own torrent download
        implementation in case the search engine in question does not allow
        traditional downloads (for example, cookie-based download).
        """
        print(download_file(info))

    # DO NOT CHANGE the name and parameters of this function
    # This function will be the one called by nova2.py
    def search(self, what, cat='all'):
        """
        Here you can do what you want to get the result from the search engine website.
        Everytime you parse a result line, store it in a dictionary
        and call the prettyPrint(your_dict) function.

        `what` is a string with the search tokens, already escaped (e.g. "Ubuntu+Linux")
        `cat` is the name of a search category in ('all', 'anime', 'books', 'games', 'movies', 'music', 'pictures', 'software', 'tv')
        """
        search_url = self.api_url
        
        what = unquote(what)
        search_params = {'sort_by': 'title'}  # used for duplicate checking

        # quality tagging
        quality_rstring = r'(?:quality=)?((?:2160|1440|1080|720|480|240)p|3D)'
        quality_re = re.search(quality_rstring, what)
        search_resolution = None
        if quality_re:
            search_resolution = quality_re.group(1)
            search_params['quality'] = search_resolution
            what = re.sub(quality_rstring, '', what).strip()
        # yts.mx only supports h264/h265 in search results at time of writing
        codec_rstring = r'(?:\.?(?:x|h)(264|265))'
        codec_re = re.search(codec_rstring, what)
        search_codec = None
        if codec_re:
            search_codec = 'x' + codec_re.group(1)
            if 'quality' in search_params:
                search_params['quality'] += f'.{search_codec}'  # only add if quality also defined, will be checked separately anyways
            what = re.sub(codec_rstring, '', what).strip()

        # rating tagging
        rating_rstring = r'(?:min(?:imum)?_)?rating=(\d)'
        rating_re = re.search(rating_rstring, what)
        min_rating = None
        if rating_re:
            min_rating = rating_re.groups()[-1]
            search_params['minimum_rating'] = {min_rating}
            what = re.sub(rating_rstring, '', what).strip()

        # genre tagging not implemented due to inconsistencies - may do later

        # prevent user causing page errors
        search_rstring = r'&page=\d+'
        what = re.sub(search_rstring, '', what).strip()

        # url finalisation
        if what:
            search_params['query_term'] = what
        search_url += urlencode(search_params)
        # print(search_url)  # for debugging
        api_result = json.loads(retrieve_url(search_url))
        if api_result['status'] != 'ok':
            print(api_result['status'] + api_result['satus_message'])
            return

        prev_movie = None
        while api_result['data']['movie_count'] > api_result['data']['limit']*(api_result['data']['page_number']-1):
            for movie in api_result['data']['movies']:
                if not prev_movie or movie['id'] != prev_movie['id']:
                    prev_movie = movie
                else:
                    for torrent in prev_movie['torrents']:
                        if torrent in movie['torrents']:
                            movie['torrents'].remove(torrent)
                for torrent in movie['torrents']:
                    if search_codec and torrent['video_codec'] != search_codec:
                        continue
                    if search_resolution and torrent['quality'] != search_resolution:
                        continue
                    formatTorrent = {
                        'link': torrent['url'],
                        'name': f'{movie["title_long"]} [{torrent["quality"]}] [{torrent["video_codec"]}] [{torrent["type"]}] [{torrent["audio_channels"]}] [YTS.MX]',
                        'size': torrent['size'],
                        'seeds': str(torrent['seeds']),
                        'leech': str(torrent['peers']),
                        'engine_url': self.url,
                        'desc_link': movie['url'],
                    }
                    prettyPrinter(formatTorrent)
            nextpage_rstring = r'&(?:page=\d+)|$'
            search_url = re.sub(nextpage_rstring, f'&page={api_result["data"]["page_number"]+1}', search_url)
            api_result = json.loads(retrieve_url(search_url))

        
