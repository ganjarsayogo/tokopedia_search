*** Settings ***
Library					SeleniumLibrary

*** Variables ***
${url}		 	https://www.tokopedia.com
${browser}		chrome
${logo}			xpath://img[@alt='tokopedia-logo']
${search}		xpath://input[@type='search']
${result}		xpath://div[@data-testid='dSRPSearchInfo']
${product}		xpath://div[@data-testid='CPMProductItem'][1]

*** Test Cases ***
Search
    Open Browser            ${url}		${browser}
    Maximize Browser Window
	Wait Until Page Contains Element		${logo}
	Title Should Be			Situs Jual Beli Online Terlengkap, Mudah & Aman | Tokopedia		// 1st assertion
	Wait Until Page Contains Element		${search}
	Click Element			${search}
	Input Text				${search}			laptop asus
	Press Keys				${search}			ENTER
	Wait Until Page Contains Element		${result}
	Element Should Contain		${result}		laptop asus									// 2nd assertion
	Title Should Be			Jual laptop asus | Tokopedia									// 3rd assertion
	Wait Until Page Contains Element		${product}
	Click Element			${product}
	Capture Page Screenshot
	Close Browser