# frozen_string_literal: true

RSpec.describe(Sniffed::Sniffer) do
  describe "configuration" do
    it "should include instance methods" do
      expect(Models::ActiveRecord::Dog.new).to(be_a_kind_of(Sniffed::Sniffer::SniffedInstanceMethods))
    end

    it "should list all changes after a transaction" do
      first_name = "Sif"
      last_name = "The Dog"
      new_first_name = "Jujuba"
      new_last_name = "The Crazy"
      dog = create_dog(first_name: first_name, last_name: last_name)
      dog.reset_commited_changes

      ActiveRecord::Base.transaction do
        dog.update(first_name: new_first_name)
        dog.update(last_name: new_last_name)
      end

      expect(dog.commited_changes).to(include({ "first_name" => [first_name, new_first_name],
                                                "last_name" => [last_name, new_last_name] }))
    end
  end
end
