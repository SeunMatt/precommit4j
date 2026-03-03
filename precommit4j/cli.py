import argparse
import sys
from .checkstyle_executor import run_checkstyle


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-c", required=True)
    parser.add_argument("--jar")
    parser.add_argument("-d", "--debug", action="store_true")
    parser.add_argument("-E", "--executeIgnoredModules", action="store_true")
    parser.add_argument("files", nargs="*")

    args = parser.parse_args()

    exit_code = run_checkstyle(
        config=args.c,
        jar=args.jar,
        debug=args.debug,
        execute_ignored=args.executeIgnoredModules,
        files=args.files,
    )

    sys.exit(exit_code)