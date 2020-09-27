# -*- coding: utf-8 -*-
# vim: ft=sls

java-{{ pillar['java']['version'] }}-openjdk-devel:
  pkg.installed

apache-maven-{{ pillar['java']['maven']['version'] }}:
  archive.extracted:
    - name: /opt
    - source: {{ pillar['java']['maven']['archive'] }}
    - source_hash: {{ pillar['java']['maven']['checksum'] }}
    - if_missing: /opt/apache-maven-{{ pillar['java']['maven']['version'] }}

/opt/maven:
  file.symlink:
    - target: /opt/apache-maven-{{ pillar['java']['maven']['version'] }}
    - force: true
    - require:
      - archive: apache-maven-{{ pillar['java']['maven']['version'] }}

maven_env:
  file.append:
    - name: /etc/profile.d/maven.sh
    - text:
      - 'export JAVA_HOME=/usr/lib/jvm/jre-openjdk'
      - 'export M2_HOME=/opt/maven'
      - 'export MAVEN_HOME=/opt/maven'
      - 'export PATH=${M2_HOME}/bin:${PATH}'
