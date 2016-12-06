class Doctor
  attr_reader(:name, :id, :patient_ids)

  define_method(:initialize) do |attributes|
        @name = attributes.fetch(:name)
        @id = attributes.fetch(:id)
        @patient_ids = []
  end

  define_method(:assign_patient) do |patient_id|
    @patient_ids.push(patient_id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      doctors.push(Doctor.new({:name => name}))
    end
    doctors
  end

end
