class java {
 $install_path ="/opt/softwares"
 $user_home="/home/vagrant"
 $path=$ENV{'PATH'}

	file { '/home/vagrant/archives':
		ensure => 'directory',
	}
  file { '/opt/softwares':
    ensure => 'directory',
  }
	exec { "download_java":
		command => 'wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u71-b15/jdk-8u71-linux-x64.tar.gz" ',
	   
		cwd  => "$user_home/archives",
		path => [ "/usr/bin", "/bin"],
		require => Package["wget"],
		creates => "$user_home/archives/jdk-8u71-linux-x64.tar.gz",
		timeout => 60000000
	}

	exec { "untar_jdk" :
		command => "tar -xvzf $user_home/archives/jdk-8u71-linux-x64.tar.gz",
		cwd =>"$install_path",
		path => ["/usr/bin","/bin"],
		require => [Package["tar"],],
		unless => "test -d ${install_path}/jdk*"

	}
	
	file { '/etc/environment':
	  ensure => present,
	}->
	file_line { 'Append java_home to /etc/environment':
	  path => '/etc/environment',  
	  line => "JAVA_HOME=${install_path}/jdk1.8.0_71",
	  match   => "^JAVA_HOME.*$",
	}->
	file_line { 'Update path to /etc/environment':
	  path => '/etc/environment',  
	  line => "PATH2=${path}:${install_path}/jdk1.8.0_71/bin",
	  match   => "^PATH2.*$",
	}->
	file_line { 'Update /etc/X11/Xwrapper.config':
	  path => '/etc/X11/Xwrapper.config',  
	  line => "allowed_users=anybody",
	  match   => "^allowed_users.*$",
	}

	
}
