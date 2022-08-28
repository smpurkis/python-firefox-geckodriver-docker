
from pyvirtualdisplay import Display
from selenium import webdriver
from time import time

def main():
    s = time()
    display = Display(visible=0, size=(800, 600))
    display.start()

    browser = webdriver.Firefox()
    browser.get('https://www.google.com/')
    print(browser.title)

    browser.quit()
    display.stop()
    print(f"Time taken: {time() - s}")
  
  
if __name__ == '__main__':
    main()