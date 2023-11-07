import pdfkit
import requests
from bs4 import BeautifulSoup


# Step 1: Extract HTML Element
def tomakeJapaneseOne():
    url = "https://atcoder.jp/contests/abs/tasks/abc088_b"
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Let's say we want to extract a div with a class "myClass"
    target_element = soup.find('div', class_='part')
    if not target_element:
        print("Element not found!")
        exit()

    html_content = '<meta charset="UTF-8">' + str(target_element)
    # html_content =  html_content.replace('_i','[i]')
    html_content = html_content.replace('<var>','',-1)
    html_content = html_content.replace('</var>','',-1)
    html_content =  html_content.replace('_i','[i]',-1)
    print(html_content)

    path = '/usr/local/bin/wkhtmltopdf'
    pdfkit_config = pdfkit.configuration(wkhtmltopdf=path)
    pdfkit.from_string(html_content, 'output.pdf', configuration=pdfkit_config)

def tomakeEnglishOne():
    url = "https://atcoder.jp/contests/abs/tasks/abc088_b?lang=en"
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # First, find the outer div with class 'lang-en'
    outer_div = soup.find('span', class_='lang-en')
    if not outer_div:
        print("Outer div not found!")
        exit()

    # Then, inside the outer div, find the div with class 'part'
    target_element = outer_div.find('div', class_='part')
    if not target_element:
        print("Target element not found!")
        exit()

    html_content = '<meta charset="UTF-8">' + str(target_element)
    html_content = html_content.replace('<var>', '')
    html_content = html_content.replace('</var>', '')
    html_content = html_content.replace('_i', '[i]', -1)
    print(html_content)

    path = '/usr/local/bin/wkhtmltopdf'
    pdfkit_config = pdfkit.configuration(wkhtmltopdf=path)
    pdfkit.from_string(html_content, 'output.pdf', configuration=pdfkit_config)

tomakeEnglishOne()
