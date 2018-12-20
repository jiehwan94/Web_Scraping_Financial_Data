library(quantmod)
library(magrittr)
library(stringr)
library(RCurl)
library(jsonlite)

# a<- 0

metric_df <- data.frame()

df <- read.csv(file="C:\\Users\\USER\\Documents\\RProject\\주식분석\\No_WhiteSpace_NASDAQ_companylist.csv", header=TRUE, sep=",")
head(df)

tickers <- df$df.Symbol
new_tickers<- as.character(tickers)

length(new_tickers)
head(new_tickers)
class(new_tickers)

Sys.time()
cnt<- 1

for (i in new_tickers[2415:length(new_tickers)]) {
  
  json_url <- paste("https://query2.finance.yahoo.com/v10/finance/quoteSummary/", i, "?modules=recommendationTrend%2CearningsTrend%2CindexTrend%2CdefaultKeyStatistics%2CFinancialData%2CincomeStatementHistoryQuarterly%2CbalanceSheetHistoryQuarterly%2CcashflowStatementHistoryQuarterly%2CCashflowStatementHistory%2CBalanceSheetHistory%2CincomeStatementHistory", sep = '')
  json_object <- getURL(json_url)
  quote_summary <- fromJSON(json_object) %>% unlist()
  
  # defaultKeyStatistics FROM HERE
  
  # profit_margins,
  # forwardPE,
  # sharesOutstanding,
  # sharesShort,
  # sharesShortPriorMonth,
  # heldPercentInsiders,
  # heldPercentInstitutions,
  # shortRatio,
  # shortPercentOfFloat,
  # beta,
  # morningStarOverallRating,
  # morningStarRiskRating,
  # bookValue,
  # priceToBook,
  # annualReportExpenseRatio,
  # ytdReturn,
  # beta3Year,
  # totalAssets,
  # yield,
  # threeYearAverageReturn,
  # fiveYearAverageReturn,
  # priceToSalesTrailing12Months,
  # mostRecentQuarter,
  # earningsQuarterlyGrowth,
  # revenueQuarterlyGrowth,
  # netIncomeToCommon,
  # trailingEps,
  # forwardEps,
  # pegRatio,
  # '52WeekChange',
  # SandP52WeekChange,
  # lastDividendValue,
  # lastCapGain,
  # annualHoldingsTurnover
  
  
  profit_margins <- quote_summary["quoteSummary.result.defaultKeyStatistics.profitMargins.raw"] %>% unname() %>% as.numeric()
  forwardPE <- quote_summary["quoteSummary.result.defaultKeyStatistics.forwardPE.raw"] %>% unname() %>% as.numeric()
  sharesOutstanding <- quote_summary["quoteSummary.result.defaultKeyStatistics.sharesOutstanding.raw"] %>% unname() %>% as.numeric()
  sharesShort <- quote_summary["quoteSummary.result.defaultKeyStatistics.sharesShort.raw"] %>% unname() %>% as.numeric()
  sharesShortPriorMonth <- quote_summary["quoteSummary.result.defaultKeyStatistics.sharesShortPriorMonth.raw"] %>% unname() %>% as.numeric()
  heldPercentInsiders <- quote_summary["quoteSummary.result.defaultKeyStatistics.heldPercentInsiders.raw"] %>% unname() %>% as.numeric()
  heldPercentInstitutions <- quote_summary["quoteSummary.result.defaultKeyStatistics.heldPercentInstitutions.raw"] %>% unname() %>% as.numeric()
  shortRatio <- quote_summary["quoteSummary.result.defaultKeyStatistics.shortRatio.raw"] %>% unname() %>% as.numeric()
  shortPercentOfFloat <- quote_summary["quoteSummary.result.defaultKeyStatistics.shortPercentOfFloat.raw"] %>% unname() %>% as.numeric()
  beta <- quote_summary["quoteSummary.result.defaultKeyStatistics.beta.raw"] %>% unname() %>% as.numeric()
  #morningStarOverallRating <- quote_summary["quoteSummary.result.defaultKeyStatistics.morningStarOverallRating.raw"] %>% unname() %>% as.numeric()
  #morningStarRiskRating <- quote_summary["quoteSummary.result.defaultKeyStatistics.morningStarRiskRating.raw"] %>% unname() %>% as.numeric()
  bookValue <- quote_summary["quoteSummary.result.defaultKeyStatistics.bookValue.raw"] %>% unname() %>% as.numeric()
  priceToBook <- quote_summary["quoteSummary.result.defaultKeyStatistics.priceToBook.raw"] %>% unname() %>% as.numeric()
  #annualReportExpenseRatio <- quote_summary["quoteSummary.result.defaultKeyStatistics.annualReportExpenseRatio.raw"] %>% unname() %>% as.numeric()
  ytdReturn <- quote_summary["quoteSummary.result.defaultKeyStatistics.ytdReturn.raw"] %>% unname() %>% as.numeric()
  beta3Year <- quote_summary["quoteSummary.result.defaultKeyStatistics.beta3Year.raw"] %>% unname() %>% as.numeric()
  totalAssets <- quote_summary["quoteSummary.result.defaultKeyStatistics.totalAssets.raw"] %>% unname() %>% as.numeric()
  yield <- quote_summary["quoteSummary.result.defaultKeyStatistics.yield.raw"] %>% unname() %>% as.numeric()
  #threeYearAverageReturn <- quote_summary["quoteSummary.result.defaultKeyStatistics.threeYearAverageReturn.raw"] %>% unname() %>% as.numeric()
  #fiveYearAverageReturn <- quote_summary["quoteSummary.result.defaultKeyStatistics.fiveYearAverageReturn.raw"] %>% unname() %>% as.numeric()
  #priceToSalesTrailing12Months <- quote_summary["quoteSummary.result.defaultKeyStatistics.priceToSalesTrailing12Months.raw"] %>% unname() %>% as.numeric()
  mostRecentQuarter <- quote_summary["quoteSummary.result.defaultKeyStatistics.mostRecentQuarter.raw"] %>% unname() %>% as.numeric()
  earningsQuarterlyGrowth <- quote_summary["quoteSummary.result.defaultKeyStatistics.earningsQuarterlyGrowth.raw"] %>% unname() %>% as.numeric()
  #revenueQuarterlyGrowth <- quote_summary["quoteSummary.result.defaultKeyStatistics.revenueQuarterlyGrowth.raw"] %>% unname() %>% as.numeric()
  netIncomeToCommon <- quote_summary["quoteSummary.result.defaultKeyStatistics.netIncomeToCommon.raw"] %>% unname() %>% as.numeric()
  trailingEps <- quote_summary["quoteSummary.result.defaultKeyStatistics.trailingEps.raw"] %>% unname() %>% as.numeric()
  forwardEps <- quote_summary["quoteSummary.result.defaultKeyStatistics.forwardEps.raw"] %>% unname() %>% as.numeric()
  pegRatio <- quote_summary["quoteSummary.result.defaultKeyStatistics.pegRatio.raw"] %>% unname() %>% as.numeric()
  enterpriseValue <- quote_summary["quoteSummary.result.defaultKeyStatistics.enterpriseValue.raw"] %>% unname() %>% as.numeric()
  enterpriseToRevenue <- quote_summary["quoteSummary.result.defaultKeyStatistics.enterpriseToRevenue.raw"] %>% unname() %>% as.numeric()
  enterpriseToEbitda <-quote_summary["quoteSummary.result.defaultKeyStatistics.enterpriseToEbitda.raw"] %>% unname() %>% as.numeric()
  YearChange <- quote_summary["quoteSummary.result.defaultKeyStatistics.profitMargins.raw"] %>% unname() %>% as.numeric()
  SandP52WeekChange <- quote_summary["quoteSummary.result.defaultKeyStatistics.SandP52WeekChange.raw"] %>% unname() %>% as.numeric()
  #lastDividendValue <- quote_summary["quoteSummary.result.defaultKeyStatistics.lastDividendValue.raw"] %>% unname() %>% as.numeric()
  #lastCapGain <- quote_summary["quoteSummary.result.defaultKeyStatistics.lastCapGain.raw"] %>% unname() %>% as.numeric()
  #annualHoldingsTurnover <- quote_summary["quoteSummary.result.defaultKeyStatistics.profitMarginsannualHoldingsTurnover.raw"] %>% unname() %>% as.numeric()
  
  # FinancialData FROM HERE
  
  # currentPrice,
  # targetHighPrice,
  # targetLowPrice,
  # targetMeanPrice,
  # targetMedianPrice,
  # recommendationMean,
  # recommendationKey,
  # numberOfAnalystOpinions,
  # totalCash,
  # totalCashPerShare,
  # ebitda,
  # totalDebt,
  # quickRatio,
  # currentRatio,
  # totalRevenue,
  # debtToEquity,
  # revenuePerShare,
  # returnOnAssets,
  # returnOnEquity,
  # returnOnEquity,
  # grossProfits,
  # freeCashflow,
  # operatingCashflow,
  # earningsGrowth,
  # revenueGrowth,
  # grossMargins,
  # ebitdaMargins,
  # operatingMargins,
  
  
  
  currentPrice <- quote_summary["quoteSummary.result.financialData.currentPrice.raw"] %>% unname() %>% as.numeric()
  targetHighPrice <- quote_summary["quoteSummary.result.financialData.targetHighPrice.raw"] %>% unname() %>% as.numeric()
  targetLowPrice <- quote_summary["quoteSummary.result.financialData.targetLowPrice.raw"] %>% unname() %>% as.numeric()
  targetMeanPrice <- quote_summary["quoteSummary.result.financialData.targetMeanPrice.raw"] %>% unname() %>% as.numeric()
  targetMedianPrice <- quote_summary["quoteSummary.result.financialData.targetMedianPrice.raw"] %>% unname() %>% as.numeric()
  recommendationMean <- quote_summary["quoteSummary.result.financialData.recommendationMean.raw"] %>% unname() %>% as.numeric()
  # recommendationKey is a char type value!!
  recommendationKey <- quote_summary["quoteSummary.result.financialData.recommendationKey"] %>% unname()
  numberOfAnalystOpinions <- quote_summary["quoteSummary.result.financialData.numberOfAnalystOpinions.raw"] %>% unname() %>% as.numeric()
  totalCash <- quote_summary["quoteSummary.result.financialData.totalCash.raw"] %>% unname() %>% as.numeric()
  totalCashPerShare <- quote_summary["quoteSummary.result.financialData.totalCashPerShare.raw"] %>% unname() %>% as.numeric()
  ebitda <- quote_summary["quoteSummary.result.financialData.ebitda.raw"] %>% unname() %>% as.numeric()
  totalDebt <- quote_summary["quoteSummary.result.financialData.totalDebt.raw"] %>% unname() %>% as.numeric()
  quickRatio <- quote_summary["quoteSummary.result.financialData.quickRatio.raw"] %>% unname() %>% as.numeric()
  currentRatio <- quote_summary["quoteSummary.result.financialData.currentRatio.raw"] %>% unname() %>% as.numeric()
  totalRevenue <- quote_summary["quoteSummary.result.financialData.totalRevenue.raw"] %>% unname() %>% as.numeric()
  debtToEquity <- quote_summary["quoteSummary.result.financialData.debtToEquity.raw"] %>% unname() %>% as.numeric()
  revenuePerShare <- quote_summary["quoteSummary.result.financialData.revenuePerShare.raw"] %>% unname() %>% as.numeric()
  returnOnAssets <- quote_summary["quoteSummary.result.financialData.returnOnAssets.raw"] %>% unname() %>% as.numeric()
  returnOnEquity <- quote_summary["quoteSummary.result.financialData.returnOnEquity.raw"] %>% unname() %>% as.numeric()
  grossProfits <- quote_summary["quoteSummary.result.financialData.grossProfits.raw"] %>% unname() %>% as.numeric()
  freeCashflow <- quote_summary["quoteSummary.result.financialData.freeCashflow.raw"] %>% unname() %>% as.numeric()
  operatingCashflow <- quote_summary["quoteSummary.result.financialData.operatingCashflow.raw"] %>% unname() %>% as.numeric()
  earningsGrowth <- quote_summary["quoteSummary.result.financialData.earningsGrowth.raw"] %>% unname() %>% as.numeric()
  revenueGrowth <- quote_summary["quoteSummary.result.financialData.revenueGrowth.raw"] %>% unname() %>% as.numeric()
  grossMargins <- quote_summary["quoteSummary.result.financialData.grossMargins.raw"] %>% unname() %>% as.numeric()
  ebitdaMargins <- quote_summary["quoteSummary.result.financialData.ebitdaMargins.raw"] %>% unname() %>% as.numeric()
  operatingMargins <- quote_summary["quoteSummary.result.financialData.operatingMargins.raw"] %>% unname() %>% as.numeric()
  
  
  # ===========================================================================================================================
  # ===========================================================================================================================
  
  # earningsTrend  ==> 이거는 미래
  
  # growth_0,
  # earningsEstimate_0,
  # earningsEstimate_growth_0,
  # revenueEstimate_0,
  # revenueEstimate_growth_0,
  # epsTrend_0,
  # epsRevisions_upLast7days_0,
  # epsRevisions_upLast30days_0,
  # epsRevisions_downLast30days_0,
  # growth_1,
  # earningsEstimate_1,
  # earningsEstimate_growth_1,
  # revenueEstimate_1,
  # revenueEstimate_growth_1,
  # epsTrend_1,
  # growth_2,
  # earningsEstimate_2,
  # earningsEstimate_growth_2,
  # revenueEstimate_2,
  # revenueEstimate_growth_2,
  # epsTrend_2,
  # growth_3,
  # earningsEstimate_3,
  # earningsEstimate_growth_3,
  # revenueEstimate_3,
  # revenueEstimate_growth_3,
  # epsTrend_3,
  # growth_4,
  # earningsEstimate_4,
  # earningsEstimate_growth_4,
  # revenueEstimate_4,
  # revenueEstimate_growth_4,
  # epsTrend_4
  
  # last quarter
  growth_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.growth.raw1"] %>% unname() %>% as.numeric()
  earningsEstimate_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.avg.raw1"] %>% unname() %>% as.numeric()
  earningsEstimate_growth_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.growth.raw1"] %>% unname() %>% as.numeric()
  revenueEstimate_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.avg.raw1"] %>% unname() %>% as.numeric()
  revenueEstimate_growth_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.growth.raw1"] %>% unname() %>% as.numeric()
  epsTrend_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsTrend.current.raw1"] %>% unname() %>% as.numeric()
  epsRevisions_upLast7days_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsRevisions.upLast7days.raw1"] %>% unname() %>% as.numeric()
  epsRevisions_upLast30days_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsRevisions.upLast30days.raw1"] %>% unname() %>% as.numeric()
  epsRevisions_downLast30days_0 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsRevisions.downLast30days.raw1"] %>% unname() %>% as.numeric()
  
  # upcoming quarter
  growth_1 <- quote_summary["quoteSummary.result.earningsTrend.trend.growth.raw2"] %>% unname() %>% as.numeric()
  earningsEstimate_1 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.avg.raw2"] %>% unname() %>% as.numeric()
  earningsEstimate_growth_1 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.growth.raw2"] %>% unname() %>% as.numeric()
  revenueEstimate_1 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.avg.raw2"] %>% unname() %>% as.numeric()
  revenueEstimate_growth_1 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.growth.raw2"] %>% unname() %>% as.numeric()
  epsTrend_1 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsTrend.current.raw2"] %>% unname() %>% as.numeric()
  
  # 2nd upcoming quarter
  growth_2 <- quote_summary["quoteSummary.result.earningsTrend.trend.growth.raw3"] %>% unname() %>% as.numeric()
  earningsEstimate_2 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.avg.raw3"] %>% unname() %>% as.numeric()
  earningsEstimate_growth_2 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.growth.raw3"] %>% unname() %>% as.numeric()
  revenueEstimate_2 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.avg.raw3"] %>% unname() %>% as.numeric()
  revenueEstimate_growth_2 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.growth.raw3"] %>% unname() %>% as.numeric()
  epsTrend_2 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsTrend.current.raw3"] %>% unname() %>% as.numeric()
  
  # 3rd upcoming quarter
  growth_3 <- quote_summary["quoteSummary.result.earningsTrend.trend.growth.raw4"] %>% unname() %>% as.numeric()
  earningsEstimate_3 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.avg.raw4"] %>% unname() %>% as.numeric()
  earningsEstimate_growth_3 <- quote_summary["quoteSummary.result.earningsTrend.trend.earningsEstimate.growth.raw4"] %>% unname() %>% as.numeric()
  revenueEstimate_3 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.avg.raw4"] %>% unname() %>% as.numeric()
  revenueEstimate_growth_3 <- quote_summary["quoteSummary.result.earningsTrend.trend.revenueEstimate.growth.raw4"] %>% unname() %>% as.numeric()
  epsTrend_3 <- quote_summary["quoteSummary.result.earningsTrend.trend.epsTrend.current.raw4"] %>% unname() %>% as.numeric()
  
  # 5 years from now
  growth_4 <- quote_summary["quoteSummary.result.earningsTrend.trend.growth.raw5"] %>% unname() %>% as.numeric()
  
  # indexTrend
  
  peRatio <- quote_summary["quoteSummary.result.indexTrend.peRatio.raw"] %>% unname() %>% as.numeric()
  estimates_4_0 <- quote_summary["quoteSummary.result.indexTrend.estimates.growth.raw1"] %>% unname() %>% as.numeric()
  estimates_4_1 <- quote_summary["quoteSummary.result.indexTrend.estimates.growth.raw2"] %>% unname() %>% as.numeric()
  estimates_1_0 <- quote_summary["quoteSummary.result.indexTrend.estimates.growth.raw2"] %>% unname() %>% as.numeric()
  estimates_1_1 <- quote_summary["quoteSummary.result.indexTrend.estimates.growth.raw4"] %>% unname() %>% as.numeric()
  estimates_1_5 <- quote_summary["quoteSummary.result.indexTrend.estimates.growth.raw5"] %>% unname() %>% as.numeric()
  
  
  # CashflowStatementHistory
  
  # totalCashFromOperatingActivities_1_1,
  # totalCashflowsFromInvestingActivities_1_1,
  # dividendsPaid_1_1,
  # totalCashFromFinancingActivities_1_1,
  # changeInCash_1_1,
  
  
  totalCashFromOperatingActivities_1_1 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashFromOperatingActivities.raw1"] %>% unname() %>% as.numeric()
  totalCashflowsFromInvestingActivities_1_1 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashflowsFromInvestingActivities.raw1"] %>% unname() %>% as.numeric()
  # Filter companies with dividends
  dividendsPaid_1_1 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.dividendsPaid.raw1"] %>% unname() %>% as.numeric()
  totalCashFromFinancingActivities_1_1 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashFromFinancingActivities.raw1"] %>% unname() %>% as.numeric()
  changeInCash_1_1 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.changeInCash.raw1"] %>% unname() %>% as.numeric()
  
  totalCashFromOperatingActivities_1_2 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashFromOperatingActivities.raw2"] %>% unname() %>% as.numeric()
  totalCashflowsFromInvestingActivities_1_2 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashflowsFromInvestingActivities.raw2"] %>% unname() %>% as.numeric()
  dividendsPaid_1_2 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.dividendsPaid.raw2"] %>% unname() %>% as.numeric()
  totalCashFromFinancingActivities_1_2 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashFromFinancingActivities.raw2"] %>% unname() %>% as.numeric()
  changeInCash_1_2 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.changeInCash.raw2"] %>% unname() %>% as.numeric()
  
  totalCashFromOperatingActivities_1_3 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashFromOperatingActivities.raw3"] %>% unname() %>% as.numeric()
  totalCashflowsFromInvestingActivities_1_3 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashflowsFromInvestingActivities.raw3"] %>% unname() %>% as.numeric()
  dividendsPaid_1_3 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.dividendsPaid.raw3"] %>% unname() %>% as.numeric()
  totalCashFromFinancingActivities_1_3 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.totalCashFromFinancingActivities.raw3"] %>% unname() %>% as.numeric()
  changeInCash_1_3 <- quote_summary["quoteSummary.result.cashflowStatementHistory.cashflowStatements.changeInCash.raw3"] %>% unname() %>% as.numeric()
  
  
  
  #BalanceSheetHistory
  
  # totalCurrentAssets_1_1,
  # totalAssets_1_1,
  # goodWill_1_1,
  # totalCurrentLiabilities_1_1,
  # totalLiab_1_1,
  # netTangibleAssets_1_1,
  
  
  totalCurrentAssets_1_1 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalCurrentAssets.raw1"] %>% unname() %>% as.numeric()
  totalAssets_1_1 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalAssets.raw1"] %>% unname() %>% as.numeric()
  goodWill_1_1 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.goodWill.raw1"] %>% unname() %>% as.numeric()
  totalCurrentLiabilities_1_1 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalCurrentLiabilities.raw1"] %>% unname() %>% as.numeric()
  totalLiab_1_1 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalLiab.raw1"] %>% unname() %>% as.numeric()
  netTangibleAssets_1_1 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.netTangibleAssets.raw1"] %>% unname() %>% as.numeric()
  
  totalCurrentAssets_1_2 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalCurrentAssets.raw2"] %>% unname() %>% as.numeric()
  totalAssets_1_2 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalAssets.raw2"] %>% unname() %>% as.numeric()
  goodWill_1_2 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.goodWill.raw2"] %>% unname() %>% as.numeric()
  totalCurrentLiabilities_1_2 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalCurrentLiabilities.raw2"] %>% unname() %>% as.numeric()
  totalLiab_1_2 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalLiab.raw2"] %>% unname() %>% as.numeric()
  netTangibleAssets_1_2 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.netTangibleAssets.raw2"] %>% unname() %>% as.numeric()
  
  totalCurrentAssets_1_3 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalCurrentAssets.raw3"] %>% unname() %>% as.numeric()
  totalAssets_1_3 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalAssets.raw3"] %>% unname() %>% as.numeric()
  goodWill_1_3 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.goodWill.raw3"] %>% unname() %>% as.numeric()
  totalCurrentLiabilities_1_3 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalCurrentLiabilities.raw3"] %>% unname() %>% as.numeric()
  totalLiab_1_3 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.totalLiab.raw3"] %>% unname() %>% as.numeric()
  netTangibleAssets_1_3 <- quote_summary["quoteSummary.result.balanceSheetHistory.balanceSheetStatements.netTangibleAssets.raw3"] %>% unname() %>% as.numeric()
  
  
  # incomeStatementHistory
  
  # grossProfit_1_1,
  # nonRecurring_1_1,
  # netIncomeFromContinuingOps_1_1,
  # incomeTaxExpense_1_1,
  
  
  
  grossProfit_1_1<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.grossProfit.raw1"] %>% unname() %>% as.numeric()
  # Filter companies with repeated nonRecurring expenses
  nonRecurring_1_1<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.quote_summary.raw1"] %>% unname() %>% as.numeric()
  netIncomeFromContinuingOps_1_1<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.netIncomeFromContinuingOps.raw1"] %>% unname() %>% as.numeric()
  # Filter companies with tax benefits
  incomeTaxExpense_1_1<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.incomeTaxExpense.raw1"] %>% unname() %>% as.numeric()
  
  grossProfit_1_2<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.grossProfit.raw2"] %>% unname() %>% as.numeric()
  nonRecurring_1_2<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.quote_summary.raw2"] %>% unname() %>% as.numeric()
  netIncomeFromContinuingOps_1_2<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.netIncomeFromContinuingOps.raw2"] %>% unname() %>% as.numeric()
  incomeTaxExpense_1_2<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.incomeTaxExpense.raw2"] %>% unname() %>% as.numeric()
  
  grossProfit_1_3<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.grossProfit.raw3"] %>% unname() %>% as.numeric()
  nonRecurring_1_3<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.quote_summary.raw3"] %>% unname() %>% as.numeric()
  netIncomeFromContinuingOps_1_3<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.netIncomeFromContinuingOps.raw3"] %>% unname() %>% as.numeric()
  incomeTaxExpense_1_3<- quote_summary["quoteSummary.result.incomeStatementHistory.incomeStatementHistory.incomeTaxExpense.raw3"] %>% unname() %>% as.numeric()
  
  
  df_to_rbind <- data.frame(ticker = i,
                            profit_margins,
                            forwardPE,
                            sharesOutstanding,
                            sharesShort,
                            sharesShortPriorMonth,
                            heldPercentInsiders,
                            heldPercentInstitutions,
                            shortRatio,
                            shortPercentOfFloat,
                            beta,
                            #morningStarOverallRating,
                            #morningStarRiskRating,
                            bookValue,
                            priceToBook,
                            #annualReportExpenseRatio,
                            ytdReturn,
                            beta3Year,
                            totalAssets,
                            yield,
                            #threeYearAverageReturn,
                            #fiveYearAverageReturn,
                            #priceToSalesTrailing12Months,
                            mostRecentQuarter,
                            earningsQuarterlyGrowth,
                            #revenueQuarterlyGrowth,
                            netIncomeToCommon,
                            trailingEps,
                            forwardEps,
                            pegRatio,
                            enterpriseValue,
                            enterpriseToRevenue,
                            enterpriseToEbitda,
                            YearChange,
                            SandP52WeekChange,
                            #lastDividendValue,
                            #lastCapGain,
                            #annualHoldingsTurnover,
                            
                            currentPrice,
                            targetHighPrice,
                            targetLowPrice,
                            targetMeanPrice,
                            targetMedianPrice,
                            recommendationMean,
                            recommendationKey,
                            numberOfAnalystOpinions,
                            totalCash,
                            totalCashPerShare,
                            ebitda,
                            totalDebt,
                            quickRatio,
                            currentRatio,
                            totalRevenue,
                            debtToEquity,
                            revenuePerShare,
                            returnOnAssets,
                            returnOnEquity,
                            returnOnEquity,
                            grossProfits,
                            freeCashflow,
                            operatingCashflow,
                            earningsGrowth,
                            revenueGrowth,
                            grossMargins,
                            ebitdaMargins,
                            operatingMargins,
                            
                            
                            growth_0,
                            earningsEstimate_0,
                            earningsEstimate_growth_0,
                            revenueEstimate_0,
                            revenueEstimate_growth_0,
                            epsTrend_0,
                            epsRevisions_upLast7days_0,
                            epsRevisions_upLast30days_0,
                            epsRevisions_downLast30days_0,
                            growth_1,
                            earningsEstimate_1,
                            earningsEstimate_growth_1,
                            revenueEstimate_1,
                            revenueEstimate_growth_1,
                            epsTrend_1,
                            growth_2,
                            earningsEstimate_2,
                            earningsEstimate_growth_2,
                            revenueEstimate_2,
                            revenueEstimate_growth_2,
                            epsTrend_2,
                            growth_3,
                            earningsEstimate_3,
                            earningsEstimate_growth_3,
                            revenueEstimate_3,
                            revenueEstimate_growth_3,
                            epsTrend_3,
                            growth_4,
                            
                            peRatio,
                            estimates_4_0,
                            estimates_4_1,
                            estimates_1_0,
                            estimates_1_1,
                            estimates_1_5,
                            
                            totalCashFromOperatingActivities_1_1,
                            totalCashflowsFromInvestingActivities_1_1,
                            dividendsPaid_1_1,
                            totalCashFromFinancingActivities_1_1,
                            changeInCash_1_1,
                            totalCashFromOperatingActivities_1_2,
                            totalCashflowsFromInvestingActivities_1_2,
                            dividendsPaid_1_2,
                            totalCashFromFinancingActivities_1_2,
                            changeInCash_1_2,
                            totalCashFromOperatingActivities_1_3,
                            totalCashflowsFromInvestingActivities_1_3,
                            dividendsPaid_1_3,
                            totalCashFromFinancingActivities_1_3,
                            changeInCash_1_3,
                            
                            totalCurrentAssets_1_1,
                            totalAssets_1_1,
                            goodWill_1_1,
                            totalCurrentLiabilities_1_1,
                            totalLiab_1_1,
                            netTangibleAssets_1_1,
                            totalCurrentAssets_1_2,
                            totalAssets_1_2,
                            goodWill_1_2,
                            totalCurrentLiabilities_1_2,
                            totalLiab_1_2,
                            netTangibleAssets_1_2,
                            totalCurrentAssets_1_3,
                            totalAssets_1_3,
                            goodWill_1_3,
                            totalCurrentLiabilities_1_3,
                            totalLiab_1_3,
                            netTangibleAssets_1_3,
                            
                            grossProfit_1_1,
                            nonRecurring_1_1,
                            netIncomeFromContinuingOps_1_1,
                            incomeTaxExpense_1_1,
                            grossProfit_1_2,
                            nonRecurring_1_2,
                            netIncomeFromContinuingOps_1_2,
                            incomeTaxExpense_1_2,
                            grossProfit_1_3,
                            nonRecurring_1_3,
                            netIncomeFromContinuingOps_1_3,
                            incomeTaxExpense_1_3
                            
  )
  metric_df <- rbind(metric_df, df_to_rbind)
  Sys.sleep(runif(1, 1, 2))
  print (paste(i,cnt))
  cnt<- cnt + 1
}
Sys.time()

#write.table(metric_df, file= "C:\\Users\\USER\\Documents\\RProject\\주식분석\\New_Saving_Financial_Stats.csv", sep = ",", col.names = T, append = T)
write.table(metric_df, file= "C:\\Users\\USER\\Documents\\RProject\\주식분석\\New_New_New_Saving_Financial_Stats.csv", sep = ",", col.names = T, append = T)
View(metric_df)





