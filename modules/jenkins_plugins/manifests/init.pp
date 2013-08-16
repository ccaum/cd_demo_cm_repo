class jenkins_plugins {
  Jenkins::Plugin { notify => Class['jenkins::service'] }
  jenkins::plugin { 'vagrant': }
  jenkins::plugin { 'git': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'ruby-runtime': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'ssh-slaves': }
  jenkins::plugin { 'build-pipeline-plugin': }
  jenkins::plugin { 'parameterized-trigger': }
  jenkins::plugin { 'jquery': }
}
