# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find { |candidate| candidate[:id] == id }
end
  
def experienced?(candidate)
  candidate[:years_of_experience] >=2
end

def has_minimum_github_points?(candidate)
  candidate[:github_points] >= 100
end

def knows_required_languages?(candidate)
  (candidate[:languages] & ["Ruby", "Phyton"]).any?
end

def recently_applied?(candidate)
  candidate[:age] >= 18
end

def is_adult?(candidate)
  candidate[:age] >= 18
end

 
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
      has_minimum_github_points?(candidate) &&
      knows_required_languages?(candidate) &&
      recently_applied?(candidate) &&
      is_adult?(candidate)
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
