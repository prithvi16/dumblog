# file: lib/tasks/email_tasks.rake

desc 'send digest email'
task send_digest_email: :environment do
    users=User.all
    users.each do |user|
    WeeklyEmailMailer.sample_email(user).deliver!
end

end