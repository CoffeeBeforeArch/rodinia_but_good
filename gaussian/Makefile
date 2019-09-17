include ../../common/make.config

CC := $(CUDA_DIR)/bin/nvcc

INCLUDE := $(CUDA_DIR)/include

SRC = gaussian.cu
EXE = gaussian

KERNEL_DIM := -DRD_WG_SIZE_0=128 -DRD_WG_SIZE_1=16

release: $(SRC)
	$(CC) $(KERNEL_DIM) $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR) 

clean:
	rm gaussian
