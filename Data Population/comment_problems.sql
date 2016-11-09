--this is the table that user comment earlier than game;
      1 |      3
      1 |     11
      1 |     12
      1 |     13
      2 |      3
      2 |      6
      2 |      7
      2 |     12
      2 |     13
      3 |      3
      3 |      5
      3 |      6
      3 |      7
      3 |      9
      3 |     11
      4 |      7
      4 |      9
      4 |     11
      5 |     12
      5 |      3
      5 |      7
      5 |      9
      6 |      4
      6 |     13
      6 |      9
      8 |      7
      9 |      4

-- to correct this mistake I infill SQL to let what ever comment ealier than game set to be commented at the time 11 days 5 hours later than the game
update comment_written_about set commenttime=g.gametime +'11 days 5 hours' from game as g where comment_written_about.gameid=g.gameid and comment_written_about.commenttime<=g.gametime;
-- run this query to assure
select c.commentid from comment_written_about c, game g where c.gameid=g.gameid and c.commenttime<=g.gametime;
--There's none. So it's good.
