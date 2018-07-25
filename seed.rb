require 'active_record'
require_relative 'db_config'
require_relative 'models/segment'

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
Segment.create story_id: 22, 
Segment.create story_id: 23,
Segment.create story_id: 24,
Segment.create story_id: 25,
Segment.create story_id: 26,
Segment.create story_id: 27,
Segment.create story_id: 28,
Segment.create story_id: 29,
Segment.create story_id: 30,
Segment.create story_id: 31, 
Segment.create story_id: 32,
Segment.create story_id: 33,
Segment.create story_id: 34,
Segment.create story_id: 35,
Segment.create story_id: 36,
Segment.create story_id: 37,
Segment.create story_id: 38,
