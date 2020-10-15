*** Settings ***
Documentation  Its a POC suite for Robot framework where we are implementing services and UI testcases
Resource  ../Resources/ObjectRepository.robot
Library  AppiumLibrary
Library  RequestsLibrary
*** Variables ***
${base_URL}   https://reqres.in
${key}   /api/users
*** Test Cases ***
Validating API and UI for Reqrez application
    [Documentation]  Maintaining employee profile based on their job
    Create API session
    Check Site is up and GET request is successful
    Check POST request is successful
    User launches Emulator and Opens application
#    Check a failed response
    User creates a new Job Profile


*** Keywords ***
Create API session
    create session  APISession  ${base_url}

Check Site is up and GET request is successful
    ${response}=  get request  APISession  ${key}
    should be equal as strings  ${response.status_code}  200

Check POST request is successful
    ${body}=  create dictionary  name=morpheus  job=leader
    ${header}=  create dictionary    Content-Type=application/json
    ${responses}=  post request  APISession  ${key}  data=${body}  headers=${header}
    should be equal as strings  ${responses.status_code}  201

User launches Emulator and Opens application
    OPEN APPLICATION  http://localhost:4723/wd/hub  platformName=Android  deviceName=emulator-5554   appPackage=com.lubulwa.reqrez  appActivity=com.lubulwa.reqrez.ui.component.splash.SplashActivity  automationName=Uiautomator2
    Wait Until Page Contains Element  ${pageRefresh}  timeout=10

Check a failed response
    ${response}=  get request  APISession  ${key}
    should be equal as strings  ${response.status_code}  400

User creates a new Job Profile
    Click Element  ${addUserJobProfile}
    Wait Until Page Contains Element  ${userName}  timeout=10
    Input Text  ${userName}  Mike
    Input Text  ${jobProfile}  Kroger
    Click Element  ${createUserButton}