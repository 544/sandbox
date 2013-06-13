import urllib2
from HTMLParser import HTMLParser

class SampleParser(HTMLParser):
	def __init__(self):
		HTMLParser.__init__(self);

	def handle_starttag(self, tagname, attribute):
		if tagname.lower() == "a" :
			for i in attribute:
				if i[0].lower() == "href":
					print i[1]


if __name__ == "__main__":

	#url = 'http://www.python-izm.com/contents/application/htmlparser.shtml'
	url = 'http://dailynews.yahoo.co.jp/fc/economy/'
	req = urllib2.Request(url);
	resp = urllib2.urlopen(req);
	#page = responce.read();
	#print page;
	ps = SampleParser();
	ps.feed(resp.read());

	ps.close();
	resp.close();



