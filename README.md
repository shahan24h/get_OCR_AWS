# get_OCR_AWS

[![GitHub stars](https://img.shields.io/github/stars/shahan24h/get_OCR_AWS?style=social)](https://github.com/shahan24h/get_OCR_AWS/stargazers)

A toolkit for processing OCR data using AWS Textract...


get ocr using aws_simple script to get ocr data for analysis
# AWS OCR JSONL Extractor

This script is designed to extract OCR (Optical Character Recognition) data from files stored in AWS S3 and output the results in `.jsonl` format for further processing.

## 🔧 Prerequisites

Before running the script, make sure you have:

1. **AWS Credentials** configured (via `~/.aws/credentials` or environment variables)

What this script do:
Connects to an AWS S3 bucket
Downloads image or document files
Performs OCR using AWS Textract
Saves the OCR text output with metadata into a .jsonl file

USE CASE:
Used for preparing labeled OCR datasets for document classification models. Json format output, might be useful for raw files such as .0001 extention.

[![GitHub stars](https://github.com/shahan24h/get_OCR_AWS.git))
