*** Settings ***
Library  SeleniumLibrary
Test Setup  Ouvrir Youtube
Test Teardown  Fermer Youtube

*** Variables ***

*** Test Cases ***
prank
  Fermer Cookies
  Rechercher Youtube  Never Gonna Give You Up
  Cliquer Video  Never Gonna Give You Up
  Passer pub
  
*** Keywords ***
Ouvrir Youtube
  Open Browser  https://www.youtube.com  edge
  Title Should Be  YouTube
  Maximize Browser Window

Fermer Youtube
  Close Browser

Rechercher Youtube  
  [Arguments]  ${recherche}  
  Input Text  xpath=/html/body/ytd-app/div[1]/div/ytd-masthead/div[4]/div[2]/ytd-searchbox/form/div[1]/div[1]/input  ${recherche}
  Press Keys  xpath=/html/body/ytd-app/div[1]/div/ytd-masthead/div[4]/div[2]/ytd-searchbox/form/div[1]/div[1]/input  RETURN

Cliquer Video
  [Arguments]  ${recherche}
  Wait Until Element Is Visible  xpath=//*[@id="video-title"]/yt-formatted-string
  Element Should Contain  xpath=//*[@id="video-title"]/yt-formatted-string  ${recherche}
  Mouse Over  xpath=//*[@id="video-title"]/yt-formatted-string
  Mouse Down  xpath=//*[@id="video-title"]/yt-formatted-string
  Mouse Up  xpath=//*[@id="video-title"]/yt-formatted-string
Passer pub 
  Wait Until Element Is Visible  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div  85
  Mouse Over  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
  Mouse Down  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
  Mouse Up  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
  Wait Until Element Is Visible  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div  85
  Mouse Over  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
  Mouse Down  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
  Mouse Up  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
  Wait For Condition  False  120
  
Fermer Cookies
  Mouse Over  xpath=//*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[1]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
  Mouse Down  xpath=//*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[1]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
  Mouse Up  xpath=//*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[1]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
  Wait Until Element Is Not Visible  xpath=//*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[1]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]  10


  