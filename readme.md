# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Rails Background Jobs

Starter code for implementing <a href="https://github.com/sf-wdi-24/modules/tree/master/how-tos/rails/background-jobs" target="_blank">Rails background jobs</a>.

## Getting Started

* Clone this repo, and change directories into `rails_background_jobs`.
* Run `bundle install` in the Terminal.
* Run `rake db:create db:migrate` to create your database and data tables.
* Work off of the master branch.

## Objectives

* Set up the app to use Delayed Job for background jobs. Follow the <a href="https://github.com/collectiveidea/delayed_job" target="_blank">Delayed Job docs</a> and/or the <a href="https://github.com/sf-wdi-24/modules/tree/master/how-tos/rails/background-jobs" target="_blank">Rails Background Jobs</a> notes.
* Refactor the "favoriting" and "unfavoriting" features in the app to use background jobs. **Hint:** Look at `app/controllers/favorites_controller.rb` and `app/services/favorites_service.rb`.