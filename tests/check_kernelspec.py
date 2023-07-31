#!/usr/bin/env python

import sys
from pathlib import Path
from typing import Iterator, Union, Iterable, Optional
import json
import logging

_log = logging.getLogger("check_kernel")


def collect_notebooks(
    paths: Optional[Iterable[Union[str, Path]]] = None
) -> Iterator[Path]:
    paths = [Path(p) for p in (paths or ["."])]
    for path in paths:
        if path.is_file():
            yield path
        elif path.is_dir():
            for d in path.glob("**/*.ipynb"):
                if ".ipynb_checkpoints" not in d.parts:
                    yield d
        else:
            raise RuntimeError(f"Not a file or dir: {path}")


def extract_kernel_spec(notebook: Path) -> dict:
    with notebook.open("r", encoding="utf-8") as f:
        return json.load(f)["metadata"]["kernelspec"]


def main():
    logging.basicConfig(level=logging.INFO)

    supported_kernels = [
        "openeo",
        "sentinelhub",
        "geo",
    ]

    checked = 0
    issues = []
    for notebook in collect_notebooks(paths=sys.argv[1:]):
        checked += 1
        _log.info(f"Checking {notebook}")
        try:
            kernel_spec = extract_kernel_spec(notebook=notebook)
            _log.info(f"Found kernel spec {kernel_spec}")
            kernel_name = kernel_spec["name"]
            if kernel_name not in supported_kernels:
                issue = f"{notebook} has unsupported kernel {kernel_name!r} (from {kernel_spec})"
                _log.error(issue)
                issues.append(issue)
        except Exception as e:
            issue = f"Failed to extract kernel spec from {notebook}"
            _log.exception(issue)
            issues.append(issue)

    print(f"Checked {checked} notebooks")
    if issues:
        print(f"Found {len(issues)} kernel spec issues:")
        print("\n".join(issues))
        sys.exit(1)


if __name__ == "__main__":
    main()
