[login_Report_fixed2-.md](https://github.com/user-attachments/files/17940822/login_Report_fixed2-.md)[login-Report-.md](https://github.com/user-attachments/files/17940813/login-Report-.md)
Cybersecurity and data privacy 2024

#Logbook

30.10.2024, 2h, Kick-off lecture, Getting to know 
| Date  | Used Hours | Subject(s) | Output |
| ----- | ---------- | ----------- | ------- |
| 03.11.2024 | 2 | Kick-off lecture | watched the lecture, got to know the Github better |
| 04.11.2024 | 1 | Lecture 2 | signed in to the Portswigger, listened the lecture |
| 06.11.2024 | 3 | Lecture 4 | the lecture, tried to do the booking system project |
| 11.11.2024 | 3 | Lecture 5 | the lecture, the Portswigger labs |
| 13.11.2024 | 2,5 | Lecture - | the workshop, the Portswigger labs |
| 17.11.2024 | 2 | Lecture - |  lectures, The booking system project 1 |
| 23.11.2024 | 3 | Lecture - |  The booking system project 1 |
| 24.11.2024 | 3,5 | Lecture - |  The booking system project 1 |
| 26.11.2024 | 2 | Lecture - |  The booking system project 2 |
| 26.11.2024 | 3 | Lecture - |  lectures, The booking system project 2 |
| 27.11.2024 | 6 | Lecture - | lectures,  The booking system project 2 |
| 05.12.2024 | 4,5 | Lecture - | lectures,  started doing The booking system project 3 |
| 06.12.2024 | 3 | Lecture - | more lectures, continued with The booking system project 3 |
| 08.12.2024 | 2,5 | Lecture - | The booking system project 3, tried to get zap working properly|
|15.12.2024  |3 |              |last three lectures
|16.12.2024  |4 |              |more Portswigger labs, cisco exam
|19.12.2024  |2,5|             |finished the booking system project 3, started to do the final phase


### Project phase 3 reports:

Security Findings for the Booking System
1. Suspicious Comments (Passive Alert 10027)
The application contains comments in its responses that may disclose sensitive information to an attacker. This was flagged by ZAP as a Passive Alert 10027.
I would review the source code and remove all unnecessary comments, particularly those that include debugging information or mention sensitive system details or paths.

2. Loosely Scoped Cookies (Passive Alert 90033)
Cookies are scoped too broadly, allowing them to be accessed by subdomains unnecessarily. This can increase the risk of cookie theft. It was found because ZAP flagged it as a Passive Alert 90033. I would scope cookies to the specific subdomain where they are needed. 


3. Authentication Request Identified (Passive Alert 10111)
ZAP identified requests that are likely used for authentication but did not detect any apparent issues with them. This alert is informational. I would review authentication requests for potential vulnerabilities, such as insecure password storage.

4. Modern Web Application Detected (Passive Alert 10109)
ZAP detected that the application is a modern web application, likely using dynamic JavaScript frameworks or Single Page Application technology. This alert is informational. No direct action required, but this information can guide further testing.

5. Session Management Response Identified (Passive Alert 10112)
ZAP identified responses containing session management tokens, such as cookies or headers. This alert is informational and indicates how session management is implemented.
I would review session management practices. Ensure tokens are random, unique, and securely generated, and verify that session tokens are stored and transmitted securely.


### Project phase 2 reports:

[Uploadin# ZAP by Checkmarx Scanning Report

ZAP by [Checkmarx](https://checkmarx.com/).


## Summary of Alerts

| Risk Level | Number of Alerts |
| --- | --- |
| High | 0 |
| Medium | 1 |
| Low | 2 |
| Informational | 1 |




## Alerts

| Name | Risk Level | Number of Instances |
| --- | --- | --- |
| Content Security Policy (CSP) Header Not Set | Medium | 1 |
| Application Error Disclosure | Low | 1 |
| Information Disclosure - Debug Error Messages | Low | 1 |
| Authentication Request Identified | Informational | 1 |




## Alert Detail



### [ Content Security Policy (CSP) Header Not Set ](https://www.zaproxy.org/docs/alerts/10038/)



##### Medium (High)

### Description

Content Security Policy (CSP) is an added layer of security that helps to detect and mitigate certain types of attacks, including Cross Site Scripting (XSS) and data injection attacks. These attacks are used for everything from data theft to site defacement or distribution of malware. CSP provides a set of standard HTTP headers that allow website owners to declare approved sources of content that browsers should be allowed to load on that page — covered types are JavaScript, CSS, HTML frames, fonts, images and embeddable objects such as Java applets, ActiveX, audio and video files.

* URL: http://localhost:8000/login
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: ``
  * Other Info: ``

Instances: 1

### Solution

Ensure that your web server, application server, load balancer, etc. is configured to set the Content-Security-Policy header.

### Reference


* [ https://developer.mozilla.org/en-US/docs/Web/Security/CSP/Introducing_Content_Security_Policy ](https://developer.mozilla.org/en-US/docs/Web/Security/CSP/Introducing_Content_Security_Policy)
* [ https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html ](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html)
* [ https://www.w3.org/TR/CSP/ ](https://www.w3.org/TR/CSP/)
* [ https://w3c.github.io/webappsec-csp/ ](https://w3c.github.io/webappsec-csp/)
* [ https://web.dev/articles/csp ](https://web.dev/articles/csp)
* [ https://caniuse.com/#feat=contentsecuritypolicy ](https://caniuse.com/#feat=contentsecuritypolicy)
* [ https://content-security-policy.com/ ](https://content-security-policy.com/)


#### CWE Id: [ 693 ](https://cwe.mitre.org/data/definitions/693.html)


#### WASC Id: 15

#### Source ID: 3

### [ Application Error Disclosure ](https://www.zaproxy.org/docs/alerts/90022/)



##### Low (Medium)

### Description

This page contains an error/warning message that may disclose sensitive information like the location of the file that produced the unhandled exception. This information can be used to launch further attacks against the web application. The alert could be a false positive if the error message is found inside a documentation page.

* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: ``
  * Attack: ``
  * Evidence: `HTTP/1.1 500 Internal Server Error`
  * Other Info: ``

Instances: 1

### Solution

Review the source code of this page. Implement custom error pages. Consider implementing a mechanism to provide a unique error reference/identifier to the client (browser) while logging the details on the server side and not exposing them to the user.

### Reference



#### CWE Id: [ 200 ](https://cwe.mitre.org/data/definitions/200.html)


#### WASC Id: 13

#### Source ID: 3

### [ Information Disclosure - Debug Error Messages ](https://www.zaproxy.org/docs/alerts/10023/)



##### Low (Medium)

### Description

The response appeared to contain common error messages returned by platforms such as ASP.NET, and Web-servers such as IIS and Apache. You can configure the list of common debug messages.

* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: ``
  * Attack: ``
  * Evidence: `Internal Server Error`
  * Other Info: ``

Instances: 1

### Solution

Disable debugging messages before pushing to production.

### Reference



#### CWE Id: [ 200 ](https://cwe.mitre.org/data/definitions/200.html)


#### WASC Id: 13

#### Source ID: 3

### [ Authentication Request Identified ](https://www.zaproxy.org/docs/alerts/10111/)



##### Informational (High)

### Description

The given request has been identified as an authentication request. The 'Other Info' field contains a set of key=value lines which identify any relevant fields. If the request is in a context which has an Authentication Method set to "Auto-Detect" then this rule will change the authentication to match the request identified.

* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `username`
  * Attack: ``
  * Evidence: `password`
  * Other Info: `userParam=username
userValue=foo-bar@example.com
passwordParam=password
referer=http://localhost:8000/login`

Instances: 1

### Solution

This is an informational alert rather than a vulnerability and so there is nothing to fix.

### Reference


* [ https://www.zaproxy.org/docs/desktop/addons/authentication-helper/auth-req-id/ ](https://www.zaproxy.org/docs/desktop/addons/authentication-helper/auth-req-id/)



#### Source ID: 3


g login-Report-.md…]()


## **Muutin login.html ja login.js -tiedostoja niin, että kirjautumisessa tapahtuvan virheen seurauksena käyttäjälle näkyy virheviesti sekä käyttäjä ohjataan takaisin kirjautumissivustolle. Ilman virheviestiä käyttäjä näkee arkaluontoisia palvelimen virheilmoituksia, joka paljastaa teknisiä tietoja. Tämä auttaa estämään esimerkiksi sisäisten tietojen vuotamisen.**


[# ZAP by Checkmarx Scanning Report

ZAP by [Checkmarx](https://checkmarx.com/).


## Summary of Alerts

| Risk Level | Number of Alerts |
| --- | --- |
| High | 0 |
| Medium | 0 |
| Low | 0 |
| Informational | 3 |




## Alerts

| Name | Risk Level | Number of Instances |
| --- | --- | --- |
| Authentication Request Identified | Informational | 1 |
| Modern Web Application | Informational | 2 |
| User Agent Fuzzer | Informational | 12 |




## Alert Detail



### [ Authentication Request Identified ](https://www.zaproxy.org/docs/alerts/10111/)



##### Informational (High)

### Description

The given request has been identified as an authentication request. The 'Other Info' field contains a set of key=value lines which identify any relevant fields. If the request is in a context which has an Authentication Method set to "Auto-Detect" then this rule will change the authentication to match the request identified.

* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `username`
  * Attack: ``
  * Evidence: `password`
  * Other Info: `userParam=username
userValue=foo-bar@example.com
passwordParam=password
referer=http://localhost:8000/login`

Instances: 1

### Solution

This is an informational alert rather than a vulnerability and so there is nothing to fix.

### Reference


* [ https://www.zaproxy.org/docs/desktop/addons/authentication-helper/auth-req-id/ ](https://www.zaproxy.org/docs/desktop/addons/authentication-helper/auth-req-id/)



#### Source ID: 3

### [ Modern Web Application ](https://www.zaproxy.org/docs/alerts/10109/)



##### Informational (Medium)

### Description

The application appears to be a modern web application. If you need to explore it automatically then the Ajax Spider may well be more effective than the standard one.

* URL: http://localhost:8000/login
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `<script>
        
        if (window.location.search.includes("error=true")) {
            document.getElementById("error-message").style.display = "block";
        }
    </script>`
  * Other Info: `No links have been found while there are scripts, which is an indication that this is a modern web application.`
* URL: http://localhost:8000/login%3Ferror=true
  * Method: `GET`
  * Parameter: ``
  * Attack: ``
  * Evidence: `<script>
        
        if (window.location.search.includes("error=true")) {
            document.getElementById("error-message").style.display = "block";
        }
    </script>`
  * Other Info: `No links have been found while there are scripts, which is an indication that this is a modern web application.`

Instances: 2

### Solution

This is an informational alert and so no changes are required.

### Reference




#### Source ID: 3

### [ User Agent Fuzzer ](https://www.zaproxy.org/docs/alerts/10104/)



##### Informational (Medium)

### Description

Check for differences in response based on fuzzed User Agent (eg. mobile sites, access as a Search Engine Crawler). Compares the response statuscode and the hashcode of the response body with the original response.

* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (Windows NT 10.0; Trident/7.0; rv:11.0) like Gecko`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3739.0 Safari/537.36 Edg/75.0.109.0`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/91.0`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (iPhone; CPU iPhone OS 8_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12A366 Safari/600.1.4`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16`
  * Evidence: ``
  * Other Info: ``
* URL: http://localhost:8000/login
  * Method: `POST`
  * Parameter: `Header User-Agent`
  * Attack: `msnbot/1.1 (+http://search.msn.com/msnbot.htm)`
  * Evidence: ``
  * Other Info: ``

Instances: 12

### Solution



### Reference


* [ https://owasp.org/wstg ](https://owasp.org/wstg)



#### Source ID: 1


Uploading login_Report_fixed2-.md…]()



