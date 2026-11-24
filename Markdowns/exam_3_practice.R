data('Groceries', package = 'arules')

arules::summary(Groceries)
arules::itemFrequency(Groceries) |> sort(decreasing = TRUE) |> head(10)

grocery_rules = arules::apriori(
  Groceries, parameter = list(
    support = 0.01, confidence = 0.5, minlen = 2)  )

arules::summary(grocery_rules)
arules::sort(grocery_rules, by = 'count', decreasing = TRUE)[1:3] |> arules::inspect()



data('Groceries', package = 'arules')

item_freq = arules::itemFrequency(Groceries)   # the support of every item, in the data's own order (not sorted)
item_freq |> sort(decreasing = TRUE) |> head(10)

yogurt_support = item_freq['yogurt']
yogurt_support

tropical_rank = which(names(sort(item_freq, decreasing = TRUE)) == 'tropical fruit')
tropical_rank
