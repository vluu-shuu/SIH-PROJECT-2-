# C-MINE Intelligence — SIH26023 Demo Build

**Problem Statement:** SIH26023 — AI-Powered Geological, Mining and other Reporting Solution for CMPDI/CIL subsidiaries.

C-MINE Intelligence is a local-first document-intelligence prototype that demonstrates the core workflow requested by the problem statement:

**Upload → Digitize/Extract → Structure → Validate → Query → Topic Intelligence → Evidence Report**

## Cost model

The default system is designed for **₹0 API usage**:
- no OpenAI/Gemini API key is required;
- PDF/DOCX/XLSX/CSV parsing runs locally;
- OCR uses local Tesseract + Poppler when installed;
- SQLite is local;
- AI-style Q&A falls back to explainable retrieval + structured rules;
- optional local Ollama integration can provide generative answers without a cloud API.

Public deployment/hosting can have separate provider limits or costs; the SIH laptop demo does not require paid hosting.

## Features

- Multi-format intake: PDF, DOCX, XLSX, XLS, CSV, TXT and common image formats.
- Text extraction and optional local OCR for scanned PDFs/images.
- Source traceability through document + page/sheet references.
- Structured extraction for production, dispatch, drilling, target, reserves, overburden and exploration.
- Validation layer that surfaces conflicting values instead of silently selecting one.
- Natural-language query intent detection: field, year, entity and comparison/trend requests.
- Topic identification with explainable keyword clusters and corpus terms.
- Evidence report generation as DOCX with structured findings and source passages.
- Evaluation harness with a small hand-verified ground-truth set.

## Public prototype dataset

`sample_data/` contains small text extracts derived from public Ministry of Coal Annual Report 2024-25 material. The files retain the official source URL inside each document. They are intentionally small so the demo remains lightweight.

Also included are two clearly labelled **synthetic** files solely to demonstrate the conflict-validation workflow. They must never be represented as real CMPDI/CIL records.

Official public source index: https://coal.gov.in/public-information/reports/annual-reports/annual-report-2024-25

## Run on Windows

1. Install Node.js LTS.
2. Open this folder in VS Code.
3. Open Terminal.
4. Run:

```bash
npm install
npm start
```

5. Open `http://localhost:3000`.
6. Go to **Documents** and upload the files from `sample_data/`.
7. Try **AI Query** questions such as:
   - `What was the total coal demand in 2023-24?`
   - `What drilling was carried out by CMPDI in 2024-25?`
   - `Compare drilling values for 2024-25.`
8. Open **Validation** to demonstrate conflict detection.
9. Use **Reports** to generate a DOCX evidence report.

## Optional local generative AI

If Ollama is installed locally, set:

```text
CMINE_AI=ollama
CMINE_MODEL=llama3.2:3b
```

Then start the server. The application will still work without Ollama.

## Evaluation

With the server running:

```bash
node evaluation/evaluate.js
```

The evaluation script reports exact-match recall against the included hand-verified sample set. **Do not present this small-sample result as production accuracy.** Expand the ground truth before making quantitative performance claims.

## SIH demo narrative

1. Upload heterogeneous public mining records.
2. Show extracted facts and source references.
3. Ask a natural-language operational question.
4. Show grounded values and evidence passages.
5. Show a deliberate synthetic conflict and the validation panel.
6. Generate an evidence report for a parliamentary/high-priority style response.
7. Show topic intelligence for rapid historical exploration.

## Important claims discipline

The prototype does not claim a percentage reduction in report preparation time, extraction accuracy, automation percentage, or response-time improvement. Those are **evaluation targets** from the problem statement and should only be quantified after a representative benchmark is completed.
