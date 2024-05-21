echo "Configuring and building Thirdparty/DBoW2 ..."

proc_n=$((($(nproc)) * 3 / 4))
echo "make with j proc_n: ${proc_n}"

cd Thirdparty/DBoW2
mkdir build -p
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j${proc_n}

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build -p
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j${proc_n}

cd ../../Sophus

echo "Configuring and building Thirdparty/Sophus ..."

mkdir build -p
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j${proc_n}

cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

#echo "Configuring and building ORB_SLAM3 ..."

#mkdir build -p
#cd build
#cmake .. -DCMAKE_BUILD_TYPE=Release
#make -j${proc_n}
