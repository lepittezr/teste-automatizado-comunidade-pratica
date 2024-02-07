*** Settings ***  

Library    SeleniumLibrary
Test Setup    Run Keywords

*** Variables ***  

${URL}        http://sistemas.t2mlab.com:3009/
${BROWSER}    chrome

&{LOGIN_PAGE}
...    UsernameInput=id:formBasicEmail
...    PasswordInput=id:formBasicPassword
...    LoginButton=css=.botao-default

${SELECT_MODULE}    css=.col-lg-3:nth-child(4) .MuiCardMedia-root

&{CAD_COMUNIDADE}
...    CadastrarComunidade=css=.bRyZhd > .botao-default
...    LinkImagem=id=validationCustom01
...    NomeLider=css=.col-md-6 > #validationCustom01
...    Categoria=id=validationCustom02
...    Descricao= id=validationCustom03
...    BotaoEnviar=xpath=//button[contains(.,'Enviar')]

*** Keywords ***  

Realizar Login 
    Input Text    ${LOGIN_PAGE.UsernameInput}    Alan
    Input Password    ${LOGIN_PAGE.PasswordInput}    123
    Click Element    ${LOGIN_PAGE.LoginButton}

Selecionar Módulo
    Wait Until Element Is Visible    ${SELECT_MODULE}    timeout=10s
    Click Element    ${SELECT_MODULE}

Cadastrar Comunidade
        Wait Until Element Is Visible    ${CAD_COMUNIDADE.CadastrarComunidade}    timeout=10s
        Click Element    ${CAD_COMUNIDADE.CadastrarComunidade}
        Input Text    ${CAD_COMUNIDADE.LinkImagem}    https://img.freepik.com/vetores-gratis/mao-desenhada-pessoas-felizes-pulando_23-2149092878.jpg
        Input Text    ${CAD_COMUNIDADE.NomeLider}    Evangelson
        Input Text    ${CAD_COMUNIDADE.Categoria}    Diversão
        Input Text    ${CAD_COMUNIDADE.Descricao}    Discussão do dia: Biscoito ou bolacha? (BISCOITO, óbvio)
        Click Element    ${CAD_COMUNIDADE.BotaoEnviar}

*** Test Cases ***  
TC001 - Realizar Login com usuário válido 
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar Login
    Selecionar Módulo
    Cadastrar Comunidade