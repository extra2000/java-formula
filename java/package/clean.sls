# -*- coding: utf-8 -*-
# vim: ft=sls

java-1.8.0-openjdk-devel:
  pkg.removed

/opt/apache-maven-3.6.3:
  file.absent

/opt/maven:
  file.absent

/etc/profile.d/maven.sh:
  file.absent
