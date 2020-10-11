*** Settings ***
Library  AppiumLibrary
*** Test Cases ***
Open_Application
    OPEN APPLICATION  http://localhost:4723/wd/hub  platformName=Android  deviceName=emulator-5554   appPackage=chat21.android.demo  appActivity=chat21.android.demo.SplashActivity  automationName=Uiautomator2
