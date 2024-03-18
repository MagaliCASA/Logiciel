*** Settings ***
Library  SeleniumLibrary
Test Setup  Ouvrir Youtube
Test Teardown  Fermer Youtube

*** Variables ***
${Moteur_Recherche}  edge

${Barre_recherche}  xpath=/html/body/ytd-app/div[1]/div/ytd-masthead/div[4]/div[2]/ytd-searchbox/form/div[1]/div[1]/input
${Titre_Video}  xpath=//*[@id="video-title"]/yt-formatted-string
${Bouton_Pub}  xpath=/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[1]/div[2]/div/div/ytd-player/div/div/div[20]/div/div[3]/div/div[2]/span/button/div
${Bouton_Cookies}  xpath=//*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[1]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]

*** Test Cases ***
prank
  Fermer Cookies
  Rechercher Youtube  Never Gonna Give You Up
  Cliquer Video  Never Gonna Give You Up
  Passer pub
  
*** Keywords ***
Ouvrir Youtube
  Open Browser  https://www.youtube.com  ${Moteur_Recherche}
  Title Should Be  YouTube
  Maximize Browser Window

Fermer Youtube
  Close Browser

Rechercher Youtube  
  [Arguments]  ${recherche}  
  Input Text  ${Barre_recherche}  ${recherche}
  Press Keys  ${Barre_recherche}  RETURN

Cliquer Video
  [Arguments]  ${recherche}
  Wait Until Element Is Visible  ${Titre_Video}
  Element Should Contain  ${Titre_Video}  ${recherche}
  Mouse Over  ${Titre_Video}
  Mouse Down  ${Titre_Video}
  Mouse Up  ${Titre_Video}
Passer pub 
  Wait Until Element Is Visible  ${Bouton_Pub}  85
  Mouse Over  ${Bouton_Pub}
  Mouse Down  ${Bouton_Pub}
  Mouse Up  ${Bouton_Pub}
  Wait Until Element Is Visible  ${Bouton_Pub}  85
  Mouse Over  ${Bouton_Pub}
  Mouse Down  ${Bouton_Pub}
  Mouse Up  ${Bouton_Pub}
  Wait For Condition  False  120
  
Fermer Cookies
  Mouse Over  ${Bouton_Cookies}
  Mouse Down  ${Bouton_Cookies}
  Mouse Up  ${Bouton_Cookies}
  Wait Until Element Is Not Visible  ${Bouton_Cookies}  10


  
