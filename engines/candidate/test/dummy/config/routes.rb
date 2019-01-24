Rails.application.routes.draw do
  mount Candidate::Engine => "/candidate"
end
