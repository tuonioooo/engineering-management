


set BASE_PATH=C:\workspace\tool\jenkins



set HTTP_PORT=9999



set LOG_PATH=C:\workspace\tool\jenkins\jenkins.log



java -Dhudson.util.ProcessTree.disable=true -jar -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9901 %BASE_PATH%/jenkins.war --httpPort=%HTTP_PORT% --logfile=%LOG_PATH% --prefix=/jenkins



pause

