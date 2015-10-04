require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_ratings => :environment do

    csv = 'db/DOHMH_New_York_City_Restaurant_Inspection_Results.csv'

    CSV.foreach(csv) do |row|
      Rating.create!({
        :camis => row[0].tr_s('"', '').strip,
        :dba => row[1].tr_s('"', '').strip,
        :boro => row[2].tr_s('"', '').strip,
        :building => row[3].tr_s('"', '').strip,
        :street => row[4].tr_s('"', '').strip,
        :zipcode => row[5].tr_s('"', '').strip,
        :phone => row[6].tr_s('"', '').strip,
        :cuisine_description => row[7].tr_s('"', '').strip,
        :inspection_date => row[8].tr_s('"', '').strip,
        :action => row[9].tr_s('"', '').strip,
        :violation_code => row[10],
        :violation_description => row[11],
        :critical_flag => row[12],
        :score => row[13],
        :grade => row[14],
        :grade_date => row[15],
        :record_date => row[16],
        :inspection_type => row[17],
      })
      puts "Row added!"
    end
  end
end