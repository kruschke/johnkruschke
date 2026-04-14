# _poem_word_count.R

library(tidyverse)
library(quanteda)
library(quanteda.textstats)
library(nsyllable)

word_syl_count <- function( poem_text, intro_words = 3 ){
  # N.B. poem_text should be one complete string, not a vector of strings.
  poem_tokens <-
    poem_text |> 
    tokens(remove_punct = TRUE)
  intro <- 
    poem_tokens |> 
    pluck(1) |>
    head(intro_words) |>
    paste(collapse = " ")
  syl_count <- 
    poem_tokens |>
    nsyllable() |>
    data.frame() |>
    pull( text1 ) |>
    na.omit() |>  
    sum()
  word_count <- 
    poem_tokens |>
    dfm() |>
    sum()
  return( data.frame( intro = intro,
                      syl = syl_count, 
                      word = word_count ) )
}

#---------------------------------------------------------------
r"(
Any Time Spent\\
Any time spent\
Not making babies.\
Or not making money.\

Any time spent\
Not tilling the soil.\
Or not dancing the floor.\

Any time spent\
Not watching the sunset.\
Or watching the sunset.\

Any time spent\
Not being outraged.\
Or being outraged.\

Any time spent\
Being forced to choose.\
Or regretting your choice.\

Any time spent\
Having no choice.\
Or lamenting your fate.\

Any time spent\
Going on living.\
Or giving up.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
A Late Afternoon Lying on My Back

I want to believe\
the curtain blocking out the day\
is like a palm tree casting diamond shade.\

The weight of blanket on my upturned toes\
is like some beach sand warm beneath my feet.\

But if I am honest,\
the curtain blocking out the day\
is not a palm tree casting diamond shade.\

The weight of blanket on my upturned toes\
is not the beach sand warm beneath my feet.\

The heartbeat pulsing flushes in my ears\
is not the rhythmic surf upon the shore.\

The forced air hissing through the vent\
is not the sea breeze kiss caressing skin.\

The floaters in my vitreous eyes\
are not the sea birds hovering in time.\

The vacant half of mattress at my side\
is not your towel waiting while you swim.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
At the Window

I pray to the Invisible:\

Please protect us\
from blizzard and hail, from blaze and swelter,\
from flying insects that sting and swarm,\
from pestilence and sulfurous miasma,\
and from the crowded bluster and welter.\

But let us see the light,\
through your architectured frame,\
of sun, of stars, of moon, of clouds,\
of dappled leaves, of shimmering creek,\
and all your gentle creatures without names.\

And give us wisdom  --\
when through your fearsome grace,\
you slay a bird mid-flight\
and leave an ashen smudge\
suspended mid-air in its place.\

AND when non-believers\
doubt your clear perfection,\
then at dusk reveal the veil\
of dust and spots and filth\
co-mingled in their own reflection,\

So then, in them,\
it will grow known\
that they reside within\
the mercy of your windowed house\
and they should not throw stones.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Bookmarks and Headstones

My shelves lift volumes covered soft and hard,\
a thousand books I've given brief regard.\
Slower gazing reveals the multitude\
all clasping slender markers that protrude\
like flowers lazing where the reading paused\
and then expired when the flow was lost.\

Like them my body is a flower clasped\
between the fast-read chapters of my past\
and all my future pages still untold.\
After each day's loud narration, my soul\
retreats to some hidden library room\
while body marks where story should resume.\

The vast hillside lawn has horizontal\
shelves of tightly shouldered bookmarks, some tall\
some short, but all denoting interrupt-\
ted narratives of people who have upped\
and stuck a headstone where life was leading,\
and where visitors may resume reading.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"( 
Carbon Footprints of Unwanted Children

I can't put my finger on it, when did it\
change? I would ride my bike miles from\
home, even at night and in rain. No one\
worried, I would just roam. It ended, maybe,\
with a spoonful of cereal and a half gallon of\
fear, the milk carton asking, feral and wild:\
*"Have you, have you, seen this child?"*\

