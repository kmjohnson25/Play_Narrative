---
# Compare Gestures within specific dataframe (ex: P#_H8)
  
# Load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)
library(knitr)

# Ex: P3_H8
## Children with Brain Injuries during Home Visit 8

## Import and Clean Dataset
P3_H8_ALL <- read.csv('~/KristenWorkingDirectory/Play_Narrative/PN_Datasets/Pretend Play/CSVs_of_Combined_Data_PP/P3_H8_ALL.csv')

# makes all c_form entries lower case
P3_H8_ALL$c_form <- tolower(P3_H8_ALL$c_form)

## Child Gesture and Pretend Play overlap:
# Filter for rows where c_pret is 1, then count occurrences of c-form
PP_gest_overlap <- P3_H8_ALL %>%
  filter(c_pret == 1 & !is.na(c_form)) # Only keep rows where c_pret is 1 and c_form has any value

## Child Gesture Pretend Play overlap by individual:
# Generate summary statistics for the count column 'n'
cooccurance1 <- PP_gest_overlap %>%
  group_by(participant_id) %>%
  summarise(
    PP_gest_overlap_individual = n()
  )

## Child Utterance and Pretend Play overlap:
# Filter for rows where c_pret is 1, then count occurrences of c_utt
PP_utts_overlap <- P3_H8_ALL %>%
  filter(c_pret == 1 & !is.na(c_utts)) # Only keep rows where c_pret is 1 and c_utt has any value

## Child Utterance and Pretend Play overlap by individual:
cooccurance2 <- PP_utts_overlap %>%
  group_by(participant_id) %>%
  summarise(
    PP_utts_overlap_individual = n()
  )

## Merged PP_Gesture and PP_Utterance subsets
PP_utts_gest_overlap <- full_join(cooccurance1, cooccurance2, by = "participant_id")

## Representational (Iconic or Metaphoric or Demo) Gesture and Pretend Play overlap:
# Filter for rows where c_pret is 1, then count occurrences of c-form
PP_gest_rep_overlap <- P3_H8_ALL %>%
  filter(c_pret == 1 & 
           str_detect(c_form,"iconic|iconic - flip|point - iconic|metaphoric|demo"))

## Representational (Iconic or Metaphoric or Demo) Gesture and Pretend Play overlap by individual:
# Generate summary statistics for the count column 'n'
cooccurance4 <- PP_gest_rep_overlap %>%
  group_by(participant_id) %>%
  summarise(
    PP_gest_rep_overlap_individual = n()
  )

## Iconic Gesture and Pretend Play overlap:
# Filter for rows where c_pret is 1, then count occurrences of c-form
PP_gest_icon_overlap <- P3_H8_ALL %>%
  filter(c_pret == 1 & 
           str_detect(c_form,"iconic|iconic - flip|point - iconic")) # be sure to adjust specific words for each new dataset

## Iconic Gesture and Pretend Play overlap by individual:
# Generate summary statistics for the count column 'n'
cooccurance3 <- PP_gest_icon_overlap %>%
  group_by(participant_id) %>%
  summarise(
    PP_gest_icon_overlap_individual = n()
  )

## Table of ALL Gesture, Utterance, and Representative Gesture:
PP_utts_gest_rep_overlap <- full_join(PP_utts_gest_overlap, cooccurance4, by = "participant_id")

## Reshaped ALL Gesture, Utterance, and Representative Gesture Data for Plotting
# Convert wide format to long format
long_data_rep <- PP_utts_gest_rep_overlap %>%
  pivot_longer(
    cols = -participant_id, # Convert all except participant_id
    names_to = "Category", 
    values_to = "Count"
  )

# Rename categories for better visualization
long_data_rep$Category <- recode(long_data_rep$Category, 
                                 PP_gest_overlap_individual = "All Gestures",
                                 PP_utts_overlap_individual = "Utterances",
                                 PP_gest_rep_overlap_individual = "Representational Gestures")

## Bar graph of All Gesture, Utterance, and Iconic Gesture data:
ggplot(long_data_rep, aes(x = factor(participant_id), y = Count, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(
    title = " Utterances, Gestures, and Representational Gestures during Pretend Play per Participant",
    x = "Participant ID",
    y = "Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels
  scale_fill_manual(values = c("All Gestures" = "steelblue", 
                               "Utterances" = "tomato", 
                               "Representational Gestures" = "#FFFF33"))  # Customize colors

## Table of ALL Gesture, Utterance, and Iconic Gesture:
PP_utts_gest_icon_overlap <- full_join(PP_utts_gest_overlap, cooccurance3, by = "participant_id")

## Reshaped ALL Gesture, Utterance, and Iconic Gesture data for plotting  
# Convert wide format to long format
long_data_icon <- PP_utts_gest_icon_overlap %>%
  pivot_longer(
    cols = -participant_id, # Convert all except participant_id
    names_to = "Category", 
    values_to = "Count"
  )

# Rename categories for better visualization
long_data_icon$Category <- recode(long_data_icon$Category, 
                                  PP_gest_overlap_individual = "All Gestures",
                                  PP_utts_overlap_individual = "Utterances",
                                  PP_gest_icon_overlap_individual = "Iconic Gestures")

## Bar graph of ALL Gesture, Utterance, and Iconic Gesture data:
ggplot(long_data_icon, aes(x = factor(participant_id), y = Count, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(
    title = " Utterances, Gestures, and Iconic Gestures during Pretend Play per Participant",
    x = "Participant ID",
    y = "Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels
  scale_fill_manual(values = c("All Gestures" = "steelblue", 
                               "Utterances" = "tomato", 
                               "Iconic Gestures" = "seagreen"))  # Customize colors

## Bar graph of All Gestures and Iconic Gestures data
# Filter out Utterances and keep only Gestures and Iconic Gestures
long_data_icon_filtered <- long_data_icon %>%
  filter(Category %in% c("All Gestures", "Iconic Gestures"))

# Create the grouped bar chart
ggplot(long_data_icon_filtered, aes(x = factor(participant_id), y = Count, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(
    title = "ALL Gestures compared to Iconic Gestures per Participant",
    x = "Participant ID",
    y = "Count",
    fill = "Category"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  
  scale_fill_manual(values = c("All Gestures" = "steelblue", 
                               "Iconic Gestures" = "seagreen"))  # Customize colors

## Bar graph of All Gestures and Representational Gestures data
# Filter out Utterances and keep only Gestures and Representational Gestures
long_data_rep_filtered <- long_data_rep %>%
  filter(Category %in% c("All Gestures", "Representational Gestures"))

# Create the grouped bar chart
ggplot(long_data_rep_filtered, aes(x = factor(participant_id), y = Count, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(
    title = "ALL Gestures compared to Representational Gestures per Participant",
    x = "Participant ID",
    y = "Count",
    fill = "Category"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  
  scale_fill_manual(values = c("All Gestures" = "steelblue", 
                               "Representational Gestures" = "#FFFF33"))  # Customize colors
