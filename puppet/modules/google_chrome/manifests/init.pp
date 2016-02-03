class apache {

	exec { "download_chrome":
		command => 'wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" ',
	   
		cwd  => "$user_home/archives",
		path => [ "/usr/bin", "/bin"],
		require => Package["wget"],
		creates => "$user_home/archives/google_chrome.deb",
		timeout => 60000000
	}

	package { 'google_chrome':
	  ensure => "installed",
	  require => Exec['download_chrome'],
	}

}