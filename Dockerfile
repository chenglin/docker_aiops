FROM chenglin903/anaconda3:latest

RUN conda install -y numpy cython matplotlib scipy pandas pystan fbprophet dask airflow -c conda-forge && \
pip install faust && \
conda clean -all

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]
