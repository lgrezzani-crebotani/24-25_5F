CREATE DATABASE IF NOT EXISTS social;

USE social;

DROP TABLE IF EXISTS comment_likes;
DROP TABLE IF EXISTS post_likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(64) NOT NULL UNIQUE,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    about_me TEXT
);

CREATE TABLE posts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    image_url VARCHAR(1024),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_id INT,
    comment_id INT,
    text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE
);

CREATE TABLE post_likes (
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE comment_likes (
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE
);
-- ------------------ --
-- FINE STRUTTURA DB  --
-- ------------------ --


INSERT INTO users (email, first_name, last_name, about_me) VALUES
('john.doe1@example.com', 'John', 'Doe', 'Loves hiking and outdoor adventures.'),
('jane.smith1@example.com', 'Jane', 'Smith', 'Passionate about technology and AI.'),
('paul.brown@example.com', 'Paul', 'Brown', 'Avid reader and coffee enthusiast.'),
('lucy.jones@example.com', 'Lucy', 'Jones', 'Digital artist and designer.'),
('michael.white@example.com', 'Michael', 'White', 'Loves cooking and traveling.'),
('sarah.black@example.com', 'Sarah', 'Black', 'Yoga instructor and mindfulness coach.'),
('peter.wilson@example.com', 'Peter', 'Wilson', 'Sports enthusiast and writer.'),
('emma.taylor@example.com', 'Emma', 'Taylor', 'Musician and songwriter.'),
('daniel.martin@example.com', 'Daniel', 'Martin', 'Tech startup founder.'),
('lisa.moore@example.com', 'Lisa', 'Moore', 'Professional photographer.'),
('kevin.thomas@example.com', 'Kevin', 'Thomas', 'History teacher and traveler.'),
('olivia.jackson@example.com', 'Olivia', 'Jackson', 'Botanist and nature lover.'),
('david.lee@example.com', 'David', 'Lee', 'Self-taught programmer.'),
('susan.green@example.com', 'Susan', 'Green', 'Human rights activist.'),
('robert.hall@example.com', 'Robert', 'Hall', 'Engineer and part-time gamer.'),
('karen.young@example.com', 'Karen', 'Young', 'Fitness coach and blogger.'),
('james.allen@example.com', 'James', 'Allen', 'Bookstore owner.'),
('nancy.king@example.com', 'Nancy', 'King', 'Gardener and writer.'),
('mark.scott@example.com', 'Mark', 'Scott', 'Environmental scientist.'),
('amy.harris@example.com', 'Amy', 'Harris', 'Baker and food blogger.'),
('chris.wright@example.com', 'Chris', 'Wright', 'Podcaster and radio host.'),
('laura.clark@example.com', 'Laura', 'Clark', 'Dog trainer and pet lover.'),
('steven.rodriguez@example.com', 'Steven', 'Rodriguez', 'Aspiring chef.'),
('michelle.lewis@example.com', 'Michelle', 'Lewis', 'Artist and muralist.'),
('jeffrey.walker@example.com', 'Jeffrey', 'Walker', 'Adventure photographer.'),
('ashley.lopez@example.com', 'Ashley', 'Lopez', 'Traveler and culture enthusiast.'),
('brian.hill@example.com', 'Brian', 'Hill', 'Software developer.'),
('megan.roberts@example.com', 'Megan', 'Roberts', 'Yoga teacher.'),
('andrew.evans@example.com', 'Andrew', 'Evans', 'Mathematician.'),
('rachel.nelson@example.com', 'Rachel', 'Nelson', 'Political analyst.'),
('patrick.hughes@example.com', 'Patrick', 'Hughes', 'Painter.'),
('julia.reed@example.com', 'Julia', 'Reed', 'Fashion designer.'),
('george.ward@example.com', 'George', 'Ward', 'Photographer.'),
('melissa.murphy@example.com', 'Melissa', 'Murphy', 'Fitness instructor.'),
('ryan.diaz@example.com', 'Ryan', 'Diaz', 'Videographer.'),
('brandon.wood@example.com', 'Brandon', 'Wood', 'Coffee expert.'),
('kayla.bennett@example.com', 'Kayla', 'Bennett', 'Biology teacher.'),
('victoria.cook@example.com', 'Victoria', 'Cook', 'Chef and recipe developer.'),
('sean.bailey@example.com', 'Sean', 'Bailey', 'Traveler and videographer.'),
('alice.cooper@example.com', 'Alice', 'Cooper', 'Veterinarian.'),
('ethan.watson@example.com', 'Ethan', 'Watson', 'Cinematographer.'),
('chloe.bell@example.com', 'Chloe', 'Bell', 'Social media manager.'),
('jason.richards@example.com', 'Jason', 'Richards', 'Fitness blogger.'),
('tina.brooks@example.com', 'Tina', 'Brooks', 'Book editor.'),
('jeff.russell@example.com', 'Jeff', 'Russell', 'Illustrator.'),
('emma.watson@example.com', 'Emma', 'Watson', 'Writer.'),
('henry.jones@example.com', 'Henry', 'Jones', 'Historian.'),
('lily.ross@example.com', 'Lily', 'Ross', 'Psychologist.'),
('charlie.phillips@example.com', 'Charlie', 'Phillips', 'Guitar teacher.'),
('amy.sullivan@example.com', 'Amy', 'Sullivan', 'Florist.');

-- Inserimento di 150 post
INSERT INTO posts (user_id, image_url, description) VALUES
(1, 'https://images.com/1.jpg', 'Exploring the mountains today!'),
(2, 'https://images.com/2.jpg', 'Beautiful sunset over the city.'),
(3, 'https://images.com/3.jpg', 'Baking a cake today.'),
(4, 'https://images.com/4.jpg', 'My latest painting is finally done.'),
(5, 'https://images.com/5.jpg', 'Had a fantastic day at the beach!'),
(6, 'https://images.com/6.jpg', 'Trying out a new recipe.'),
(7, 'https://images.com/7.jpg', 'A snapshot from my morning run.'),
(8, 'https://images.com/8.jpg', 'Just finished reading a great book.'),
(9, 'https://images.com/9.jpg', 'Photography practice at the park.'),
(10, 'https://images.com/10.jpg', 'A peaceful day by the lake.'),
(11, 'https://images.com/11.jpg', 'Captured the full moon tonight.'),
(12, 'https://images.com/12.jpg', 'My dog enjoying the sunshine.'),
(13, 'https://images.com/13.jpg', 'Trying a new style in my art.'),
(14, 'https://images.com/14.jpg', 'Late night coding session.'),
(15, 'https://images.com/15.jpg', 'Visited a local art gallery.'),
(16, 'https://images.com/16.jpg', 'Family BBQ on a sunny day.'),
(17, 'https://images.com/17.jpg', 'Throwback to my last vacation.'),
(18, 'https://images.com/18.jpg', 'Making progress on my novel.'),
(19, 'https://images.com/19.jpg', 'Exploring street art in my city.'),
(20, 'https://images.com/20.jpg', 'Freshly brewed coffee at my favorite spot.'),
(21, 'https://images.com/21.jpg', 'Experimenting with night photography.'),
(22, 'https://images.com/22.jpg', 'A walk in the forest.'),
(23, 'https://images.com/23.jpg', 'Trying to learn a new instrument.'),
(24, 'https://images.com/24.jpg', 'Sunrise at the mountains.'),
(25, 'https://images.com/25.jpg', 'My latest watercolor painting.'),
(26, 'https://images.com/26.jpg', 'Beach day with friends.'),
(27, 'https://images.com/27.jpg', 'Exploring a hidden waterfall.'),
(28, 'https://images.com/28.jpg', 'Biking through the countryside.'),
(29, 'https://images.com/29.jpg', 'Starting a new workout plan.'),
(30, 'https://images.com/30.jpg', 'A quiet moment with my cat.'),
(31, 'https://images.com/31.jpg', 'Learning to bake sourdough bread.'),
(32, 'https://images.com/32.jpg', 'Reading under the stars.'),
(33, 'https://images.com/33.jpg', 'Springtime in my garden.'),
(34, 'https://images.com/34.jpg', 'Building a model car.'),
(35, 'https://images.com/35.jpg', 'Weekend road trip adventure.'),
(36, 'https://images.com/36.jpg', 'Experimenting with acrylics.'),
(37, 'https://images.com/37.jpg', 'Visited a local animal sanctuary.'),
(38, 'https://images.com/38.jpg', 'Got a new tattoo today.'),
(39, 'https://images.com/39.jpg', 'Rainy day reading.'),
(40, 'https://images.com/40.jpg', 'Exploring ancient ruins.'),
(41, 'https://images.com/41.jpg', 'Late night stargazing.'),
(42, 'https://images.com/42.jpg', 'Camping trip with family.'),
(43, 'https://images.com/43.jpg', 'Took a cooking class today.'),
(44, 'https://images.com/44.jpg', 'Practicing landscape photography.'),
(45, 'https://images.com/45.jpg', 'My first attempt at a sculpture.'),
(4, 'https://images.com/46.jpg', 'Trying out landscape painting.'),
(4, 'https://images.com/47.jpg', 'Brunch with friends.'),
(4, 'https://images.com/48.jpg', 'Exploring the city by bike.'),
(4, 'https://images.com/49.jpg', 'New earrings I made myself.'),
(5, 'https://images.com/50.jpg', 'Spent the day with my family.'),
(5, 'https://images.com/51.jpg', 'Running by the river.'),
(5, 'https://images.com/52.jpg', 'Writing poetry under a tree.'),
(5, 'https://images.com/53.jpg', 'Visiting the museum of natural history.'),
(5, 'https://images.com/54.jpg', 'Captured a beautiful rainbow.'),
(5, 'https://images.com/55.jpg', 'Drawing with charcoals.'),
(5, 'https://images.com/56.jpg', 'Learning to knit.'),
(5, 'https://images.com/57.jpg', 'Gardening on a sunny day.'),
(5, 'https://images.com/58.jpg', 'My dog met a new friend.'),
(5, 'https://images.com/59.jpg', 'Watching the sunrise.'),
(6, 'https://images.com/60.jpg', 'Experimenting with digital art.'),
(6, 'https://images.com/61.jpg', 'At the beach during sunset.'),
(6, 'https://images.com/62.jpg', 'Picnic with family.'),
(6, 'https://images.com/63.jpg', 'Reading at the local library.'),
(6, 'https://images.com/64.jpg', 'Dancing in the rain.'),
(6, 'https://images.com/65.jpg', 'Finished another knitting project.'),
(6, 'https://images.com/66.jpg', 'A day at the skate park.'),
(6, 'https://images.com/67.jpg', 'Camping by the lake.'),
(6, 'https://images.com/68.jpg', 'Trying out a new camera lens.'),
(6, 'https://images.com/69.jpg', 'Dinner with old friends.'),
(7, 'https://images.com/70.jpg', 'Practicing yoga at sunrise.'),
(7, 'https://images.com/71.jpg', 'Reading my favorite novel again.'),
(7, 'https://images.com/72.jpg', 'Fishing by the river.'),
(7, 'https://images.com/73.jpg', 'Exploring new trails in the forest.'),
(7, 'https://images.com/74.jpg', 'Rainy day doodling.'),
(7, 'https://images.com/75.jpg', 'Hiking with friends.'),
(7, 'https://images.com/76.jpg', 'Art workshop in the park.'),
(7, 'https://images.com/77.jpg', 'Filming a documentary.'),
(7, 'https://images.com/78.jpg', 'Visiting a farmers market.'),
(7, 'https://images.com/79.jpg', 'A beautiful sunset by the shore.'),
(8, 'https://images.com/80.jpg', 'A lovely stroll downtown.'),
(8, 'https://images.com/81.jpg', 'Taking time for some mindfulness.'),
(8, 'https://images.com/82.jpg', 'Tasting exotic foods.'),
(8, 'https://images.com/83.jpg', 'Getting back into painting.'),
(8, 'https://images.com/84.jpg', 'My homemade pasta experiment.'),
(8, 'https://images.com/85.jpg', 'Kayaking in the lake.'),
(8, 'https://images.com/86.jpg', 'My dog playing in the snow.'),
(8, 'https://images.com/87.jpg', 'Watching a movie marathon.'),
(8, 'https://images.com/88.jpg', 'Weekend brunch with friends.'),
(8, 'https://images.com/89.jpg', 'Shopping for fresh flowers.'),
(9, 'https://images.com/90.jpg', 'Capturing wildlife on film.'),
(9, 'https://images.com/91.jpg', 'Working on a comic strip.'),
(9, 'https://images.com/92.jpg', 'Exploring the mountains alone.'),
(9, 'https://images.com/93.jpg', 'Learning to play the ukulele.'),
(9, 'https://images.com/94.jpg', 'Camping under the stars.'),
(9, 'https://images.com/95.jpg', 'Making my own candle.'),
(9, 'https://images.com/96.jpg', 'Picnic at the botanical garden.'),
(9, 'https://images.com/97.jpg', 'A bike ride through the countryside.'),
(9, 'https://images.com/98.jpg', 'Trying out urban photography.'),
(9, 'https://images.com/99.jpg', 'A beach bonfire night.'),
(10, 'https://images.com/100.jpg', 'Winter walk in the park.'),
(1, 'https://images.com/101.jpg', 'DIY jewelry making.'),
(2, 'https://images.com/102.jpg', 'Baking cookies with friends.'),
(3, 'https://images.com/103.jpg', 'Late night coffee run.'),
(4, 'https://images.com/104.jpg', 'Day at the art museum.'),
(5, 'https://images.com/105.jpg', 'Sketching in the garden.'),
(6, 'https://images.com/106.jpg', 'My travel journal update.'),
(7, 'https://images.com/107.jpg', 'Trying my hand at pottery.'),
(8, 'https://images.com/108.jpg', 'Making a scrapbook.'),
(9, 'https://images.com/109.jpg', 'Filming in the mountains.'),
(10, 'https://images.com/110.jpg', 'Creating new music compositions.'),
(11, 'https://images.com/111.jpg', 'Exploring a historic town.'),
(12, 'https://images.com/112.jpg', 'Finished a tough workout.'),
(13, 'https://images.com/113.jpg', 'Cooking with family.'),
(14, 'https://images.com/114.jpg', 'Camping in the national park.'),
(15, 'https://images.com/115.jpg', 'Trying out astrophotography.'),
(16, 'https://images.com/116.jpg', 'Snowboarding in the mountains.'),
(17, 'https://images.com/117.jpg', 'My latest woodworking project.'),
(18, 'https://images.com/118.jpg', 'Attended a food festival.'),
(19, 'https://images.com/119.jpg', 'Crafting my own candles.'),
(20, 'https://images.com/120.jpg', 'Rainy day in the city.'),
(21, 'https://images.com/121.jpg', 'Snowshoeing with friends.'),
(22, 'https://images.com/122.jpg', 'Documenting a street festival.'),
(23, 'https://images.com/123.jpg', 'Learning to skateboard.'),
(24, 'https://images.com/124.jpg', 'Painting a mural.'),
(25, 'https://images.com/125.jpg', 'Shopping at a flea market.'),
(26, 'https://images.com/126.jpg', 'Building a terrarium.'),
(27, 'https://images.com/127.jpg', 'Took part in a charity walk.'),
(28, 'https://images.com/128.jpg', 'Attended a concert.'),
(9, 'https://images.com/129.jpg', 'Building a treehouse.'),
(30, 'https://images.com/130.jpg', 'Enjoying the first snowfall.'),
(31, 'https://images.com/131.jpg', 'Vintage camera photography.'),
(32, 'https://images.com/132.jpg', 'Exploring a museum.'),
(33, 'https://images.com/133.jpg', 'Sketching in my notebook.'),
(34, 'https://images.com/134.jpg', 'My first pottery class.'),
(35, 'https://images.com/135.jpg', 'Visiting an aquarium.'),
(36, 'https://images.com/136.jpg', 'Volunteering at an animal shelter.'),
(37, 'https://images.com/137.jpg', 'Getting a new tattoo.'),
(38, 'https://images.com/138.jpg', 'City skyline at night.'),
(39, 'https://images.com/139.jpg', 'Restoring vintage furniture.'),
(40, 'https://images.com/140.jpg', 'Picking apples at an orchard.'),
(41, 'https://images.com/141.jpg', 'First day in the mountains.'),
(42, 'https://images.com/142.jpg', 'Walking through a sunflower field.'),
(43, 'https://images.com/143.jpg', 'Trying out macro photography.'),
(44, 'https://images.com/144.jpg', 'Watching the northern lights.'),
(45, 'https://images.com/145.jpg', 'Sunset over the mountains.'),
(46, 'https://images.com/146.jpg', 'Playing board games with family.'),
(47, 'https://images.com/147.jpg', 'Filming a short movie.'),
(48, 'https://images.com/148.jpg', 'Watching birds at the lake.'),
(49, 'https://images.com/149.jpg', 'A visit to the opera.'),
(50, 'https://images.com/150.jpg', 'Creating new music compositions.');


-- Inserimento di 200 commenti
INSERT INTO comments (user_id, post_id, comment_id, text) VALUES
(1, 1, NULL, 'Great view! Where is this?'),
(1, 2, NULL, 'Looks amazing! Wish I was there.'),
(1, 3, NULL, 'Baking is so much fun! What recipe did you use?'),
(1, 4, NULL, 'Fantastic painting, love the colors!'),
(1, 5, NULL, 'The beach is my favorite place. Looks so peaceful.'),
(1, 6, NULL, 'Let me know how the recipe turned out!'),
(1, 7, NULL, 'Nothing like an early morning run to start the day!'),
(1, 8, NULL, 'I loved that book! Did you like it too?'),
(1, 9, NULL, 'Awesome shot! What camera are you using?'),
(1, 10, NULL, 'The lake looks so calm. What a great place to relax!'),
(1, 11, NULL, 'Wow, the moon looks stunning in your photo.'),
(1, 12, NULL, 'Your dog is adorable! I have one too!'),
(1, 13, NULL, 'Love the style of this painting, very creative.'),
(2, 1, NULL, 'Late night coding is the best. What are you working on?'),
(2, 15, NULL, 'Art galleries are so inspiring, aren’t they?'),
(2, 16, NULL, 'BBQ with family is the best. What did you cook?'),
(2, 17, NULL, 'Vacations are the best memories. Where was this?'),
(2, 18, NULL, 'Writing a novel? That’s amazing! What’s it about?'),
(2, 19, NULL, 'Street art has so much personality. Great capture!'),
(2, 20, NULL, 'Nothing beats a fresh cup of coffee. Enjoy!'),
(2, 21, NULL, 'Night photography is tricky. Looks awesome!'),
(2, 22, NULL, 'I love forest walks too, so calming.'),
(2, 23, NULL, 'What instrument are you learning? I just picked up guitar!'),
(2, 24, NULL, 'Sunrise in the mountains is magical.'),
(2, 25, NULL, 'Beautiful watercolor! Do you paint often?'),
(2, 26, NULL, 'Beach days are the best! Did you go swimming?'),
(2, 27, NULL, 'Waterfalls are mesmerizing! Is this nearby?'),
(2, 28, NULL, 'Country biking sounds amazing, great way to unwind.'),
(10, 28, NULL, 'Workout goals! Keep it up!'),
(10, 30, NULL, 'Cats bring such peace, don’t they?'),
(10, 31, NULL, 'Sourdough takes time, but it’s worth it!'),
(10, 32, NULL, 'Reading under the stars sounds perfect.'),
(10, 33, NULL, 'The garden looks vibrant. What plants do you have?'),
(10, 34, NULL, 'Building models is so relaxing. Nice work!'),
(10, 35, NULL, 'Road trips make the best memories. Where did you go?'),
(10, 36, NULL, 'Acrylics are so versatile. What’s your subject?'),
(10, 37, NULL, 'Animal sanctuaries are so special. What animals did you see?'),
(10, 38, NULL, 'Nice tattoo! What’s the meaning behind it?'),
(10, 39, NULL, 'Rainy days and books go hand in hand.'),
(10, 40, NULL, 'Ancient ruins are fascinating. Where was this?'),
(10, 41, NULL, 'Stargazing is so humbling.'),
(10, 42, NULL, 'Camping with family sounds so fun!'),
(10, 43, NULL, 'What did you cook in your class?'),
(10, 44, NULL, 'Landscape photography can be so rewarding. Great shot!'),
(10, 45, NULL, 'Is this your first sculpture? It looks awesome.'),
(13, 45, NULL, 'Landscape painting? I’d love to see the finished piece!'),
(47, 45, NULL, 'Brunch with friends is the best!'),
(47, 48, NULL, 'Biking is such a great way to explore.'),
(47, 49, NULL, 'Wow, you made those earrings? They’re beautiful!'),
(47, 50, NULL, 'Family time is precious.'),
(47, 51, NULL, 'Running by the river must be refreshing.'),
(47, 52, NULL, 'Writing poetry? I’d love to read some!'),
(47, 53, NULL, 'Museums are my happy place too.'),
(47, 54, NULL, 'Rainbows make everything better!'),
(47, 55, NULL, 'Charcoal is tricky, but you nailed it!'),
(47, 56, NULL, 'Knitting? Cool! What are you making?'),
(47, 57, NULL, 'Gardening on a sunny day is so rewarding.'),
(47, 58, NULL, 'Aww, dog friends!'),
(47, 59, NULL, 'Sunrise views are the best start to the day.'),
(47, 60, NULL, 'Digital art looks so vibrant.'),
(47, 61, NULL, 'Sunset at the beach? Yes, please!'),
(47, 62, NULL, 'Picnics are the best! What did you bring?'),
(47, 63, NULL, 'Libraries have such a peaceful vibe.'),
(47, 64, NULL, 'Dancing in the rain! That’s the spirit!'),
(47, 65, NULL, 'Knitting is a skill I admire.'),
(47, 66, NULL, 'Skate park sounds fun. Do you skate often?'),
(11, 66, NULL, 'Camping by the lake? Sounds serene.'),
(23, 66, NULL, 'Nice lens! Photography gear is so fun to experiment with.'),
(23, 69, NULL, 'Old friends make the best company.'),
(23, 70, NULL, 'Yoga at sunrise sounds perfect.'),
(23, 71, NULL, 'Rereading a favorite book feels like visiting an old friend.'),
(23, 72, NULL, 'Fishing by the river? Sounds peaceful.'),
(23, 73, NULL, 'Exploring new trails? Love it!'),
(23, 74, NULL, 'Rainy day doodling? Love the creativity!'),
(23, 75, NULL, 'Hiking with friends must’ve been a blast!'),
(23, 76, NULL, 'Art workshops are inspiring. What did you make?'),
(23, 77, NULL, 'Documentaries are fascinating!'),
(23, 78, NULL, 'Farmers markets are so fun. What did you buy?'),
(23, 79, NULL, 'Sunset by the shore? Beautiful!'),
(23, 80, NULL, 'City walks have their own charm.'),
(23, 1, NULL, 'Mindfulness is key to peace.'),
(23, 2, NULL, 'Exotic foods? What did you try?'),
(23, 3, NULL, 'Painting again? Love your art journey!'),
(23, 4, NULL, 'Homemade pasta! Bet it was delicious.'),
(23, 5, NULL, 'Kayaking is so fun!'),
(23, 6, NULL, 'Dogs in the snow are so cute!'),
(23, 7, NULL, 'Movie marathon? Perfect cozy day.'),
(23, 8, NULL, 'Brunch with friends is a win!'),
(23, 9, NULL, 'Fresh flowers are always a mood booster!'),
(23, 90, NULL, 'Wildlife photography is such a thrill.'),
(23, 1, NULL, 'Comic strip? Nice!'),
(23, 2, NULL, 'Solo mountain trips are empowering.'),
(23, 3, NULL, 'Learning ukulele? That’s awesome!'),
(23, 4, NULL, 'Camping under the stars! What a night.'),
(23, 5, NULL, 'Candle making? Sounds calming.'),
(23, 6, NULL, 'Picnic at the botanical garden? Perfect!'),
(23, 7, NULL, 'Countryside bike rides are the best.'),
(23, 8, NULL, 'Urban photography is so creative!'),
(23, 99, NULL, 'Beach bonfire? Sign me up!'),
(23, 100, NULL, 'Winter walks are so peaceful.'),
(23, 101, NULL, 'Jewelry making? Nice skill!'),
(23, 102, NULL, 'Baking with friends? Must’ve been fun!'),
(23, 103, NULL, 'Late night coffee? Sounds perfect!'),
(23, 104, NULL, 'Art museum? Inspiring place!'),
(23, 105, NULL, 'Sketching in nature is therapeutic.'),
(23, 106, NULL, 'Travel journals are so meaningful.'),
(23, 107, NULL, 'Pottery class? That’s cool!'),
(23, 108, NULL, 'Scrapbooking? What a great way to keep memories!'),
(23, 109, NULL, 'Filming in the mountains? Wow!'),
(23, 110, NULL, 'New music compositions? Exciting!'),
(23, 111, NULL, 'Historic towns have so much character.'),
(23, 111, NULL, 'Workout complete! Keep it up!'),
(23, 113, NULL, 'Cooking with family? Lovely tradition!'),
(23, 114, NULL, 'Camping in the park? Sounds amazing!'),
(23, 111, NULL, 'Astrophotography is challenging, but you nailed it!'),
(17, 111, NULL, 'Snowboarding? Sounds thrilling!'),
(17, 111, NULL, 'Woodworking project looks awesome!'),
(17, 111, NULL, 'Food festivals are a treat!'),
(17, 111, NULL, 'Candle making? Sounds relaxing!'),
(17, 120, NULL, 'Rainy day? City vibes are the best.'),
(17, 121, NULL, 'Snowshoeing is a workout!'),
(17, 122, NULL, 'Street festival? So lively!'),
(17, 123, NULL, 'Learning to skateboard? Brave!'),
(17, 124, NULL, 'Mural painting? Impressive!'),
(17, 125, NULL, 'Flea market finds are treasures!'),
(17, 126, NULL, 'Terrarium project looks great!'),
(17, 127, NULL, 'Charity walk? Wonderful cause.'),
(17, 128, NULL, 'Concert night! Awesome vibes.'),
(17, 129, NULL, 'Treehouse building? Amazing skill!'),
(17, 130, NULL, 'Snowfall? Perfect winter day.');


-- Inserimento di 70 risposte ad altri commenti
INSERT INTO comments (user_id, post_id, comment_id, text) VALUES
(7, NULL, 1, 'Yes, I’d love to know where this is too!'),
(7, NULL, 2, 'It does look incredible!'),
(7, NULL, 3, 'I second this! What recipe did you try?'),
(7, NULL, 4, 'Totally agree, those colors pop!'),
(7, NULL, 5, 'The beach is so peaceful, isn’t it?'),
(7, NULL, 6, 'Let us know how it went!'),
(7, NULL, 7, 'A morning run sets the tone for the day!'),
(7, NULL, 8, 'I loved that book as well!'),
(7, NULL, 9, 'I’m curious too!'),
(7, NULL, 10, 'Such a calm vibe, for sure.'),
(7, NULL, 11, 'The moon looks surreal here!'),
(7, NULL, 12, 'I have a dog too! They’re the best.'),
(7, NULL, 13, 'Your art style is unique!'),
(7, NULL, 10, 'Night coding is the best time to focus.'),
(12, NULL, 15, 'Galleries have that effect, totally!'),
(12, NULL, 16, 'BBQ gatherings are always fun!'),
(12, NULL, 10, 'Vacations are memories to cherish!'),
(12, NULL, 18, 'That sounds interesting! Any spoilers?'),
(12, NULL, 19, 'Street art is fascinating to capture!'),
(12, NULL, 20, 'Coffee lovers unite!'),
(12, NULL, 21, 'Night photography is a challenge, true!'),
(12, NULL, 22, 'The forest brings such peace.'),
(12, NULL, 12, 'Guitar’s amazing! How’s it going?'),
(12, NULL, 24, 'Sunrise in the mountains is breathtaking.'),
(12, NULL, 25, 'Watercolors bring out emotions!'),
(12, NULL, 12, 'The beach feels timeless.'),
(12, NULL, 27, 'Waterfalls are just magical!'),
(12, NULL, 28, 'Such a refreshing way to relax!'),
(12, NULL, 29, 'Keep those workouts going!'),
(12, NULL, 30, 'Yes! Cats add so much joy.'),
(12, NULL, 11, 'Sourdough has a learning curve!'),
(12, NULL, 11, 'Books and stars are a perfect mix.'),
(12, NULL, 11, 'Your garden must be beautiful!'),
(12, NULL, 11, 'Building models is so satisfying!'),
(12, NULL, 18, 'Road trips create lifelong memories.'),
(12, NULL, 36, 'What inspired this painting?'),
(12, NULL, 37, 'Sanctuaries have a unique vibe!'),
(32, NULL, 38, 'Cool tattoo!'),
(32, NULL, 39, 'Rainy days call for coziness!'),
(32, NULL, 40, 'Where were these ruins?'),
(32, NULL, 41, 'Stargazing is humbling, indeed.'),
(32, NULL, 42, 'Camping with family is the best!'),
(32, NULL, 11, 'Cooking together must’ve been fun!'),
(32, NULL, 44, 'The patience for landscape photography!'),
(32, NULL, 11, 'Looks like a lot of effort paid off!'),
(32, NULL, 46, 'Would love to see it completed!'),
(32, NULL, 47, 'Food with friends is always a vibe.'),
(32, NULL, 48, 'Biking is my way of unwinding too!'),
(32, NULL, 49, 'Handmade jewelry is so unique!'),
(32, NULL, 50, 'Family moments are priceless.'),
(32, NULL, 51, 'Running near water sounds perfect.'),
(17, NULL, 52, 'Writing poetry takes courage!'),
(17, NULL, 53, 'Museums are magical!'),
(17, NULL, 54, 'Rainbows bring joy!'),
(17, NULL, 55, 'Charcoal art is intense!'),
(17, NULL, 56, 'What are you knitting?'),
(17, NULL, 57, 'Gardening is fulfilling.'),
(17, NULL, 58, 'Dogs make life better!'),
(17, NULL, 59, 'Sunrises are worth waking up for.'),
(17, NULL, 60, 'Digital art has vibrant potential!'),
(17, NULL, 61, 'Beach sunsets are serene!'),
(17, NULL, 62, 'Picnic time! What did you eat?'),
(17, NULL, 63, 'Libraries have a calming effect.'),
(19, NULL, 64, 'Rain and dancing, perfect duo!'),
(19, NULL, 65, 'Knitting? Impressive!'),
(19, NULL, 66, 'Skating keeps you active!'),
(15, NULL, 37, 'Camping near water is so relaxing.'),
(24, NULL, 68, 'Photography gear is addictive!'),
(24, NULL, 37, 'Old friends make memories better!'),
(24, NULL, 70, 'Yoga with nature sounds peaceful.');

-- Inserimento di like ai post
INSERT INTO post_likes (user_id, post_id, created_at) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(1, 3, NOW()),
(2, 1, NOW()),
(2, 4, NOW()),
(3, 1, NOW()),
(3, 5, NOW()),
(4, 1, NOW()),
(4, 2, NOW()),
(4, 3, NOW()),
(5, 2, NOW()),
(5, 5, NOW()),
(5, 6, NOW()),
(6, 3, NOW()),
(6, 7, NOW()),
(7, 4, NOW()),
(7, 5, NOW()),
(8, 6, NOW()),
(8, 8, NOW()),
(9, 6, NOW()),
(9, 7, NOW()),
(10, 8, NOW()),
(10, 9, NOW()),
(11, 10, NOW()),
(11, 11, NOW()),
(12, 10, NOW()),
(12, 12, NOW()),
(13, 13, NOW()),
(13, 14, NOW()),
(14, 15, NOW()),
(14, 16, NOW()),
(15, 17, NOW()),
(15, 18, NOW()),
(15, 19, NOW()),
(16, 20, NOW()),
(17, 20, NOW()),
(18, 21, NOW()),
(19, 22, NOW()),
(20, 23, NOW()),
(21, 24, NOW()),
(22, 25, NOW()),
(23, 26, NOW()),
(24, 27, NOW()),
(25, 28, NOW()),
(26, 29, NOW()),
(27, 30, NOW()),
(28, 31, NOW()),
(29, 32, NOW()),
(30, 33, NOW()),
(31, 34, NOW()),
(32, 35, NOW()),
(33, 36, NOW()),
(34, 37, NOW()),
(35, 38, NOW()),
(36, 39, NOW()),
(37, 40, NOW()),
(38, 41, NOW()),
(39, 42, NOW()),
(40, 43, NOW()),
(41, 44, NOW()),
(42, 45, NOW()),
(43, 46, NOW()),
(44, 47, NOW()),
(1, 48, NOW()),
(2, 49, NOW()),
(3, 50, NOW()),
(4, 51, NOW()),
(5, 52, NOW()),
(6, 53, NOW()),
(7, 54, NOW()),
(8, 55, NOW()),
(9, 56, NOW()),
(10, 57, NOW()),
(11, 58, NOW()),
(12, 59, NOW()),
(13, 60, NOW()),
(14, 61, NOW()),
(15, 62, NOW()),
(16, 63, NOW()),
(17, 64, NOW()),
(18, 65, NOW()),
(19, 66, NOW()),
(20, 67, NOW()),
(21, 68, NOW()),
(22, 69, NOW()),
(23, 70, NOW()),
(24, 71, NOW()),
(25, 72, NOW()),
(26, 73, NOW()),
(27, 74, NOW()),
(28, 75, NOW()),
(29, 76, NOW()),
(30, 77, NOW()),
(31, 78, NOW()),
(32, 79, NOW()),
(33, 80, NOW()),
(34, 81, NOW()),
(35, 82, NOW()),
(36, 83, NOW()),
(37, 84, NOW()),
(38, 85, NOW()),
(39, 86, NOW()),
(40, 87, NOW()),
(41, 88, NOW()),
(42, 89, NOW()),
(43, 90, NOW()),
(44, 91, NOW()),
(45, 92, NOW()),
(46, 93, NOW()),
(47, 94, NOW()),
(1, 95, NOW()),
(2, 96, NOW()),
(3, 97, NOW()),
(4, 98, NOW()),
(5, 99, NOW()),
(6, 100, NOW());


-- Inserimento di like ai commenti
INSERT INTO comment_likes (user_id, comment_id, created_at) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(2, 3, NOW()),
(2, 4, NOW()),
(3, 5, NOW()),
(3, 6, NOW()),
(4, 7, NOW()),
(5, 8, NOW()),
(5, 9, NOW()),
(6, 10, NOW()),
(7, 11, NOW()),
(8, 12, NOW()),
(8, 13, NOW()),
(9, 14, NOW()),
(9, 15, NOW()),
(10, 16, NOW()),
(10, 17, NOW()),
(11, 18, NOW()),
(12, 19, NOW()),
(12, 20, NOW()),
(13, 21, NOW()),
(14, 22, NOW()),
(15, 23, NOW()),
(16, 24, NOW()),
(16, 25, NOW()),
(17, 26, NOW()),
(18, 27, NOW()),
(19, 28, NOW()),
(20, 29, NOW()),
(21, 30, NOW()),
(22, 31, NOW()),
(22, 32, NOW()),
(23, 33, NOW()),
(24, 34, NOW()),
(25, 35, NOW()),
(26, 36, NOW()),
(27, 37, NOW()),
(28, 38, NOW()),
(29, 39, NOW()),
(30, 40, NOW()),
(31, 41, NOW()),
(32, 42, NOW()),
(33, 43, NOW()),
(34, 44, NOW()),
(35, 45, NOW()),
(36, 46, NOW()),
(37, 47, NOW()),
(1, 48, NOW()),
(2, 49, NOW()),
(3, 50, NOW()),
(4, 51, NOW()),
(5, 52, NOW()),
(6, 53, NOW()),
(7, 54, NOW()),
(8, 55, NOW()),
(9, 56, NOW()),
(10, 57, NOW());


-- Assegna casualmente date di registrazione utenti
UPDATE users
SET created_at = FROM_UNIXTIME(RAND() * (1738537200 - 1643842800 + 1) + 1643842800);

-- Assegna casualmente date di creazione post
UPDATE posts
SET created_at = FROM_UNIXTIME(RAND() * (1738537200 - 1643842800 + 1) + 1643842800)
    updated_at = created_at;

-- Assegna casualmente date di creazione commenti
UPDATE comments
SET created_at = FROM_UNIXTIME(RAND() * (1738537200 - 1643842800 + 1) + 1643842800)
    updated_at = created_at;
