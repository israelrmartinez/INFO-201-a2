### This file contains your main code.
### Feel free to rename it, or split it into several files.
###
### Your final product should contain the code along the following lines:

##    ---------- Google Civic Information API ----------
## 1. create the google civic platform request and httr::GET() the result
##    you need to include your api key in the request.  See the documentation
##    https://developers.google.com/civic-information/
##    https://developers.google.com/civic-information/docs/v2/
##    in particular the reference section.
##
##    Note: you can try the requests by submitting these through your browser by entering the
##    full query (base url, endpoint, query) in your browser's address bar.
##    If it is correct correct, it will display the corresponding JSON data.  If
##    incorrect, you get an error message.

## 2. extract the elected officials' data from the result
##    The data contains many relevant variables, including normalized address,
##    'offices' and 'officials'.  In order to attach the officials (people)
##    with offices (jobs), I recommend to use dplyr joins (what would be the key?)
##    More about joins in
##    https://info201.github.io/dplyr.html#joins
##    http://r4ds.had.co.nz/relational-data.html

## 3. transform the data into a well formatted table
##    I recommend you transform the data into markdown strings.  For instance,
##    to display a html link as a link in the markdown file, you may want to
##    embed it between "[](" and ")".
##    
##    You may want to consider improved table printing, look for details at the rmarkdown
##    page at
##    http://rmarkdown.rstudio.com/index.html
##    

## -------------------- propublica --------------------
## 4. Get state representatives from propublica congress API
##    you need the respective API key.
##
##    Note1: the api key must be sent as 'X-API-Key'.  No other name, such as 'api-key'
##    will work.
##
##    Note2: Propublica API has several endpoints.  The relevant one here is 'members'.
##    It which allows you to get lists of members, lists of members by state,
##    specific member by id, voting data, and more.
##    
##    Read the documentation:
##    https://projects.propublica.org/api-docs/congress-api/members/
##    
##
## 5. transform it in a form you can use for visualizations.
## 
##    For the first visualization you have to extract the party affiliation of all the members
##    and make a histogram of that data.
##    
## 6. pick a representative.
##
##    Note: this representative must correspond to the state the address points to.  Different
##    states have different number of representatives, I recommend to pick one of these at random. 
##
## 7. get this representative's info
##
##    Consult the 'members' endpoint and the examples related to information about a particular member.
##
## 8. get her recent votes.
##
##    In order to get the percentage of votes with majority, you have:
##    a) get the member's voting data (see the same API documentation)
##    b) pick the most recent votes (the data includes vote date)
##    c) find her position (Yes/No)
##    d) find the total votes (yes/no)
##    Consult the example in the API documentation that includes the relevant JSON result.
##
