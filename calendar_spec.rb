# -*- coding: utf-8 -*-
require './calendar'
require 'date'
require 'rspec'

describe Calendar do
  let(:jan) { Calendar.new(2011, 1) }
  let(:feb) { Calendar.new(2011, 2) }

  context "カレンダー情報が正常に把握できる" do
    it "#first_day で月初の日付が取得できる" do
      jan.first_day.should == Date.parse('2011-01-01')
    end
    it "#last_day で月末の日付が取得できる" do
      jan.last_day.should == Date.parse('2011-01-31')
      feb.last_day.should == Date.parse('2011-02-28')
    end
    it "#last_day で閏年の２月月末の日付が取得できる" do
      Calendar.new(2012, 2).last_day.should == Date.parse('2012-02-29')
    end
    it "#first_sunday で今月のカレンダーを表示する時の最初の日曜日が得られる" do
      jan.first_sunday.should == Date.parse('2010-12-26')
    end
    it "#first_sunday で得られる日付が今月 1日から始まる場合も正しい" do
      Calendar.new(2011, 5).first_sunday.should == Date.parse('2011-05-01')
    end
    it "#last_saturday で今月のカレンダーを表示する最後の土曜日が得られる" do 
      jan.last_saturday.should == Date.parse('2011-02-05')
    end
    it "#last_saturday で得られる日付が月末の場合も正しい" do
      Calendar.new(2011, 4).last_saturday.should == Date.parse('2011-04-30')
    end
  end

  context "カレンダーを繰り返し操作する" do
    it "#each_week は2011年1月は週を 6回繰り返し操作する" do
      jan.each_week.count.should == 6
    end
    it "#each_week は2011年2月は週を 5回繰り返し操作する" do
      Calendar.new(2011, 2).each_week.count.should == 5
    end
    it "#each_week は2015年2月は週を 4回繰り返し操作する" do
      Calendar.new(2015, 2).each_week.count.should == 4
    end
    it "#each_week でブロックに渡される変数は Date型の配列である" do
      jan.each_week do |week|
        week.should have(7).items
        week.should be_a_kind_of(Array)
        week.each { |date| date.should be_a_kind_of(Date) }
      end
    end
    it "#each_week はブロック付きで呼ばれた場合に自分自身を返す" do
      jan.each_week { }.should == jan
    end
    it "#each_day は2011年1月を 31日繰り返し操作する" do 
      Calendar.new(2011, 1).each_day.count.should == 31
    end
    it "#each_day は2011年2月を 28日繰り返し操作する" do
      Calendar.new(2011, 2).each_day.count.should == 28
    end
    it "#each_day は2011年4月を 30日繰り返し操作する" do
      Calendar.new(2011, 4).each_day.count.should == 30
    end
    it "#each_day は2012年2月を 29日繰り返し操作する" do
      Calendar.new(2012, 2).each_day.count.should == 29
    end
    it "#each_day でブロックに渡される変数は Date型である" do
      jan.each_day do |date|
        date.should be_a_kind_of(Date)
      end
    end
    it "#each_day がブロック付きで呼ばれた場合は自分自身を返す" do
      jan.each_day { }.should == jan
    end
  end
end
