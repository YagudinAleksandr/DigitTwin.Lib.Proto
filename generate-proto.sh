#!/bin/bash

PROTO_DIR="Contracts"
OUT_CS="Output/CSharp"
OUT_JAVA="Output/Java"
OUT_PY="Output/Python"

mkdir -p "$OUT_CS" "$OUT_JAVA" "$OUT_PY"

find "$PROTO_DIR" -name "*.proto" | while read file; do
  echo "Генерация для $file ..."
  protoc --csharp_out="$OUT_CS" --proto_path="$PROTO_DIR" "$file"
  protoc --java_out="$OUT_JAVA" --proto_path="$PROTO_DIR" "$file"
  protoc --python_out="$OUT_PY" --proto_path="$PROTO_DIR" "$file"
  echo "---"
done

echo "Генерация завершена." 