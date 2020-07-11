# pblo.me

## Commits...
This repo was going to be private. But I don't like having projects I've worked on
be closed source, so I made it open source.

So if you take a look at the first commits you will see that I did not care at all
about having tons of them or naming them correctly. So please... don't look at
them...

## Page
This is my personal webpage! I got jealous of other people having one while I
didn't so I decided to create one myself!

## Help
These are bits and pieces I need help with, either because I'm not as good of a
developer to wrap my head around them, because I don't have enough knowledge on
the topic to know how the bases for them work, or just because I think I've not
reached a good solution. I would appreciate it very much if you could help me
with them.

* Instagram icon.
 
	I would want all of them to be loaded from a single file.

	I'm already two thirds of the way there, because the method I've found works with both the GitHub and Twitter icons, but I'm really struggling to have the gradient on the Instagram icon be like that.
	
	I've found a solution, but it's very convoluted, and requests the same resource twice (and the second request ignores caching!).
	
	I'm rendering the plain Instagram icon with an `<svg>` element and a child `<use>` element under it. The `<use>` element has an `href` tag that points to a `symbol` in my sprite file (where all the svg symbols lie), like so: `sprite.svg#instagram`.
	
	But when I want to render the icon with a rainbow fill, I do a completely different procedure.
	
	I first make the svg icon's `fill` transparent. Then I set its background to the gradient, and finally I put another svg icon as a mask.
	
	The problems with this procedure are:
	
	* In order for the mask to load correctly in CSS, I have had to tweak the [`sprite.svg`](src/assets/sprite.svg) file. I've doubled the Instagram symbol, first as a symbol and then as plain svg. This makes the file larger than it could be.  
	* This mask loading thing makes a second request to get the [`sprite.svg`](src/assets/sprite.svg) file, which for some reason bypasses the cache (or maybe the first request to the sprite.svg file just doesn't get cached).
	* I have to do the hard work in CSS, when I have a perfectly functional rendering method in HTML (with the `<svg>` tags).
	
	I would love if there was a way to set an `<svg>`'s `fill` to an image, but I haven't found one. If you know of a way, ***please email me.***