# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# DoctorSpecialty.destroy_all
# Doctor.destroy_all
# Specialty.destroy_all
# Patient.destroy_all
# Appointment.destroy_all


doctors = []
5.times do 
  city = City.create!(city_name: Faker::Address.city)
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: city)
  doctors << doctor
end
  
5.times do
  city = City.create!(city_name: Faker::Address.city)
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city)
end 

#Appointments
5.times do 
  doctor = Doctor.order("RANDOM()").first
  patient = Patient.order("RANDOM()").first 
  appointment = Appointment.create!(
    date: Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :day),
    doctor: doctor,
    patient: patient
  )
end 

specialties = []
5.times do 
  specialty = Specialty.create!(expertise: Faker::Job.title)
  specialties << specialty
end 

doctors.each do |doctor|
  specialties.sample(3).each do |specialty|
    DoctorSpecialty.create(doctor_id: doctor.id, specialty_id: specialty.id)
  end
end
  
