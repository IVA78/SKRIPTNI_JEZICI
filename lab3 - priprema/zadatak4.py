#python zadatak4.py https://www.jutarnji.hr/

import sys
import re
import urllib.request


def main():
    if len(sys.argv) < 2:
        print("Nisu zadani potrebni argumenti!")
        return
    
    url = sys.argv[1]  
    page = urllib.request.urlopen(url)
    page_bytes = page.read()
    page_content = page_bytes.decode("utf8")
    
    #print page content
    print("PAGE CONTENT:")
    print(page_content)
    
    
    links = re.findall(r'href=[\'"]?(http[^\'" >]+)', page_content)
    hosts = dict()
    #print links and count hosts
    print()
    print("LINKS:")
    for link in links:
        print(link)
        
        if "//" not in link:
            continue
        start = link.find("//") + 2
        if "/" in link[start:]:
            end = link[start:].find("/") + start
        else:
            end = len(link)
    
        host = link[start:end]
        
        if host not in hosts:
            hosts[host] = 1
        else:
            hosts[host] += 1
        
        
    #print hosts
    print()
    print("HOSTS:")
    for host, count in hosts.items():
        print("Host: ", host, "Count: ", count)
        
    
    emails = re.findall(r'[\w\.-]+@[\w\.-]+', page_content)
    #print emails
    print()
    print("EMAILS:")
    for email in emails:
        print(email)
        
    images = re.findall(r'<img src=[\'"]?([^\'" >]+)', page_content)
    #print image number
    print()
    print("IMAGE NUMBER: ", len(images))

if __name__ == "__main__":
    main()
