# BNOTES
A note-taking application, written in QuickBasic 4.5, for DOS. Designed for 
compatibility with DOSBox. 

This is mostly a project that I started as a learning adventure to write
more efficient code, although I do intend to use it myself. If someone else
wants to use, share, and/or improve it, then that's awesome! I chose a
permissive BSD 2-clause license to make that as frictionless as possible.

## General Goals the project
I primarily want to learn better coding practices, but the general goals
for the program are: (1) run-of-the-mill DOS compatibility and (2) 
generating the note files in AsciiDoc format.

### DOS Compatibility
The main goal is to be able to have an executable that runs in DOSBox 
without a memory extender (like is required with FreeBASIC). I want the 1MB
RAM constraint! 

### AsciiDoc Formatting
I chose to use AsciiDoc formatting for the note files, because it is a
clearly defined standard and is very easy to read in plaintext. It also 
has the added benefit of being able to be converted to other document
formats, like HTML and PDF, with modern tools.

## Why DOS? Why QuickBasic? In 2019?!
QuickBasic 4.5 and DOS are definitely outdated, and not really useful in 
2019. However, it **was** an extremely popular language in the past and
there are still communities online with good reference materials. The
constraints involved in developing for DOS seemed like a good limiting
factor that would force me to code more efficiently. QB64 also might allow
running this on modern systems, but I'm not testing that yet -- this is a
DOS-only application for now!

## Where to find compiled binaries
Nowhere! I haven't figured out how, or even if, I will publish binaries.

## Building an EXE from the code
Currently, I don't have a working build script that I can share. For the
time being, the only way to build an EXE is to open the project in the
QuickBasic 4.5 IDE and compile it through the **Run** menu.

## Simple walkthrough of the source code 
The code is broken up into module files in a fairly standard way for
QuickBasic applications using a .MAK file that tells QuickBasic which files
to load. 

### BNOTES.BAS - The Main Program Module
BNOTES.BAS is the main program module that performs some initialization of
the program and controls the flow of the interface using a CASE inside of a
loop.

### Supporting Modules
The supporting modules contain the functions and subs for the program. All
of these files will start with "BN-" and have a .BAS extension.

* BN-FOUT.BAS - Contains procedures that write output to files.
* BN-INPUT - Contains procedures that handle user input outside of the main
menu. 
* BN-LOGIC - Contains procedures that are more general in nature, or are
otherwise difficult to categorize.
* BN-MENU - Contains procedures that are related to the menu

### Include modules
There are two include modules (BN-DECLR.BI and BN-VER.BI).

* BN-DECLR.BI - Contains declare statements for all functions and subs
accross all module files. This gets included in all modules.
* BN-VER.BI - Contains a single variable assignment that represents the
version of BNOTES. I put this is its own file so I can increment the build
version automatically in my build script. This is only included in the main
program module. 

## Contributing
Initially, I'm not sure whether or not I will accept contributions via pull
request, but I would like to do that at some point in the future. I don't
expect to get very many, since I doubt anyone will be particularly excited
to be able to write notes in AsciiDoc format on their DOS machines.
