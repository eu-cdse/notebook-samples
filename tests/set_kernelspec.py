import json
import sys
from pathlib import Path


def set_kernelspec(path: Path, name="openeo", display_name="OpenEO") -> None:
    notebook = json.loads(path.read_text(encoding="utf-8"))
    metadata = notebook["metadata"]
    kernelspec = metadata.get("kernelspec", {})
    language = kernelspec.get("language") or metadata.get("language_info", {}).get(
        "name", ""
    )
    if language.lower() != "python":
        return

    kernelspec.update(name=name, display_name=display_name, language="python")
    metadata["kernelspec"] = kernelspec
    path.write_text(
        json.dumps(notebook, ensure_ascii=False, indent=1) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    for filename in sys.argv[1:]:
        set_kernelspec(Path(filename))
