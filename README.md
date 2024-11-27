## How to get started with Bash scripting

## Running Bash commands from the command line

As mentioned above, the shell prompt looks like this:

```
[username@host ~]$
```

You can enter any command after the `$` sign and see the result in the terminal.

Generally, commands follow this syntax:

```
command [OPTIONS] arguments
```

Let's look at some basic bash commands and see their results. Don't forget to follow the instructions! :)

### Basic commands:

- **`date`**: Displays the current date.

    ````bash
    zaira@Zaira:~/shell-tutorial$ date
    Tue Mar 14 13:08:57 PKT 2023
    ```

- **`pwd`**: Show current working directory

    ````bash
    zaira@Zaira:~/shell-tutorial$ pwd
    /home/zaira/shell-tutorial
    ```

- **``ls`**: List the contents of the current directory

    ````bash
    zaira@Zaira:~/shell-tutorial$ ls
    check_plaindrome.sh count_odd.sh env log temp
    ```

- **`echo`**: Print a string or the value of a variable to the terminal

    ````bash
    zaira@Zaira@Zaira:~/shell-tutorial$ echo ‘Hello bash’
    Hello bash
    ```

You can always consult a command manual with the `man` command.

For example, the `ls` manual looks like this:

> Image

You can see the options for a command in detail using `man`.
## How to Create and Run Bash Scripts

### Script Naming Conventions

By naming convention, Bash scripts typically end with `.sh`. However, Bash scripts can run perfectly fine without the `.sh` extension.

### Adding the Shebang

Bash scripts begin with a shebang. The shebang is a combination of the `#` symbol and the `!` symbol, followed by the path to the Bash shell. This is the first line of the script. The shebang instructs the shell to execute the script using the Bash shell. It is simply an absolute path to the Bash interpreter.

Below is an example of a shebang declaration:

```bash
#!/bin/bash
```

You can find the path to your Bash shell (which may differ from the above) using the following command:

```bash
which bash
```

### How to Execute a Bash Script
# Using `chmod` and Running Scripts

- **`chmod`**: Modifies the file's permissions for the current user: `u`.
- **`+x`**: Grants execute permissions to the current user. This means the file owner can now run the script.

### Example:
`run_all.sh` is the file we want to execute.

You can execute the script using any of the following methods:

```bash
sh run_all.sh
```

```bash
bash run_all.sh
```

```bash
./run_all.sh
```
## Variables and Data Types in Bash

Variables allow you to store data. You can use variables to read, access, and manipulate data throughout a script.

In Bash, there are no strict data types. A variable can store numeric values, single characters, or strings.

### Using Variables in Bash

You can assign and use variable values in the following ways:

- **Assigning a value directly**:

    ```bash
    country=Pakistan
    ```

- **Assigning a value based on the output of a program or command** using command substitution. Note that `$` is required to access the value of an existing variable:

    ```bash
    same_country=$country
    ```

### Accessing the Value of a Variable

To access the value of a variable, prepend `$` to the variable name:

```bash
zaira@Zaira:~$ country=Pakistan
zaira@Zaira:~$ echo $country
Pakistan
zaira@Zaira:~$ new_country=$country
zaira@Zaira:~$ echo $new_country
Pakistan
```

# Input and Output in Bash Scripts

## Gathering Information

This section discusses methods to provide input to your scripts.

### Reading User Input and Storing it in a Variable

You can read user input using the `read` command.

```bash
#!/bin/bash

echo "What's your name?"

read entered_name

echo -e "\nWelcome to the Bash tutorial, $entered_name"
```

> Image

### Reading from a File

This code reads each line from a file called `input.txt` and prints it to the terminal. We'll explore `while` loops in more detail later in this article.

```bash
while read line
do
  echo $line
done < input.txt
```

### Command-Line Arguments

In a Bash script or function, `$1` denotes the first argument passed, `$2` denotes the second argument, and so on.

This script takes a name as a command-line argument and prints a personalised greeting:

```bash
echo "Hello, $1!"
```

For example, we supply `Zaira` as an argument to the script:

```bash
#!/bin/bash
echo "Hello, $1!"
```

# Displaying Output

Here are some methods for receiving output from scripts.

### Printing to the Terminal

