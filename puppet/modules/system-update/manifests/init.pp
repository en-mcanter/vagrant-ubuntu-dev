class system-update {

	exec { 'apt-get update':
	  command => 'apt-get update',
	  timeout => 60,
	  tries   => 3
	}

	$sysPackages = [ 'build-essential', 'git', 'wget', 'curl', 'unzip', 'tar', 'git-core']
	package { $sysPackages:
	  ensure => "installed",
	  require => Exec['apt-get update'],
	}

	# class { 'idea::ultimate':version => '12.0.1',}
	
}