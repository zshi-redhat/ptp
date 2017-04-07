# Class: ptp
# ===========================
#
# Full description of class ptp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ptp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ptp (
  Boolean $ptp4l_service_enable,
  Boolean $phc2sys_service_enable,
  String $ptp4l_service_ensure,
  String $phc2sys_service_ensure,
  String $package_name,
  String $ptp4l_service_name,
  String $phc2sys_service_name,
  String $ptp4l_interface,
  String $ptp4l_conffile,
  String $ptp4l_optfile,
) {

  contain ptp::install
  contain ptp::config
  contain ptp::service

  Class['::ptp::install'] ->
  Class['::ptp::config'] ~>
  Class['::ptp::service']
}