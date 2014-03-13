# encoding: utf-8

RAILS_ENV = ENV['RAILS_ENV'] || 'development'

##
# Backup Generated: db_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t db_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:db, 'Database backup to S3') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  split_into_chunks_of 250

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    db.name               = "brewbit_#{RAILS_ENV}"
    db.username           = "brewbit"
    db.password           = "brewbit"
    db.host               = "localhost"
    db.port               = 5432
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3 do |s3|
    s3.bucket            = "brewbit_com_db_backup"
    s3.path              = "#{RAILS_ENV}"
    s3.keep              = 10
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip
  
  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true
  end

  ##
  # Hipchat [Notifier]
  #
  notify_by Hipchat do |hipchat|
    hipchat.from = 'Website Backup'
  end

end
