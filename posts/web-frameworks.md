Date: 2011-11-01
Title: The Web Framework Evolution

Finally getting some not unwelcome free time at work, I did research around the node.js web frameworks and tools. I've been trying out [Brunch](http://brunch.io/), which is a great scaffolding and compiler tool built on top of [Eco](https://github.com/sstephenson/eco) templates, [Stylus](http://learnboost.github.com/stylus/) stylesheets, [Backbone](http://documentcloud.github.com/backbone/) and the now indispensable alternative syntax for JavaScript; [CoffeeScript](http://jashkenas.github.com/coffee-script/). Its purpose is to become a de-facto environment to build HTML5 application front-ends. 

Working with Brunch for a real project now, it strikes me is just how much time in development gets spent in Brunch (CoffeeScript, Backbone, Stylus etc.), and how little time gets spent on the backend. I don't have such a strong preference for Python frameworks anymore. I'd pick Flask because Armin Ronacher is a damned genius, but the time it takes to knock together a Django or Flask app is closing in to very little indeed. Backbone just wants some RESTful JSON endpoints, and is happy to sort, edit and display data, but also communicate with [JSONP enabled API's](http://www.solberg.is/the-api-culture.html).

What if Brunch, currently a client side framework for harnessing all the new browser technology, slowly took over what current server side frameworks are good for? CRUD interfaces, form/model validation and a model persistence layer (ORM?). We'd have something like the Django admin module, but DOM and therefor *design* aware. The questionable WYSIWYG ethos but responsive and truly in-browser, in-DOM even. 

One-off editables would be defined easily with data-* attributes like so:

	<p>Phone number: <span data-key="mysite:phone" data-type="text" data-empty-value="No phone number">+354 616 1339</span></p>
	
	<img data-key="mysite:logo" data-type="image" width="120" src="logo.png">

The idea being that authors can easily provide default values, but make them editable with no extra effort. Different `data-type` values call their respective admin widgets. Single-line text, Markdown text, image uploads, and more. Each widget knows how to update the element and child nodes thereof. Widgets have error and success awareness and can report user or server errors. For lists-of-things or anything more complex and tailored you would define those elements as Backbone models and views with your own widgets, or perhaps classes of multiple fields like a Django `Form` class.

The base classes are tuned towards persistance in Redis, but community extensions can be more document or relational centric.

But the framework needs to solve more problems.

#### The Empty HTML Trend

The web is moving to serving empty HTML sans data then populating the DOM with JSON. This is a problem for Google and such crawlers as all the data is invisible unless it's part of the content provided by the server on the initial HTTP GET. The Backbone.js documentation encourages authors to ship the initial data with the HTML, for quicker loading, but this still doesn't solve anything for SEO and indexation. 

The stars of web development had a debate when Twitter launched with empty HTTP GET pages, populated by AJAX. I won't speak of Twitter's deployment of the technology, but I'm certainly a spokesman of the web being more about URL's than HTTP REST sinners and saints. Joe Hewitt has some excellent writing on this very topic.

The next generation web framework solves this problem by rendering the output in a headless WebKit process and then serving a string presentation of that document object. Testing frameworks like [Zombie.js](http://zombie.labnotes.org/) already do this. I wonder if this is fast enough to do on a per request basis, at least in a development environment. 



