Class EMPIDemo.Util.Vector Extends %RegisteredObject
{

ClassMethod EmbeddingPy(text) As %String [ Language = python, SqlProc ]
{
    from sentence_transformers import SentenceTransformer
    m = SentenceTransformer("/isc/model/text2vec")
    #m = SentenceTransformer("shibing624/text2vec-base-chinese")
    try:
        sentences = [text]
        sentence_embeddings = m.encode(sentences)
        return str(sentence_embeddings[0].tolist())   
    except Exception as e:
        errorMsg = "SplitAndEmbed Error: "+ str(e)
        print(errorMsg)
        return errorMsg
}

}
