# Simple wordcloud with R
# After http://georeferenced.wordpress.com/2013/01/15/rwordcloud/

# Remember common error: curly "" wont work

# Load everything in given directory into corpus
corpus <- Corpus (DirSource("xxx/"))

# Inspect corpus
#inspect(romeo)

# Strip whitespace
corpus <- tm_map(corpus, stripWhitespace)

# All to lowe characters
corpus <- tm_map(corpus, tolower)

# Remove Stopwords
corpus <- tm_map(corpus, removeWords, stopwords(“english”))

# Document stemming (reduce verbs etc. to stems)
corpus <- tm_map(corpus, stemDocument)

# Avoid "Error in inherits(doc, "TextDocument")" error due to tm 6.0 (worked fine with 5.2)
# See http://stackoverflow.com/questions/24191728/documenttermmatrix-error-on-corpus-argument
corpus <- tm_map(corpus, PlainTextDocument)

# Generate wordcloud
wordcloud(corpus, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE,
          colors=brewer.pal(8, “Dark2″))

# Remove individual words
lords <- tm_map(corpus, removeWords, "thy")

# Remove a list of words
lords <- tm_map(corpus, removeWords, c("thou", "thee"))

