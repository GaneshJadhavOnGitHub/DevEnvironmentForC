# DevEnvironmentForC

VS-Code based set up for writing c programs in a containerised environment.

Steps to Set-up

1. Go through System_Requirements.txt for hardware and software requirements.

2. Clone the repo.

3. Go to DevEnvironmentForC folder.
   cd DevEnvironmentForC 

4. Open this folder in VS-Code

5. It will ask to reopen the folder in container. Click Reopen.
   Otherwise open VS-Code Command pallete (f1) and execute
   following command DevContainers : Open Folder in container.

6. The image is built, and the container is spun up.

7.  Go to .devcontainer folder.
    cd .devcontainer

8. Execute post-create.sh script to install required VS-Code extensions.
   
   chmod +x post-create.sh

   ./post-create.sh      

9. Go to hello_world folder. 

   cd ..
   cd c_programs
   cd hello_world

10. Compile hello_world.c  and execute.

   gcc -g hello_world.c -o hello_world

   ./hello_world

   Remember to use -g flag to compile program with debug symbols.
   -g flag is required for debugging.

11. Set break-point and debug.
    
12. The .vscode/launch.json file is configured to use debugger with this program only
    i.e. for hello_world. 
    To use debugger for any other program, edit launch.json and set 
    "program" property with the path of executable file that you wish to debug.



