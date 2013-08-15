class jenkins_plugins {
  jenkins::plugin { 'vagrant': }
  jenkins::plugin { 'git': }
  jenkins::plugin { 'build-pipeline-plugin': }
}
