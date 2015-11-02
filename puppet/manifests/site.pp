# manifests/site.pp

/*
$PUBLIC_IP = '128.111.55.39'
$IPADDR = '10.50.10.39'
$HOSTNAME = 'php.cs.ucsb.edu'
*/

node default{
  class {'::ntp':
    servers => ['128.111.1.5', '128.111.1.6'],
    ensure => 'present'
  }

  package {'openssh-server':
    ensure => present
  }

  file { '/etc/selinux/config' :
    ensure => file,
    source => 'puppet:///modules/eucalyptus/selinux.config.original'
  }

  exec { '/usr/sbin/setenforce 0' :
    onlyif => '/usr/bin/test `/usr/sbin/getenforce` == Enabled'
  }

  /*file { '/etc/sysconfig/network-scripts/ifcfg-eth1' :
    content => template('eucalyptus/ifcfg-eth1.erb'),
    mode    => 0644
  }

  file { '/etc/sysconfig/network-scripts/ifcfg-eth1' :
    content => template('eucalyptus/ifcfg-eth1.erb'),
    mode    => 0644
  }
  */
}
