# Music Trends
## Overview
For this project I used PostgreSQL to analyze trends and draw insights from a Kaggle [dataset](https://www.kaggle.com/datasets/nelgiriyewithana/top-spotify-songs-2023?resource=download) on 2023's hottest Spotify hits. I answered 21 questions about music trends by working with variables such as streams and energy, examining the correlation between variables, and creating views and inner joins to understand overlap.

To view the code and direct results, use the trends.sql file.

## Key Insights
*In this section I will highlight the main insights derived from my analysis of 2023's hottest Spotify hits.*
- Top 3 highest streamed songs on Spotify: Blinding Lights by The Weeknd, Shape of You by Ed Sheeran, and Someone You Loved by Lewis Capaldi.
- Average number of streams per song: 535,432,384.40
- 37 songs reached number one on the Spotify, Apple Music, Deezer, and Shazam charts
- Most songs were released on the 1st of the month
- Quarter 1 and Quarter 2 (the top two for number of songs released) had a very similar number of songs released
  - They also contain the months with the highest numbers of songs released (January and May) 

## Q&A
**1) Which tracks have the most streams?**

    Blinding Lights by The Weeknd, Shape of You by Ed Sheeran, and Someone You Loved by Lewis Capaldi.
  
   
**2) Do certain artists have a pattern of BPM? (Taylor Swift)**

    The BPM in her songs vary but have a range of 126 BPM.


**3) Which songs have the highest BPMs?**

    Lover, We Don't Talk About Bruno, and Last Night have the highest BPMs.
    

**4) What is the average number of streams per song?**

    535,432,384.40 streams is the average number of streams per song.


**5) What is the relationship between bpm and danceability?**

    As BPM increases, danceability fluctauates.


**6) Do songs on more playlists have higher streams on Spotify?**

    Overall, yes, songs on more playlists have higher streams on Spotify.
![streams visual](https://github.com/vedarc/Music-Trends/assets/162649750/db7555b7-6de9-42e4-8806-935d6d572813)


**7) Does having more artists contributing lead to higher energy?**

    They seem unrelated- as artist count increases, energy fluctuates.


**8) Does positive content lead to more streams?**

     They seem unrelated- as positivity (valence) increases, the number of streams varies.


**9) Does danceability correlate to more streams?**

    They seem unrelated- as danceability increases, number of streams varies.


**10) How does speechiness (amount of words spoken) impact streams?**

    They seem unrelated- as speechiness increases, number of streams varies.


**11) Does the danceability/energy of a song correlate to positivity?**

    There seems to be a very low correlation, as there is a slight upward trend for both danceability and energy as positivity
    increases. (See graphs below, both with Positivity on the X-axis and variable on the Y-axis.)
    
  ![dv](https://github.com/vedarc/Music-Trends/assets/162649750/ea0a1c76-ba8b-4abe-bc8b-c4477e0b5bd8)
  ![de](https://github.com/vedarc/Music-Trends/assets/162649750/392dc3fb-c852-45e5-a6e9-f9956093a028)



**12) Are more popular songs newer?**

    Only Spotify and Apple Music: The most popular songs are mainly from 2022, and almost all of them are from 2019 or earlier
    (the past 5 years).
    
    On Spotify, Apple Music, Shazam, and Deezer: The most popular songs are mainly from 2022, and almost all of them are from 2021
    or earlier (the past 3 years).


**13) Which songs (and how many) reached number one on all four platforms?**

    37 songs reached number 1 on Spotify, Apple Music, Shazam, and Deezer.


**14) Which tracks/artists are on the most playlists (Apple Music and Spotify)?**

    Get Lucky - Radio Edit, Mr. Brightside, Wake Me Up - Radio Edit, and Smells Like Teen Spirit -
    Remastered 2021 are the top 4 tracks on the most Spotify and Apple Music playlists as well as the only
    tracks on more than 50,000 playlists.
    
    The Weeknd, Ed Sheeran, and Taylor Swift are the artists on the most playlists (each on over 125,000).


**15) Do certain artists have more speechiness?**

    Kendrick Lamar, Taylor Swift, and Drake/21 Savage have the most speechiness.


**16) Are more songs major or minor?**

    More songs are major than minor (Major: 498 songs, Minor: 349 songs)


**17) Which day of the month are songs typically released?**

    Most songs were released on the 1st of the month, more than double the amount released on the next highest day, the 21st.


**18) Is there a pattern in BPMs of the most popular songs?**

    They seem unrelated- as popularity (on all charts) increases, BPM varies.


**19) Are song releases seasonal?**

    Quarter released: Quarter 1 and Quarter 2 (the top two) had a very similar number of songs released.
![qview](https://github.com/vedarc/Music-Trends/assets/162649750/3b8a162d-b241-4aec-a57b-08d1045e996c)

    Month released: January and May had the highest number of songs released which is evident in the higher number of songs
    released during Q1 and Q2.



**20) Which collaborations between artists have been most successful in terms of chart performance?**

    Savior by Kendrick Lamar, Sam Dew, & Baby Keem and BABY OTAKU by Fran C, Polima WestCoast, Nickoog Clk, Pablito Pesadilla
    were the two most successful collaborations between artists.


**21) Which songs went #1 on Spotify and Apple Music?**

    481 songs went #1 on Spotify and Apple Music- see SQL file for full list.