```bash
echo "Hello, World!"
```

This prints the text "Hello, World!" to the terminal.

### Writing to a File

```bash
echo "This is some text." > output.txt
```

This writes the text "This is some text." to a file named `output.txt`. Note that the `>` operator overwrites a file if it already has content.

### Appending to a File

```bash
echo "More text." >> output.txt
```

This appends the text "More text." to the end of the `output.txt` file.

### Redirecting Output

```bash
ls > files.txt
```

This lists files in the current directory and writes the output to a file called `files.txt`. You can redirect the output of any command to a file this way.

## Basic Bash Commands (`echo`, `read`, etc.)

Below is a list of commonly used Bash commands:

- **`cd`**: Changes the directory.
- **`ls`**: Lists the contents of the current directory.
- **`mkdir`**: Creates a new directory.
- **`touch`**: Creates a new file.
- **`rm`**: Deletes a file or directory.
- **`cp`**: Copies a file or directory.
- **`mv`**: Moves or renames a file or directory.
- **`echo`**: Prints text to the terminal.
- **`cat`**: Concatenates and displays the contents of a file.
- **`grep`**: Searches for a pattern in a file.
- **`chmod`**: Changes file or directory permissions.
- **`sudo`**: Runs a command with administrative privileges.
- **`df`**: Shows available disk space.
- **`history`**: Displays a list of previously executed commands.
- **`ps`**: Shows information about running processes.

# Conditional Statements (`if/else`)

Expressions that produce a boolean result, either true or false, are called conditions. Various forms of conditionals include `if`, `if-else`, `if-elif-else`, and nested conditionals.

### Syntax

```bash
if [[ condition ]];
then
    statement
elif [[ condition ]]; then
    statement
else
    do this by default
fi
```

Logical operators such as `-a` (AND) and `-o` (OR) can be used for more complex comparisons.

```bash
if [ $a -gt 60 -a $b -lt 100 ]
```

### Example: Using `if`, `if-else`, and `if-elif-else`

Here's a Bash script that determines if a number entered by the user is positive, negative, or zero:

```bash
#!/bin/bash

echo "Please enter a number: "
read num

if [ $num -gt 0 ]; then
  echo "$num is positive"
elif [ $num -lt 0 ]; then
  echo "$num is negative"
else
  echo "$num is zero"
fi
```

### See it in Action 🚀

# Loops and Branching in Bash

## While Loop

`while` loops check if a condition exists and repeat the loop as long as the condition is `true`. A counter statement is required to control the loop's execution.

In the following example, `(( i += 1 ))` increments the value of `i`. The loop will execute exactly 10 times.

```bash
#!/bin/bash
i=1
while [[ $i -le 10 ]] ; do
   echo "$i"
   (( i += 1 ))
done
```

## For Loop

The `for` loop, like the `while` loop, allows statements to execute a specific number of times. The syntax and usage differ.

In this example, the loop iterates 5 times.

```bash
#!/bin/bash
for i in {1..5}
do
    echo $i
done
```

## Case Statements

In Bash, `case` statements are used to compare a given value against a list of patterns and execute a block of code based on the first matching pattern. The syntax for a `case` statement in Bash is as follows:

```bash
case expression in
    pattern1)
        # code to execute if expression matches pattern1
        ;;
    pattern2)
        # code to execute if expression matches pattern2
        ;;
    pattern3)
        # code to execute if expression matches pattern3
        ;;
    *)
        # code to execute if none of the above patterns match expression
        ;;
esac
```

### Example

```bash
fruit="apple"

case $fruit in
    "apple")
        echo "This is a red fruit."
        ;;
    "banana")
        echo "This is a yellow fruit."
        ;;
    "orange")
        echo "This is an orange fruit."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac
```

In this example, since the value of `fruit` is `"apple"`, the first pattern matches, and the block of code prints "This is a red fruit." If the value of `fruit` were `"banana"`, the second pattern would match, printing "This is a yellow fruit," and so on. If `fruit` does not match any specified pattern, the default case executes, printing "Unknown fruit."

# Activity 1

Create a script to monitor CPU and memory usage, sending alerts if they exceed a defined threshold.

# Activity 2

Automate the cleanup of temporary files older than seven days.
