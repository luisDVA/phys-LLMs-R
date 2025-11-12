# this code draws on a post by Dr. Chris Brown at UTAS
# https://www.seascapemodels.org/rstats/2025/03/15/LMs-in-R-with-ellmer.html

library(ellmer) # [github::tidyverse/ellmer] v0.3.2.9000
library(purrr)  # CRAN v1.1.0

# 

chatpdfs <- chat_openai(model = "gpt-4.1-mini",
  system_prompt = "extract data from scientific papers")
  
# Prepare and encode PDF for chat input
mybatfile <- content_pdf_file("session2files/stenoderma.pdf")

of_interest <- 
  type_object(
  scientific_name = type_string("focal species of the document"),
  forearm_length = type_number("length in milimeters of the bat's forearm"),
  forearm_length_max =type_number("length in milimeters of the bat's max value for forearm"),
  forearm_length_min =type_number("length in milimeters of the bat's minimum value for forearm"),
  ear_length = type_number("length in milimeters of the bat's forearm"),
  body_mass =  type_number("weight in grams for the species")
)

bat_info <- chatpdfs$chat_structured(mybatfile, type= of_interest)
bat_info

