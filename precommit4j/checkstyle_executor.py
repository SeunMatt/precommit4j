import subprocess
import sys
from pathlib import Path


def run_checkstyle(config, jar=None, debug=False, execute_ignored=False, files=None):
    if files is None:
        files = []

    if jar:
        jar_file = jar
    else:
        script_dir = Path(__file__).resolve().parent
        jar_file = script_dir.joinpath("./checkstyle.jar").resolve()

    command = ["java", "-jar", str(jar_file), "-c", config]

    if debug:
        command.append("-d")

    if execute_ignored:
        command.append("-E")

    command.extend(files)

    process = subprocess.run(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    if process.stdout:
        print(process.stdout, end="")

    if process.stderr:
        print(process.stderr, end="", file=sys.stderr)

    return process.returncode