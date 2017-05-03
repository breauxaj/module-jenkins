# Class: jenkins::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class jenkins::params {
  $jenkins_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $jenkins_package = 'jenkins'
              $jenkins_service = 'jenkins'
            }
          }
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}