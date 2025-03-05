library(tidyverse)
library(glue)

procedures = read_csv("query_tool_export_2025-03-05_124414.csv")

branching_glue = '[op_procedure_1] = "{record}" or'

procedures %>% 
  filter(str_detect(value, "Other")) %>% 
  mutate(logic = glue(branching_glue)) %>% 
  pull(logic) %>% 
  paste(collapse = "\n") %>% 
  write_file("brancing_other_procedures.txt")
