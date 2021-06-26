library(dplyr)
library(tidytext)

textstored <- c("Today is a great day. It is a Saturday!",
          "First I will have a big breakfast.",
          "After breakfast, I think that I will go running and swimming!",
          "I love swimming!")


text_df1 <- data_frame(line = 1:4, text=textstored)


words_df <- text_df1 %>% 
  unnest_tokens(word, text)

words_df


words_df <- anti_join(words_df, stop_words)


words_df %>%
  dplyr::count(word, sort = TRUE)

library(ggplot2)

words_df %>%
  count(word, sort = TRUE) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

install.packages('textdata')

library(textdata)

joyd <- get_sentiments("nrc") %>%
  filter(sentiment=="joy")

words_df %>%
  inner_join(joyd) %>%
  count(word, sort = TRUE)

install.packages('wordcloud')
library(wordcloud)

words_df %>%
  count(word) %>%
  with(wordcloud(word, n))


#####################################################


textstored2 <- c("Today is a great day. It is a Saturday!",
                "First I will have a big breakfast.",
                "After breakfast, I think that I will go running and swimming!",
                "I love swimming!")


text_df2 <- data_frame(line = 1:4, text=textstored2)


words_df2 <- text_df2 %>% 
  unnest_tokens(bigram, text, token = "ngrams", n=2)

words_df2

words_df2 %>%
  count(bigram, sort = TRUE)
