skills = arules::read.transactions(   # Job Scout skills: one posting = one basket
  'https://raw.githubusercontent.com/fmegahed/isa401/main/data/class25_job_skills_2026-11-15.csv',
  format = 'single', sep = ',', header = TRUE, cols = c('posting_id', 'skill'))

arules::summary(skills)

arules::itemFrequency(skills) # returns frequency in alphabetic order
arules::itemFrequency(skills) |> sort(decreasing = TRUE)

arules::itemFrequencyPlot(skills, support = 0.1) # minimum support; sorts by ascending name
arules::itemFrequencyPlot(skills, topN = 20) # sorts by descending support
arules::itemFrequencyPlot(skills, topN = 20, support = 0.2) # sorts by descending support; top 20 and minimum support

# mine association rules with a certain min support and confidence
skill_rules = arules::apriori(
  skills, parameter = list(
    support = 0.2, confidence = 0.5, minlen = 2, maxlen = 5)  )

arules::summary(skill_rules)
arules::inspect(skill_rules)

arules::sort(skill_rules, by = 'lift', decreasing = TRUE)[1:3] |> arules::inspect()

# internal to arulesViz, hence the :::
arulesViz:::plot.rules(skill_rules,
                       measure = c('support', 'lift'),
                       shading = 'confidence')


item_freq = arules::itemFrequency(skills)
round(item_freq["excel"],3)

arules::itemFrequency(skills)["excel"]
