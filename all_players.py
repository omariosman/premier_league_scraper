import pandas as pd
from selenium import webdriver
from sqlalchemy import false, true
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException      
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

import os
os.startfile("chromedriver.exe")

time.sleep(5)

web = webdriver.Chrome(ChromeDriverManager().install())
"""
options = web.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging'])
driver = web.Chrome(options=options)
"""
#web = webdriver.Chrome()   

def open_players_page():
    web.get('https://www.premierleague.com/players')
    time.sleep(5)

#Accept Cookies



def accept_cookies():
    accept_cookies = web.find_element_by_xpath('/html/body/div[1]/div/div/div[1]/div[5]/button[1]')
    accept_cookies.click()
    time.sleep(3)


#scroll
def scroll_down():
    current_height = web.execute_script("return document.body.scrollHeight")
    while True:
        web.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        time.sleep(3)
        try:
            new_height = web.execute_script("return document.body.scrollHeight") # Calculate new scroll height except:
        except:
            print("Failed", current_height)
        if new_height == current_height:
            break       
        current_height = new_height

    print("Scroll Height", new_height)


def scroll_up3():
    web.find_element(By.TAG_NAME,'body').send_keys(Keys.CONTROL + Keys.HOME)

def scroll_up2():
    element = web.find_element_by_xpath('//*[@id="mainContent"]/div[2]/div/div/section/div[1]/div[2]')
    element.location_once_scrolled_into_view

def scroll_up():
    ctr = 0
    html = web.find_element_by_tag_name('html')
    while True:
        html.send_keys(Keys.PAGE_UP) 
        ctr+=1
        print(ctr)
        if(ctr==100):
            break

def close():
    web.close()
#web.find_element_by_tag_name('body').send_keys(Keys.HOME)



def main_handler():
    open_players_page()
    accept_cookies()
    #scroll_down()



main_handler()


link_list = []
link_set = set()
player_temp_dict = {}
#/html/body/main/div[2]/div[1]/div/section/div[1]/div[2]
whole_players = []
for i in range(4):
    web.find_element(By.TAG_NAME,'body').send_keys(Keys.CONTROL + Keys.HOME)
    time.sleep(2) 
    #WebDriverWait(web, 20).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="mainContent"]/div[2]/div[1]/div/section/div[1]/div[2]'))).click()
    div = web.find_element_by_xpath('//*[@id="mainContent"]/div[2]/div[1]/div/section/div[1]/div[2]')
    div.click()
    time.sleep(1)
    li = web.find_element_by_xpath("/html/body/main/div[2]/div[1]/div/section/div[1]/ul/li[" + str(i+1) + "]")
    season = li.text
    li.click()
    time.sleep(1)
    scroll_down()
    players = web.find_elements(By.XPATH,'//*[@id="mainContent"]/div[2]/div[1]/div/div/table/tbody/tr')
    #player_list = []
    for player in players:
        attr = player.find_elements(By.TAG_NAME,'td')
        [name, position, country] = attr #Object Destruction
        td_name = name.find_elements(By.TAG_NAME,'a')
        [link] = td_name
        href = link.get_attribute("href")
        print(href)
        
        player_temp_dict[href] = [name.text, position.text, country.text] 
        #link_list.append(href)
        if (href not in link_set):
            link_set.add(href)


for iterator_link in link_set:
    web.get(iterator_link)
    time.sleep(3)
    player_dict = {}
    #get name
    try:
        player_dict["name"] = player_temp_dict[iterator_link][0]
    except NoSuchElementException:
        print("NULL") 
        player_dict["name"] = "NULL"

    #get position
    try:
        player_dict["position"] = player_temp_dict[iterator_link][1]
    except NoSuchElementException:
        print("NULL") 
        player_dict["position"] = "NULL"
    #get nationality
    try:
        player_dict["country"] = player_temp_dict[iterator_link][2]
    except NoSuchElementException:
        print("NULL") 
        player_dict["country"] = "NULL"

    #get weight
    
    #get height
    try:       
        height_div = web.find_elements_by_xpath("/html/body/main/div[3]/div/div/div[1]/section/div/ul[3]/li[1]/div[2]")
        if (len(height_div) > 0):
            [height_info] = height_div
            player_dict["height"] = height_info.text
    except NoSuchElementException:
        print("NULL") 
        player_dict["height"] = "NULL"
    try:       
        dob_div = web.find_elements_by_xpath("/html/body/main/div[3]/div/div/div[1]/section/div/ul[2]/li/div[2]")
        if (len(dob_div) > 0):
            [dob_info] = dob_div
            lst = dob_info.text.strip().split(' ')
            player_dict["date_of_birth"] = lst[0]
    except NoSuchElementException:
        print("NULL") 
        player_dict["date_of_birth"] = "NULL"

    try:       
        personal_details = web.find_element_by_class_name("personalDetails")
        sourceHTML = personal_details.get_attribute('innerHTML')
        weight_found = sourceHTML.find('kg</div>')
        if(weight_found != -1):
            player_weight = sourceHTML[weight_found - 6: weight_found]
            actual_weight = player_weight.split('>')[1]
            player_dict["weight"] = actual_weight
    except NoSuchElementException:
        print("NULL") 
        player_dict["weight"] = "NULL"


    if(player_dict is not None):
        whole_players.append(player_dict)


    #get seasons and club names

 

        
   
web.close()

#Create a DataFrame and Export CSV


df = pd.DataFrame(whole_players)
df.to_csv(r'AllPlayersWithWeightFinal.csv',index=True)

