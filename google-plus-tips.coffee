fs    = require 'fs'
htdoc = require 'htdoc'
eco   = require 'eco'

tips =
  [
  	title:   'bold and italics'
  	content: """
  	         <ul>
  	           <li>To bold text, surround it with *asterisks*.</li>
  	           <li>To italicize text, surround it with _underscores_.</li>
  	         </ul>
  	         """
  ,
    title:   'hide the notification count when searching'
    content: """
             Install one of
             <a href="http://batkin.tumblr.com/post/7454469160/browser-extensions-hide-g-notifications-on">these browser extensions</a>
             to hide the notification count on www.google.com
             (the domain used for searching the web).
             """
  ]

ribbon = '<a href="https://github.com/benatkin/google-plus-tips"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://gs1.wac.edgecastcdn.net/80460E/assets/img/71eeaab9d563c2b3c590319b398dd35683265e85/687474703a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677261795f3664366436642e706e67" alt="Fork me on GitHub"></a>'

template =
  """
  <% for tip in @tips: %>
  <h2><%= tip.title %></h2>
  <%- tip.content %>
  <% end %>
  """

tips_html = eco.render template,
  tips: tips

html = htdoc.htdoc
  html:
    """
    <html>
      <head>
        <title>Google+ Tips</title>
      </head>
      <body>
        <h1>Google+ Tips</h1>
        <div id="tips">
          #{tips_html}
        </div>
        #{ribbon}
      </body>
    </html>
    """
  css:
    """
    h1 {
      color: green;
      font-family: sans-serif;
    }
    #tips {
      max-width: 600px;
    }
    """

fs.writeFileSync 'index.html', html