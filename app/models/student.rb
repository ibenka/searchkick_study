class Student < ActiveRecord::Base
  searchkick word_start: [:name], synonyms: [["begine", "Domingo Ville"], ["qtip", "cotton swab"]]
end
