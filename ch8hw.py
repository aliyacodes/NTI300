#!/usr/bin/python
#hw.py

>>> import os
>>> os.path.join('usr', 'bin', 'spam')
'usr/bin/spam'
>>> 


>>> myFiles = ['accounts.txt', 'details.csv', 'invite.docx']
>>> for filename in myFiles:
...     print(os.path.join('/Users/aliya', filename))
... 
/Users/aliya/accounts.txt
/Users/aliya/details.csv
/Users/aliya/invite.docx
>>> 


>>> import os
>>> os.getcwd()
'/Users/aliyaasken'
>>> os.chdir('/Users/aliyaasken/Documents')
>>> os.getcwd()
'/Users/aliyaasken/Documents'
>>> 


>>> import os
>>> os.makedirs('/Users/aliyaasken/pythontest1/pythontest2/pythontest3')
>>> 


>>> os.path.abspath('.')
'/Users/aliyaasken'
>>> os.path.abspath('./Scripts')
'/Users/aliyaasken/Scripts'
>>> os.path.isabs('.')
False
>>> os.path.isabs(os.path.abspath('.'))
True
>>> 


>>> helloFile = open('/Users/aliyaasken/hello.txt', 'r')
>>> hellloContent = helloFile.read()
>>> hellloContent
'hello'
>>> 


>>> sonnetFile = open('sonnet29.txt')
>>> sonnetFile.readlines()
["When, in disgrace with fortune and men's eyes,\n", 'I all alone beweep my outcast state,\n', 'And trouble deaf heaven with my bootless cries,\n', 'And look upon myself and curse my fate,']
>>> 


>>> baconFile = open('bacon.txt', 'w')
>>> baconFile.write('Hello world!\n')
13
>>> baconFile.close()
>>> baconFile = open('bacon.txt', 'a')
>>> baconFile.write('Bacon is not a vegetable.')
25
>>> baconFile.close()
>>> baconFile = open('bacon.txt')
>>> content = baconFile.read()
>>> baconFile.close()
>>> print(content)
Hello world!
Bacon is not a vegetable.
>>> 


>>> import shelve
>>> shelfFile = shelve.open('mydata')
>>> cats = ['Zophie', 'Pooka', 'Simon']
>>> shelfFile['cats'] = cats
>>> shelfFile.close()
>>> 
>>> shelfFile = shelve.open('mydata')
>>> type(shelfFile)
<class 'shelve.DbfilenameShelf'>
>>> shelfFile['cats']
['Zophie', 'Pooka', 'Simon']
>>> shelfFile.close()
>>> 
>>> shelfFile = shelve.open('mydata')
>>> list(shelfFile.keys())
['cats']
>>> list(shelfFile.values())
[['Zophie', 'Pooka', 'Simon']]
>>> shelfFile.close()
>>> 


>>> import pprint
>>> cats = [{'name': 'Zophie', 'desc': 'chubby'}, {'name': 'Pooka', 'desc': 'fluffy'}]
>>> pprint.pformat(cats)
"[{'desc': 'chubby', 'name': 'Zophie'}, {'desc': 'fluffy', 'name': 'Pooka'}]"
>>> fileObj = open('myCats.py', 'w')
>>> fileObj.write('cats = ' + pprint.pformat(cats) + '\n')
83
>>> fileObj.close()
>>> 


>>> import myCats
>>> myCats.cats
[{'desc': 'chubby', 'name': 'Zophie'}, {'desc': 'fluffy', 'name': 'Pooka'}]
>>> myCats.cats[0]
{'desc': 'chubby', 'name': 'Zophie'}
>>> myCats.cats[0]['name']
'Zophie'
>>> 









