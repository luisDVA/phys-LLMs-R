# https://console.groq.com/docs/models
library(ellmer)
chatGrDemo <- chat_groq(model = "meta-llama/llama-4-maverick-17b-128e-instruct")

chatGrDemo$chat("list three interesting facts about Gaborone")
chatGrDemo$chat("summarize each of the facts")

