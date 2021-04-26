# Abrir o localhost 1º
# ssh localhost
hadoop_path="hadoop-3.3.0/"

cd $hadoop_path
# Formatar o HDFS
bin/hdfs namenode -format

# Vamos iniciar o HDFS do Hadoop
# sbin/start-dfs.sh
# ou
sbin/start-all.sh
# Se correu bem, vamos à página http://localhost:9870/
# http://localhost:54310/

# Vamos criar as diretorias necessárias para correr MapReduce
bin/hdfs dfs -mkdir /user

# Opá eu criei a VM com o user hadoop e dei-lhe esse nome, mas acho que pode ser qualquer um
username="hadoop"
bin/hdfs dfs -mkdir /user/$username
jps
# Para parar, basta correr o comando sbin/stop-dfs.sh

# Cria a diretoria de input de output
bin/hdfs dfs -mkdir /user/$username/input /user/$username/output

# Copia um ficheiro exemplo para a diretoria HDFS do Hadoop
bin/hdfs dfs -put /home/hadoop/historico.txt /user/hadoop/input
# bin/hdfs dfs -put /home/hadoop/hadoop-3.3.0/exemplo.txt /user/hadoop/input

# Corre o MapReducer
# <hadoop> jar <diretoria do hadoop-streaming> -input <path_input> -output <path_output> -mapper <path_mapper> -reducer <path_reducer>
bin/hadoop jar /home/hadoop/hadoop-3.3.0/share/hadoop/tools/lib/hadoop-streaming-3.3.0.jar -input /user/hadoop/input/historico.txt -output /user/hadoop/output/out -mapper /home/hadoop/mapper.py -reducer /home/hadoop/reducer.py
