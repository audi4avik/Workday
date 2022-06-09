from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager


def get_chromedriver():
    chromedriver = ChromeDriverManager().install()
    return chromedriver


def get_edgedriver():
    edgedriver = EdgeChromiumDriverManager().install()
    return edgedriver
