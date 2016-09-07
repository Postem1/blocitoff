namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.current - 7.days).destroy_all
  end
end
