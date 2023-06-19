/*

user_id PRIMARY KEY olmalı.
username UNIQUE olmalı ve NULL olmamalı.
email UNIQUE olmalı ve NULL olmamalı.
creation_date girilmediyse verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir.

Yukarıdaki kısıtlamalara uyularak 'users' tablosu oluşturuldu.

*/

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN
);

/*

category_id PRIMARY KEY olmalı.
name UNIQUE olmalı ve NULL olmamalı.
creation_date girilmediyse verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir.

Yukarıdaki kısıtlamalara uyularak 'categories' tablosu oluşturuldu.

*/

CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*

posts_id PRIMARY KEY olmalı.
Tablolar arasında FOREIGN KEY ile referans verilerek ilişki kurulmalıdır.
Hiçbir gönderi (post) kullanıcı (user) bilgisi olmadan kayıt edilememelidir.
Hiçbir gönderi (post) kategori (category) bilgisi olmadan kayıt edilememelidir.
Tüm gönderilerin (posts) title ve content bilgisi olmak zorundadır. title bilgisi 50 karakterden uzun olmamalıdır.
Bir gönderi herhangi bir view_count bilgisi olmadan kayıt edilirse 0 olarak başlangıç değerine sahip olmalıdır.
creation_date girilmediyse verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir.

Yukarıdaki kısıtlamalara uyularak 'posts' tablosu oluşturuldu.

*/

CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id) NOT NULL,
  category_id INTEGER REFERENCES categories(category_id) NOT NULL,
  title VARCHAR(50) NOT NULL,
  content TEXT NOT NULL,
  view_count INTEGER DEFAULT 0,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_published BOOLEAN
);

/*

comment_id PRIMARY KEY olmalı.
Tablolar arasında FOREIGN KEY ile referans verilerek ilişki kurulmalıdır.
Hiçbir yorum (comment) gönderi (post) bilgisi olmadan kayıt edilememelidir.
Tüm yorumların (comment) comment bilgisi olmak zorundadır.
creation_date girilmediyse verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir.

Yukarıdaki kısıtlamalara uyularak 'comments' tablosu oluşturuldu.

*/

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts(post_id) NOT NULL,
  user_id INTEGER REFERENCES users(user_id),
  comment TEXT NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_confirmed BOOLEAN
); 



-- users tablosu veri girişi.


insert into users (username, email, creation_date, is_active) values ('gguyan0', 'jdoget0@bandcamp.com', '2003-12-04', false);
insert into users (username, email, creation_date, is_active) values ('ngayter1', 'ajakel1@dedecms.com', '2021-02-10', false);
insert into users (username, email, creation_date, is_active) values ('khogben2', 'abarchrameev2@usnews.com', '2006-10-16', true);
insert into users (username, email, creation_date, is_active) values ('oberryman3', 'mherley3@slate.com', '2016-02-21', false);
insert into users (username, email, creation_date, is_active) values ('sdecleen4', 'ssayles4@arizona.edu', '2022-07-21', true);
insert into users (username, email, creation_date, is_active) values ('jhubbard5', 'akenworth5@geocities.com', '2022-03-25', true);
insert into users (username, email, creation_date, is_active) values ('dkid6', 'koshesnan6@exblog.jp', '2022-07-25', false);


-- categories tablosu veri girişi.


insert into categories (name, creation_date) values ('LifeStyle', '2000-01-23');
insert into categories (name, creation_date) values ('Cooking', '2020-03-11');
insert into categories (name, creation_date) values ('Sports', '2016-12-05');


-- posts tablosu veri girişi.


insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 2, 'optimize cross-media users', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut', 50, false, '2011-05-31');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 3, 'target collaborative functionalities', 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia', 4, false, '2022-10-22');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 2, 'brand collaborative e-markets', 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 6, false, '2008-03-03');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 2, 'repurpose mission-critical supply-chains', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 2, true, '2018-12-06');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 3, 'morph real-time synergies', 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus', 39, true, '2005-09-13');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (1, 3, 'e-enable virtual applications', 'iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', 30, true, '2011-09-16');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 1, 'visualize clicks-and-mortar infrastructures', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', 7, false, '2019-03-09');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (1, 2, 'mesh dynamic supply-chains', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut', 20, true, '2020-03-26');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 1, 'syndicate frictionless applications', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 7, true, '2015-12-22');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 1, 'incubate open-source metrics', 'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus', 4, false, '2011-06-15');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 3, 'synergize extensible markets', 'aenean sit amet justo morbi ut odio cras mi pede', 32, true, '2003-09-24');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (7, 3, 'synthesize end-to-end e-markets', 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', 39, true, '2022-03-08');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (7, 1, 'disintermediate compelling interfaces', 'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam', 16, true, '2016-11-21');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (4, 1, 'mesh out-of-the-box synergies', 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 20, true, '2020-03-07');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 3, 'engage cutting-edge functionalities', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam', 47, false, '2008-11-06');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 1, 'evolve proactive content', 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec', 22, true, '2016-09-03');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (1, 2, 'redefine best-of-breed metrics', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et', 43, true, '2001-05-10');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 3, 'exploit interactive niches', 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras', 11, true, '2015-02-25');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 3, 'engage vertical web services', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', 24, false, '2018-03-15');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 1, 'maximize extensible mindshare', 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at', 26, true, '2013-11-02');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 1, 'innovate real-time e-markets', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus', 7, false, '2014-07-19');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 2, 'unleash front-end technologies', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel', 47, false, '2013-08-02');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (4, 3, 'syndicate granular experiences', 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue', 49, true, '2002-11-13');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 1, 'enable bricks-and-clicks e-commerce', 'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 8, false, '2006-11-12');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 3, 'grow sexy ROI', 'curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed', 30, false, '2012-09-17');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 1, 'orchestrate next-generation technologies', 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci', 43, true, '2013-02-12');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 2, 'repurpose intuitive markets', 'aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', 27, false, '2020-05-11');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (4, 3, 'redefine one-to-one bandwidth', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit', 15, false, '2007-12-31');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 2, 'iterate cross-media synergies', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis', 29, true, '2007-03-11');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (1, 3, 'exploit strategic metrics', 'vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in', 36, true, '2014-09-17');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 1, 'envisioneer world-class interfaces', 'nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 25, false, '2008-12-09');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 2, 'incentivize proactive e-services', 'convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu', 47, true, '2019-07-02');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 3, 'extend best-of-breed supply-chains', 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium', 33, false, '2005-09-03');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 1, 'transform strategic e-tailers', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis', 39, false, '2009-10-07');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (4, 3, 'transform plug-and-play architectures', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu', 8, false, '2005-07-12');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 1, 'exploit cutting-edge users', 'neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat', 1, false, '2016-09-23');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (4, 1, 'generate robust convergence', 'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros', 9, true, '2015-06-08');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 2, 'matrix rich communities', 'in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 39, false, '2010-07-14');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (2, 1, 'engage cross-platform niches', 'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 2, false, '2001-02-07');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (3, 2, 'benchmark strategic initiatives', 'donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', 46, true, '2022-06-05');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (1, 1, 'aggregate strategic e-tailers', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis', 40, true, '2017-02-01');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 2, 'aggregate strategic metrics', 'placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem', 24, false, '2003-12-20');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 1, 'enhance frictionless web-readiness', 'quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 40, false, '2012-03-21');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (1, 2, 'seize vertical schemas', 'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor', 17, false, '2009-05-28');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (4, 3, 'syndicate e-business infrastructures', 'erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia', 28, false, '2010-05-17');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (7, 1, 'productize distributed e-markets', 'sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla', 28, true, '2003-09-17');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 1, 'enable innovative e-business', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse', 16, false, '2013-10-17');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 3, 'iterate mission-critical content', 'semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra', 20, true, '2014-09-29');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 1, 'drive synergistic e-services', 'sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', 21, true, '2000-11-14');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (6, 3, 'utilize plug-and-play eyeballs', 'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 13, false, '2014-09-03');
insert into posts (user_id, category_id, title, content, view_count, is_published, creation_date) values (5, 2, 'disintermediate wireless web services', 'dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed', 4, true, '2015-07-07');



-- comments tablosu veri girişi.


insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 7, 'magna at nunc commodo placerat praesent blandit', '2020-07-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 6, 'erat tortor sollicitudin mi sit amet lobortis', '2022-11-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 6, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum', '2012-08-10', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 4, 'dolor morbi vel lectus in quam fringilla rhoncus mauris', '2022-11-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 2, 'suscipit nulla elit ac nulla sed vel enim', '2003-04-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 4, 'integer tincidunt ante vel ipsum praesent blandit lacinia erat', '2005-08-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 6, 'elit ac nulla sed vel enim sit amet nunc', '2008-12-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 3, 'magna at nunc commodo placerat praesent blandit', '2008-10-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 6, 'vitae ipsum aliquam non mauris morbi non lectus aliquam', '2017-12-16', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 1, 'vel enim sit amet nunc viverra dapibus nulla suscipit', '2015-10-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 6, 'enim blandit mi in porttitor pede justo', '2004-12-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 2, 'nisl duis ac nibh fusce', '2006-01-01', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 1, 'donec quis orci eget orci vehicula condimentum curabitur in libero', '2014-10-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 5, 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', '2007-06-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 7, 'nulla nunc purus phasellus in felis donec', '2001-07-10', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 3, 'tristique in tempus sit amet sem fusce consequat nulla', '2004-01-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 4, 'faucibus orci luctus et ultrices posuere cubilia curae mauris', '2010-12-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 2, 'amet eleifend pede libero quis', '2012-12-01', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 1, 'parturient montes nascetur ridiculus mus etiam', '2018-05-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 5, 'molestie nibh in lectus pellentesque at nulla suspendisse', '2010-05-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 2, 'pede ac diam cras pellentesque volutpat dui maecenas', '2010-08-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 1, 'magna vulputate luctus cum sociis natoque penatibus et magnis', '2020-07-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 2, 'pede ullamcorper augue a suscipit', '2019-05-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 6, 'libero rutrum ac lobortis vel', '2006-06-02', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 3, 'quis justo maecenas rhoncus aliquam lacus morbi quis', '2017-05-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 6, 'nunc donec quis orci eget orci', '2020-08-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (3, 4, 'nulla tellus in sagittis dui vel nisl duis ac', '2020-04-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 3, 'quis justo maecenas rhoncus aliquam lacus', '2007-04-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 3, 'sapien iaculis congue vivamus metus arcu adipiscing molestie', '2019-08-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 7, 'eget rutrum at lorem integer', '2001-03-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 3, 'venenatis tristique fusce congue diam id ornare imperdiet', '2008-03-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 1, 'platea dictumst maecenas ut massa quis', '2001-11-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 3, 'imperdiet et commodo vulputate justo', '2009-04-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 7, 'viverra pede ac diam cras pellentesque volutpat dui maecenas tristique', '2013-04-13', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 4, 'nulla facilisi cras non velit', '2018-11-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 6, 'nulla quisque arcu libero rutrum ac lobortis', '2006-08-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 6, 'mi sit amet lobortis sapien sapien non', '2020-08-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 6, 'eget rutrum at lorem integer tincidunt', '2012-06-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 6, 'congue eget semper rutrum nulla nunc purus', '2013-04-05', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 6, 'fusce lacus purus aliquet at feugiat non', '2008-07-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 5, 'curabitur at ipsum ac tellus semper interdum mauris', '2019-02-28', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 6, 'id nisl venenatis lacinia aenean', '2000-12-13', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 1, 'tristique fusce congue diam id ornare imperdiet sapien urna pretium', '2020-01-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 1, 'purus eu magna vulputate luctus cum', '2005-03-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 7, 'sapien in sapien iaculis congue', '2018-05-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 1, 'nulla mollis molestie lorem quisque ut erat', '2009-12-19', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 7, 'mauris ullamcorper purus sit amet nulla quisque', '2011-09-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 3, 'cubilia curae mauris viverra diam vitae quam suspendisse potenti', '2006-10-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 2, 'blandit mi in porttitor pede justo', '2009-07-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (37, 3, 'tortor risus dapibus augue vel accumsan tellus nisi', '2019-07-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 6, 'pede ac diam cras pellentesque', '2016-02-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 7, 'mi in porttitor pede justo eu massa donec dapibus duis', '2015-12-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 2, 'suspendisse potenti cras in purus eu', '2017-02-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 3, 'ut rhoncus aliquet pulvinar sed nisl nunc', '2015-01-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 7, 'duis bibendum felis sed interdum venenatis turpis enim blandit', '2009-10-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 4, 'erat quisque erat eros viverra eget congue eget semper rutrum', '2008-04-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 6, 'viverra diam vitae quam suspendisse', '2002-09-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 7, 'ac nulla sed vel enim sit amet nunc viverra', '2021-09-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 5, 'bibendum morbi non quam nec dui luctus rutrum nulla', '2017-07-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 7, 'tincidunt lacus at velit vivamus vel nulla eget eros elementum', '2001-03-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 7, 'dui maecenas tristique est et tempus semper', '2016-10-05', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (3, 7, 'nulla neque libero convallis eget eleifend luctus ultricies eu', '2011-08-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 1, 'in blandit ultrices enim lorem ipsum dolor sit amet', '2019-05-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 1, 'consequat ut nulla sed accumsan', '2010-06-18', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 7, 'a pede posuere nonummy integer non velit donec', '2010-08-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (15, 3, 'eget massa tempor convallis nulla neque libero convallis eget eleifend', '2014-07-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (5, 6, 'enim blandit mi in porttitor pede justo eu massa donec', '2017-01-30', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 5, 'at velit vivamus vel nulla eget eros elementum pellentesque', '2008-06-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 4, 'eleifend quam a odio in', '2017-02-18', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 4, 'lobortis est phasellus sit amet erat nulla tempus vivamus in', '2021-10-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 7, 'cras pellentesque volutpat dui maecenas tristique', '2018-02-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 7, 'turpis donec posuere metus vitae ipsum aliquam non mauris', '2014-06-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 3, 'ac leo pellentesque ultrices mattis', '2018-05-31', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 3, 'dolor sit amet consectetuer adipiscing elit proin risus praesent', '2008-07-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 7, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus', '2023-03-18', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (10, 4, 'orci luctus et ultrices posuere cubilia', '2020-03-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 6, 'sed magna at nunc commodo placerat', '2004-11-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 1, 'eleifend luctus ultricies eu nibh quisque id', '2010-11-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 5, 'odio in hac habitasse platea dictumst maecenas', '2022-05-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 4, 'morbi ut odio cras mi pede', '2021-02-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 3, 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', '2009-11-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 4, 'mauris lacinia sapien quis libero nullam sit amet turpis elementum', '2013-10-27', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 2, 'mauris enim leo rhoncus sed vestibulum', '2020-10-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (31, 7, 'est donec odio justo sollicitudin', '2019-11-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 7, 'donec ut dolor morbi vel lectus in', '2015-06-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 7, 'suspendisse potenti nullam porttitor lacus at', '2019-02-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 1, 'ut ultrices vel augue vestibulum ante ipsum primis in', '2015-11-11', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 2, 'nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', '2006-12-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 2, 'pharetra magna ac consequat metus sapien ut nunc vestibulum', '2016-09-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 4, 'sed ante vivamus tortor duis mattis', '2001-12-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 1, 'duis aliquam convallis nunc proin at turpis a pede posuere', '2003-11-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 1, 'sed magna at nunc commodo placerat praesent blandit nam nulla', '2023-01-18', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 1, 'habitasse platea dictumst morbi vestibulum velit', '2007-06-15', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 4, 'in ante vestibulum ante ipsum primis in', '2012-03-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 4, 'interdum in ante vestibulum ante', '2002-08-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 3, 'eleifend luctus ultricies eu nibh quisque', '2015-05-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 4, 'id nisl venenatis lacinia aenean sit amet justo', '2013-09-10', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (14, 3, 'nec condimentum neque sapien placerat ante nulla justo aliquam', '2008-06-09', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 1, 'sem duis aliquam convallis nunc proin', '2016-08-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 3, 'bibendum felis sed interdum venenatis turpis enim', '2002-06-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 4, 'ipsum primis in faucibus orci', '2011-09-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 5, 'cubilia curae mauris viverra diam vitae quam suspendisse', '2007-02-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 6, 'sollicitudin vitae consectetuer eget rutrum at', '2013-05-10', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 1, 'odio condimentum id luctus nec molestie sed', '2003-01-30', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 7, 'amet nulla quisque arcu libero rutrum ac lobortis vel', '2021-01-22', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 1, 'vestibulum vestibulum ante ipsum primis in faucibus orci', '2018-10-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (6, 4, 'dapibus at diam nam tristique tortor eu pede', '2008-01-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 4, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', '2004-04-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 5, 'nec sem duis aliquam convallis nunc proin at', '2018-02-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 6, 'mollis molestie lorem quisque ut erat curabitur gravida', '2011-09-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 7, 'erat volutpat in congue etiam justo etiam pretium', '2009-05-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 5, 'ultrices enim lorem ipsum dolor sit amet consectetuer', '2021-08-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 4, 'placerat ante nulla justo aliquam quis turpis eget elit sodales', '2022-09-30', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 1, 'fusce lacus purus aliquet at feugiat non pretium', '2017-08-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 5, 'diam in magna bibendum imperdiet nullam', '2014-06-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (10, 5, 'sit amet erat nulla tempus vivamus in', '2004-08-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 7, 'diam neque vestibulum eget vulputate', '2007-02-19', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 7, 'risus semper porta volutpat quam pede lobortis ligula', '2009-08-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 2, 'vestibulum ante ipsum primis in', '2016-04-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 7, 'integer tincidunt ante vel ipsum', '2002-01-28', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 4, 'eleifend luctus ultricies eu nibh', '2016-02-11', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 3, 'erat fermentum justo nec condimentum neque sapien placerat ante nulla', '2021-09-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (3, 5, 'condimentum curabitur in libero ut massa volutpat convallis morbi', '2019-05-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 4, 'amet consectetuer adipiscing elit proin interdum', '2005-05-31', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (8, 6, 'molestie hendrerit at vulputate vitae nisl aenean lectus', '2012-08-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 7, 'mauris lacinia sapien quis libero', '2014-03-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 6, 'magna bibendum imperdiet nullam orci pede venenatis non sodales', '2013-05-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 4, 'ut erat curabitur gravida nisi at nibh in hac', '2008-10-17', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 4, 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem', '2020-01-18', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 6, 'aenean lectus pellentesque eget nunc donec quis orci', '2020-06-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 3, 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi', '2023-01-03', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 1, 'sem sed sagittis nam congue risus semper', '2013-02-03', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, 2, 'nascetur ridiculus mus etiam vel augue vestibulum rutrum', '2002-01-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 4, 'massa donec dapibus duis at velit eu est congue', '2004-02-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 5, 'at velit vivamus vel nulla eget eros elementum', '2004-08-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 3, 'pede lobortis ligula sit amet eleifend pede libero quis', '2016-07-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (50, 5, 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', '2001-12-20', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 5, 'at velit vivamus vel nulla eget eros elementum pellentesque', '2005-04-08', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 7, 'sit amet turpis elementum ligula vehicula', '2015-02-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 7, 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor', '2017-12-20', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 5, 'maecenas pulvinar lobortis est phasellus sit amet erat', '2021-12-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 6, 'proin at turpis a pede posuere nonummy integer non', '2005-06-13', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (31, 1, 'viverra diam vitae quam suspendisse potenti', '2022-07-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 1, 'quisque arcu libero rutrum ac lobortis vel', '2015-07-05', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (15, 1, 'nulla suspendisse potenti cras in purus', '2006-11-27', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 3, 'ac neque duis bibendum morbi', '2018-09-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 7, 'suscipit nulla elit ac nulla', '2021-04-28', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 6, 'metus sapien ut nunc vestibulum ante ipsum primis', '2010-08-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 1, 'felis sed lacus morbi sem mauris laoreet ut', '2002-01-20', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (7, 1, 'cum sociis natoque penatibus et magnis dis parturient', '2008-04-02', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 2, 'lectus in est risus auctor', '2010-05-01', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 3, 'luctus rutrum nulla tellus in sagittis dui vel nisl', '2013-02-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (17, 5, 'magna at nunc commodo placerat', '2010-06-13', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (37, 4, 'elementum ligula vehicula consequat morbi a ipsum integer a', '2016-04-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 4, 'quam nec dui luctus rutrum nulla tellus', '2005-01-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (11, 3, 'enim lorem ipsum dolor sit amet consectetuer', '2005-12-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (33, 7, 'augue a suscipit nulla elit ac', '2018-02-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (45, 7, 'sapien urna pretium nisl ut', '2016-10-12', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 5, 'rutrum at lorem integer tincidunt ante vel ipsum praesent', '2000-10-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 7, 'ut nulla sed accumsan felis ut at dolor quis odio', '2011-12-16', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 7, 'velit eu est congue elementum in hac', '2011-11-30', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 6, 'blandit non interdum in ante vestibulum ante ipsum primis in', '2009-10-26', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 6, 'quam nec dui luctus rutrum nulla tellus in', '2020-07-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 2, 'sed sagittis nam congue risus semper porta volutpat quam pede', '2010-03-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 1, 'iaculis congue vivamus metus arcu', '2003-05-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 4, 'in felis eu sapien cursus vestibulum', '2017-09-23', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 2, 'curae mauris viverra diam vitae quam suspendisse potenti nullam', '2021-06-25', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 5, 'habitasse platea dictumst maecenas ut massa', '2015-05-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 2, 'eu felis fusce posuere felis sed lacus morbi sem mauris', '2020-04-13', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 5, 'eget congue eget semper rutrum nulla nunc', '2020-06-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 1, 'sit amet lobortis sapien sapien non mi integer', '2002-07-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (36, 6, 'morbi a ipsum integer a', '2022-03-20', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (2, 6, 'sapien arcu sed augue aliquam erat volutpat in congue etiam', '2004-03-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 5, 'suspendisse potenti in eleifend quam', '2009-02-14', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 4, 'rhoncus aliquet pulvinar sed nisl nunc rhoncus', '2022-07-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 6, 'lobortis est phasellus sit amet erat', '2016-02-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 1, 'morbi sem mauris laoreet ut rhoncus aliquet', '2019-05-28', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 4, 'sodales sed tincidunt eu felis fusce', '2022-10-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 6, 'ipsum primis in faucibus orci luctus', '2020-09-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 6, 'pellentesque ultrices mattis odio donec vitae', '2003-01-08', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (6, 7, 'neque vestibulum eget vulputate ut', '2010-01-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 4, 'in congue etiam justo etiam pretium iaculis', '2016-02-21', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 5, 'praesent lectus vestibulum quam sapien', '2011-05-04', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (48, 6, 'ante vivamus tortor duis mattis egestas metus', '2017-11-24', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (23, 7, 'suspendisse accumsan tortor quis turpis sed ante vivamus tortor', '2019-02-12', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 2, 'id turpis integer aliquet massa id lobortis convallis tortor risus', '2011-02-15', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 5, 'phasellus id sapien in sapien iaculis', '2011-06-03', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 1, 'in felis eu sapien cursus vestibulum proin eu mi nulla', '2007-11-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (24, 4, 'duis at velit eu est congue elementum in hac', '2010-09-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (42, 7, 'ac tellus semper interdum mauris ullamcorper', '2004-12-23', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 1, 'turpis donec posuere metus vitae ipsum', '2007-07-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 1, 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', '2012-11-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 3, 'vel sem sed sagittis nam congue risus semper porta volutpat', '2008-06-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 2, 'luctus et ultrices posuere cubilia curae', '2012-01-15', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 6, 'massa donec dapibus duis at velit eu est', '2000-11-25', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (19, 2, 'porta volutpat quam pede lobortis ligula sit amet eleifend', '2014-07-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 5, 'sem sed sagittis nam congue risus semper porta', '2015-04-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 1, 'at velit vivamus vel nulla eget eros elementum pellentesque', '2000-09-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 1, 'nisi vulputate nonummy maecenas tincidunt lacus at velit', '2021-01-10', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 5, 'lectus suspendisse potenti in eleifend quam a odio in', '2012-08-27', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (22, 3, 'quam fringilla rhoncus mauris enim leo rhoncus sed', '2005-01-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 3, 'phasellus sit amet erat nulla tempus vivamus', '2016-08-16', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 1, 'volutpat erat quisque erat eros', '2002-09-14', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 7, 'blandit non interdum in ante vestibulum ante ipsum', '2023-03-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (39, 3, 'ridiculus mus vivamus vestibulum sagittis', '2012-05-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 7, 'nibh in hac habitasse platea dictumst aliquam augue quam', '2002-09-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 7, 'enim blandit mi in porttitor pede justo', '2023-03-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (20, 1, 'ut blandit non interdum in ante vestibulum ante', '2008-01-02', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 7, 'sem sed sagittis nam congue risus semper porta volutpat', '2002-09-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 6, 'eu massa donec dapibus duis at velit eu est congue', '2014-07-05', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 4, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean', '2015-11-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 6, 'turpis eget elit sodales scelerisque mauris', '2008-11-10', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 3, 'nibh in quis justo maecenas rhoncus aliquam lacus morbi', '2001-12-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 6, 'risus dapibus augue vel accumsan', '2022-06-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 5, 'faucibus cursus urna ut tellus nulla ut erat', '2010-08-26', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 4, 'laoreet ut rhoncus aliquet pulvinar', '2017-02-15', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 3, 'in hac habitasse platea dictumst etiam faucibus cursus urna', '2004-08-07', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (30, 6, 'duis mattis egestas metus aenean fermentum donec ut', '2015-09-01', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (41, 2, 'quis orci nullam molestie nibh in lectus pellentesque at', '2000-07-28', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (27, 3, 'a odio in hac habitasse platea dictumst maecenas ut', '2012-02-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (35, 1, 'sed justo pellentesque viverra pede', '2011-08-05', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 5, 'aliquet massa id lobortis convallis tortor risus dapibus augue vel', '2007-05-10', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 4, 'justo in hac habitasse platea', '2014-04-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (32, 7, 'maecenas tincidunt lacus at velit vivamus', '2018-01-11', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 3, 'sed augue aliquam erat volutpat in congue etiam justo', '2005-06-30', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (21, 1, 'aliquam quis turpis eget elit', '2022-10-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (26, 6, 'tincidunt in leo maecenas pulvinar lobortis est phasellus', '2012-01-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (6, 6, 'cras non velit nec nisi', '2015-01-04', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (40, 5, 'ac enim in tempor turpis nec euismod', '2002-12-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (16, 5, 'mauris lacinia sapien quis libero nullam', '2011-02-15', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (49, 4, 'et ultrices posuere cubilia curae mauris viverra diam vitae', '2015-09-22', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (43, 1, 'commodo placerat praesent blandit nam nulla integer pede justo', '2009-01-21', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (1, 3, 'tortor duis mattis egestas metus aenean fermentum donec ut mauris', '2019-02-19', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (12, 1, 'sagittis nam congue risus semper', '2002-04-09', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (38, 3, 'habitasse platea dictumst morbi vestibulum', '2018-09-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (29, 3, 'cras mi pede malesuada in imperdiet et commodo vulputate', '2018-11-06', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (51, 1, 'orci luctus et ultrices posuere', '2019-09-27', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 2, 'luctus ultricies eu nibh quisque', '2016-01-13', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (4, 5, 'eu est congue elementum in', '2013-03-17', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (46, 7, 'sed tristique in tempus sit amet sem fusce consequat nulla', '2017-02-07', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (28, 6, 'lobortis vel dapibus at diam nam tristique tortor', '2013-11-06', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (47, 2, 'libero nullam sit amet turpis elementum ligula vehicula consequat', '2008-05-28', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (18, 2, 'vitae ipsum aliquam non mauris', '2012-10-08', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 3, 'amet justo morbi ut odio', '2006-12-29', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 1, 'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', '2022-02-05', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (25, 4, 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien', '2021-11-19', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (44, 3, 'eleifend pede libero quis orci nullam molestie nibh in lectus', '2016-04-15', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (13, 3, 'justo aliquam quis turpis eget elit sodales scelerisque', '2008-05-01', false);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (34, 1, 'duis aliquam convallis nunc proin', '2021-03-29', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (10, 7, 'vulputate nonummy maecenas tincidunt lacus at velit vivamus vel', '2006-02-24', true);
insert into comments (post_id, user_id, comment, creation_date, is_confirmed) values (9, 3, 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget', '2019-04-08', true);



-- Veritabanında Gerçekleştirdiğimiz İşlemler




-- 1. Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.

SELECT posts.title, users.username, categories.name FROM posts
JOIN categories ON posts.category_id = categories.category_id
JOIN users ON posts.user_id = users.user_id;



-- 2. En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte alın.

SELECT posts.title, users.username, posts.creation_date FROM posts
JOIN users ON posts.user_id = users.user_id
WHERE posts.is_published = true
ORDER BY posts.creation_date DESC
LIMIT 5;



-- 3. Her blog yazısı için yorum sayısını gösterin.

SELECT posts.title,COUNT(comment_id) FROM comments
JOIN posts ON posts.post_id = comments.post_id
GROUP BY posts.title;



-- 4. Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin.

SELECT username, email FROM users;



-- 5. En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın.

SELECT posts.title, comments.comment FROM comments
JOIN posts ON posts.post_id = comments.post_id
ORDER BY comments.creation_date DESC
LIMIT 10;



-- 6. Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun.

SELECT * FROM posts
WHERE user_id = 7;


-- 7. Her kullanıcının yazdığı toplam gönderi sayısını alın.

SELECT users.username,COUNT(post_id) FROM posts
JOIN users ON users.user_id = posts.user_id
GROUP BY users.username;



-- 8. Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin.

SELECT categories.name, COUNT(post_id) FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY name;



-- 9. Gönderi sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, COUNT(post_id) AS postct FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY name
ORDER BY postct DESC
LIMIT 1;



-- 10. Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, SUM(view_count) AS sum_view FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY name
ORDER BY sum_view DESC
LIMIT 1;



-- 11. En fazla yoruma sahip gönderiyi alın.

SELECT posts.title, SUM(comments.post_id) AS sum_post FROM posts
JOIN comments ON posts.user_id = comments.user_id
GROUP BY posts.title
ORDER BY sum_post DESC
LIMIT 1;



-- 12. Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin.

SELECT username, email FROM users
JOIN posts ON users.user_id = posts.user_id
WHERE posts.post_id = 47;



-- 13. Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun.

SELECT * FROM posts
WHERE title LIKE '%morbi%' OR content LIKE '%morbi%';



-- 14. Belirli bir kullanıcının en son yorumunu gösterin.

SELECT users.username, comments.creation_date, comments.comment FROM users
JOIN comments ON comments.user_id = users.user_id
WHERE users.user_id = 7
ORDER BY creation_date DESC
LIMIT 1;



-- 15. Gönderi başına ortalama yorum sayısını bulun.


SELECT AVG(totalComment) FROM (
SELECT post_id, COUNT(comments.comment_id) AS totalComment FROM comments
GROUP BY post_id) AS avgComment;



-- 16. Son 30 günde yayınlanan gönderileri gösterin.

SELECT * FROM posts
WHERE creation_date >= '2023-05-17';



-- 17. Belirli bir kullanıcının yaptığı yorumları alın.

SELECT comment FROM comments
WHERE user_id = 7;



-- 18. Belirli bir kategoriye ait tüm gönderileri bulun.

SELECT * FROM posts
WHERE category_id = 1;



-- 19. 5'ten az yazıya sahip kategorileri bulun.

SELECT categories.name FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.name
HAVING COUNT(posts.post_id) < 5; 



-- 20. Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin.

SELECT username FROM users
WHERE(SELECT COUNT(*) FROM posts
WHERE users.user_id = posts.user_id) = 1 
AND (SELECT COUNT(*) FROM comments
WHERE comments.user_id = comments.user_id) = 1;



-- 21. En az 2 farklı yazıya yorum yapmış kullanıcıları alın.

SELECT * FROM users
WHERE (SELECT COUNT(post_id) FROM comments
WHERE users.user_id = comments.user_id) >= 2;



-- 22. En az 3 yazıya sahip kategorileri görüntüleyin.

SELECT * FROM categories
WHERE (SELECT COUNT(post_id) FROM posts
WHERE categories.category_id = posts.category_id) >= 3;




-- 23. 5'ten fazla blog yazısı yazan yazarları bulun.

SELECT users.username FROM users
WHERE (SELECT COUNT(*) FROM posts
WHERE users.user_id = posts.user_id) > 5;



-- 24. Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)


SELECT users.email FROM users
WHERE (SELECT COUNT(post_id) FROM posts WHERE posts.user_id = users.user_id) = 1
UNION
SELECT users.email FROM users
WHERE (SELECT COUNT(comment_id) FROM comments WHERE comments.user_id = users.user_id) = 1;



-- 25. Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun.

SELECT users.username FROM users
WHERE (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.user_id) = 1
AND
(SELECT COUNT(*) FROM comments WHERE comments.user_id = users.user_id) = 0;
	







