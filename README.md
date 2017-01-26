# Parallel

[![Build Status](https://travis-ci.org/ptigas/parallel.svg?branch=master)](https://travis-ci.org/ptigas/parallel)

What is parallel?
---

Parallel is a social experiment aiming to address the social psychology of possessions in digital economies and to challenge our perception of property.

![](http://denmyl.com/wp-content/uploads/2015/02/Parallel-800px.jpg)


Parallel Contract
---

Contract is is written in Solidity to run on the Ethereum blockchain. Land is broken down using geohashing. Unclaimed land (geohashes) are free to be claimed.
```
// If Unowned, claim it for free.
owner = land[location].owner;
if (land[location].owner == 0x0) {
    land[location].owner = msg.sender;
    land[location].price = 0; // Set Price to 0.
    geohashes.push(location);
    LandUpdated(location);
} else {
    throw;
}
```
Statement
---

Drawing from the virtual economies that have emerged during the last few years (e.g. the Linden economy in Second Life), it investigates the effect of virtual worlds on our perception of complex societal systems. By introducing the idea of a parallel world where there’s a chance for anyone to prosper, Parallel creates a post-scarcity narrative that stands between reality and conceptuality, to which hypothesis the general public is invited to respond; Parallel takes the form of an online platform that allows users to virtually appropriate the representation of real world assets, such as house and land property or pretty much anything that has exchange value in real life and an online presence. The online platform is a “reset button”, a playground to regulate and rearrange real life property in any way users consider as efficient for a functional cohabitation, as well as a platform to exercise post-scarcity. However, the actual purpose of the project is to record potential responses to the existence of such a platform. The platform becomes a mediator to discuss the complex nature of ethics in economics and to investigate whether the already existing capitalist context is eventually transferred to virtual domains, disrupting the perception of our most idealistic self.
 
In the accompanying video documentation, random people in a public space discuss the idea of having a second chance with property acquisition through their participation in virtual realms and share their thoughts on authority and a hypothetical redistribution of wealth. For this survey we collaborated with a professional who had specialised in door-to-door sales, to engage people with the artefact in question. In the video, people are invited to respond to a scenario of a parallel reality where there is a possibility to prosper; they are asked to contemplate on the hypothesis of appropriating an iconic asset for free, exchanging their own house with something else, or redistributing real world assets more fairly.

![](http://denmyl.com/wp-content/uploads/2015/02/parallel-stills_800px.jpg)

The documentation records the inconsistency in our opinions and beliefs, between reality and a virtually conceived (or reconceived) society; interestingly enough, most of the participants seem to be happy with ideas of shared ownership and fair redistribution in a virtual reality, but when it comes to the virtual version of their own real word assets, they become less solidary “because they are theirs”. The recorded response brings to mind John Rawls’ concept of the “Original Position”, “the appropriate initial status quo which insures that the fundamental agreements reached in it are fair” (Rawls, 1971); what we witness is the fact that the “Original Position” in Parallel is perceived by the participants as the one currently held.
 
Referencing to popular virtual community games and the economies that emerged through them, can give us a very concise idea of how societal issues are addressed within a simulation environment (Bittanti, 2015) (simulation here refers to the conceptual level of engagement, rather than the visual). Parallel as a platform is based on this exact logic of rehearsing and addressing situations in virtual contexts. Considering that post-scarcity is a societal arrangement, rather than merely an economic one, the system, if meant to be adopted, needs to not only be tested in terms of our faith in it but most importantly to be practised. John Maynard Keynes already by 1930 had identified the socio-economic possibilities of post-scarcity, as well as the dread of the “ordinary man” of rejecting the economic cares “bred into him for countless generations” (Keynes, 1930).
 
A closer examination of the public response to the hypothetical artefact can also give us a very concise idea of whether and how the psychology of possession differs between reality and the virtual, aka between what we stand for in a real world context and what we desire in a hypothetical and ahistorical context. Similarly to Second Life, Parallel as an experiment tends to confirm Michael Sandel’s view that Rawls’ unencumbered self, liberated from history is impossible to conceive, even hypothetically (Sandel, 1984). To the question whether one would seek an individual second chance with the financial capital or a second chance for humanity to rearrange itself, the answer can barely be the latter, even hypothetically (aka in a virtual world), as it seems that it still wouldn’t be a response liberated from the current capitalist context.

Bittanti, M. (2015). How to get rid of homeless. 1st ed. San Francisco: Concrete Press.

Keynes, J. (2008). Economic Possibilities for our Grandchildren (1930). In Pecchi L. & Piga G. (Eds.), Revisiting Keynes: Economic Possibilities for Our Grandchildren (pp. 17-26). MIT Press.

Rawls, J. (1971). A theory of justice. 1st ed. Cambridge, Mass.: Belknap Press of Harvard University Press.

Sandel, M. (1984). The Procedural Republic and the Unencumbered Self. Political Theory, 12(1), pp.81-96.
