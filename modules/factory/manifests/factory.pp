class corpapp1::factory {
  factory_group { 'group1':
    pipelines => 'corpsite1',
  }

  factory_pipeline { 'corpsite1':
    materials => ['cd-puppet'],
    stages    => ['unit','acceptance'],
  }

  factory_stage { 'unit':
    jobs => ['puppet lint','rspec-puppet'],
  }

  factory_stage { 'acceptance-provision':
    jobs    => ['cloud provisioner'],
    require => Factory::Stage['unit'],
  }

  factory_stage { 'acceptance-run':
    jobs    => ['module acceptance'],
    require => Factory::Stage['acceptance-provision'],
  }

  factory_job { 'puppet lint':
    command       => 'puppet lint',
    arguments     => '',
    if_conditions => passed,
  }

  factory_material { 'cd-puppet':
    source   => 'file:///opt/puppet/factory',
    provider => git,
  }
}
