# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class NotifierMailerPreview < ActionMailer::Preview

    # Preview this email at
    # http://localhost:3000/rails/mailers/notifier_mailer/
    
    def guest_info(first, last, phone, email, interest, timestamp)
      mail(to: 'admin@techhandie.com', subject: "Website Visitors Request for Information")
    end
    
end