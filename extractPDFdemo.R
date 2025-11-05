# this code draws on a post by Dr. Chris Brown at UTAS
# https://www.seascapemodels.org/rstats/2025/03/15/LMs-in-R-with-ellmer.html

library(ellmer)
library(purrr)

chatdemo <- chat_google_gemini(system_prompt = "an assistant that can extract structured data from scientific papers")
  
mybatfile <- content_pdf_file("macrotus.pdf")
mybatfile2 <- content_pdf_file("stenoderma.pdf")

of_interest <- 
  type_object(
  scientific_name = type_string("focal species of the document"),
  forearm_length = type_number("length in milimeters of the bat's forearm"),
  forearm_length_max =type_number("length in milimeters of the bat's max value for forearm"),
  forearm_length_min =type_number("length in milimeters of the bat's minimum value for forearm"),
  ear_length = type_number("length in milimeters of the bat's forearm"),
  body_mass =  type_number("weight in grams for the species")
)


bat_info <- chatdemo$chat_structured(mybatfile2, type= of_interest)
bat_info

chatdemo$chat("how to clear the chat context?")
get_measurements <- function(filepath,chat){
  chatdemo$chat_structured(content_pdf_file(filepath), type= of_interest) |> as.data.frame()
}


chatdemo$last_turn()

out <- purrr::map(c("stenoderma.pdf","macrotus.pdf"),get_measurements)
out
list_rbind(out)
