Date: 2011-09-03
Title: The API Culture

Modern publishing platforms have great API's these days. Some are in their second incarnation, which in internet terms is "we've learned a lot from previous mistakes". Tumblr, Instagram, Twitter and even niche apps like [Substance.io](http://substance.io/) have similarly powerful programmable interfaces. The community building and consuming these API's has agreed on some rules in design and implementation. It's not unlike the formation of a culture with fau pax, rules, breaking of rules, good citizens etc. I'm tempted to think "ecosystem" is a more apt term.

I'm frequently on the consumption side of these relationships and I can appreciate the new standards. Switching between API's focuses my cognitive load towards the business differences of each service, as opposed to the awkwardness of the API. We're slowly but surely moving towards an age where API's are transparent layers<sup>1</sup>.

The Web 2.0 promise was always to be able to mash together different services into a whole. Sort of like the Unix philosophy of having small and sturdy specialized units, and other "meta" tools to string them together to create more specialized functions. I believe we are finally entering that age online, and it means the death of the generic site CMS. 

For a recent site build I pulled together these services on one HTML page:

+ 5 photos from a hashtag on **Instagram**
+ 5 posts from a **Tumblr** blog
+ A **Facebook** login to see participants<sup>2</sup> from your social network
+ A tweet from the respective **Twitter** account
+ 2 fonts from **TypeKit**
+ .. and an **Analytics** tracking code for good measure

The only API that relied on backend code was the Facebook login, but that's only because I wanted to log all registrants in a database. Everything else was achieved with asynchronous API calls and none of it feels rickety. And amazingly the page load is fine because I've managed to load most of my assets and API calls asynchronously.

What's funny is that some of these API's have been around for client side consumption for a long time. But none of this had me interested until I moved to Backbone and CoffeeScript. These two are pretty much essential when writing JavaScript at this level IMHO. Before I discovered them I could not bring myself to write this logic in jQuery spaghetti, instead relying on backend Python code with all the caching and duplication it needed. <sup>3</sup>

### A Note on Content Strategy

Fetching the human authored content from the browser side is a dramatic shift in web application architecture. Not only do you get the full power of specialized publishing platforms along with the social networking features, but the programming is less tedious with the right tools at hand. It also encourages developers to adapt to modern interface design, being so close to the interaction layer. Not knowing JavaScript could no longer be an option for web developers.

### The Future of Web Development

> [joehewitt](https://twitter.com/joehewitt/status/108341258602299395): 
> The new way I'm making web apps is you don't get to 
> author an HTML file. The "page" is just a JS file. 
> Static markup is pointless now.

We should narrow the distinction between *apps* and *sites* to nothing. But I'm with you Joe. 

**UPDATE 12/9/2011** [Check out Rasmus' take on the API culture, and rolling his own for client side consumption](http://rsms.me/2011/09/10/dropular-net-tech.html)

- - - 

1. <small>The REST architecture, while not being the one and only transport standard, has become an industry standard. This is fortunate, because the tools are ubiquitous and probably the most well understood spec around. </small>
2. <small>The site referenced here, for the curious is [Global Champion Month](http://www.globalchampionmonth.com/)</small>
3. <small>Just see how [simple it is](https://gist.github.com/1191695) to pull in a Tumblr blog.</small>
