name "production"
description "Production environment for brewbit.com"

default_attributes(
  'brewbit' => {
    'hostname' => 'brewbit.com',
    'db_name' => 'brewbit_production'
  }
)
