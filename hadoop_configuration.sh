# Vamos ver se é desta que funciona
# https://github.com/TuanHenry/Step-by-step-install-Hadoop-on-Ubuntu-Kali-LINUX/wiki
cd 
pwd
sudo apt-get update
sudo apt-get install default-jdk

clear
java -version

# Instalar o Hadoop
# wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0-aarch64.tar.gz

# tar xzvf hadoop-3.3.0-aarch64.tar.gz
hadoop_path=hadoop-3.3.0/

bold=$(tput bold)
normal=$(tput sgr0)

# Configura Hadoop Java Home
java_home_path=$(readlink -f /usr/bin/java | sed "s:bin/java::")
cd $hadoop_path
clear
echo "${bold}Escrevam isto abaixo no ficheiro hadoop-env.sh${normal}"
echo "export JAVA_HOME=$java_home_path"

sudo gedit etc/hadoop/hadoop-env.sh
echo "Verifiquem se ficou bem"
sudo cat etc/hadoop/hadoop-env.sh

# Configura o .profile, não necessário
cd
#echo "# JAVA HOME PATH" >> .bashrc
#echo "export JAVA_HOME=$java_home_path" >> .bashrc
# POR FAZER OS ALIAS AO HADOOP
# echo "# Hadoop Alias" >> .bashrc
# echo 

# Tutorial do Hadoop
# https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#YARN_on_Single_Node

# Faz install do ssh
sudo apt install ssh

# Remove a password do localhost
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

cd $hadoop_path
#
clear
echo "Vamos ver se mostra os comandos do Hadoop"
bin/hadoop

clear
# Prepara agora o Pseudo-Distributed 
core_site="<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>"
echo "${bold}Copiar e colar isto no ficheiro aberto pelo Gedit${normal}"
echo $core_site
sudo gedit etc/hadoop/core-site.xml

hdfs_site="<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>"
echo "${bold}Copiar e colar isto no ficheiro aberto pelo Gedit${normal}"
echo $hdfs_site
sudo gedit etc/hadoop/hdfs-site.xml
clear
echo "${bold}Parte 1 de 2 feita com sucesso!"
exit

