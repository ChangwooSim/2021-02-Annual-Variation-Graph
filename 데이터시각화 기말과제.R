## HistData 안에 내장되어있는 Wheat를 불러온다.
library(knitr)
library(HistData)
help("HistData")
library(dplyr)
dat <- HistData::Wheat

## 연도별 밀 가격 변동 그래프
library(ggplot2)
yw <- ggplot(data = Wheat,
             aes(x= Year, y= Wheat)) +
  geom_line(color = "Skyblue", lwd=1.5) +
  ggtitle("밀 가격 변동 그래프") +
  theme_bw() +
  theme(plot.title=element_text(size=20, color="black", hjust = 0.5))

yw

## 연도별 주간임금 변동 그래프
yl <-  ggplot(data = Wheat,
              aes(x= Year, y= Wages)) +
  geom_line(color = "Skyblue", lwd=2) +
  ggtitle("주간임금 변동 그래프") +
  theme_bw() +
  theme(plot.title=element_text(size=20, color="black", hjust = 0.5))
yl

## 밀 가격과 주간임금의 변동에 대한 그래프

a <- dat$Wheat
b <- dat$Wages
wl <- data.frame(a,b)

wlg <- ggplot(data = wl,
              aes(x = b, y = a)) +
  geom_line(color = "Darkgreen", lwd=1.2) +
  ggtitle("밀 가격과 주간임금 변동의 관계") +
  theme_bw() +
  xlab("Wages") + 
  ylab("Wheat") +
  theme(plot.title = element_text(size = 20, color="black", hjust = 0.5))
wlg

## 밀과 임금의 상관계수 분석
cor.test(dat$Wages,dat$Wheat)

## 그래프 모아서 보기

'연도별 밀 가격 변동 그래프'
yw
'연도별 주간임금 변동 그래프'
yl
'밀 가격과 주간임금 변동에 대한 그래프'
wlg