When did having children become an\
imposition? Mine were a gift and a reason to\
keep trying, a joy and a purpose to postpone\
dying. When did people reach the grim\
decision that making babies would only reap\
regret? Maybe it happened on the internet?\
Doom-scrolling starving polar bears and\
forests burning down, all trampled to death\
by carbon footprints of our own. Therefore,\
breeding carbon copies would only be\
complicit. Ergo, we will have no\
grandchildren to visit.\

How did folks forget that we are children of\
the universe? That we're allowed here too.\
My toddler daughter knew. At twilight\
beaming pure delight, using her own voice:\
*"Daddy, there's a 'tar up in the 'ky!"*\
Maybe, I could also give my voice a try?\
Look up and hear the bluebird sing his\
ancient Navajo song, *"Get up, my*\
*grandchild, it is dawn!"* Reminding me that\
I belong.\ 
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Cruel Sestina

With appreciation and apologies to Taylor Swift\
and her wonderful song, Cruel Summer.\

"No rules in breakable heaven." Looking in your eyes,\
no fools could break even. Feeling this high\
there's no falling. I'm floating light out the window,\
no angel calling and time lingering slow.\
No candles, no street lamps, sighing into the night.\
No handles, no guard rails, resigned to the dice.\

The hourglass frozen, stuck sand ice,\
refracting the icicles into my eyes.\
Maybe some summer we can reignite\
the airborne embers once bonfire high.\
If you don't see me you've set your eyes low,\
I'm the spark floating out the window.\

I've paid the blizzard, what does the wind owe?\
Skate on the surface, slip-and-slide ice,\
even the glaciers can see we're too slow,\
just waiting and watching our love melt in sighs.\
The heat from my mind in this fever-dream high\
during the chill of this dark, this insomniac night.\

Gravity's lost and this space stays finite\
'round the hovering door and the floating window\
that sometime fall low and sometime rise high\
like the spots in my eyes or the dots on the dice\
that roll over the table and face up realize\
that the falling is fast but the waiting is slow.\

Shot by that arrow, aim high but miss low,\
breaking a vase in the bouquet of night,\
marking a flower right between the eyes\
while the petals, aroma float out the window,\
and the rose thorns and arrow heads chopped into dice\
are swept under the carpet we flew magic high.\

Angels are watching and advocate shy\
while devils pretend to take everything slow\
and keep in their pockets the gambling dice\
'til everything fades in the shadow of night\
and they serenade yearning outside your window\
until fever compels that you look in their eyes.\

"Fever dream high in the quiet of the night,"\
"Killing me slow out the window."\
"Devils roll the dice, angels roll their eyes."\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Cueva de las Manos

Shadowy menageries of rabbits,\
birds and bees, of urges and bad habits,\
slither across the chained spelunker's wall,\
lit from behind by FX digital:\
a sorcerer's hands, contorted fingers,\
cast illusions while cave eyes malinger.\
A mouse on the wall tells time with two splayed\
hands, white gloved, the big one spinning fast, made\
to emphasize the passing of minutes\
while the small hand smuggles to begin its\
inobtrusive countdown of the hours\
prankster Mickey laughingly devours.\
To fend off wasted time, envies, regrets,\
another wall clock's arms have amulets:\
two hamsa hands that protect or provide,\
one hamsa blessed, one never evil eyed.\
Concentric gestures sweep the dial's face\
but never will those hamsa hands embrace.\
Outside the cave, two lovers orbit hand\
in hand pointing to nothing but a sand\
grain's weightless free fall in their hourglass,\
to dandelions floating over grass,\
contriving no manipulation of\
shadows, protecting one provision: love.\
To mark their union, they pack mineral\
pigments to the sacred cave, where they will\
splay their hand, one lover's-hand thickness off\
the wall, while the lover blows powder soft,\
paints a canvas with reverse silhouette\
that twenty thousand years will not forget,\
so now we may hold our own hands with care\
one lover's-hand thickness away from theirs.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Golden State

Dazzling synthetic threads of tangerine orange itched\
me happy when I was eight years old, my favorite plaid\
shirt, weft with runs of vibrant red and yellow.\
Rough florescent fabric beaming brilliant orange as\

