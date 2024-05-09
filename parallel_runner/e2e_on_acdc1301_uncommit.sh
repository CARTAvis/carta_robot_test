#!/bin/bash

CONDA_PATH=/home/acdc1301/anaconda3/bin
eval "$($CONDA_PATH/conda shell.bash hook)"
conda activate

FRONTEND_FOLDER=/home/acdc1301/carta_build/carta-frontend
BACKEND_FOLDER=/home/acdc1301/carta_build/carta-backend
E2E_FOLDER=/home/acdc1301/carta_robot_test
E2E_RUN_FOLDER=/home/acdc1301/carta_robot_test/parallel_runner
E2E_REPORT_FOLDER=/home/acdc1301/e2e_reports

function git_func() {
    cd $1
    git fetch
    git clean -f
    git checkout -f $2
    git pull
    # git status
}


## default branchs
f_branch=dev
b_branch=dev
e2e_branch=main
git_func $FRONTEND_FOLDER $f_branch
git_func $BACKEND_FOLDER $b_branch
git_func $E2E_FOLDER $e2e_branch


if [[ $# -eq 0 ]]; then
    echo "enter flag -f, -b, or -t and its argument."
    exit 1
    fi

while [[ $# -gt 0 ]]; do
    case "$1" in
    -f | --frontend)
        FRONTEND_FOLDER=/home/acdc1301/carta_build/carta-frontend-uncommit
        f_branch=uncommit
        ;;
    -b | --backend)
        BACKEND_FOLDER=/home/acdc1301/carta_build/carta-backend-uncommit
        b_branch=uncommit
        ;;
    -t | --e2etest)
        if [[ -n "$2" ]]; then
            e2e_branch="$2"
            git_func $E2E_FOLDER $e2e_branch
        fi
        git_func $E2E_FOLDER $e2e_branch
        shift
        ;;
    --build_f)
        cd $FRONTEND_FOLDER 
        git submodule update
        npm install --legacy-peer-deps & 
        wait ${!}
        npm run build-docker &
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
--variable DELAY:0.2 --variable N_OMP_THREADS:8 --variable PYTHON3_EXECUTABLE:/home/acdc1301/anaconda3/bin/python --variable CARTA_BACKEND_EXECUTABLE:${BACKEND_FOLDER}/build/carta_backend --variable CARTA_FRONTEND_FOLDER:${FRONTEND_FOLDER}/build --variable INITIAL_IMAGE_FOLDER:/home/acdc1301/set_QA_e2e_v2" > config_acdc1301_uncommit.txt


# python parallel_run_acdc1301.py config_acdc1301_uncommit.txt
cd /home/acdc1301/temp_parallel_runner
echo "backend: $b_branch
frontend: $f_branch
e2e: $e2e_branch" > branch_info.txt
python parallel_run_acdc1301.py $E2E_RUN_FOLDER/config_acdc1301_uncommit.txt


conda deactivate

cd $E2E_REPORT_FOLDER
tree -H '.' -L 1 --noreport --dirsfirst -T 'e2e reports' -s -D --charset utf-8 -I "index.html" -o index.html



exit
