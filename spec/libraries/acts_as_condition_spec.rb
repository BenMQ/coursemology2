require 'rails_helper'

RSpec.describe 'Extension: Acts as Condition', type: :model do
  describe 'objects which act as conditions' do
    subject do
      Class.new(ActiveRecord::Base) do
        def self.columns
          []
        end
        acts_as_condition
      end.new
    end

    it 'implements #title' do
      expect(subject).to respond_to(:title)
      expect { subject.title }.to raise_error(NotImplementedError)
    end

    it 'implements #satisfied_by?' do
      expect(subject).to respond_to(:satisfied_by?)
      expect { subject.satisfied_by?(double) }.to raise_error(NotImplementedError)
    end
  end
end
