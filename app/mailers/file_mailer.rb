class FileMailer < ActionMailer::Base
  default from: 'tea.tamarin@gmail.com'
  
  def result_file_email(file_path, email)
    file_name = file_path.split('/')[-1]
    attachments[file_name] = File.read(file_path)
    mail to: email,
         subject: 'Result file'
  end
end
