namespace :populate do
	desc "populate db with Universities"
  task get_universities: :environment do
  	schoolfile = 'public/hd2013.csv'
  	schoolfile = File.open(schoolfile, 'r')
  	schoolfile.each do |line|
  		# split the line into an array
  		# access each part of the array and create a new school object with each line
  		@line = line.gsub('"','').encode('UTF-8', :invalid => :replace).split(",")
  		@school = School.new
  		@school.name = @line[1].chomp.to_s
  		@school.location = @line[3].chomp.to_s
  		@school.state = @line[4].chomp.to_s
  		@school.save
  	end
  end

  desc "populate db with students"
  task get_students: :environment do
  	require 'populator'
    require 'faker'
    User.populate 100 do |user|
    	@full_name = Faker::Name.name
    	@first_name = @full_name.split(" ")[0]
    	@last_name = @full_name.split(" ")[1]

    	user.first_name = @first_name
    	user.last_name = @last_name
    	user.phone  = Faker::PhoneNumber.phone_number
    	user.email = @first_name[0].to_s + @last_name.to_s + "@gmail.com"
    	user.username = @first_name[0].to_s + @last_name.to_s 
    	user.password_digest = "password"
    end
  end

  desc "add associations"
  task get_associations: :environment do 
    @user_id_bucket = (1..100)
    @school_id_bucket = (1..6514)
    @course_id_bucket = (1..1000)
    @course_name_bucket = ["Math 101","English 100","Calculus 1","Calculus 2","Calculus 3","Biology 200","Computer Science Intro","Business 120","Physics 300","Physics Lab 1","Art- Drawing 1","Art- Drawing 2","Physiology 100","Psychology 240","Ice Hockey Intro","Basket Weaving","Gym 320","Health and Safety 1","Biomedical Engineering Intro","Computer Security 101","Game Development for Programmers","Software Engineering 400","Public Safety","Human Anatomy"]

    # create courses
    1000.times {Course.create(name: @course_name_bucket.sample, description: "N/A", school_id: rand(@school_id_bucket))}

    # add school associations to users
    300.times {UserSchool.create(user_id: rand(@user_id_bucket), school_id: rand(@school_id_bucket))}

  end
end









