from tempfile import TemporaryFile
import pandas as pd
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
import time
from selenium.common.exceptions import NoSuchElementException        
import os


"""
try:
    main = WebDriverWait(driver, 10).until( EC.presence_of_element_located((By.ID, "main"))
    )
    articles = main.find_elements_by_tag_name("article")
except:
    driver.quit()
for article in articles:
    header = article.find_element_by_class_name("entry-summary")
    print (header.text)
"""

#Start Chrome Driver
os.startfile("chromedriver.exe")

time.sleep(3)

web = webdriver.Chrome(ChromeDriverManager().install())
"""
options = web.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging'])
driver = web.Chrome(options=options)
"""
#web = webdriver.Chrome() 

web.get('https://www.premierleague.com/clubs')
#web.maximize_window()
time.sleep(5)

#Accept Cookies


accept_cookies = web.find_element_by_xpath('/html/body/div[1]/div/div/div[1]/div[5]/button[1]')
accept_cookies.click()

time.sleep(3)


current_height = web.execute_script("return document.body.scrollHeight")

#scroll

while True:
    print("here")
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


clubs = web.find_elements(By.XPATH,'/html/body/main/div[2]/div/div/div[3]/div/table/tbody/tr')
clubs_list = []
#loop in players for each player: name, position, nationality


club_links_dict = {}
clubs_link = []
clubs_link_set = set()
all_stadiums = []
for club in clubs:
    attr = club.find_elements(By.TAG_NAME, 'td')
    [team, venue] = attr

    anchor = team.find_elements(By.TAG_NAME, 'a')
    [link] = anchor
    href = link.get_attribute('href')
    club_links_dict[href] = [team.text, venue.text]

    clubs_link.append(href)    

    

for club in clubs_link:
    web.get(club)
    time.sleep(3)
    stad_dict = {}
    stad_dict["club_name"] = club_links_dict[club][0]
    stad_dict["stadium_name"] = club_links_dict[club][1]

    try:
        stadium_button = web.find_element_by_xpath("/html/body/main/nav/ul/li[7]/a")
        stadium_button.click()
        time.sleep(2)
    except NoSuchElementException:
        print("NULL")
    try:
        stadium_info_btn = web.find_element_by_xpath("/html/body/main/div[3]/div[2]/div/ul/li[2]")
        stadium_info_btn.click()
        time.sleep(2)
    except NoSuchElementException:
        print("NULL")
  
    try:
        first = web.find_element_by_xpath("//*[contains(text(), 'Capacity')]")
        capacity = first.find_element_by_xpath("..")
        stad_capacity = capacity.text
        stad_capacity_lst = stad_capacity.split(' ')
        stad_dict["capacity"] = stad_capacity_lst[1]
    except NoSuchElementException:
        print("NULL")   
        stad_dict["capacity"] = "NULL" 
    try:
        first = web.find_element_by_xpath("//*[contains(text(), 'Record PL attendance:')]")
        attendance = first.find_element_by_xpath("..")
        stad_attendance = attendance.text
        stad_attendance_lst = stad_attendance.split(' ')
        stad_dict["record_league_attendance"] = stad_attendance_lst[3]
    except NoSuchElementException:
        print("NULL")  
        stad_dict["record_league_attendance"] = "NULL"  
        
    try:
        first = web.find_element_by_xpath("//*[contains(text(), 'Built')]")
        built = first.find_element_by_xpath("..")
        stad_built = built.text
        stad_built_lst = stad_built.split(' ')
        stad_dict["building_date"] = stad_built_lst[1]

    except NoSuchElementException:
        print("NULL")    
        stad_dict["building_date"] = "NULL"


    try:
        first = web.find_element_by_xpath("//*[contains(text(), 'Stadium address:')]")
        stad_address = first.find_element_by_xpath("..")
        stad_stad_address = stad_address.text
        stad_stad_address_lst = stad_stad_address.split(' ')
        str_joined = ' '.join(stad_stad_address_lst[2:])
        stad_dict["address"] = str_joined

    except NoSuchElementException:
        print("NULL")    
        stad_dict["address"] = "NULL"   


    try:
        first = web.find_element_by_xpath("//*[contains(text(), 'Pitch size:')]")
        pitch_size = first.find_element_by_xpath("..")
        stad_pitch_size = pitch_size.text
        stad_pitch_size_lst = stad_pitch_size.split(' ')
        str_joined =  ' '.join(stad_pitch_size_lst[2:])
        stad_dict["pitch_size"] = str_joined

    except NoSuchElementException:
        print("NULL")    
        stad_dict["pitch_size"] = "NULL"



    if(stad_dict is not None):
        all_stadiums.append(stad_dict)
    #print("type: ", type(website_link))


#print(clubs_list)

web.close()

#Create a DataFrame and Export CSV
df = pd.DataFrame(all_stadiums)
df.to_csv(r'StadiumsTableFinal.csv',index=True)

