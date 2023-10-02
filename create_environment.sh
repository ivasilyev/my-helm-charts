#!/usr/bin/env bash

mkdir -p \
    "charts" \
    "templates"

touch \
    "templates/deployment.yaml" \
    "templates/service.yaml" \
    "values.yaml" \
    "Chart.yaml"
