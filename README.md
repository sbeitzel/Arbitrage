# Arbitrage

Remember Tai-Pan? Trade Wars? Escape Velocity? Fundamentally, these are games about discovering where one may buy low and
sell high, and trying to come up with trade routes that turn a profit. The trading is made difficult by hazards and fixed
costs (pirates/bandits along the way, fuel) and sometimes market fluctuations (local conditions or time passing changing
the local demand/supply for a particular good). I think this is a pretty interesting system to poke at, and one of the
variables I think is interesting is the speed of information versus the speed of goods. For instance, a courier on a
horse can travel faster than an oxcart, but can only carry some letters and maybe a small pouch of stuff. So, a trader
on the other side of the continent might find out that there's a famine or a gold strike a week or even a month before
a cargo transport shows up with the same news.

C. J. Cherryh's stations and merchanters have an interesting wrinkle on this, with system-local markets moving information
fast and goods slightly slower, but then interstellar markets are connected with links where goods and information travel
at exactly the same speed. Contrast this with Ursula LeGuin's ansible, where information can flow instantaneously everywhere
while goods are limited to sublight speeds. I also like to contrast this with the 19th century: in 1800, horses and sails
were the transports of both information and goods, but by mid-century there were steam engines and telegraphs.

Anyhow. This project is my playground for noodling around with information and goods exchange.

## Initial Implementation

First off, we'll make something really simple. A market has its list of prices and those prices don't change. We'll start
off with a world in which there are ten markets and the prices of goods are all just random. The markets will be sprinkled
around the world vaguely randomly, and the player starts out in the first one generated.

### Basic Gameplay

A player starts off a young trader in some town. They have a small amount of capital, either in the form of cash or
in some goods. They buy and sell goods in their town, then ultimately transport the goods to some other town and try
to turn a profit. Long term, there will be different transports, and all kinds of complications. But to start out,
we'll be keeping track of the turn number, the player's cash balance, and their inventory of goods in town(s). The player
also has a ledger and every time an information packet arrives in the same town as the player, the ledger gets updated
with the news.

## Trade

Goods and information travel between markets, but they don't just teleport. They have to travel along routes, and that
travel takes time. Ultimately, I think I want some kind of map, perhaps with terrain that could impact the kinds of
transport that get used and how long travel takes.

To start off, however, I'll make it stupid simple. Travel takes constant time based only on distance and every market
has a route to every other market (it's a fully connected weighted graph where the edge weight equals the distance). This
means that to start off with, I don't need to build a graph at all.
