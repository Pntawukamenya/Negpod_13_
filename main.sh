#!/usr/bin/env bash
#function for program loader
function load {
 for i in {1..10}; do
 echo -n "."
 sleep 0.1
done
 echo -e "100%\n"
}
  echo -e "\n\n***************** Welcome To Bachelor of Software      Engineering cohort list of     students ***************\n"
 echo -n "Starting App "
  load
export file_path="students-list_0923.txt"

#----------------------------------------function To Register student
function register {
 #get inputs with function
 read -p "Enter Student Email: " email
 read -p "Enter Student Age : " age
 read -p "Enter Student Id : " id
 
 if [[ $email == *"@alustudent.com" ]]; then

 if [ -e "$file_path" ]; then
 echo "adding Student"
 else
  printf "+----------------------------+----------------------------+-------------------------------------\n">$file_path
 printf "| %-26s | %-26s | %-36s |\n" "student Id" "Age" "Email">>$file_path
 # Print separator line
 printf "+----------------------------+----------------------------+-------------------------------------\n">>$file_path
 echo "Creating Table and Adding Data"
 fi
sleep 1
 #use grep to search if student id column exists
 if grep -E "^\|[[:space:]]*$id[[:space:]]*\|" $file_path; then
 #message notification
 echo -e "\n\n****The Student Id Already Exists***\n"
 #restart app for user to enter new data
sleep 2
clear
./main.sh
 #if the student id does’nt exist then add data to file
 else
 # Print table rows
 printf "| %-26s | %-26s | %-36s |\n" "$id" "$age" "$email" >>$file_path
 printf "+----------------------------+----------------------------+-------------------------------------\n">>$file_path
 #loading message
 echo -n "opening preview loading ";
            load
 #end of loading 
cat $file_path

 echo -e "\n\n returning to Home\n\n"
            load
 #end of loading 
        clear
      ./main.sh
 fi

else
  echo -e "\n\n**************** This is Not A valid ALU Student Email ****************\n\n"
#call the register function if invalid email to allow use input again
 register
fi
}

function view_student {
# Check if the file exists
if [ -f "$file_path" ]; then
#check if file is empty
if [ -s "$file_path" ]; then
#message
echo -e "\n\n \t\t\t*** Viewing All Students ***\n\n\n"
#display students
cat "$file_path"
#and also call restart the app for user to choice other
./main.sh
else
echo "No Student Found. Try Adding New Students."
echo -e "\n\n **** returning to Home **** \n\n"
#call the load function
load
#clear everything and restart the app for user
clear
./main.sh
fi
else
echo "File Not Found."
echo -e "\n\n **** returning to Home **** \n\n"
load
clear
./main.sh
fi
}

#----------------------------function To Update Student

function update_student {
#check file exists
if [ -f "$file_path" ]; then
#get email
read -p "Enter The Student Id To Edit: " id

#check exists of the student id
if grep -E "^\|[[:space:]]*$id[[:space:]]*\|" $file_path; then
#message to the being edited
echo -e "\nYou Are Editing this User\n"
#get data from user age and email
read -p "Enter New Age: " age
read -p "Enter New Email: " email
if [[ $email == *"@alustudent.com" ]]; then
temp_file="temp_file"
found=false
while IFS= read -r line; do
if echo "$line" | grep -q -E "^\|[[:space:]]*$id[[:space:]]*\|"; then
printf "| %-26s | %-26s | %-36s |\n" "$id" "$age" "$email" >> "$temp_file"
found=true
else
echo "$line" >> "$temp_file"
fi
done < "$file_path"
if [ "$found" = false ]; then
echo "Student ID: $id not found in the file."
echo -e "\n\n **** returning to Home **** \n\n"
load
#----------------------------function To Update Student

function update_student {
#check file exists
if [ -f "$file_path" ]; then
#get email
read -p "Enter The Student Id To Edit: " id

#check exists of the student id
if grep -E "^\|[[:space:]]*$id[[:space:]]*\|" $file_path; then
#message to the being edited
echo -e "\nYou Are Editing this User\n"
#get data from user age and email
read -p "Enter New Age: " age
read -p "Enter New Email: " email
if [[ $email == *"@alustudent.com" ]]; then
temp_file="temp_file"
found=false
while IFS= read -r line; do
if echo "$line" | grep -q -E "^\|[[:space:]]*$id[[:space:]]*\|"; then
printf "| %-26s | %-26s | %-36s |\n" "$id" "$age" "$email" >> "$temp_file"
found=true
else
echo "$line" >> "$temp_file"
fi
done < "$file_path"
if [ "$found" = false ]; then
echo "Student ID: $id not found in the file."
echo -e "\n\n **** returning to Home **** \n\n"
load
#end of loading
clear
./main.sh
fi
}


#app menu 
echo -e "\n\n Choose What You Want To Do With Our App\n"
echo "1) Add New Student"
echo "2) View All Students"
echo "3) Edit Existing Student"

# Allow the user to input their choice with read function
echo -e "\n"
read -p "Enter Your choice Here: " choice
echo -e "\n"

# Switch case to call functions according to user need
case $choice in
    1)
        register
        ;;
    2)
        view_student
        ;;
    3)
        update_student
        ;;
    *)
        echo "Invalid choice. Please try again."
        ./main.sh
        ;;
esac
