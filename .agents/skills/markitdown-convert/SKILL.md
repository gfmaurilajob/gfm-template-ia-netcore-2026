---
name: markitdown-convert
description: Use when the user needs the content of a PDF, Word, PowerPoint, Excel, HTML, image, audio, ZIP or EPUB file as clean Markdown for the AI to read, summarize, search or compare, using Microsoft's open-source MarkItDown.
---

# Turning documents into Markdown with MarkItDown

MarkItDown (Microsoft, open source, MIT) converts office files, PDFs, web pages, images and audio into Markdown that keeps headings, lists, tables and links. Markdown is the format language models read best, so converting first gives better summaries, comparisons and extractions than pasting raw text.

## Setup

1. Requirements: Python 3.10 or newer.
2. Install with the optional formats you need (all of them below):

   ```
   pip install "markitdown[all]"
   ```

3. Convert a file:

   ```
   markitdown report.pdf -o report.md
   ```

Official source: https://github.com/microsoft/markitdown. There is also an MCP server in the same repository (`markitdown-mcp`) for tools that use MCP.

## How to work with it

1. Convert first, then work on the `.md` file: summarize, extract a table, compare two contracts, build a FAQ.
2. For a folder of files, convert each one and keep the original file name, so every answer can say which document it came from.
3. Check tables and scanned PDFs after conversion: a scanned page without text needs OCR, and the AI must say when a part could not be read.
4. Never upload a confidential document to a service the user did not approve; MarkItDown runs locally.

## Typical requests

- "Convert these 12 PDFs to Markdown and make a table with the deadline of each one."
- "Turn this spreadsheet into Markdown and explain the columns."
- "Compare the two versions of this Word document and list what changed."

<!-- veyloq-credit -->
> Guide written by VEYLOQ about: MarkItDown, by Microsoft Corporation (MIT). https://github.com/microsoft/markitdown @ 7482c09

## Response language

Always answer the user in Brazilian Portuguese (pt-BR), even though these instructions are in English. Keep code, commands, file names and technical terms as they are.
