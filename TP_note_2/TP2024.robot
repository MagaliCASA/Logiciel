*** Settings ***
Library  SeleniumLibrary
Test Setup  Ouvrir Prestashop
Test Teardown  Fermer Prestashop 

*** Variables ***
${Cat_Vetements}  //*[@id="category-3"]/a
${Cat_Homme}  //*[@id="category-4"]/a
${Cat_Femme}  //*[@id="category-5"]/a

${Cat_Accessoires}  //*[@id="category-6"]/a
${Cat_Papeterie}  //*[@id="category-7"]/a
${Cat_Accessoires_maison}  //*[@id="category-8"]/a

*** Test Cases ***
# test1
#   Rechercher  mug
#   Verifier  Il y a 5 produits.  mug

# test2
#   Rechercher  carnet
#   Verifier  Il y a 3 produits.  carnet

#test3
#  [Template]  Rechercher et verifier
#  mug  Il y a 5 produits.
#  T-Shirt  Il y a 1 produit.
#  carnet  Il y a 3 produits.

#test4
#  Verifier categorie invisible  //*[@id="category-4"]/a  //*[@id="category-3"]/a  

test5
  [Template]  Verifier categorie invisible
  ${Cat_Homme}  ${Cat_Vetements}
  ${Cat_Papeterie}  ${Cat_Accessoires}

*** Keywords ***
Ouvrir Prestashop
  Open Browser  http://www.qualifiez.fr/monPrestashop2/prestashop/index.php  edge
  Title Should Be  monPrestashop
  Maximize Browser Window

Rechercher  
  [Arguments]  ${recherche}  
  Input Text  xpath=//*[@id="search_widget"]/form/input[2]  ${recherche}
  Press Keys  xpath=//*[@id="search_widget"]/form/input[2]  RETURN

Verifier 
  [Arguments]  ${message}  ${recherche}
  Element Text Should Be  xpath=//*[@id="js-product-list-top"]/div[1]/p  ${message}
  @{liste}  Get WebElements  xpath=//*[@id="js-product-list"]/div[1]/div/article/div/div[2]/h2/a
  FOR  ${elt}  IN  @{liste}
    Element Should Contain  ${elt}  ${recherche}  ignore_case=True
  END

Rechercher et verifier
  [Arguments]  ${recherche}  ${message}
  Rechercher  ${recherche}
  Verifier  ${message}  ${recherche}

Verifier categorie invisible
  [Arguments]  ${Bouton_a_verif}  ${Bouton_primaire}
  Element Should Not Be Visible  xpath=${Bouton_a_verif}
  Mouse Over  xpath=${Bouton_primaire}
  Element Should Be Visible  xpath=${Bouton_a_verif}
  
  

Fermer Prestashop
  Close Browser
  