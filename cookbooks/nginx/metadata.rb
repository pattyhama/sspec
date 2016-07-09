name 'nginx'
issues_url 'https://github.com/pattyhama/sspec/issues' if respond_to?(:issues_url)
source_url 'https://github.com/pattyhama/sspec' if respond_to?(:source_url)
maintainer       'Harumi Hamaoka'
maintainer_email 'strodr@gmail.com'
license          'All rights reserved'
description      'Installs/Configures nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
