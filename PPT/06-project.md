# 智能交易实例项目 #

## 目前我们已经完成的事情 ##

1. 我们知道了如何获取数据
2. 我们知道了如何图形展示数据
3. 我们知道了如何生成分析报告
4. 我们知道了如何在云计算平台上实施以上事情

剩下的，就是开始为操作制定交易规则。

## 什么是交易规则？ ##

* 简单讲，就是什么时侯买入金融资产，什么时侯卖出金融资产。

你们能想到的交易规则是什么？

## 最古老悠久的交易规则：低买高卖 ##

> 贱取如珠玉 贵出如粪土   《史记·货殖列传》

然而，怎样才是价格低呢？

以股市为例，股价每天都在波动，如何才能知道目前的价格是低还是高呢？

## 如何是低价 ##
有两种分析思路：

1. 基本面分析，估值模型，算出股票的“合理价格”

当目前价格低于所计算的合理价格的时侯，就认为股价较低。

2.  趋势分析，统计数据分析，判断股价目前的价格水平。

当目前的价格与历史数据相比，处在较低位置的时侯，就认为股价低。

## 定义低价：价格利于历史中位价 ##

我们定义如下操作规则：

* 某只股票的价格低于其过去一年中历史价格的中位数，

* 就称该只股票的价格较低

* 在操作上，我们定义一个名叫under_ratio的指标

> under_ratio = 最新收盘价／前一自然年中中股价的中位数

under_ratio小于1的股票就被认为股价较低。

## 低于前一年中位值 ##

但是目前沪深两市股票有三千多只，低于其前一年价格中位数的股票肯定不只一个，那我们该如何选择呢？

* 对所有的股票按照under_ratio值从小到大排序


* 排序后最靠前的股票是在沪深两市中股价相对最低的股票

* 我们从中选出前6名作为投资的选择对象

注意：这里的6是任意选的的数据。

## 然而到底以什么价格买入呢？ ##

我们已经选定了6只低价的股票，但是，到底要以什么价格买入呢？

1. 因为我们是以昨天的收盘价计算排序找到这六只股票的，所以第二天以昨天的收盘价买入。

2. 然而我们想到，对于历史数据，我们只用了过去一年之中的数据，对于之前的数据还没有利用，这会不会存在信息的浪费呢？

## 一种更充分的利用历史信息的买入价格确定方式 ##

* 分别计算这6只股票有数据以来的收盘价格的标准差D

* 用前一自然年度收盘价的中位数作为均值U

* 如果股价低于 U - 2D 那么就买入

* 如果股价高于 U + 2D 就卖出

这一策略同时解决了如何确定买入和卖出价格的问题。

> 注意：这个策略只是为了教学的方便而定义的简单规则，不要认为这是真的可以赚钱的规则。

## 交易规则的实现：工具语言的介入 ##

## 交易指令报告的自动生成 ##
