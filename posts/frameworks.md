Date: 2011-11-10
Title: More Thoughts on Frameworks

As long as node.js earned its share of fans and hacker accolades one of the benefits was touted to be one runtime for both environments (browser and clients). That is, JavaScript in the front, JavaScript in the back. Up until now this did not seem like a real benefit to me, and indeed few frameworks actually delivered on this promise, or even tried. However structured and clever your code, you'd always need to think about "front" and "back". Backbone.js blurs the line by reducing your backend to an API without any HTML output. But what line exactly? Where is the trend stopping? What trend?

Templating is an awkward beast in web development. Most template engines start with a loader of ANY text file of ANY structure and replace tags with code, at the end of which placeholder text is injected. The DOM kind of *is* a template engine when you think about it. It starts with a tree and has methods to juggle that tree about, a scripting engine for the logic and methods to modify and inject values. We're in this in-between phase where we love the power and expressiveness of normal template engines, but rarely reach for its power because the looping and value injecting is all done by JavaScript now-days. What I'm suggesting; if what you're dealing with is almost always a DOM, why not express your output in a programmable DOM? And what better tool to juggle the DOM tree then JavaScript and a library like jQuery?

Forward thinking site authors are going this way, but as usual problems present themselves because the rest of the world hasn't adapted to this mode of development. Thing is, making a website play well with important services like Google crawlers and Facebook "Like" buttons requires your site to play by the rules of REST, serving content stuffed HTML. It's probably just a question of time until these services catch up with modern web development and start "pretending" to be JavaScript enabled, but until they do they're a pretty good excuse to ignore the exciting development of new, mostly node.js happy frameworks. Indeed, Google has started indexing DISQUS comments, usually not part of the initial DOM.

What I'm hoping for is a framework that extends the components necessary for a true frameworkial merge of the browser and backend, to both sides of the development model. Web servers are then simply public repositories for interface recipes and URL modeled stateful communication (static files and REST APIs respectfully). We'll need a URL router that works as well when deployed client side as it does when delivering fresh requests. The datastore wraps methods in a thin AJAX crust when in the browser, but in all other aspects behaves the same. The backend runs jQuery for what we used to call the template layer, but is now, prophetically speaking now, simply called: `Tree`.

	
	tree = new HTML5DocumentTree 
		styles: [
			'static/base.css'
			new Stylus 'styles.stylus'
		]
    	scripts: [
    		'static/jquery.js', 
    		new TreeScript 'ready.coffee'
    	]
    	# layout: new LayoutTree
    
    class Animal extends Resource
    
	class AnimalTree extends Tree 
		dom: [
			'div', {className: 'animal'}, 'I am a @name'
		]
		
	index = (req, tree) ->
		dog = new Animal name: "dog"
		dog.tree = new AnimalTree model: dog
		tree.find("body").append dog.tree
	    return tree
	
	routes = {'/': index}
	router = new Router routes

Route callbacks always return DocumentTree instances. If the routes are triggered server side a `tree.ready()` is called and `tree.render()` written to the HTTP response object. That's the bit I'm not sure just how magical must be. 

Tree is a superset server side DOM object. DocumentTree is a subclass of Tree that is smart about structuring itself as an HTML5 document. The `app` object is automatically attached to the `window` DOM object on render. `scripts` is a list of executables or URLs to wrap in `<script>` tags. `ready()` triggers all the $(document).ready callbacks. 

I hope this got you thinking about the evolution of web frameworks. I'm not trying to be political about it, just recognizing that node.js people have a fucking good point about having the same runtime as that of the browser. And an inventive and creative community around it that's thinking much more about this stuff than I am. Check out the freshly released [flatiron](flatironjs.org) framework for some hints at the future.

