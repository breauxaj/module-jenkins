# Class: jenkins
#
# This class installs Jenkins
#
# Parameters:
#
# Actions:
#   - Installs the jenkins package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'jenkins': }
#
class jenkins (
  $ensure = $::jenkins::params::jenkins_package_ensure
) inherits ::jenkins::params {
  package { $::jenkins::params::jenkins_package:
    ensure  => $ensure,
  }

  service { $::jenkins::params::jenkins_service:
    ensure  => running,
    enable  => true,
    require => Package[$::jenkins::params::jenkins_package]
  }

}
