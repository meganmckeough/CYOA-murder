require 'active_record'
require_relative 'models/segment'

Segment.create story_id: 1, content: 'Sample segment text 1', options: { 'potato' => 2 }
Segment.create story_id: 2, content: 'Potato segment text 2', options: { 'tomato' => 3, 'lettuce' => 4}
Segment.create story_id: 3, content: 'Tomato segment text 3', options: { 'lettuce' => 4}