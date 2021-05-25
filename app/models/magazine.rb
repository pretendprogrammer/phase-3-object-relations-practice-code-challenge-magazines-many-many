require 'pry'
class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        email_array = readers.map { |reader_instance| reader_instance.email }
        email_array.join(';')
    end

    def self.most_popular
        all.sort {|magazine_a, magazine_b| magazine_b.readers.length <=> magazine_a.readers.length}[0]
    end
end