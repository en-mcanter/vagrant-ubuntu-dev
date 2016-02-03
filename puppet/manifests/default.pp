
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


notify{ "\n!!!!  Got here with ${puppet_modules2} and ${SharedFolderPathMachineMapping3}":}

exec { 'ins':
  command => 'sudo pwd',
  timeout => 60,
  tries   => 3
}


#include apache
#class { 'apache':}

#include system-update
class { 'system-update':
}

#include system-update
class { 'java': }

#class { 'cinnamon': }

#class { 'google_chrome':}

#class { 'idea::ultimate':
#  version => '15.0.1',
#}