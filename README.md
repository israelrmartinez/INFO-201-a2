# Who Are Representing You?


You task is to display some information about elected officials,
representing a given US address.  The report should be written in
R-markdown, and given a valid address, it should compile to an html
file that includes the federal, state, and county level
representatives, and summary information about the state's members of
the House of Representatives.  The final report markdown file should
compile for different addresses: if you pick an address in any state
and recompile, it will show the representatives for that address.

The task may sound overwhelming, but API-s help you.  In particular,
we expect you to use
[google civic platform](https://developers.google.com/civic-information/)
that links elected officials for a given address, and
[pro publica congress](https://www.propublica.org/datastore/api/propublica-congress-api)
that includes information about state representatives, such as party
membership and voting history.

The repo also includes a few files that help you to get started:
* _index\_stub.rmd_: a stub for the report.  We recommend you to take
  this file as template and start filling it with your code and text.
  It also includes suggestions and example pieces of code.
* _process\_data.R_: template stub file that should contain your main
  data analysis code.  You may take this too as the template for your
  actual code.
* _index.html_: an example how the result should look like
* _styles.css_: a proposed stylesheet (how to use this is visible from
  the .rmd file).
* _Makefile_: in case you want to compile it from command line, not
  from within Rstudio.
  

## Proceed along the following lines:

### 1. Become familiar with the example:

See the included _index.html_ file.

### 2. Learn about the basics of
[google civic platform API](https://developers.google.com/civic-information/)
and 
[pro publica congress API](https://www.propublica.org/datastore/api/propublica-congress-api). Both
of these API-s require a valid key.  ProPublica Congress API key
can be requested on the same webpage, for Google Civic Platform
API, follow the instructions
[here](https://support.google.com/cloud/answer/6158862).

### 3. Store the API keys

Store the keys on your computer:
* don't upload these to GitHub!
* don't put these in the code that will be uploaded to GitHub!

There are many ways to achieve this.  However, from grading point of
view, please do like this:
1. create an R file _keys.R_ in the same project folder.  The file
   should contain the keys in the form:  

```
google.key <- "123xyz"
propublica.key <- "abc456"
```
   The file should not contain anything else.  Please use exactly the
   same names for the keys and the keyfile.
2. add this file to _.gitignore_


### 4. Get familiar with API-s

I recommend first to experiment with the queries on the interactive
consoles, provided with both API-s.  In particular, you should manage
to: 
* get the elected officials' info from Google's _civic platform_
* get the list of state representatives from _ProPublica Congress_
* get selected representative's voting history and personal
  information from _ProPublica Congress_
  

### 5. Short introduction

Write a short introduction (a few sentences) where you explain where
you get the following information.  Provide API links!  Use
bold/italics according to need.
  

### 6. Table of all elected officials 

Create a table of all elected officials.
The table should contain all elected officials from Civic Platform for
the address. The table should include
* name
* position
* party
* email (link)
* phone
* photo
Ensure that missing information (such as missing phone numbers) are
displayed in an pleasant and informative way (such as _not available_
or '-') and not as `<NA>` or other kind of ugly code.

### 7. House of Representatives (aka 'The House')

For the House representatives, display:
* state name and the number of representatives for that state
* create a _horizontal barplot_ (histogram) that shows the
  distribution of party affiliations for the
  representatives of the state
* create another relevant visualization

Ensure the figures are appropriately labeled, and font sizes and colors
are appropriate.


### 8. Tell us about a representative

Finally, pick an arbitrary representative (usually abbreviated as 'Rep') for that state and display some personal information
about him/her:
* name.  The name should be included in the header.
* age, in years, computed based on the birthday and current date
* twitter name (should be link to the corresponding twitter page)
* percentage of votes he/she cast with the majority through the last
  20 or so votings.

Note: the representative should represent the _relevant state_,
i.e. if you change the state of the address, you have to show a
different representative.  I recommend to pick a random representative
out of the state's Rep-s, check out the `sample` function.


### 9. Does it look good?

* Ensure that you explain and introduce your charts and tables with
  suitable amount of text.
* The tables should look human-readable and pleasant, and must not
  include leftovers of JSON, raw HTML, computer code etc.


## Further ideas

If you consider these ideas relevant, you may dig deeper into the data
and create a group project that shows how many times representatives
have voted for/against certain type of legislation, and how often they
have voted along/across party lines.

