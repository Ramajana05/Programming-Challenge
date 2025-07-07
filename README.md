# Programming Challenge

## Patterns I Used

I was following the principles of separation of concerns, for a clean architecture.

this project is divided into clear layers:
-	Ui components - (screens and widgets )
- Design layer - (style, color and fonts)
- Logic layer - (primelogic)
- Data layer - (randomprimeapi and timetilllastprime)

this approach makes the app easier to maintain, test and scale.
-> best practise

## Libraries I used 

Intl: For formatting date and time easily. 
Google_fonts: For personal use, since i'm a fan of the lexend font.
Http: To perform http requests and communicate with web apis. So i can get the random number from the given link.
Shared_preferences: To store data locally on the users device, allowing me to save the timestamp of the last detected prime number and calculate the time elapsed since it was received. 

Side note: I know there are libraries for prime detection, but for a simple task like this, I preferred to write it myself, its something ive done often during my studies.

## Assumptions that influenced the design

Responsive layout across devices: The app needs to be responsive and stable across all screen sizes, so I used a layout based on layoutbuilder, adaptive widths and scrolling behaviour to avoid overflows. -> should run perfectly on all devices

Simplicity over complexity: I avoided over engineering and chose to not include external state management libraries like provider or riverpod, since the apps logic could be handled cleanly within statefulwidgets.

Modular dialog instead of second screen: I made the second screen a dialog instead, since i think it's more convenient and not necessary to send the user to a new screen to see if they received a prime number. I also made sure they don't overlap. everytime a new popup opens, the previous one closes automatically, to prevent the app from crashing. 

Handling APIs failures: External APIs can fail or be unavailable at times, so I added proper exception handling and logging to make sure the app stays stable and that it's clear where the issue is on the api side. (Additionally, users feedback - like a popup or a snackbar - could have been added to indicate what's happening for the users to increase the UX)

Lightweight persistence with sharedpreferences: I used sharedpreferences instead of a database or backend, since the app only stores one simple value. Its fast, lightweight and avoids unnecessary complexity.




 








