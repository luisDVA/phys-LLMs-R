library(ellmer) # [github::tidyverse/ellmer] v0.3.2.9000
library(readr)  # Posit RSPM v2.1.5

visitors <- read_tsv("session2files/visitorbook.tsv")
visitors

# available models
models_openai()
chatExtract <- chat_openai(model="gpt-4o-mini",
                     system_prompt = "Extract city or country")


parallel_chat_structured(chatExtract, # the chat object
                         list(visitors$location), # out input as a list
                         type=type_string()) # desired output

# try extracting city AND country

