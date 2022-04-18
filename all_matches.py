from gettext import find
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

def open_results_page():
    web.get('https://www.premierleague.com/results')
    time.sleep(5)

#Accept Cookies



def accept_cookies():
    try:
        accept_cookies = web.find_element_by_xpath('/html/body/div[2]/div/div/div[1]/div[5]/button[1]')
        accept_cookies.click()
        time.sleep(3)
    except:
        pass


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




def main_handler():
    open_results_page()
    accept_cookies()
    scroll_down()



main_handler()

first_time = false
all_matches = []
all_matches_dict = {}
all_matches_links_list = []
ctr=0
for i in range(4):
    web.find_element(By.TAG_NAME,'body').send_keys(Keys.CONTROL + Keys.HOME)
    time.sleep(2) 
    try:
        div = web.find_element_by_xpath('/html/body/main/div[3]/div[1]/section/div[3]/div[2]')
        div.click()
        time.sleep(1)
    except:
        pass
    try:
        li = web.find_element_by_xpath("/html/body/main/div[3]/div[1]/section/div[3]/ul/li["+str(i+1)+"]")
        season = li.text
        li.click()
        time.sleep(1)
        scroll_down()
    except:
        pass
    try:
        #section =  web.find_elements_by_class_name("fixtures")
        matches_entities = web.find_elements_by_class_name("fixtures__matches-list")
        #matches_entities = web.find_elements_by_xpath("/html/body/main/div[3]/div[1]/div[2]/section/div")
        
        for match in matches_entities:
            ctr+=1
            print(ctr)
            fixtures = match.find_elements_by_class_name("fixture")
            match_date = match.get_attribute("data-competition-matches-list")
            for fixture in fixtures:
                href = fixture.get_attribute("data-href")
                href = "https:" + href
                #print("href: ", href)
                all_matches_links_list.append(href)
                parent_li = fixture.find_element_by_xpath("..")
                data_home = parent_li.get_attribute("data-home")
                #print("data home: ", data_home)
                data_away = parent_li.get_attribute("data-away")
                #print("data away: ", data_away)
                stadium = parent_li.get_attribute("data-venue")
                stadium_lst = stadium.split(',')
                stadium_name = stadium_lst[0]
                #print("stad: ", stadium_name)
                span_score = parent_li.find_element_by_class_name("score")
                score_lst =  span_score.text.split('-')
                home_score = score_lst[0]
                away_score = score_lst[1]
                #print("home score: ", home_score)
                #print("away score: ", away_score)
                all_matches_dict[href] = [data_home, data_away, home_score, away_score, stadium_name,season, match_date]
 
    except:
        print("No matches entities")


for iterator_link in all_matches_links_list:
        web.get(iterator_link)
        time.sleep(3)

        match_dict = {}
        try:
            match_dict["home_team"] = all_matches_dict[iterator_link][0]
            match_dict["away_team"] = all_matches_dict[iterator_link][1]
            match_dict["goals_home"] = all_matches_dict[iterator_link][2]
            match_dict["goals_away"] = all_matches_dict[iterator_link][3]
            match_dict["goals_away"] = all_matches_dict[iterator_link][3]
            #this will be removed from DB
            match_dict["stadium_name"] = all_matches_dict[iterator_link][4]
            match_dict["season"] = all_matches_dict[iterator_link][5]
            match_dict["match_date"] = all_matches_dict[iterator_link][6]

            #open stats
            match_stats_btn = web.find_element_by_xpath("/html/body/main/div/section[2]/div[2]/div[2]/div[1]/div/div/ul/li[3]")
            match_stats_btn.click()
            time.sleep(3)
            #print("cliked on stats")

        except:
            print("Failed") 

        try:
            tbody = web.find_element_by_class_name("matchCentreStatsContainer")
            stat_rows = tbody.find_elements_by_tag_name("tr")
        except:
            print("Failed") 
        #stat_rows = web.find_element_by_xpath("/html/body/main/div/section[2]/div[2]/div[2]/div[2]/section[3]/div[2]/div[2]/table/tbody/tr")
     
        try:
            for row in stat_rows:
                td_list = row.find_elements_by_tag_name("td")
                #print("len: ", len(td_list))
                if(len(td_list) == 3):
                    [a, b , c] = td_list
                    #print("b: ", b.text)
                    if(b.text == "Possession %"):
                        home_team_possession_val = a.text
                        away_team_possession_val = c.text
                        match_dict["home_team_possession"] = home_team_possession_val
                        match_dict["away_team_possession"] = away_team_possession_val
                    elif(b.text == "Yellow cards"):
                        home_team_yellow_cards_val = a.text 
                        away_team_yellow_cards_val = c.text
                        match_dict["home_team_yellow_cards"] = home_team_yellow_cards_val
                        match_dict["away_team_yellow_cards"] = away_team_yellow_cards_val
                    elif(b.text == "Red cards"):
                        home_team_red_cards_val = a.text 
                        away_team_red_cards_val = c.text
                        match_dict["home_team_red_cards"] = home_team_red_cards_val
                        match_dict["away_team_red_cards"] = away_team_red_cards_val
                    elif(b.text == "Shots"):
                        home_team_shots_val = a.text 
                        away_team_shots_val = c.text
                        match_dict["home_team_shots"] = home_team_shots_val
                        match_dict["away_team_shots"] = away_team_shots_val
                    elif(b.text == "Fouls conceded"):
                        home_team_fouls_val = a.text 
                        away_team_fouls_val = c.text
                        match_dict["home_team_fouls"] = home_team_fouls_val
                        match_dict["away_team_fouls"] = away_team_fouls_val
        except:
            print("Failed")

        if(match_dict is not None):
            all_matches.append(match_dict)


   
web.close()

#Create a DataFrame and Export CSV


df = pd.DataFrame(all_matches)
df.to_csv(r'AllMatchesTableWithFouls.csv',index=True)

