# == Class: traefik::params
#
class traefik::params {
  $install_method    = 'url'
  $download_url_base = 'https://github.com/containous/traefik/releases/download'
  $version           = '1.0.3'
  $archive_dir       = '/opt/puppet-archive'
  $bin_dir           = '/usr/local/bin'
  $max_open_files    = 16384

  $config_dir        = '/etc/traefik'
  $config_file       = 'traefik.toml'

  case $::architecture {
    'x86_64', 'amd64': { $arch = 'amd64' }
    'i386':            { $arch = '386'   }
    /^arm.*/:          { $arch = 'arm'   }
    default:           {
      fail("Unsupported kernel architecture: ${::architecture}")
    }
  }

  $os = downcase($::kernel)

  $init_style = $facts['service_provider']

}
