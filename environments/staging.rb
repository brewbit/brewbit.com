name "staging"
description "Staging environment for staging.brewbit.com"

default_attributes(
  'brewbit' => {
    'hostname' => 'staging.brewbit.com',
    'db_name' => 'brewbit_staging'
  }
)
