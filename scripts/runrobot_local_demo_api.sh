./deleteconfig.sh
./deletereport.sh
ENVIRONMENT="local"

python ../_lib/data/config.py $ENVIRONMENT

bold=$(tput bold)
normal=$(tput sgr0)
number_of_files="0"
echo "${bold}LIST OF TESTCASE:${bold}"
for entry in "../demo_api/testcases"/*
do
    IFS='/' read -r -a array <<< "$entry"
    echo ${array[@]:(-1)}
    for drop in "../demo_api/testcases/${array[@]:(-1)}"/*
    do
        IFS='/' read -r -a droparray <<< "$drop"
        echo "${normal}\t${droparray[@]:(-1)}${normal}"
        echo "\t\t${bold}key\t\tvalue"
        for testcases in "../demo_api/testcases/${array[@]:(-1)}/${droparray[@]:(-1)}"/*
        do
            number_of_files=$[$number_of_files+1]
            IFS='/' read -r -a testcasearray <<< "$testcases"
            echo "${normal}\t\t${number_of_files}\t\t${testcasearray[@]:(-1)}${normal}"
            #declare variable like data_1=../demo_api/testcases/demo/user/api_get_user.robot
            declare "data_$number_of_files=../demo_api/testcases/${array[@]:(-1)}/${droparray[@]:(-1)}/${testcasearray[@]:(-1)}"
        done
    done
done

read -p "${bold}Input test case key: ${normal}" testkey
echo $testkey

declare "pathGet=data_$testkey"
declare "path=${!pathGet}"
robot -V ../_conf/env_$ENVIRONMENT.py --outputdir ../automation/report --listener "allure_robotframework;../report/output" ${path}

## command to run robot
#robot -V ../_conf/env_$ENVIRONMENT.py --outputdir ../automation/report --listener "allure_robotframework;../report/output" ../demo_api/testcases/demo/playland/postgres.robot