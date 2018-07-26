require 'active_record'
require_relative 'db_config'
require_relative 'models/segment'
require_relative 'models/ending'

# Segment.create story_id: 1, content: 'Sample segment text 1', options: { 'potato' => 2 }
# Segment.create story_id: 2, content: 'Potato segment text 2', options: { 'tomato' => 3, 'lettuce' => 4}
# Segment.create story_id: 3, content: 'Tomato segment text 3', options: { 'lettuce' => 4}


# Segment.create story_id: 1, content: 'Once in the foyer, it is eerily quiet, for the scene of a murder. There is a small side table by the door with a large black telephone on it, and a pair of folded round eyeglasses, resting on a silver drinks tray. Your phone number is scrawled on the notepad by the phone - presumably written by the person who phoned you here. To the right, an open door leads to a brightly lit dining room.', options: { 'You enter the dining room.' => 2 }

# Segment.create story_id: 2, content: 'Once inside, you notice the table set for dinner. Or rather, it was. Dishes are cracked, glasses askew, and part of the decadent meal is on the floor. No one is around. 
# Well, there is somebody. A dead body. Next to the remains of what looks like a delicious soup, are the bodily remains of a finely dressed gentleman with glasses. In addition to a rather smart-looking dinner jacket, he is also sporting what looks like several stab wounds to the chest. 
# You know that the victim is also owner of the mansion, multimillionaire and host of the dinner party. He has met his untimely death at the hands of one of someone in the mansion, no doubt. You peer back down at the body.', options: { 'Take his nice looking silver pocket watch.' => 3, 'Examine the stab wounds.' => 4 }

