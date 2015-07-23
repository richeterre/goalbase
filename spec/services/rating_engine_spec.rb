describe RatingEngine do
  describe "for mere home matches" do
    it "calculates the correct rating for wins" do
      match1 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 2, away_goals: 1)
      rating = RatingEngine.calculate_rating([match1, match2], [])
      expect(rating).to eq(10)
    end

    it "calculates the correct rating for draws" do
      match1 = FactoryGirl.create(:match, home_goals: 0, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 1, away_goals: 1)
      rating = RatingEngine.calculate_rating([match1, match2], [])
      expect(rating).to be_within(0.01).of(3.33)
    end

    it "calculates the correct rating for defeats" do
      match1 = FactoryGirl.create(:match, home_goals: 0, away_goals: 1)
      match2 = FactoryGirl.create(:match, home_goals: 1, away_goals: 2)
      rating = RatingEngine.calculate_rating([match1, match2], [])
      expect(rating).to eq(0)
    end
  end

  describe "for mere away matches" do
    it "calculates the correct rating for wins" do
      match1 = FactoryGirl.create(:match, home_goals: 0, away_goals: 1)
      match2 = FactoryGirl.create(:match, home_goals: 1, away_goals: 2)
      rating = RatingEngine.calculate_rating([], [match1, match2])
      expect(rating).to eq(10)
    end

    it "calculates the correct rating for draws" do
      match1 = FactoryGirl.create(:match, home_goals: 0, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 1, away_goals: 1)
      rating = RatingEngine.calculate_rating([], [match1, match2])
      expect(rating).to be_within(0.01).of(3.33)
    end

    it "calculates the correct rating for defeats" do
      match1 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 2, away_goals: 1)
      rating = RatingEngine.calculate_rating([], [match1, match2])
      expect(rating).to eq(0)
    end
  end

  describe "for both home and away matches" do
    it "calculates the correct rating for wins" do
      match1 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 0, away_goals: 1)
      rating = RatingEngine.calculate_rating([match1], [match2])
      expect(rating).to eq(10)
    end

    it "calculates the correct rating for draws" do
      match1 = FactoryGirl.create(:match, home_goals: 0, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 1, away_goals: 1)
      rating = RatingEngine.calculate_rating([match1], [match2])
      expect(rating).to be_within(0.01).of(3.33)
    end

    it "calculates the correct rating for defeats" do
      match1 = FactoryGirl.create(:match, home_goals: 0, away_goals: 1)
      match2 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)
      rating = RatingEngine.calculate_rating([match1], [match2])
      expect(rating).to eq(0)
    end

    it "calculates the correct rating for mixed outcomes" do
      # One win, two draws, one defeat
      match1 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)
      match2 = FactoryGirl.create(:match, home_goals: 0, away_goals: 0)
      match3 = FactoryGirl.create(:match, home_goals: 0, away_goals: 0)
      match4 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)

      rating = RatingEngine.calculate_rating([match1, match2], [match3, match4])
      expect(rating).to be_within(0.001).of(4.166)
    end
  end
end
