CREATE TABLE `etl_patient_demographics` (
  `patient_id` int(11) NOT NULL PRIMARY KEY,
  `given_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `national_id_no` varchar(50) DEFAULT NULL,
  `unique_patient_no` varchar(50) DEFAULT NULL,
  `patient_clinic_number` varchar(15) DEFAULT NULL,
  `Tb_no` varchar(50) DEFAULT NULL,
  `district_reg_no` varchar(50) DEFAULT NULL,
  `hei_no` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `birth_place` varchar(50) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `next_of_kin` varchar(255) DEFAULT NULL,
  `next_of_kin_phone` varchar(100) DEFAULT NULL,
  `next_of_kin_relationship` varchar(100) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `education_level` varchar(50) DEFAULT NULL,
  `dead` int(11) DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `voided` int(11) DEFAULT NULL
);

CREATE TABLE `etl_covid_19_enrolment` (
  `uuid` char(38) DEFAULT NULL,
  `encounter_id` int(11) NOT NULL PRIMARY KEY,
  `visit_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `encounter_provider` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `sub_county` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `detection_point` varchar(255) DEFAULT NULL,
  `date_detected` date DEFAULT NULL,
  `onset_symptoms_date` date DEFAULT NULL,
  `symptomatic` varchar(10) DEFAULT NULL,
  `fever` varchar(50) DEFAULT NULL,
  `cough` varchar(10) DEFAULT NULL,
  `runny_nose` varchar(10) DEFAULT NULL,
  `diarrhoea` varchar(10) DEFAULT NULL,
  `headache` varchar(10) DEFAULT NULL,
  `muscular_pain` varchar(10) DEFAULT NULL,
  `abdominal_pain` varchar(10) DEFAULT NULL,
  `general_weakness` varchar(10) DEFAULT NULL,
  `sore_throat` varchar(10) DEFAULT NULL,
  `shortness_breath` varchar(10) DEFAULT NULL,
  `vomiting` varchar(10) DEFAULT NULL,
  `confusion` varchar(10) DEFAULT NULL,
  `chest_pain` varchar(10) DEFAULT NULL,
  `joint_pain` varchar(10) DEFAULT NULL,
  `other_symptom` varchar(10) DEFAULT NULL,
  `specify_symptoms` varchar(255) DEFAULT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `pharyngeal_exudate` varchar(10) DEFAULT NULL,
  `tachypnea` varchar(10) DEFAULT NULL,
  `abnormal_xray` varchar(10) DEFAULT NULL,
  `coma` varchar(10) DEFAULT NULL,
  `conjuctival_injection` varchar(10) DEFAULT NULL,
  `abnormal_lung_auscultation` varchar(10) DEFAULT NULL,
  `seizures` varchar(10) DEFAULT NULL,
  `pregnancy_status` varchar(10) DEFAULT NULL,
  `trimester` varchar(10) DEFAULT NULL,
  `underlying_condition` varchar(10) DEFAULT NULL,
  `cardiovascular_dse_hypertension` varchar(10) DEFAULT NULL,
  `diabetes` varchar(10) DEFAULT NULL,
  `liver_disease` varchar(10) DEFAULT NULL,
  `chronic_neurological_neuromascular_dse` varchar(10) DEFAULT NULL,
  `post_partum` varchar(10) DEFAULT NULL,
  `immunodeficiency` varchar(10) DEFAULT NULL,
  `renal_disease` varchar(10) DEFAULT NULL,
  `chronic_lung_disease` varchar(10) DEFAULT NULL,
  `malignancy` varchar(10) DEFAULT NULL,
  `occupation` varchar(10) DEFAULT NULL,
  `other_signs` varchar(10) DEFAULT NULL,
  `specify_signs` varchar(255) DEFAULT NULL,
  `admitted_to_hospital` varchar(10) DEFAULT NULL,
  `date_of_first_admission` date DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `date_of_isolation` date DEFAULT NULL,
  `patient_ventilated` varchar(10) DEFAULT NULL,
  `health_status_at_reporting` varchar(255) DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `recently_travelled` varchar(10) DEFAULT NULL,
  `country_recently_travelled` varchar(100) DEFAULT NULL,
  `city_recently_travelled` varchar(100) DEFAULT NULL,
  `recently_visited_health_facility` varchar(10) DEFAULT NULL,
  `recent_contact_with_infected_person` varchar(10) DEFAULT NULL,
  `recent_contact_with_confirmed_person` varchar(10) DEFAULT NULL,
  `recent_contact_setting` varchar(200) DEFAULT NULL,
  `recent_visit_to_animal_market` varchar(10) DEFAULT NULL,
  `animal_market_name` varchar(200) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL
);