marigold flowers in front of my sister's elementary school,\
named: Marigold Elementary, next to Pleasant Valley High.\
Marigolds by any other name would smell as ochre,\
yet they flaunted pollen-heavy petticoats under\

orange bosomed trees my father grew backyard.\
Thorny green-leafed branches flashing orbs of orange\
skins we peeled away to tongue the sweet segmented\
fruits as orange the fields of California golden\

poppies on Sierra foothills at the edge of\
town if springtime rains would grace the ground transform the\
dirt-dry taupe-straw grass to dappled orange gauze:\
draping waves of paint daubes on the hills.\

At university, long afternoons I'd gaze\
from Panoramic Way across the burgeoning bay\
to the Golden Gate Bridge spanning sunglint waves\
beneath a saffron sunset -- which felt very romantic.\

There I gave a girl a golden band, slid\
despite her eternally seeing red. She insisted\
her infernos cleared unhealthy underbrush\
but in truth they only burned the greenwood black.\

On a honeymoon trip to a coastal forest we puzzled at trees with\
bizarrely crenulated ashen bark, solved when slanting\
sunlight erupted a rapture of myriad Monarch butterflies,\
tornado-thousand poppy petals sublimating sky.\

I'd seen orange in trees before: father doubtful\
driving our sedan through raging forest fire,\
fulminating furies flaying flesh from off the trees on\
both sides of the highway with no end in sight.\

Long further down that road, though I nearly perished\
in the flames, I repossessed the gold ring from\
the arsonist girl in the home she set ablaze. The golden\
bridge is sunken far below the western waves,\

the orange-thread shirt is shed like an abandoned chrysalis.\
Yet here the winging monarch flies unbidden into\
mind, every orange flutter a flashbulb memory\
migrating away, suspending me in a golden state.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Honor Among Sleeves

All these sleeves are overwhelming. How can\
a person choose the less bad hole to dig,\
the word that won't offend if unspoken,\
which nostril vents less carbon, the too big\
or too small gesture of disagreement,\
which eyebrow to raise, or whether to let\
fall the other shoe, whether to lament\
or to rejoice, to forgive or forget?\
I watched an hourglass for clues of how\
to discern which grain of sand best merits\
a moment's shove from above to below,\
but the judgment passed without a care, its\
ruling like the wind I listened to for\
days, trying to infer how it decides\
which way to blow, while I just pray in four\
directions, hold my bated breath inside.\
I have learned not to open a carton\
of eggs; it is impossible to choose\
which hens' efforts should be granted pardon\
while others win cracking -- or did they lose?\
Such presumptuous advice men dispense,\
to "put my best foot forward," as if rank-\
ing toes and insteps is just common sense,\
and calling one foot "worst" is merely frank.\
So I'm stuck with my feet in the quicksand\
of this immobilizing awareness,\
this hard fact: the journey of a thousand\
miles begins with a single unfairness.\
And now it is unbearable to look\
you in the eye, to choose which window to\
surveil, and wonder whether I mistook\
which camera was taking the photo,\
and if I close my eyes, imagining\
to kiss you in the dark, I agonize\
wanting all of you at once: beginning\
anywhere is such injustice, a lie.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
In Retirement Sunlight Falls / Blackbirds Hang

I.

In retirement, sunlight falls\
like cherry blossom petals, floating\
into drifts of pastel luminescence,\
soft’ning corners in curvaceous glow,\
and when I raise my arms,\
corollas swarm\
to form angelic wings.\

Heaven’s merfolk spout\
celestial dew\
that trickles, gently off\
my glass umbrella,\
tickles near my sandaled feet.\
My silken robes are lined\
with thousand\
puckered lips in secret\

kissing and caressing\
ev’ry moment of my smoothly satin skin,\
and when I part my lips\
to speak, emerges only\
laughter, chuckles, chortles,\
pausing, raptured, to inhale\
sweet redolent gardenias.\
Mouth forever fed with honey,\
leaves of mint protrude, perennial grin.\