# Segment.create story_id: 3, content: 'I thought you were a detective, not a thief? Regardless, you pocket the nice trinket and then proceed to do your real job.', options: { 'Examine the stab wounds.' => 4 }
# Segment.create story_id: 4, content: 'You lean in close as a crack of thunder splits the sky. This body is pretty fresh, actually, which is a relief. The stab wounds look to have been made by a long, thin (and obviously sharp) object, which is nowhere to be found in the dining room itself. You wonder about what led to this fellow\'s demise... but the task at hand is to find the killer, not unpack his life history. You know that some of the dinner guests are congregated in the next room over, a small sitting room.', options: {'Go into the sitting room.' => 6, 'Empty out his pockets.' => 5, 'Head back to the foyer.' => 7}
# Segment.create story_id: 5, content: 'You don\'t find anything except some lint. Congratulations.', options: { 'You go into the sitting room.' => 6}
# Segment.create story_id: 6, content: 'You enter the sitting room. There is a small huddled group of guests assembled there, dressed in finery and looking put out by the thoroughly inconvenient murder.', options: { 'You talk to the guests to learn more.' => 9, 'Search the room for clues' => 12}
# Segment.create story_id: 7, content: 'You are back in the opulent, but empty, foyer.', options: {'Leave the house.' => 8, 'Head for the stairs.' => 16}
# Segment.create story_id: 8, content: 'Really? Fair enough. Too afraid to go on, you don\'t solve the murder, and you get the award for Biggest Chicken. Whistling a tune, you head to the nearest tavern while assuming that everyone in the mansion will meet some horrible fate without you.'
# Segment.create story_id: 9, content: 'You look around the room for someone to speak with. They all appear to be accounted for - one guest in the room for each place at the dinner table. They mill about like lost cows in a paddock, but one breaks away and heads towards you. It is an older woman with kind eyes.', options: { 'You speak to the woman.' => 10 }
# Segment.create story_id: 10, content: 'The older woman looks shaken and presses a lace handkerchief to her lips. She has a small pink hat on, with fine netting pinned to her grey bun. She speaks in a very soft voice and talks about the deceased, but sadly none of it is useful. However, just as she is about to shuffle away, she presses something small into your palm. It is a folded up piece of paper.', options: { 'Unfold.' => 11 }
# Segment.create story_id: 11, content: 'As you unfold it you realise it is actually a photograph. It is of a man and woman, smiling into the camera and holding hands. The man is tall, with dark hair, round eyeglasses and a neat moustache. The woman has blazing red hair and is wearing a beautiful necklace with a shiny pendant on it in the shape of an "A". 
# You turn to address the woman but she is already deep in conversation with another guest. You leave the room.', options: { 'Head for the stairs.' => 16 }
# Segment.create story_id: 12, content: 'Dispensing with any niceties completely, you ignore the guests and begin searching the room using your keen detective senses. Hmm, would you rather...', options: { 'Open all the drawers in the sidetable?' => 13, 'Poke around in the smouldering fireplace?' => 15 }
# Segment.create story_id: 13, content: 'Great, you\'ve further disrupted the guests\' already strange evening by making a racket. An older gentleman approaches you as you are tipping the contents of the last drawer onto the ground. You can either let him approach, or push him aside, exit and head for the stairs.', options: { 'Talk to the man.' => 14, 'Make a break for it.' => 16 }
# Segment.create story_id: 14, content: 'You are quickly engaged in a long and useless conversation about polo. Pretending to notice something interesting in the fireplace, you politely but firmly excuse yourself and beeline for the fireplace.', options: { 'Poke around in the smouldering fireplace.' => 15 }
# Segment.create story_id: 15, content: 'With a faceful of dust, you emerge triumphant. There is a partially burned piece of paper in the fireplace - the remains of a letter. It is mostly burned, but you can see one word - that reads "Annabelle". You pocket the letter discreetly and exit the sitting room, leaving the guests milling about in a fitful state.', options: { 'You head for the stairs.' => 16 }
# Segment.create story_id: 16, content: 'With the chandelier towering above your head, you ascend the grand staircase to look upstairs. As you do, something catches your eye - several drops of blood on one of the stairs. You lean in close. Odd. The blood is still fresh...', options: { 'Ignore and enter the first bedroom.' => 21, 'Examine the stairs more.' => 17 }
# Segment.create story_id: 17, content: 'You look around the staircase area some more looking for clues. You notice that the blood actually looks a bit like a trail... that seems to head into the wall...?', options: { 'Ignore it, leave the stairs and enter the first bedroom.' => 21, 'Tap on the wall.' => 18 } 
# Segment.create story_id: 18, content: 'It sounds oddly hollow. That means only one thing... A secret passageway! You start randomly pressing panels on the wall. You are quickly rewarded for your efforts when one springs open to reveal a dark tunnel within... Who knows where it leads?', options: {'Go into the secret passage, obviously.' => 19, 'Back away and enter the first bedroom.' => 21 }
# Segment.create story_id: 19, content: 'You\'re in the tunnel. You don\'t have a great feeling about this. Just inside the entrance to the secret passage you see a dark object...', options: { 'Examine the object.' => 20, 'Dart back out and enter the first bedroom.' => 21 }
# Segment.create story_id: 20, content: 'As you lean down to examine the object (a pair of white butler\'s gloves?), you feel something shift in the darkness of the secret passage..... and then everything goes black.'
# Segment.create story_id: 21, content: 'The room is lavishly decorated in pink tones and delicate lace. You rely on your outdated notions of gender and assume that it is woman\'s bedroom, and head over to the dressing table to poke around (ostensibly for clues). Bonza! You find a beautiful necklace, with a pendant in the shape of an "A". There is also a heavy silver hairbrush. On the handle is engraved the name "Annabelle".', options: { 'You keep looking around the room.' => 22, 'Head into the hallway.' => 24 }
# Segment.create story_id: 22, content: 'You decide to keep poking around the room in case there are any more clues to be found. You acknowledge that at the moment you are just arbitrarily moving around the mansion and happening upon simplistic clues, but you push that thought aside as you open the drawer to the bedside table.
# Inside is a photograph, of a young red-haired woman standing next to a tall older gentleman with a smart-looking dinner jacket on. He has his hand on her shoulder, and she is wearing monogrammed riding clothes, and no jewellery. You pocket the photograph.', options: { 'Keep looking around.' => 23, 'Head into the hallway.' => 24 }
# Segment.create story_id: 23, content: 'Underneath the bed you find a box. It looks like a jewellery gift box, and there is a small card attached. You open the card. "To my Dearest, wear this and think of me always. With much love. J." Intrigued, you pocket the card.', options: { 'You head into the hallway.' => 24 }
# Segment.create story_id: 24, content: 'You emerge from the bedroom. Just as you enter the hallway, you hear a scream, coming from downstairs. At the same time, you hear a heavy crash in the second bedroom, just down the hall, away from the staircase.', options: { 'You stay upstairs and investigate the crash.' => 25, 'Run downstairs.' => 29 }
# Segment.create story_id: 25, content: 'You race up the hallway towards to second bedroom. As you do, you notice a small door tucked in an alcove - the stairs to the attic.', options: { 'You keep going into the second bedroom.' => 26, 'Go into the attic.' => 28 }
# Segment.create story_id: 26, content: 'Just as you fling the door open, you catch a glimpse of a figure, dressed in black and white, darting into the adjoined bathroom. You see a large vase on the ground, and inside the broken ceramic pieces is nestled a small key. Should you pursue the figure?', options: { 'Go into the bathroom.' => 27, 'Split and run downstairs.' => 29 }
# Segment.create story_id: 27, content: 'Really? Okay then. You pursue the figure into the ensuite bathroom... or rather, you try to. Before you know quite what is happening, white gloved hands fasten around your neck and everything is fading... fading... and black. Just as you are about to black out, you blurrily look up into a dim, moustached face...'
# Segment.create story_id: 28, content: 'You open the creaky door and climb up the rickety, narrow stairs. You step into the dusty attic. The door slams behind you, and the lock clicks shut. You spin around frantically. As you do, you notice something in the corner... it looks like... but it can\'t be? It\'s a dead body, but it isn\'t a nice fresh one. This one is old, in both senses of the word. The fellow has thinning grey hair and portly middle. He is wearing a butler\'s uniform.'
# Segment.create story_id: 29, content: 'You run downstairs in the direction of the scream - the ballroom. You burst through the extravagent double doors expecting to find another dead body. You do. A small, older lady with a pink hat lies in the center of the ballroom. There is a pool of blood around her head like a halo, and her small fists are clenched shut. You look around accusingly. Another murder, right under your nose! Some of the guests are all huddled in a group by the grand piano, eyes wide with fright.', options: { 'You examine the old lady.' => 30, 'You look around the room for clues.' => 31 }
# Segment.create story_id: 30, content: 'You learn closer to the poor old love. She has a kind face. In one fist is clutched a delicate lace handkerchief. In the other, a crumpled up piece of paper. You gently pry it from her grasp - it is what looks like a formal resignation letter, and it is signed with the name "John". It is addressed to the now deceased owner of the house.', options: { 'You look around the room for clues.' => 31 }
# Segment.create story_id: 31, content: 'It\'s not long before you stumble upon the wooden panel in the wall, cracked open slightly. You gently pry it back, to reveal the gaping hole of a secret passageway hidden behind it. But where does it lead? Apprehensive, you aren\'t sure whether to head into the dark unknown or backtrack and investigate another area of the house for this audacious murderer. You look behind you, but the guests have all gone back to the sitting room. What to do?', options: { 'You head into the secret passage.' => 34, 'You look in the conservatory.' => 32 }
# Segment.create story_id: 32, content: 'You enter the conservatory with apprehension, but there is nothing but a dark, glass-walled room - empty. You decide to take a look around anyway. It\'s not long before you find it. A long, thin letter opener, hidden in a pot plant. As the rain lashes the roof of the conservatory, you reach down and grasp the handle. You are just examining the engraved initials ("J.A") when someone clears their throat behind you. You whip around and are confronted with a tall man in round glasses, a neat moustache, and a murderous glint in his eye. Your hand tightens around the letter opener as your instincts kick in.  You quickly lash out with the letter opener, slashing his cheek and splashing blood on his butler\'s uniform. While he is stunned, you push him aside and run for the door. Once in the hallway, you block the door from the outside so he can\'t get out and head back to the entrance to call the police.', options: { 'Head back to the entrance.' => 33 }
# Segment.create story_id: 33, content: 'You quickly rush back to the entrance of the mansion and snatch up the black telephone, the murderer\'s name on the tip of your tongue. When you reach the phone and dial the police, what do you say?', options: { 'It was the red-haired woman.' => 36, 'Pink hat lady did it.' => 37, 'The butler did it.' => 38 }
# Segment.create story_id: 34, content: 'You head into the secret passage and gently close the panel behind you. Luckily, you have a small torch with you, which you light as you make your way forward. Outside, the storm is still howling. You begin to turn the events over in your mind, and just as you are coming to a realisation, you reach a small alcove area in the tunnel - someone\'s secret hideout. Here there is a small chair and table with a lamp on it - you use some matches to light the lamp so you can see better. On the table is a pair of folded round eyeglasses, a small moustache comb and a pair of bloodstained white gloves. The walls of the alcove are plastered with bits of paper - a map of the house, what looks to be a work roster with the name "J. Atkins" at the top, and several photographs of a red-haired woman.', options: { 'You head back to the entrance to call the police.' => 33, 'You keep going down the tunnel...' => 35 }
# Segment.create story_id: 35, content: 'Despite your bad feeling, you head further into the dark tunnel. It\'s far too late when you realise that the tunnel is ending, and there is no exit. You hear the footsteps behind you, and you drop your torch just as the white-gloved hands wrap around your neck...'
# Segment.create story_id: 36, content: 'Just as you tell the police this nonsense theory, the line goes dead. Frantically trying for a dial tone, you are distracted as the butler comes up behind you...'
# Segment.create story_id: 37, content: 'Just as you tell the police this nonsense theory, the line goes dead. Frantically trying for a dial tone, you are distracted as the butler comes up behind you...'
# Segment.create story_id: 38, content: 'The police say they are sending a police car to the property just as the line goes dead (why police didn\'t come with you in the first place is irrelevant...). Quick on your feet, you spin around, face to face with John Atkins - the butler, Annabelle\'s lover, and two-time murderer. Why did he invite you here if it was his intention to murder others, and maybe you too? You barely have time to think about this though - you conk him on the head with the heavy telephone headset, breaking his eyeglasses. He topples over onto the foyer floor with a thud. The remaining guests run out from the sitting room where they have been enjoying port and brandy and trying to stay alive, and applaud your fine detective skills and extraordinary luck in solving this mystery.'


