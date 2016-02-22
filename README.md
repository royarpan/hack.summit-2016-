# hack.summit-2016-Sockpuppet
Sockpuppet is my koding hack 2016 project. The URL for the project is http://uakse385bad5.aggregato.koding.io:1880/.

How to run the project ?
Click on the "Search tweet" node and in Twitter ID field click the drop down list to select '@arpanroyy'.
Then click deploy. Check out the output in the debug sidebar. 

There are four debug nodes:
(i) shows ISO code for the language of the tweet, 
(ii) shows Watson language translation's confidence in language identified, 
(iii) tweet processed output from Alchemy API: tweet source, keywords extracted by Alchemy API, tweet sentiment value and tweet time,
(iv) logisic regression classifier output showing whether tweet is spam or not.

Only node (iv) is activated. Please activate the other debug nodes to check their outputs (click on the small box to the right of each debug node.

Project description:
Sockpuppet takes as input live tweet data on a certain topic of your choosing (e.g., big data, Kalamazoo) and passes the data to Watson's language translation API.
Language translation determines the language of the tweet and if it predicts the language to be English (ISO code: 'en') with confidence>0.9, the tweet is processed to figure out if its spam or not.
The tweet is added to dataset.txt. The tweet sentiment score is computed and added to the tweet payload for storing.
Then Alchemy API reads the tweet contents and extracts keywords from it. The keywords, tweet source and sentiment value is then combined to form a new payload which is passed to my logistic regression classifier(feedrank).
The classifier has been trained using spam email data to detect spam tweets. It reads in each new tweet's payload and predicts whether it is spam or not.