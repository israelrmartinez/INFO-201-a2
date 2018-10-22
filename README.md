# Who Is Representing You?

This is the first real data-programming task.  As such, it is
much more time-consuming than the earlier
intro-to-programming homeworks.  Quite a substantial task is digging
into the API documentation, experimenting with the queries, and trying
squeeze uncooperative results into the desired form!  Unfortunately,
this is a frequent experience with APIs.  Data comes in a million
different ways on the internet, the API-s are fluid, and bad
documentation is more of a rule than exception.

Have fun!

---

Your task is to display some information about elected officials,
representing a given US address.  The report should be written in
R-markdown. Given a valid address, it should compile to an html
file that includes the federal, state, and county level
representatives (_representatives_ as in  "_representing_ you"), as well as summary
information about the state's Representatives (meaning "members of
the
[House of Representatives](https://en.wikipedia.org/wiki/United_States_House_of_Representatives)").
The markdown document should include the code that updates the final
report as the address is changed: if you pick an address in any state
and recompile, it should show the representatives for that address and
state. 

The task may sound overwhelming, but API-s help you.  In particular,
we expect you to use
[google civic information API](https://developers.google.com/civic-information/)
that links addresses to elected officials, and
[pro publica congress](https://www.propublica.org/datastore/api/propublica-congress-api)
that includes information about state representatives, such as party
membership and voting history.

The repo also includes a few files that help you to get started:
* _index\_stub.rmd_: a stub for the report.  We recommend you to take
  this file as template and start filling it with your code and text.
  It also includes suggestions and example pieces of code.
* We recommend you to rename _index\_stub_ into _index_ as the final
  file should be labelled _index.html_.
* _process\_data.R_: template stub file that should contain your main
  data analysis code.  You may take this too as the template for your
  actual code.
* _index.html_: an example how the result should look like
* _styles.css_: a proposed stylesheet (how to use this is visible from
  the .rmd file).
* For those who want to compile it outside RStudio, the set also
  includes _Makefile_.  If you work in RStudio, it is not needed.


## Before Starting:

### 1. Become familiar with the example:

See the included _index.html_ file.

### 2. Learn about the basics of
[google civic information API](https://developers.google.com/civic-information/)
and
[pro publica congress API](https://www.propublica.org/datastore/api/propublica-congress-api). Both
of these API-s require a valid key.  ProPublica Congress API key
can be requested on the same webpage, for Google Civic Information
API, follow the instructions
[here](https://support.google.com/cloud/answer/6158862).

### 3. Store the API keys

Store the keys on your computer:
* don't upload these to GitHub!
* don't put these in the code that will be uploaded to GitHub!

There are many ways to achieve this.  However, in order to make
grading easier, please do it like this:

1. create an R file _keys.R_ in the same project folder.  The file
   should contain the keys in the form:  

```
google.key <- "123xyz"
propublica.key <- "abc456"
```
   The file should not contain anything else.  Please use exactly the
   same names for the keys and the keyfile.

2. add this file to _.gitignore_, or, even better, store it outside of
   your problemset repo.


### 4. Get familiar with API-s

I recommend to experiment first with the queries on the interactive
consoles, provided with both API-s.  In particular, you should manage
to:

* get the elected officials' info from Google's _Civic Information_.
  First read the relevant documentation for
  [Civic Information API reference](https://developers.google.com/civic-information/docs/v2/)
  and 
  [representatives by address](https://developers.google.com/civic-information/docs/v2/representatives/representativeInfoByAddress).
  Note that Civic Platform expects authentication to be provided as
  **key=_your-google-civic-key_** in the query. 
  In this task you only need to extract the full list of
  representatives by address.
  
* get the list of state representatives from _ProPublica Congress_.
  First, you should familiarize yourself with
  [ProPublica Congress API](https://projects.propublica.org/api-docs/congress-api/)
  and it's
  [_members_ endpoint](https://projects.propublica.org/api-docs/congress-api/members/).
  Note that ProPublica expects the authentication to be provided as
  **X-API-Key: _your-propublica-key_** as a header.  This can be
  achieved by specifying `httr::add_headers("X-API-Key" =
  your-propublica-key)` as an additional argument to your `GET`
  request.  This is very different from Civic Information!

* get selected representative's voting history and personal
  information from _ProPublica Congress_.  The
  [Members endpoint description](https://projects.propublica.org/api-docs/congress-api/members/#get-current-members-by-statedistrict)
  includes links that explain how to get voting positions and a
  specific member data.  Note that voting data includes for each vote
  the representative's position, whether the vote passed, and also
  total number of yeas and nays.  In this way you can compute how much
  the Rep agreed and disagreed with the majority.
  There are also example requests and and json
  results that should give you an idea where to look for the relevant
  results. 


## Starting the Assignment:

### 1. Short introduction

Write a short introduction (a few sentences) where you explain where
you get the following information.  Provide API links!  Use
bold/italics according to need.


### 2. Table of all elected officials

Create a table of all elected officials.  Note that the _GET_ request
provides two tables (embedded into the same json): _offices_, and
_officials_.  Offices are the corresponding position (say, President
of the US), officials are the persons currently at that position (here
Donald J. Trump).  Offices data includes reference for the
corresponding officials.  Note: there are more than one person for
certain offices, such as US Senate.

The final table should contain all elected officials from the Civic Information for
the address. The table should include
* name
* position
* party
* email (link)
* phone
* photo
Ensure that missing information (such as missing phone numbers) are
displayed in an pleasant and informative way (such as _not available_
or '-') and not as `<NA>` or `!Error` or other kind of ugly code.


### 3. House of Representatives (aka 'The House')

For the House of Representatives, display:
* state name and the number of representatives for that state
* create a _horizontal barplot_ (histogram) that shows the
  distribution of party affiliations for the
  representatives of the state
* create another relevant visualization

Ensure the figures are appropriately labeled, and font sizes and colors
are appropriate.


### 4. Tell us about a representative

Finally, pick an arbitrary Representative (i.e. member of the House) for that state and display some personal information
about him/her:
* name.  The name should be included in the header.
* age, in years, computed based on the birthday and current date
* twitter name (should be link to the corresponding twitter page)
* percentage of votes he/she cast with the majority through the last
  20 or so votings.

Note: the representative should represent the _relevant state_,
i.e. if you change the state of the address, you have to show a
different representative.  I recommend to pick a random representative
out of the state's Rep-s, check out the `sample` function to pick a
random element from a list of given elements.


### 5. Does it look good?

* Ensure that you explain and introduce your charts and tables with
  suitable amount of text.
* The tables should look human-readable and pleasant, and must not
  include leftovers of JSON, raw HTML, computer code etc.


## Further ideas

If you consider these ideas relevant, you may dig deeper into the data
and create a group project that shows how many times representatives
have voted for/against certain type of legislation, and how often they
have voted along/across party lines.

## Grading

| Section (points)             |  Task                          | Points            |
| ---------------------------- | ------------------------------ | -----------------:|
| intro (5)                    | address                        | 1                 |
|  				               | API links     				    | 2                 |
| 				  		       | appropriate explanations included | 2                 |
| Table of Officials (25) | Names displayed, linked to website | 5
|                         | photos visible | 6
| 						| missing photos replaced by '-' or similar | 2
| 						| emails are links   | 5
| 						| missing emails replaced by '-' or similar | 2
| 						| phone, party, position included | 5
| House Visualizations (20) | horizontal party barplot | 5
| 	                      | appropriate labels, colors, size | 5
| 						  | the other visualization | 10
| Selected Representative (20) | current age in years | 7
|                              | include twitter link | 3
| 							 | recent vote agreement| 10
| Data processing (30)         | code clear, logical, efficient | 10
|                              | works with different address | 10
| 							 | API keys hidden, not uploaded | 3
| 							 | code organized into appropriate |
| 							 |   functions/files               | 7
