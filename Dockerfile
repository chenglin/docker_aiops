FROM centos

ENV PATH /opt/conda/bin:$PATH

RUN yum -y update && \
yum -y install epel-release && \
yum -y install wget bzip2 htop && \
yum clean all

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
/bin/bash ~/anaconda.sh -b -p /opt/conda && \
rm ~/anaconda.sh && \
ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
echo "conda activate base" >> ~/.bashrc

RUN conda install -y numpy cython matplotlib scipy pandas pystan fbprophet dask airflow -c conda-forge && \
pip install faust && \
conda clean -all

CMD ["/bin/bash"]
