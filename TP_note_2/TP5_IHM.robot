*** Settings ***
Library  SeleniumLibrary
Test Setup  Ouvrir Prestashop
Test Teardown  Fermer Prestashop 

*** Variables ***
${Moteur_Recherche}  edge

${Cat_Vetements}  //*[@id="category-3"]/a
${Cat_Homme}  //*[@id="category-4"]/a
${Cat_Femme}  //*[@id="category-5"]/a

${Cat_Accessoires}  //*[@id="category-6"]/a
${Cat_Papeterie}  //*[@id="category-7"]/a
${Cat_Accessoires_maison}  //*[@id="category-8"]/a

*** Test Cases ***

test2
  [Template]  Verifier categorie invisible
  ${Cat_Homme}  ${Cat_Vetements}
  ${Cat_Papeterie}  ${Cat_Accessoires}

# On utilise le template pour vérifier plusieurs jeux de données notamment vérifier que la catégorie homme apparait sous la catégorie vetement. De meme que la catégorie papeterie apparait sous la catégorie accessoires.


*** Keywords ***
Ouvrir Prestashop
  Open Browser  http://www.qualifiez.fr/monPrestashop2/prestashop/index.php  ${Moteur_Recherche}
  Title Should Be  monPrestashop
  Maximize Browser Window

Fermer Prestashop
  Close Browser

Verifier categorie invisible
  [Arguments]  ${Bouton_a_verif}  ${Bouton_primaire}
  Element Should Not Be Visible  xpath=${Bouton_a_verif}
  Mouse Over  xpath=${Bouton_primaire}
  Element Should Be Visible  xpath=${Bouton_a_verif}

  
