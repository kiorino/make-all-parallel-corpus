# 使い方
## ディレクトリ構成
```
$ find ${WORKDIR}/origin | head

${WORKDIR}/origin
${WORKDIR}/origin/SNT
${WORKDIR}/origin/SNT/SNT00296.xml
${WORKDIR}/origin/SNT/SNT00308.xml
${WORKDIR}/origin/SNT/SNT00055.xml
${WORKDIR}/origin/SNT/SNT00202.xml
${WORKDIR}/origin/SNT/SNT00013.xml
${WORKDIR}/origin/SNT/SNT00260.xml
${WORKDIR}/origin/SNT/SNT00230.xml
${WORKDIR}/origin/SNT/SNT00153.xml
```
## 実行方法
./make_all_parallel_corpus ${WORKDIR}/origin > corpus.ja-en
cut -f 1 corpus.ja-en > corpus.ja
cut -f 2 corpus.ja-en > corpus.en
