node default {
  include ::jenkins

  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

  package { 'java-1.7.0-openjdk': ensure => 'present' }

  yumrepo { 'jenkins':
    descr    => 'Jenkins',
    baseurl  => 'http://pkg.jenkins.io/redhat',
    gpgcheck => '1',
    gpgkey   => 'https://pkg.jenkins.io/redhat/jenkins.io.key',
  }

}
