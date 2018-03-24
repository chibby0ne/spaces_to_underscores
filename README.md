# Spaces to Underscores 

Found myself fighting with the escaped spaces in the shell, one to many times.

Renames files in the given directory, by replacing groups of adjacent whitespaces with an underscore (\_).

# Usage

When it finds something to rename:

```
meeseeks@home:~/test_dir $ ./spaces_to_underscores.sh .
Changed a dir to a_dir
Changed a  file to a_file
```

When it doesn't find something to rename:

```
meeseeks@home:~/test_dir $ ./spaces_to_underscores.sh .
No files with spaces. No files renamed.
```

When the given directory is not searchable by the current user:

```
meeseeks@home:~/test_dir $ ./spaces_to_underscores.sh .
No files with spaces. No files renamed.
```

```
meeseeks@home:~/test_dir $ ./spaces_to_underscores.sh .
Cannot search root_dir directory. Check directory permissions.
```

## License 

MIT 
