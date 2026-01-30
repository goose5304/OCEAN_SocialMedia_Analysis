#**********************************
# Stat 182 T3L Group 5 Project R Script
# Dumago, Ezekiel Eduard
# Sabado, Krisha Lei
# Simbulan, Angus Dylan
#**********************************

#-------------- Data Cleaning for PersonalityResponses.xlsx -------------------
rm(list=ls())
library(readxl)
PersonalityResponses <- read_excel("D:\\ANGUS\\Downloads\\PersonalityResponses.xlsx")
PersonalityResponses <-  na.omit(PersonalityResponses)

O_cols <- c(5, 10, 15, 20, 25, 30, 35, 40, 41, 44) + 1
c_cols <-  c(3, 8, 13, 18, 23, 28, 33, 38, 43) + 1
e_cols <- c(1, 6, 11, 16, 21, 26, 31, 36) + 1
a_cols <- c(2, 7, 12, 17, 22, 27, 32, 42) + 1
n_cols <- c(4, 9, 14, 19, 24, 29, 34, 39) + 1
R <- c(6, 21, 31, 2, 12, 27, 37, 8, 18, 23, 43, 9, 24, 34, 35, 41) + 1

for (i in 2:45){
  PersonalityResponses[[i]] <- ifelse(PersonalityResponses[[i]] == "Disagree Strongly", "1", PersonalityResponses[[i]])
  PersonalityResponses[[i]] <- ifelse(PersonalityResponses[[i]] == "Disagree a little", "2", PersonalityResponses[[i]])
  PersonalityResponses[[i]] <- ifelse(PersonalityResponses[[i]] == "Neither Agree nor Disagree", "3", PersonalityResponses[[i]])
  PersonalityResponses[[i]] <- ifelse(PersonalityResponses[[i]] == "Agree A Little", "4", PersonalityResponses[[i]])
  PersonalityResponses[[i]] <- ifelse(PersonalityResponses[[i]] == "Agree Strongly", "5", PersonalityResponses[[i]])

  PersonalityResponses[[i]] <- as.numeric(PersonalityResponses[[i]])
}

PersonalityResponses[,R] <- 6 - PersonalityResponses[,R]

finaldataset <- data.frame(ID=PersonalityResponses$ID)
colnames(finaldataset)[1] <- "StudentID"
finaldataset$openness <- rowMeans(PersonalityResponses[, O_cols])
finaldataset$conscientiousness <- rowMeans(PersonalityResponses[, c_cols])
finaldataset$extraversion <- rowMeans(PersonalityResponses[, e_cols])
finaldataset$agreeableness <- rowMeans(PersonalityResponses[, a_cols])
finaldataset$neuroticism <- rowMeans(PersonalityResponses[, n_cols])

#-------------- Data Cleaning for QuestionnaireResponses.xlsx -------------------

QuestionnaireResponses <- read_excel("D:\\ANGUS\\Downloads\\QuestionnaireResponses.xlsx", sheet = "Questionnaire 3")

#Filter out questionnaire to to group questions
group_questions <- QuestionnaireResponses[, c(1, 46:50)]

#merge the two datasets: summary & group_questions
finaldataset <-  merge(group_questions, finaldataset, by="StudentID")
finaldataset <-  na.omit(finaldataset)
View(finaldataset)

#AGREEABLENESS

# frequency table of responses
table(finaldataset$`How much do you agree with this statement: "I often engage in online discussions to help solve specific problems"`)
# median calculation per group
ab <- aggregate(finaldataset$openness ~ finaldataset$`How much do you agree with this statement: "I often engage in online discussions to help solve specific problems"`, FUN = median)
colnames(ab) <- c("Response", "Median Agreeableness Score")
View(ab)

# Scatterplot with labels
bo <- plot(finaldataset$`How much do you agree with this statement: "I often engage in online discussions to help solve specific problems"`,
           finaldataset$agreeableness,
           xlab = "Response",
           ylab = "Agreeableness Rating",
           main = "Scatterplot on Question Response vs Agreeableness Rating",
           col = "#118ab2",
           pch = 16)

bp1 <- boxplot(finaldataset$agreeableness ~ finaldataset$`How much do you agree with this statement: "I often engage in online discussions to help solve specific problems"`,
               data = finaldataset,
               xlab = "Response",
               ylab = "Agreeableness Rating",
               main = "Boxplot on Response and Median Rating",
               col = "#118ab2"
)

#statistical analysis (non-parametric test for k-pop independent)
kruskal.test(finaldataset$agreeableness ~ finaldataset$`How much do you agree with this statement: "I often engage in online discussions to help solve specific problems"`)

#OPENNESS

# frequency table of responses
table(finaldataset$`Which of these social media platforms do you mostly browse for news and online discussions?`)

# median calculation
ag <- aggregate(finaldataset$openness ~ finaldataset$`Which of these social media platforms do you mostly browse for news and online discussions?`, FUN = median)
colnames(ag) <- c("Social Media Platform", "Median Openness Rating")
View(ag)

#Get the counts
agc <- aggregate(finaldataset$openness ~ finaldataset$`Which of these social media platforms do you mostly browse for news and online discussions?`, FUN = length)
values <- agc$'finaldataset$openness'

#Platform Labels
platforms <- c("Facebook", "Reddit", "Tiktok", "X (Formerly Twitter)")

#Compute for the percentages
percentages <- round(values/sum(values)*100, 3)
#Format the labels
labels_with_percent <- paste(platforms, "-", percentages, "%")


# Pie Graph with labels
pg <- pie(agc$'finaldataset$openness',
          labels=labels_with_percent,
          main = "Piegraph for the Platforms Mostly Used to Browse News and Online Discussions",
          init.angle = 90,
          col = c("#118ab2", "#ffd166","#06d6a0", "#ef476f")
)


# Boxplot with labels
bp <- boxplot(finaldataset$openness ~ finaldataset$`Which of these social media platforms do you mostly browse for news and online discussions?`,
              data = finaldataset,
              xlab = "Response",
              ylab = "Openness Rating",
              main = "Boxplot on Response and Median Rating",
              col = "#ef476f"
)


# statistical analysis (non-parametric hypothesis test for k-pop)
kruskal.test(finaldataset$openness ~ finaldataset$`Which of these social media platforms do you mostly browse for news and online discussions?`)