class Janitor
  class << self
    @@messes = []

    def add_mess(mess)
      @@messes << mess
      mess
    end

    def clean_messes
        @@messes.each {|mess| mess.clean}
    end
  end
end