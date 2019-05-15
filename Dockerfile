FROM chenglin903/anaconda3:latest

RUN conda install -y fbprophet dask numba airflow -c conda-forge && \
pip install faust && \
conda clean -all

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]
