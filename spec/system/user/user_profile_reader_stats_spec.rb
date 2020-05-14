require "rails_helper"

RSpec.describe "Profile reader stats dashboard", type: :system do
  context "when user visits profile page" do
    context "when user checks the overall stats" do
      before do
        create(:user, username: "user3000")
        visit "/user3000"
      end

      it "shows the number of visits" do
        within(".sidebar-data") do
          expect(first("#number-visits").text).not_to be_empty
        end
      end

      it "shows the number of articles read" do
        within(".sidebar-data") do
          expect(first("#number-articles-read").text).not_to be_empty
        end
      end

      # it "shows the number of comments received" do
      #   within(".sidebar-data") do
      #     expect(first("#number-comments-received").text).not_to be_empty
      #   end
      # end

      it "shows the number of words read" do
        within(".sidebar-data") do
          expect(first("#number-words-read").text).not_to be_empty
        end
      end
    end

    context "when user checks the daily stats" do
      before do
        create(:user, username: "user3000")
        visit "/user3000"
      end

      it "shows the number of visits per day" do
        within(".daily-stats") do
          expect(first("#visits-per-day").text).not_to be_empty
        end
      end

      it "shows the average active time on pages per day" do
        within(".daily-stats") do
          expect(first("#average-active-time-per-day").text).not_to be_empty
        end
      end

      it "shows the average number of articles read per day" do
        within(".daily-stats") do
          expect(first("#average-number-articles-per-day").text).not_to be_empty
        end
      end

      it "shows the average number of words read per day" do
        within(".daily-stats") do
          expect(first("#average-number-words-per-day").text).not_to be_empty
        end
      end
    end
  end
end
