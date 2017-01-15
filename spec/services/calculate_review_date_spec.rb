require 'rails_helper'
describe CalculateReviewDate do

  subject { CalculateReviewDate.new(params) }
  let(:params) { { :original_text => 'clean', :user_text => 'clean', :factor => 2.5, 
                   :probe => 1, :repetition => nil } }

  describe '#set_new_preview_date' do

    context "when is check successful" do
      it "is valid" do
        expect(subject.set_new_preview_date[:factor]).to eq(2.6)
        expect(subject.set_new_preview_date[:probe]).to eq(3)
        expect(subject.set_new_preview_date[:repetition]).to eq(18)
        expect(subject.set_new_preview_date[:grade_scale]).to eq(5)
      end
    end

    context "when is check failed" do
      let(:params) { { :original_text => 'clean', :user_text => 'cleeaanm', :factor => 2.5, 
                       :probe => 1, :repetition => nil } }
      it "is valid" do
        expect(subject.set_new_preview_date[:factor]).to eq(2.5)
        expect(subject.set_new_preview_date[:probe]).to eq(3)
        expect(subject.set_new_preview_date[:repetition]).to eq(18)
        expect(subject.set_new_preview_date[:grade_scale]).to eq(0)
      end
    end
  end

  describe "#calculate_new_factor" do

    it "is valid when check is pass" do
      expect(subject.calculate_new_factor).to eq(2.6)
    end
  end

  describe '#calculate_grade_scale' do

    context "when texts coincide" do
      it "is valid" do
        expect(subject.calculate_grade_scale).to eq(5)
      end
    end

    context "when texts not coincide" do
      let(:params) { { :original_text => 'clean', :user_text => 'cleeaanm', :factor => 2.5, 
                       :probe => 1, :repetition => nil } }
      it "is valid when texts do not coincide completely" do
        expect(subject.calculate_grade_scale).to eq(0)
      end
    end
  end
end
