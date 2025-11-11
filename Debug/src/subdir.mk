################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Octree_MC.cpp \
../src/chull.cpp 

CPP_DEPS += \
./src/Octree_MC.d \
./src/chull.d 

OBJS += \
./src/Octree_MC.o \
./src/chull.o 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I"/home/note_msi/downloads/eclipse-workspace/Octree_MC/include" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src

clean-src:
	-$(RM) ./src/Octree_MC.d ./src/Octree_MC.o ./src/chull.d ./src/chull.o

.PHONY: clean-src