# Segment.find_by(story_id: 8).update(options: {'THE END' => 'ending/8'})
# Segment.find_by(story_id: 32).update(options: {'THE END' => 'ending/32'})
# Segment.find_by(story_id: 20).update(options: {'THE END' => 'ending/20'})
# Segment.find_by(story_id: 27).update(options: {'THE END' => 'ending/27'})
# Segment.find_by(story_id: 28).update(options: {'THE END' => 'ending/28'})
# Segment.find_by(story_id: 35).update(options: {'THE END' => 'ending/35'})
# Segment.find_by(story_id: 36).update(options: {'THE END' => 'ending/36'})
# Segment.find_by(story_id: 37).update(options: {'THE END' => 'ending/37'})
# Segment.find_by(story_id: 38).update(options: {'THE END' => 'ending/38'})

# Ending.create story_id: 8, name: 'left early', content: 'took off without solving the crime, and got a beer.'
# Ending.create story_id: 32, name: 'conservatory', content: 'single-handedly took down the murderer without hesitation (or particular skill).'
# Ending.create story_id: 20, name: 'first tunnel', content: 'was the victim of curiosity and a dark tunnnel.'
# Ending.create story_id: 27, name: 'bathroom', content: 'was cornered in the water closet and met a messy end.'
# Ending.create story_id: 28, name: 'attic', content: 'ascended to their doom in the attic... and discovered a grim secret?'
# Ending.create story_id: 35, name: 'second tunnel', content: 'didn\'t know when to turn back, or give up.' 
# Ending.create story_id: 36, name: 'red', content: 'had a foolish idea about who the murderer was.'
# Ending.create story_id: 37, name: 'pink', content: 'had an exceptionally foolish ideas about who the murderer was.'
# Ending.create story_id: 28, name: 'solved', content: 'solved the murder, called the police, received praise and got a good night\'s sleep.'

# Ending.find_by(story_id: 20).update(content: 'was the victim of curiosity and a dark tunnel.')

Ending.find_by(story_id: 8).update(content: 'took off without solving the crime, and got a beer.')
Ending.find_by(story_id: 20).update(content: 'was the victim of curiosity and mystery cliches.')
Ending.find_by(story_id: 27).update(content: 'was cornered and met a messy end.')
Ending.find_by(story_id: 28).update(content: 'ascended to their doom... and discovered a grim secret?')
Ending.find_by(story_id: 35).update(content: 'didn\'t know when to turn back, or give up.')
Ending.find_by(story_id: 36).update(content: 'had a foolish idea about who the murderer was.')
Ending.find_by(story_id: 37).update(content: 'had an exceptionally foolish idea about who the murderer was.')
Ending.find_by(story_id: 28).update(content: 'solved the murder, called the police, received praise and got a good night\'s sleep.')
