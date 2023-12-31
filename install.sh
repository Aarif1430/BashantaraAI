# installtion of packages
sudo apt-get update
sudo apt-get install g++
sudo apt-get install git
sudo apt-get install subversion
sudo apt-get install automake
sudo apt-get install libtool
sudo apt-get install zlib1g-dev
sudo apt-get install libicu-dev
sudo apt-get install libboost-all-dev
sudo apt-get install libbz2-dev
sudo apt-get install liblzma-dev
sudo apt-get install python-dev
sudo apt-get install graphviz
sudo apt-get install imagemagick
sudo apt-get install make
sudo apt-get install cmake
sudo apt-get install libgoogle-perftools-dev
sudo apt-get install autoconf
sudo apt-get install doxygen
sudo apt-get install tcsh
sudo apt-get install python3-pip
sudo apt-get install python-minimal
sudo apt-get install libpython-stdlib
sudo apt-get install libpython-dev

# download mosesdecoder
git clone https://github.com/moses-smt/mosesdecoder.git

# download mgiza
git clone https://github.com/moses-smt/mgiza.git

# install boost
wget http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz
tar zxvf boost_1_60_0.tar.gz
cd boost_1_60_0/
./bootstrap.sh
./b2 -j4 --prefix=$PWD --libdir=$PWD/lib64 --layout=system link=static install || echo FAILURE
cd ..
rm boost_1_60_0.tar.gz


# install moses
cd mosesdecoder/
./bjam -j4

# config boost with moses
./bjam --with-boost=/home/yash/smt_1/boost_1_60_0 -j32
cd ..


# install mgiza
cd mgiza/mgizapp/
cmake .
make
make install



-------------------------------------------------
# manually overwirte the path
cd manual-compile
gedit compile.sh

# overwrite path
#SRC_DIR = /home/yash/smt_1/mgiza/mgizapp/src
#BOOST_ROOT = /home/yash/smt_1/boost_1_60_0
-------------------------------------------------

# compiling script again
cd ..
manual-compile/compile.sh

# copying merge_alignment.py from scripts to bin dir
cp scripts/merge_alignment.py bin/
cd ../..


# config mgiza with moses
cd mosesdecoder
./bjam --with-mgiza=/home/yash/smt_1/mgiza/mgizapp/bin -j12
cd ..


# install srilm
# need to transfer srilm-1.6.0.tar.gz to the machine manually
wget --no-check-certificate 'https://www.dropbox.com/s/mnfgpaw0oyh81gy/srilm%20%281%29.zip?dl=1' -O srilm.zip
unzip srilm.zip
rm srilm.zip
cd srilm
tar zxvf srilm-1.6.0.tar.gz

----------------------------------------------
# change source path manually
sudo gedit Makefile
SRILM = /home/yash/smt_1/srilm
----------------------------------------------

# config srilm
sudo tcsh
sudo make NO_TCL=1 MACHINE_TYPE=i686-m64 World
sudo ./bin/i686-m64/ngram-count -help

# config srilm with moses
config srilm with moses (getting error)
./bjam --with-srilm=/home/yash/smt_1/srilm_0


# install IndicNLP
# download lib
wget https://github.com/anoopkunchukuttan/indic_nlp_library/tarball/master
tar zxvf master
or
pip3 install indic-nlp-library

# download resource file
git clone https://github.com/anoopkunchukuttan/indic_nlp_resources.git

# refer http://nbviewer.ipython.org/url/anoopkunchukuttan.github.io/indic_nlp_library/doc/indic_nlp_examples.ipynb for intial setup
git clone https://github.com/irstlm-team/irstlm.git
sudo sh regenerate-makefiles.sh --force
sudo ./configure --prefix=/teamspace/studios/this_studio/BashantaraAI/irstlm
