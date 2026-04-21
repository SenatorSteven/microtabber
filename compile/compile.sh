
# compile.sh
#
# MIT License
#
# Copyright (C) 2025 Stefanos "Steven" Tsakiris
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#!/bin/bash

NAME="compile.sh";
TAB="\t";
true=1;
false=0;

function main(){
	[ $true                        ] && { local argc=$#;                                                                                                                                             } || :;
	[ $true                        ] && { local argv=("$@");                                                                                                                                         } || :;
	[ $true                        ] && { local help=$false;                                                                                                                                         } || :;
	[ $true                        ] && { local debug=$false;                                                                                                                                        } || :;
	[ $true                        ] && { local force=$false;                                                                                                                                        } || :;
	[ $true                        ] && { local errors=$false;                                                                                                                                       } || :;
	[ $true                        ] && { local shared="";                                                                                                                                           } || :;
	[ $true                        ] && { local headerFolder="";                                                                                                                                     } || :;
	[ $true                        ] && { local sourceFolder="";                                                                                                                                     } || :;
	[ $true                        ] && { local debugFolder="";                                                                                                                                      } || :;
	[ $true                        ] && { local outputFolder="";                                                                                                                                     } || :;
	[ $true                        ] && { local recordFolder="";                                                                                                                                     } || :;
	[ $true                        ] && { local definesArray="";                                                                                                                                     } || :;
	[ $true                        ] && { local includesArray="";                                                                                                                                    } || :;
	[ $true                        ] && { local systemArray="";                                                                                                                                      } || :;
	[ $true                        ] && { local utilityArray="";                                                                                                                                     } || :;
	[ $true                        ] && { local functionArray="";                                                                                                                                    } || :;
	[ $true                        ] && { local mainArray="";                                                                                                                                        } || :;
	[ $true                        ] && { local executableArray="";                                                                                                                                  } || :;
	[ $true                        ] && { local librariesInput="";                                                                                                                                   } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "help"          ] && { help=$true;                     break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "debug"         ] && { debug=$true;                    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "force"         ] && { force=$true;                    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "errors"        ] && { errors=$true;                   break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "shared"        ] && { shared="${argv[i+1]}";          break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "header-folder" ] && { headerFolder="${argv[i+1]}";    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "source-folder" ] && { sourceFolder="${argv[i+1]}";    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "debug-folder"  ] && { debugFolder="${argv[i+1]}";     break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "output-folder" ] && { outputFolder="${argv[i+1]}";    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "record-folder" ] && { recordFolder="${argv[i+1]}";    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "defines"       ] && { definesArray="${argv[i+1]}";    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "includes"      ] && { includesArray="${argv[i+1]}";   break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "systems"       ] && { systemArray="${argv[i+1]}";     break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "utilities"     ] && { utilityArray="${argv[i+1]}";    break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "functions"     ] && { functionArray="${argv[i+1]}";   break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "mains"         ] && { mainArray="${argv[i+1]}";       break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "executables"   ] && { executableArray="${argv[i+1]}"; break; } || :; done                              } || :;
	[ $true                        ] && { for ((i = 0; i < $argc; ++i)); do [ "${argv[i]}" = "libraries"     ] && { librariesInput="${argv[i+1]}";  break; } || :; done                              } || :;
	[ "$argc" == "0"               ] && { help=$true;                                                                                                                                                } || :;
	[ $help = $true                ] && { arguments="\\ \n${TAB}help \\ \n${TAB}debug \\ \n${TAB}force \\ \n${TAB}errors \\ \n${TAB}shared [soname]";                                                } || :;
	[ $help = $true                ] && { arguments="$arguments \\ \n${TAB}header-folder [folder] \\ \n${TAB}source-folder [folder] \\ \n${TAB}debug-folder [folder]";                               } || :;
	[ $help = $true                ] && { arguments="$arguments \\ \n${TAB}output-folder [folder] \\ \n${TAB}record-folder [folder] \\ \n${TAB}defines [-Ddefine1 ... -Ddefinen]";                   } || :;
	[ $help = $true                ] && { arguments="$arguments \\ \n${TAB}includes [-Iinclude1 ... -Iincluden] \\ \n${TAB}systems [system1,...,systemn]";                                           } || :;
	[ $help = $true                ] && { arguments="$arguments \\ \n${TAB}utilities [utility1,...,utilityn] \\ \n${TAB}functions [function1,...,functionn]";                                        } || :;
	[ $help = $true                ] && { arguments="$arguments \\ \n${TAB}mains [main1,...,mainn] \\ \n${TAB}executables [executable1,...,executablen]";                                            } || :;
	[ $help = $true                ] && { arguments="$arguments \\ \n${TAB}libraries [-llibrary1 ... -llibraryn]";                                                                                   } || :;
	[ $help = $true                ] && { printf "$NAME: usage: $NAME $arguments\n" 1>&2;                                                                                             return 0;      } || :;
	[ $force = $true               ] && { rm -rf "$debugFolder" "$outputFolder" "$recordFolder";                                                                                                     } || :;
	[ $true                        ] && { mkdir -p "$debugFolder" "$outputFolder" "$recordFolder";                                                                                                   } || :;
	[ ! -d "$headerFolder"         ] && { printf "$NAME: could not read header directory\n" 1>&2;                                                                                     return 1;      } || :;
	[ ! -d "$sourceFolder"         ] && { printf "$NAME: could not read source directory\n" 1>&2;                                                                                     return 1;      } || :;
	[ ! -d "$debugFolder"          ] && { printf "$NAME: could not create debug directory\n" 1>&2;                                                                                    return 1;      } || :;
	[ ! -d "$outputFolder"         ] && { printf "$NAME: could not create output directory\n" 1>&2;                                                                                   return 1;      } || :;
	[ ! -d "$recordFolder"         ] && { printf "$NAME: could not create record directory\n" 1>&2;                                                                                   return 1;      } || :;
	[ -n "$definesArray"           ] && { definesArray=($(expandStringToArray $'\n' "$definesArray"));                                                                                               } || :;
	[ -n "$includesArray"          ] && { includesArray=($(expandStringToArray $'\n' "$includesArray"));                                                                                             } || :;
	[ -n "$systemArray"            ] && { systemArray=($(expandStringToArray $'\n' "$systemArray"));                                                                                                 } || :;
	[ -n "$utilityArray"           ] && { utilityArray=($(expandStringToArray $'\n' "$utilityArray"));                                                                                               } || :;
	[ -n "$functionArray"          ] && { functionArray=($(expandStringToArray $'\n' "$functionArray"));                                                                                             } || :;
	[ -n "$mainArray"              ] && { mainArray=($(expandStringToArray $'\n' "$mainArray"));                                                                                                     } || :;
	[ -n "$executableArray"        ] && { executableArray=($(expandStringToArray $'\n' "$executableArray"));                                                                                         } || :;
	[ $true                        ] && { printf "\x1b[?25l";                                                                                                                                        } || :;
	[ $true                        ] && { compileProject;                                                                                                                                            } || :;
	[ $true                        ] && { printf "\x1b[?25h";                                                                                                                                        } || :;
	[ $debug != $true              ] && { rm -rf "$debugFolder";                                                                                                                      return 0;      } || :;
}
function expandStringToArray(){
	[ $true                        ] && { local array=();                                                                                                                                            } || :;
	[ ! -n "$1"                    ] && { printf "";                                                                                                                                  return $false; } || :;
	[ ! -n "$2"                    ] && { printf "";                                                                                                                                  return $false; } || :;
	[ $true                        ] && { mapfile -td '' array < <(printf '%s\0' "$2");                                                                                                              } || :;
	[ $true                        ] && { printf '%s\n' "${array[@]}";                                                                                                                return $true;  } || :;
}
function compileProject(){
	[ $true                        ] && { local longestNameLength=0;                                                                                                                                 } || :;
	[ $true                        ] && { local units="";                                                                                                                                            } || :;
	[ -n "$systemArray"            ] && { for i in "${systemArray[@]}";     do i=${i#*/}; (( ${#i} > $longestNameLength )) && { longestNameLength=${#i}; } || :; done;                               } || :;
	[ -n "$utilityArray"           ] && { for i in "${utilityArray[@]}";    do i=${i#*/}; (( ${#i} > $longestNameLength )) && { longestNameLength=${#i}; } || :; done;                               } || :;
	[ -n "$functionArray"          ] && { for i in "${functionArray[@]}";   do i=${i#*/}; (( ${#i} > $longestNameLength )) && { longestNameLength=${#i}; } || :; done;                               } || :;
	[ -n "$mainArray"              ] && { for i in "${mainArray[@]}";       do i=${i#*/}; (( ${#i} > $longestNameLength )) && { longestNameLength=${#i}; } || :; done;                               } || :;
	[ -n "$executableArray"        ] && { for i in "${executableArray[@]}"; do i=${i#*/}; (( ${#i} > $longestNameLength )) && { longestNameLength=${#i}; } || :; done;                               } || :;
	[ -n "$systemArray"            ] && { printf "systems:\n";     for i in "${systemArray[@]}";     do compileObject  "$i"; done; printf "${TAB}done\n\n";                                          } || :;
	[ -n "$utilityArray"           ] && { printf "utilities:\n";   for i in "${utilityArray[@]}";    do compileObject  "$i"; done; printf "${TAB}done\n\n";                                          } || :;
	[ -n "$functionArray"          ] && { printf "functions:\n";   for i in "${functionArray[@]}";   do compileObject  "$i"; done; printf "${TAB}done\n\n";                                          } || :;
	[ -n "$mainArray"              ] && { printf "mains:\n";       for i in "${mainArray[@]}";       do compileObject  "$i"; done; printf "${TAB}done\n\n";                                          } || :;
	[ -n "$executableArray"        ] && { printf "executables:\n"; for i in "${executableArray[@]}"; do compileProgram "$i"; done; printf "${TAB}done\n\n";                                          } || :;
	[ $true                        ] && {                                                                                                                                             return $true;  } || :;
}



# works, should still check validity below this line ------------------------------------------------------------------------------------------------------------------------------------------------------

function compileObject(){
	[ $true                        ] && { local name="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local subdirectory="";                                                                                                                                     } || :;
	[ $true                        ] && { local value=$false;                                                                                                                                        } || :;
	[ $true                        ] && { local mustCompile=$false;                                                                                                                                  } || :;
	[ ! -n "$name"                 ] && { printf "${TAB}no object to compile\n" 1>&2;                                                                                                 return $false; } || :;
	[ "${name%%/*}" != "$name"     ] && { subdirectory="/${name%%/*}";                                                                                                                               } || :;
	[ $true                        ] && { name="${name#*/}";                                                                                                                                         } || :;
	[ $true                        ] && { updateVersionFile "$headerFolder$subdirectory/$name.hold"; value=$?;                                                                                       } || :;
	[ $value = $true               ] && { mustCompile=$true;                                                                                                                                         } || :;
	[ $true                        ] && { updateVersionFile "$sourceFolder$subdirectory/$name.cold"; value=$?;                                                                                       } || :;
	[ $value = $true               ] && { mustCompile=$true;                                                                                                                                         } || :;
	[ ! -f "$outputFolder/$name.o" ] && { mustCompile=$true;                                                                                                                                         } || :;
	[ $mustCompile != $true        ] && { units="$units $outputFolder/$name.o";                                                                                                       return $false; } || :;
	[ $true                        ] && { translateFile "$sourceFolder$subdirectory/$name.cold";                                                                                      return $true;  } || :;
}
function compileProgram(){
	[ $true                        ] && { local name="$1";                                                                                                                                           } || :;
	[ ! -n "$name"                 ] && { printf "${TAB}no object to compile\n" 1>&2;                                                                                                 return $false; } || :;
	[ $true                        ] && { compileExecutable "$name";                                                                                                                  return $true;  } || :;
}
function updateVersionFile(){
	[ $true                        ] && { local file="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local oldDate="";                                                                                                                                          } || :;
	[ $true                        ] && { local newDate="";                                                                                                                                          } || :;
	[ ! -n "$file"                 ] && { printf "${TAB}no version file to update\n" 1>&2;                                                                                            return $false; } || :;
	[ ! -f "$file"                 ] && { printf "${TAB}version file \"${file##*/}\" does not exist\n" 1>&2;                                                                          return $false; } || :;
	[ $true                        ] && { dateFile="$recordFolder/${file##*/}.date";                                                                                                                 } || :;
	[ $true                        ] && { oldDate=$(cat "$dateFile" 2> "/dev/null");                                                                                                                 } || :;
	[ $true                        ] && { newDate=$(stat -c "%y" "$file");                                                                                                                           } || :;
	[ "$newDate" = "$oldDate"      ] && {                                                                                                                                             return $false; } || :;
	[ $true                        ] && { printf "$newDate\n" > "$dateFile";                                                                                                          return $true;  } || :;
}
function translateFile(){
	[ $true                        ] && { local file="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local value=$false;                                                                                                                                        } || :;
	[ ! -n "$file"                 ] && { printf "${TAB}no file to translate\n" 1>&2;                                                                                                 return $false; } || :;
	[ ! -f "$file"                 ] && { printf "${TAB}translation file \"${file##*/}\" does not exist\n" 1>&2;                                                                      return $false; } || :;
	[ $true                        ] && { rm -f "/tmp/.compile.txt";                                                                                                                                 } || :;
	[ $true                        ] && { printf "${TAB}translating $name...%-$(($longestNameLength - ${#name}))s";                                                                                  } || :;
	[ $true                        ] && { printf " [\x1b[90mpreprocessing\x1b[0m] [\x1b[90mcompilation\x1b[0m] [\x1b[90massembly\x1b[0m] [\x1b[90mlinking\x1b[0m]\x1b[51D";                          } || :;
	[ $true                        ] && { preprocessFile "$file";                                                                                                                                    } || :;
	[ $true                        ] && { compileFile "$file";                                                                                                                                       } || :;
	[ $true                        ] && { assembleFile "$file"; value=$?;                                                                                                                            } || :;
	[ $value = $true               ] && { units="$units $outputFolder/$name.o";                                                                                                                      } || :;
	[ $true                        ] && { printf " [\x1b[90mlinking\x1b[0m]\n";                                                                                                                      } || :;
	[ -s "/tmp/.compile.txt"       ] && { rm -f "$recordFolder/${file##*/}.date";                                                                                                                    } || :;
	[ $errors != $true             ] && { rm -f "/tmp/.compile.txt";                                                                                                                  return $true;  } || :;
	[ -s "/tmp/.compile.txt"       ] && { sed "s/^/${TAB}${TAB}/" "/tmp/.compile.txt" 1>&2; printf "\n\n\n" 1>&2;                                                                                    } || :;
	[ $true                        ] && { rm -f "/tmp/.compile.txt";                                                                                                                  return $true;  } || :;
}
function compileExecutable(){
	[ $true                        ] && { local name="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local value=$false;                                                                                                                                        } || :;
	[ ! -n "$name"                 ] && { printf "${TAB}no executable file to create\n" 1>&2;                                                                                         return $false; } || :;
	[ $true                        ] && { rm -f "/tmp/.compile.txt";                                                                                                                                 } || :;
	[ $true                        ] && { printf "${TAB}linking     $name...%-$(($longestNameLength - ${#name}))s";                                                                                  } || :;
	[ $true                        ] && { printf " [\x1b[90mpreprocessing\x1b[0m] [\x1b[90mcompilation\x1b[0m] [\x1b[90massembly\x1b[0m] [\x1b[90mlinking\x1b[0m]";                                  } || :;
	[ $true                        ] && { printf "\x1b[10D";                                                                                                                                         } || :;
	[ $true                        ] && { linkFile "$name";                                                                                                                                          } || :;
	[ $true                        ] && { printf "\n";                                                                                                                                               } || :;
	[ $errors != $true             ] && { rm -f "/tmp/.compile.txt";                                                                                                                  return $true;  } || :;
	[ -s "/tmp/.compile.txt"       ] && { sed "s/^/${TAB}${TAB}/" "/tmp/.compile.txt" 1>&2; printf "\n\n\n" 1>&2;                                                                                    } || :;
	[ $true                        ] && { rm -f "/tmp/.compile.txt";                                                                                                                  return $true;  } || :;
}
function preprocessFile(){
	[ $true                        ] && { local file="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local name="";                                                                                                                                             } || :;
	[ $true                        ] && { local settings="$definesArray $includesArray -fdiagnostics-color=always -x c -S -std=c89 -Os";                                                             } || :;
	[ $true                        ] && { local warnings="";                                                                                                                                         } || :;
	[ $true                        ] && { local libraries="";                                                                                                                                        } || :;
	[ $true                        ] && { local value="";                                                                                                                                            } || :;
	[ $true                        ] && { local color="\x1b[32m";                                                                                                                                    } || :;
	[ ! -n "$file"                 ] && { printf "${TAB}no file to preprocess\n" 1>&2;                                                                                                return $false; } || :;
	[ ! -f "$file"                 ] && { printf "${TAB}preprocessing file \"${file##*/}\" does not exist\n" 1>&2;                                                                    return $false; } || :;
	[ $true                        ] && { name="${file##*/}"; name="${name%.*}";                                                                                                                     } || :;
	[ $true                        ] && { gcc $settings $warnings $libraries -E "$sourceFolder$subdirectory/$name.cold" > "$debugFolder/$name.i" 2> "/tmp/._compile.txt"; value="$?";                } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i '/#warning/ {/#warning/{n;N;d}}' "/tmp/._compile.txt"; sed -i 's/#warning //g'          "/tmp/._compile.txt";                                       } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i 's/ \[.*-Wcpp.*\]$//g'           "/tmp/._compile.txt"; sed -i 's/:[0-9]\+:[0-9]\+:/:/g' "/tmp/._compile.txt";                                       } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i '1s/^/\n/' "/tmp/._compile.txt"; color="\x1b[33m"; cat "/tmp/._compile.txt" >> "/tmp/.compile.txt";                                                 } || :;
	[ -f "/tmp/._compile.txt"      ] && { rm -f "/tmp/._compile.txt";                                                                                                                                } || :;
	[ "$value" != "0"              ] && { color="\x1b[31m";                                                                                                                                          } || :;
	[ $true                        ] && { printf " [${color}preprocessing\x1b[0m]";                                                                                                                  } || :;
	[ "$value" != "0"              ] && {                                                                                                                                             return $false; } || :;
	[ $true                        ] && {                                                                                                                                             return $true;  } || :;
}
function compileFile(){
	[ $true                        ] && { local file="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local name="";                                                                                                                                             } || :;
	[ $true                        ] && { local settings="$includesArray -fdiagnostics-color=always -x c -std=c89 -Os -fpreprocessed";                                                               } || :;
	[ $true                        ] && { local warnings="";                                                                                                                                         } || :;
	[ $true                        ] && { local libraries="";                                                                                                                                        } || :;
	[ $true                        ] && { local value="";                                                                                                                                            } || :;
	[ $true                        ] && { local color="\x1b[32m";                                                                                                                                    } || :;
	[ -n "$shared"                 ] && { settings="-fPIC $settings";                                                                                                                                } || :;
	[ $true                        ] && { warnings="$warnings -Waddress -Warray-bounds=1 -Wbool-compare -Wbool-operation -Wcast-function-type -Wchar-subscripts";                                    } || :;
	[ $true                        ] && { warnings="$warnings -Wclobbered -Wduplicate-decl-specifier -Wempty-body -Wformat -Wformat-overflow -Wformat-truncation";                                   } || :;
	[ $true                        ] && { warnings="$warnings -Wignored-qualifiers -Wimplicit -Wimplicit-fallthrough=3 -Wimplicit-function-declaration";                                             } || :;
	[ $true                        ] && { warnings="$warnings -Wimplicit-int -Winit-self -Wint-in-bool-context -Wlogical-not-parentheses -Wmain -Wmaybe-uninitialized";                              } || :;
	[ $true                        ] && { warnings="$warnings -Wmemset-elt-size -Wmemset-transposed-args -Wmissing-attributes -Wmissing-braces";                                                     } || :;
	[ $true                        ] && { warnings="$warnings -Wmissing-field-initializers -Wmissing-parameter-type -Wmultistatement-macros -Wnarrowing -Wnonnull";                                  } || :;
	[ $true                        ] && { warnings="$warnings -Wnonnull-compare -Wold-style-declaration -Wopenmp-simd -Woverride-init -Wparentheses -Wpedantic";                                     } || :;
	[ $true                        ] && { warnings="$warnings -Wpointer-sign -Wrestrict -Wreturn-type -Wsequence-point -Wshift-negative-value -Wsign-compare";                                       } || :;
	[ $true                        ] && { warnings="$warnings -Wsizeof-pointer-div -Wsizeof-pointer-memaccess -Wstrict-aliasing -Wstrict-overflow=1 -Wswitch";                                       } || :;
	[ $true                        ] && { warnings="$warnings -Wtautological-compare -Wtrigraphs -Wtype-limits -Wuninitialized -Wunknown-pragmas";                                                   } || :;
	[ $true                        ] && { warnings="$warnings -Wunused-but-set-parameter -Wunused-function -Wunused-label -Wunused-parameter -Wunused-value";                                        } || :;
	[ $true                        ] && { warnings="$warnings -Wunused-variable -Wvolatile-register-var";                                                                                            } || :;
	[ ! -n "$file"                 ] && { printf "${TAB}no file to compile\n" 1>&2;                                                                                                   return $false; } || :;
	[ ! -f "$file"                 ] && { printf "${TAB}compilation file \"${file##*/}\" does not exist\n" 1>&2;                                                                      return $false; } || :;
	[ $true                        ] && { name="${file##*/}"; name="${name%.*}";                                                                                                                     } || :;
	[ $true                        ] && { gcc $settings $warnings $libraries -S "$debugFolder/$name.i" -o "$debugFolder/$name.s" &> "/tmp/._compile.txt"; value="$?";                                } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i '/#warning/ {/#warning/{N;N;N;d}}' "/tmp/._compile.txt";                                                                                            } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i '1s/^/\n/' "/tmp/._compile.txt"; color="\x1b[33m"; cat "/tmp/._compile.txt" >> "/tmp/.compile.txt";                                                 } || :;
	[ -f "/tmp/._compile.txt"      ] && { rm -f "/tmp/._compile.txt";                                                                                                                                } || :;
	[ "$value" != "0"              ] && { color="\x1b[31m";                                                                                                                                          } || :;
	[ $true                        ] && { printf " [${color}compilation\x1b[0m]";                                                                                                                    } || :;
	[ "$value" != "0"              ] && {                                                                                                                                             return $false; } || :;
	[ $true                        ] && {                                                                                                                                             return $true;  } || :;
}
function assembleFile(){
	[ $true                        ] && { local file="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local name="";                                                                                                                                             } || :;
	[ $true                        ] && { local settings="-fdiagnostics-color=always";                                                                                                               } || :;
	[ $true                        ] && { local warnings="";                                                                                                                                         } || :;
	[ $true                        ] && { local libraries="";                                                                                                                                        } || :;
	[ $true                        ] && { local value="";                                                                                                                                            } || :;
	[ $true                        ] && { local color="\x1b[32m";                                                                                                                                    } || :;
	[ ! -n "$file"                 ] && { printf "${TAB}no file to assemble\n" 1>&2;                                                                                                  return $false; } || :;
	[ ! -f "$file"                 ] && { printf "${TAB}assembly file \"${file##*/}\" does not exist\n" 1>&2;                                                                         return $false; } || :;
	[ $true                        ] && { name="${file##*/}"; name="${name%.*}";                                                                                                                     } || :;
	[ $true                        ] && { gcc $settings $warnings $libraries -c "$debugFolder/$name.s" -o "$outputFolder/$name.o" &> "/tmp/._compile.txt"; value="$?";                               } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i '1s/^/\n/' "/tmp/._compile.txt"; color="\x1b[33m"; cat "/tmp/._compile.txt" >> "/tmp/.compile.txt";                                                 } || :;
	[ -f "/tmp/._compile.txt"      ] && { rm -f "/tmp/._compile.txt";                                                                                                                                } || :;
	[ "$value" != "0"              ] && { color="\x1b[31m";                                                                                                                                          } || :;
	[ $true                        ] && { printf " [${color}assembly\x1b[0m]";                                                                                                                       } || :;
	[ "$value" != "0"              ] && {                                                                                                                                             return $false; } || :;
	[ $true                        ] && {                                                                                                                                             return $true;  } || :;
}
function linkFile(){
	[ $true                        ] && { local name="$1";                                                                                                                                           } || :;
	[ $true                        ] && { local settings="-fdiagnostics-color=always -Os";                                                                                                           } || :;
	[ $true                        ] && { local warnings="";                                                                                                                                         } || :;
	[ $true                        ] && { local libraries="$librariesInput";                                                                                                                         } || :;
	[ $true                        ] && { local value="";                                                                                                                                            } || :;
	[ $true                        ] && { local color="\x1b[32m";                                                                                                                                    } || :;
	[ ! -n "$name"                 ] && { printf "${TAB}no file to link\n" 1>&2;                                                                                                      return $false; } || :;
	[ -n "$shared"                 ] && { settings="-shared $settings -Wl,-soname,$shared"; name="$shared";                                                                                          } || :;
	[ $true                        ] && { gcc $settings $warnings $libraries $units -o "$outputFolder/$name" &> "/tmp/._compile.txt"; value="$?";                                                    } || :;
	[ -s "/tmp/._compile.txt"      ] && { sed -i '1s/^/\n/' "/tmp/._compile.txt"; color="\x1b[33m"; cat "/tmp/._compile.txt" >> "/tmp/.compile.txt";                                                 } || :;
	[ -f "/tmp/._compile.txt"      ] && { rm -f "/tmp/._compile.txt";                                                                                                                                } || :;
	[ "$value" != "0"              ] && { color="\x1b[31m";                                                                                                                                          } || :;
	[ $true                        ] && { printf " [${color}linking\x1b[0m]";                                                                                                                        } || :;
	[ "$value" != "0"              ] && {                                                                                                                                             return $false; } || :;
	[ $true                        ] && {                                                                                                                                             return $true;  } || :;
}

main "$@";
exit $?;