The fruit trees overhead are flocked\
with starry galaxies\
rotating, each one singing\
like Tibetan bowls.\
Before me flows a tiding ocean\
of chinchillas,\
parting as I stroll\
and nuzzling both my ankles\
with their zephyr surf of fur.\

And in my wake,\
sequoias sprout\
from russet loam\
through sylvan mist\
to cirrus sky.\

II.

In retirement, blackbirds hang\
like fruit rot, upside down,\
inscrutable and hollow,\
watching me with beady onyx eyes,\
their charcoal feathers molting\

onto root-entangled railroad tracks\
on which I tread. I flounder past\
a stalled commuter train,\
its doors ajar and windows parted;\
inside hang stalactites\
pinning down\
stalagmite-crusted passengers,\
the hapless few who stayed\

my friends.\
Tornadic bats swarm overhead,\
my shadow flickers, phantom, blurs;\
my feet|feet catch on creosote crossties.\
Rails conclude at wasteland’s end,\
the lighthouse, toppled now,\
a scree of headstones marking\
vertebrae of spiral staircase\
climbing up chiropteran sky.\

On the dock of doldrum ocean,\
mammoth pace clock faces outward to the sea;\
converge the ashen swimmers, darkly goggled,\
turn our backs against the shore,\
and crawl-stroking away through fetid kelp,\
we drag behind, each one of us,\
a tow-float swim-buoy\
made of block of ice,\
once finely sculpted, melting now,\
dissolving figures\
of our dogs\
or cats\
or lovers.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Looking East

