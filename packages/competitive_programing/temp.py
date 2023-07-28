import os
import glob

def delete_files_recursively(directory, extension):
    for filepath in glob.glob(directory + '/**/*' + extension, recursive=True):
        try:
            os.remove(filepath)
            print(f"File {filepath} has been deleted.")
        except Exception as e:
            print(f"Error occurred while deleting file {filepath}: {e}")

# usage
delete_files_recursively('./', '.tex')
