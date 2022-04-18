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
"""
ctr = 1
for club in clubs:
    club_name = club.find_elements(By.XPATH, '/html/body/main/div[2]/div/div/div[3]/div/table/tbody/tr[' + str(ctr) + ']/td[1]/a/div[1]/h4')
    stadium_name = club.find_elements(By.XPATH, '/html/body/main/div[2]/div/div/div[3]/div/table/tbody/tr[' + str(ctr) + ']/td[2]/a')
    ctr += 1
    [club_name_element] = club_name
    [stadium_name_element] = stadium_name
    print(club_name_element.text)
    print(stadium_name_element.text)
    #attr = club.find_elements(By.TAG_NAME,'td')
    #[team, venue] = attr
    club_dict = {
		"club_name": club_name_element.text,
        "stadium_name": stadium_name_element.text
	}

    clubs_list.append(club_dict)
    
"""


for club in clubs:
    attr = club.find_elements(By.TAG_NAME, 'td')
    [team, venue] = attr

    anchor = team.find_elements(By.TAG_NAME, 'a')
    #print("len: ", len(anchor))
    [link] = anchor
    href = link.get_attribute('href')
    #web.get(href)
    #official_website_element = web.find_elements(By.XPATH, '//*[@id="mainContent"]/div[3]/div/div/div/div[1]/a[1]')
    #[official_website] = official_website_element
    
    #print("off: ", official_website.get_attribute("href"))
    club_dict = {
		"club_name": team.text,
        "stadium_name": venue.text,
        "website_entry": href,
        "website": "NULL"
	}
    clubs_list.append(club_dict)    
    

for club in clubs_list:
    web.get(club["website_entry"])
    time.sleep(3)
    try:
        website_link = web.find_element_by_link_text("Official Website")
        club_website_href = website_link.get_attribute("href")
        club["website"] = club_website_href
        web.back()
        time.sleep(2)
    except NoSuchElementException:
        print("NULL")
    #print("type: ", type(website_link))


#print(clubs_list)

web.close()

#Create a DataFrame and Export CSV
df = pd.DataFrame(clubs_list)
df.to_csv(r'ClubsTable.csv',index=True)

