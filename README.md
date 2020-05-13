# Tests for WES worfklow attachments

Verify that the **workflow attachment** parameter of a [GA4GH WES][ga4gh-wes]
implementation is functional.

> Note that this file (`README.md`) is required by the some of the commands, so
> do not delete/rename it

## Prerequisites

- Follow instructions to deploy [cwl-WES][cwl-wes] or any other [GA4GH
  WES][ga4gh-wes] implementation that can process [CWL][cwl] workflows
- Set the URL for the `POST /runs` endpoint of your WES deployment:

  ```bash
  export ENDPOINT='https://your.cwl-wes.instance/ga4gh/wes/v1/runs'
  ```

- When **authorization validation** is switched on, set the token:

  ```bash
  export TOKEN='eyJra...YOUR...TOKEN'
  ```

## Single-component workflow

```bash
curl -X POST \
    --header "Content-Type: multipart/form-data" \
    --header "Accept: application/json" \
    -F workflow_params='{"input_file": {"class": "File", "location": "README.md"}}' \
    -F workflow_type="CWL" \
    -F workflow_type_version="v1.0" \
    -F workflow_url="cat-numbered.cwl" \
    -F workflow_attachment="@cat-numbered.cwl" \
    -F workflow_attachment="@README.md" \
    "$ENDPOINT"
```

Or with **authorization validation** switched on:

```bash
curl -X POST \
    --header "Content-Type: multipart/form-data" \
    --header "Accept: application/json" \
    --header "Authorization: Bearer $TOKEN" \
    -F workflow_params='{"input_file": {"class": "File", "location": "README.md"}}' \
    -F workflow_type="CWL" \
    -F workflow_type_version="v1.0" \
    -F workflow_url="cat-numbered.cwl" \
    -F workflow_attachment="@cat-numbered.cwl" \
    -F workflow_attachment="@README.md" \
    "$ENDPOINT"
```

## Multi-component workflow

### Input from FTP

```bash
curl -X POST \
    --header "Content-Type: multipart/form-data" \
    --header "Accept: application/json" \
    -F workflow_params='{"input":{"class":"File","path":"ftp://ftp-private.ebi.ac.uk/upload/foivos/test.txt"}}' \
    -F workflow_type="CWL" \
    -F workflow_type_version="v1.0" \
    -F workflow_url="hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-test.yml" \
    -F workflow_attachment="@hashsplitter-md5.cwl.yml" \
    -F workflow_attachment="@hashsplitter-sha.cwl.yml" \
    -F workflow_attachment="@hashsplitter-whirlpool.cwl.yml" \
    -F workflow_attachment="@hashsplitter-unify.cwl.yml" \
    "$ENDPOINT"
```

Or with **authorization validation** switched on:

```bash
curl -X POST \
    --header "Content-Type: multipart/form-data" \
    --header "Accept: application/json" \
    --header "Authorization: Bearer $TOKEN" \
    -F workflow_params='{"input":{"class":"File","path":"ftp://ftp-private.ebi.ac.uk/upload/foivos/test.txt"}}' \
    -F workflow_type="CWL" \
    -F workflow_type_version="v1.0" \
    -F workflow_url="hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-test.yml" \
    -F workflow_attachment="@hashsplitter-md5.cwl.yml" \
    -F workflow_attachment="@hashsplitter-sha.cwl.yml" \
    -F workflow_attachment="@hashsplitter-whirlpool.cwl.yml" \
    -F workflow_attachment="@hashsplitter-unify.cwl.yml" \
    "$ENDPOINT"
```

### Input as workflow attachment

```bash
curl -X POST \
    --header "Content-Type: multipart/form-data" \
    --header "Accept: application/json" \
    -F workflow_params='{"input": {"class": "File", "path": "README.md"}}' \
    -F workflow_type="CWL" \
    -F workflow_type_version="v1.0" \
    -F workflow_url="hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-test.yml" \
    -F workflow_attachment="@hashsplitter-md5.cwl.yml" \
    -F workflow_attachment="@hashsplitter-sha.cwl.yml" \
    -F workflow_attachment="@hashsplitter-whirlpool.cwl.yml" \
    -F workflow_attachment="@hashsplitter-unify.cwl.yml" \
    -F workflow_attachment="@README.md" \
    "$ENDPOINT"
```

Or with **authorization validation** switched on:

```bash
curl -X POST \
    --header "Content-Type: multipart/form-data" \
    --header "Accept: application/json" \
    --header "Authorization: Bearer $TOKEN" \
    -F workflow_params='{"input": {"class": "File", "path": "README.md"}}' \
    -F workflow_type="CWL" \
    -F workflow_type_version="v1.0" \
    -F workflow_url="hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-workflow.cwl" \
    -F workflow_attachment="@hashsplitter-test.yml" \
    -F workflow_attachment="@hashsplitter-md5.cwl.yml" \
    -F workflow_attachment="@hashsplitter-sha.cwl.yml" \
    -F workflow_attachment="@hashsplitter-whirlpool.cwl.yml" \
    -F workflow_attachment="@hashsplitter-unify.cwl.yml" \
    -F workflow_attachment="@README.md" \
    "$ENDPOINT"
```

[cwl]: <https://www.commonwl.org/>
[cwl-wes]: <https://github.com/elixir-cloud-aai/cwl-WES>
[ga4gh-wes]: <https://github.com/ga4gh/workflow-execution-service-schemas>
