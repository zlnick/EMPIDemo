FROM containers.intersystems.com/intersystems/irishealth-community:2024.1
USER irisowner
RUN pip install -U sentence-transformers

WORKDIR /dur
COPY --chown=irisowner:irisowner --chmod=700 src /dur


RUN find . -name '.DS_Store' -type f -delete
RUN ISC_CPF_MERGE_FILE=/dur/init/merge.cpf iris start $ISC_PACKAGE_INSTANCENAME &&\
    iris merge $ISC_PACKAGE_INSTANCENAME /dur/init/merge.cpf &&\
    /dur/init/init.sh

#RUN ISC_CPF_MERGE_FILE=/dur/merge/merge.cpf iris start $ISC_PACKAGE_INSTANCENAME &&\
    #iris merge $ISC_PACKAGE_INSTANCENAME /dur/merge/merge.cpf &&\
#    /dur/loader.sh
