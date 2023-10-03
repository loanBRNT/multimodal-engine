set path=%path%;C:\Program Files\Java\jdk-11.0.8\bin

java -jar ./lib/ivy-java-1.2.18.jar fr.dgac.ivy.tools.Probe -b 127.255.255.255:2010 "^(.*)"
