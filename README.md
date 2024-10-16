# **Usage Guidelines**

Please follow the steps below.

## Preparation

1. MongoDB version 4.4.22

   The database that storing target collection data.

2. MySQL version 8.0

   The database that storing oqmd data source.

3. Python 3.9 virtual environment

   Environment required for program operation.

4. Project which includes code and data

   The data includes *testdata* folder and *oqmd_test.sql* file.



## Data

1. Vasp test data

   The test data is stored in the ***testdata*** path, including three folders.

2. OQMD test data

   The test data is named ***oqmd_test.sql*** and needs to be imported into MySQL database.



## Environment

1. In a python virtual environment and in the root directory of the project , install packages in the ***requirements.txt*** file.

```shell
pip install -r requirements.txt
```

2. Modify the MySQL user configuration in the ***config.yaml*** file. You need to change it to your own local database access username and password.

## Test

1. Test VASP file

   Type the following command in the command line:

   ```shell
   python run.py --source vasp --root_dir testdata [--log]
   ```

   --log : options. If add, print to file saved to log folder, else print to command line.

   

2. Test OQMD data

   Type the following command in the command line:

   ```shell
   python run.py --source oqmd [--log]
   ```

   --log : options. If add, print to file saved to log folder, else print to command line.



## Run

When running the program, you will be asked to fill in some prompts. Just press **Enter** by default.



## **Result**

View the results in the MongoDB.