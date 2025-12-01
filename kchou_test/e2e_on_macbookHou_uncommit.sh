#!/bin/bash

# CONDA_PATH=/home/acdc1301/anaconda3/bin
# eval "$($CONDA_PATH/conda shell.bash hook)"
# conda activate

shortcuts run "Set Appearance light"

BASE_DIR=/Users/kchou/bz
FRONTEND_FOLDER=$BASE_DIR/carta_build/carta-frontend-dev
BACKEND_FOLDER=$BASE_DIR/carta_build/carta-backend-dev
E2E_FOLDER=$BASE_DIR/carta_robot_test
E2E_RUN_FOLDER=$BASE_DIR/carta_robot_test/kchou_test
# E2E_RUN_FOLDER=$BASE_DIR/temp_parallel_runner
E2E_REPORT_FOLDER=$BASE_DIR/e2e_reports
PYTHON_ENV=e2e

source /Users/kchou/python_venv/${PYTHON_ENV}/bin/activate

function git_func() {
    cd $1
    git fetch
    git clean -f
    git checkout -f $2
    git pull
    # git status
}


# ## default branchs
# f_branch=dev
# b_branch=dev
# e2e_branch=main
# git_func $FRONTEND_FOLDER $f_branch
# git_func $BACKEND_FOLDER $b_branch
# git_func $E2E_FOLDER $e2e_branch

name=none

# if [[ $# -eq 0 ]]; then
#     echo "enter flag -f, -b, or -t and its argument."
#     exit 1
#     fi

while [[ $# -gt 0 ]]; do
    case "$1" in
    -f | --frontend)
        FRONTEND_FOLDER=$BASE_DIR/carta_build/carta-frontend-work
        f_branch=uncommit
        ;;
    -b | --backend)
        BACKEND_FOLDER=$BASE_DIR/carta_build/carta-backend-work
        b_branch=uncommit
        ;;
    -t | --e2etest)
        if [[ -n "$2" ]]; then
            e2e_branch="$2"
        fi
        git_func $E2E_FOLDER $e2e_branch
        shift
        ;;
    --project)
        if [[ -n "$2" ]]; then
            name="$2"
        fi
        shift
        ;;
    --build_f)
        cd $FRONTEND_FOLDER 
        git submodule update
        npm install & 
        wait ${!}
        npm run build &
        wait ${!}
        shift
        ;;
    --build_b)
        cd $BACKEND_FOLDER/build 
        git submodule update
        cmake ..
        make -j 8 &
        wait ${!}
        shift
        ;;
    --build_t)
        cd $E2E_FOLDER 
        make -j 8 &
        wait ${!}
        shift
        ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
    shift
done

cd $E2E_RUN_FOLDER

echo -n "8
--variable DELAY:0.2 --variable N_OMP_THREADS:8 --variable PYTHON3_EXECUTABLE:/Users/kchou/python_venv/${PYTHON_ENV}/bin/python --variable CARTA_BACKEND_EXECUTABLE:${BACKEND_FOLDER}/build/carta_backend --variable CARTA_FRONTEND_FOLDER:${FRONTEND_FOLDER}/build --variable INITIAL_IMAGE_FOLDER:${BASE_DIR}/set_QA_e2e_v2" > config_macbookHou_uncommit.txt


# python parallel_run_acdc1301.py config_acdc1301_uncommit.txt
# cd ${BASE_DIR}/temp_parallel_runner
cd $E2E_RUN_FOLDER
echo "backend: $b_branch
frontend: $f_branch
e2e: $e2e_branch
project: $name" > branch_info.txt
python parallel_run_macbook_hou.py $E2E_RUN_FOLDER/config_macbookHou_uncommit.txt


deactivate

shortcuts run "Set Appearance dark"

# cd $E2E_REPORT_FOLDER
# tree -H '.' -L 1 --noreport --dirsfirst -T 'e2e reports' -s -D --charset utf-8 -I "index.html" -o index.html



exit
