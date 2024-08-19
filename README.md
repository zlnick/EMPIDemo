# EMPIDemo
A Patient similarity comparison demo running on IRIS for Health with vector search.
The similarity is calculated using vector search to compare vectorized personal attributes such as name, DOB, address, etc. between different patients. The higher the score is, the more likely the compared patients are the same person.
This demo is referring to [sentence-transformers model](https://huggingface.co/models?library=sentence-transformers) to convert text into vectors then use IRIS vector functions to store,read and compare the vectors.


## Installation
1. Clone this repo
2. [text2vec-base-chinese](https://huggingface.co/shibing624/text2vec-base-chinese) is referred in this demo, you can also download any sentence-transformers model you want, store it to a foldler, i.e, D:\Coding\EMPIDemo\image-iris\llm\text2vec-base-chinese in this demo, then change the directory in volumes section of the docker-compose.yml file.
3. Start the Docker container
Please be aware that the program will download and install Python sentence-transformers module and also install a FHIR repository to store patient info, consequentely it will take about 15~16GB disk storage.

## Try the demo
1. [A demo patient info input UI](http://localhost:52880/EMPIApp/index.html)
2. [IRIS Procuction handling the requests](http://localhost:52880/csp/healthshare/fhirserver/EnsPortal.ProductionConfig.zen?$NAMESPACE=FHIRSERVER)
3. Related codes
Embedded python is used to invoke the sentence-transformer to perform vectorization, which can be found in MPIDemo.Util.Vector
Vector search is used to calculate similarity between patients, which can be found in EMPIDemo.REST.Service