Looking east before sunrise I like to\
see the slender crescent moon (sky haiku\
so abbreviated it is only\
an opening parenthesis, holy\
punctuation setting aside last night's\
constellations, planets, and satellites\
as mere afterthoughts like the Milky Way,\
which justify staying living for today).\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Magnifying Glass (haiku)

Magnifying glass\
enlarges every detail.\
I am smaller now.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Open Mic Night

The poet steps up to the mic,\
looks at us in the audience,\
then reaches deep inside\
and pulls out\
a seashell,\
twisted with finger-thick whorls,\
lined with life ridges\
and broken heart spires.\
Cradling their seashell in their upturned hand,\
the poet opens their mouth and exhales:\

I can almost hear the ocean.\

People lean forward\
and cock their heads,\
then lift their cupped hands\
behind their ears.\
I examine my hands\
for cuppability,\
and notice my palms\
with fingerprints whorled,\
life-lines ridged\
and heart-lines broken.\
I cradle these palms behind my ears\
to amplify the poet's keening.\
But gradually\
I turn my clam-shell hands\
to cover my ears completely:\

and now I hear the ocean.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Oh honey I'm searching for love that is true,\
But driving through fog is so dang hard to do.\
Please paint me a line on the road to your heart,\
I'll rev up my pick up and get a clean start.
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
She changes her hair, and he changes his style,\
She paints on her face, and he wears a fake smile,\
She shrink wraps her head, and he stretches the truth,\
But they'll always be stuck with their done wasted youth.
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Stratigraphy
gods 
    the
of      
valley
    monumental
a 
sustaining
  I.V.
    an
from   
drips  
    like
justified
    center
solo   
    stacked
words in 
   solace seeks one
loss relentless
  and age with then
scree scree scree scree scree scree
    scree  pools abundant floods deluge a  scree
scree scree  gush and rain words youth in  scree scree
gods 
    the
of      
valley
    monumental
a 
sustaining
  I.V.
    an
from   
drips  
    like
justified
    center
solo   
    stacked
words in 
   solace seeks one
loss relentless
  and age with then
scree scree scree scree scree scree
    scree  pools abundant floods deluge a  scree
scree scree  gush and rain words youth in  scree scree
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
The Power of Poetry for Climate Change

When you consider\
the carbon footprint\
of butt sitting,\

manufacturing text for hours, flushing\
wasted words up the delete-key smokestack\
while the glaciers and ice caps melt,\

then you realize\
*this poem has*\
*enormous power for change*\

because the depth of its impact\
is how much\
it made the oceans rise.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
The Purpose of Time

In response to a poem by X. J. Kennedy\

Pushed from your mother's womb plop into your\
nursing home, or having sex while the re-\
sulting teenager leaves home forever,\
your skin youth smooth .blink. old-age leathery;\
if all life's moments collapsed impromptu,\
the sensory flash would be too intense.\
So, they quip, "the purpose of time is to\
keep everything from happening at once,"\
even though, in retrospect, all of life\
implodes into a box we call the past.\
Ironic, sure. But off. Time is a knife\
that stabs into the dark of our half-assed\
moral self, cleaving act from consequence,\
daring us to buy now and pay later,\
premeditate vengeance after grievance,\
ignore the crap we flush downstream. Water\
under the bridge -- is always stepped in twice,\
once by us and again by our descend-\
ents. Time the tempter, a con-man's device\
that lures us to ignore and to pretend,\
so we desire more and more of *now*\
before the wheel of karma spins around\
and slaps the future's hand-palm on our brow\
and time's true purpose suddenly is found.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
The Sun Shines Fluidly on Every House

The sun shines fluidly on every house,\
spilling over the sheep and cattle\
in view of the cowboy brothers (twins\
-- by different fathers -- it's a long story),\
while at the water's edge a crab\
scuttles unnoticed by a cat\
dozing beside an adolescent girl\
weighing her options, curious\
of the scorpion poised\
at the hooves of a centaur (yes,\
a half-horse man roams this landscape)\
with bow and arrow slung open-carry,\
galloping to meet his chimeric brethren\
the sea-goat at the seaside where\
a gorgeous boy pours them wine\
and two fish swim together\
connected by a luminous thread,\
which, star by star, connects to every\
creature in this scene because\
the sun shone fluidly in every house\
the day each one was born,\
and would keep shining even if\
the cat appraised its options,\
and the scorpion claimed to be crab\
and the bull converted to ram\
and the brothers came out as fishes\
and the centaur dressed as a sea-goat\
and the boy became a girl.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Under Their Sink

Underneath their kitchen sink, the shiny\
red cylinder stands vigilant, ready\
to rescue them from their flammable home,\
extinguishing fires, with its thick foam,\
that erupt from oven, stove top, or fears,\
though flames never appeared in all these years.\

In their TV cabinet, there is no\
sentinel for dousing the inferno\
of contempt and dehumanization\
that rages uncontrolled on the flat screen,\
fought with backfires they might set someday;\
meanwhile, they backlight a candle and pray.\

In the bedroom, a small candle toils\
to effuse, for lovers, essence oils,\
and to distract, by flickering shadows,\
the mental ceiling sprinklers spraying to-do's,\
agendas, disappointments, and regrets\
that swamp their pelvic floors, make their feet wet.\

And in the children's rooms, the foam is deep,\
sprayed thick with good intentions, there to keep\
the children safe from self-immolation\
by unrealistic expectation\
of growing up to become an artist,\
musician, astronaut, or novelist.\
When grown, their recompense will be to think\
of the extinguisher under their sink.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Were It Not for the Firefly

Summer's hot and summer's humid:\
Summer's trifling, endless, stupid.\

Summer's games waste on all night,\
insects swarm under the lights,\
mindless phototropic creatures,\
like the people in the bleachers,\
mesmerized by play-by-play,\
eating dogs while they decay.\

Dogs bark man at crack of dawn,\
roaring mowers bite the lawn,\
deaf'ning blowers blast the dust,\
wound with gas exhaust disgust.\

August: Annexed 8 B.C., when\
Ceasar named a month "for Me!"\
because his uncle Julius\
already seized July from us.\

July the Fourth: The flag's still there!\
The fireworks, bursting in air,\
remind us all of war's delights:\
Our children's fate is firefights.\

But wait... retreat.\
The firefly ---\
in quiet night, in starlit sky,\
with summer's Milky Way aglow ---\
still winks of wonders yet to know.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Hamster in Your Head

If you hold this poem\
in the rain\
its fur will get soaking wet.\
If you hold this poem\
in the sun\
it will squint its eyes.\
If you hold this poem\
while you laugh\
it will wiggle its whiskers with delight.\
If you hold this poem\
with a friend\
it may warm both your hearts.\
If you read this poem\
with an open mind\
it may scurry home\
inside your head,\
with all its soaking and squinting,\
wiggling and warming,\
nestled snug\
in the sawdust\
of your childhood memories\
and the shredded paper\
of your past loves.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Feather in the Path of a Mower

Rain is coming this afternoon, so this morning\
I am mowing the unkempt lawn.\
Pushing the mower into the unruly growth,\
I am vigilant for debris that might obstruct my progress,\
and I see on the grass, four strides ahead,\
a single gray feather.\

I found a feather when I was four years old,\
and it was so beautiful\
I placed it, quill-end down,\
into a clear glass jar filled partway with water.\
I hoped the feather would survive like a flower,\
and might even sprout a bird.\

As I approach, three strides away,\
I admire its elegant gradation from light gray to dark.\
Perhaps from a catbird, like the one\
at the birdbath a few days ago, hopping in\
and out of the pool, flaunting his black head crest.\
When I was a kid, we had a swimming pool.\
I dove in and climbed out, time and again,\
drying my shaggy head-crest with a towel.\

Decades later at a deserted beach in Perth,\
I dunked myself into the surf\
and survived in a rip tide\
a long time alone far from shore,\
because I knew how to float.\
The sea birds were indifferent to this human flotsam,\
though I admired their white and gray plumage,\
like the gray feather two strides ahead of me.\

After the rain passes,\
I will go sailing.\
I love gliding across the lake water,\
propelled by only my intention and the wind,\
like a feather on a wing,\
flying by only impulse and atmosphere,\
as this gray feather once soared,\
now one stride ahead of me.\

It slides under the deck and\
disintegrates in the whirling scythe,\
vanishing into compost atop the leveled turf,\
on which I plod\
while scanning ahead\
for flotsam on the sea of grass,\
soon to be soaked with rain\
from the feather-gray clouds swirling overhead.\
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
Stars Fade	Translated from the English
Spots Appear
In grade school	I was young
the sky in my backyard	and the skin on the back of my hand
was filled with familiar stars,	was
memorized by heart	taken for granted.
Then, diurnal demands,	Many decades
a driving schedule,	gripping the steering wheel
allowed seeing at night only the waiting alarm clock	with hands at 10 & 2
in the caves of anxiety	in the sun of parenting and career.
Retired now,	Finally pausing
still insomniac,	at a rest stop in the evening,
I look through a narrow window at the night sky,	I am startled by
stars unrecognizable,	the back of my hand full of
constellations forgotten,	freckles, spots, blemishes,
random, disorienting, surreal,	foreign membrane,
awake on an unearthly planet	body-swapped to an alien husk.
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
A Way of Waving	Translated from the English 
Wavering Away
A snake slithers	Like ribbons fluttering
across blacktop 	at the ends of handlebars
then ungrips its skin	molted when fledged 
at the shrugged shoulder	to the shed.
Night crawler escapes	Like cassette tapes,
from flooded turf	Play pressed,
to be impaled and	rewound and
plunged into deep water	unspooled by appetite.
Vines creep up trunk and branch,	Like telltales on shrouds
grope into air	flail from windward
blindly indicating	to reveal the direction
into empty space	where you cannot directly sail.
Seaweeds sway	Like how ocular floaters
in tidal pools	of vitreous humor,
sniggering against a snorkel mask	occluding sea and air,
while breaths squeeze through a tube,	inspire through averted vision.
V formation of migrating geese	Like my migraine aura,
with pulsating wings	a corona borealis flickering
slides overhead	from fovea to periphery
toward the horizon,	is a benediction from God.
A snail ventures out	Like how my GPS wristwatch
during full-moon night	under satellite sky
leaves a trail of ooze	records my position every other second,
shimmering in starlight 
from unnamed constellations	life’s legacy of disconnected dots.
)" |> word_syl_count()

#---------------------------------------------------------------
r"(
text here
)" |> word_syl_count()
