# {{ with .Params.post_title }}{{ . }}{{ else }}{{ .Title | markdownify }}{{ end }}

{{ with .Params.Description }}{{ . }}{{ end }}

{{ with .Resources.Get "sections/head-005-contact.md" }}{{ .Content | transform.HTMLToMarkdown | safeHTML }}{{ end }}

{{ with .Resources.Get "sections/head-007-summary.md" -}}
## Objectives

{{ .Content | transform.HTMLToMarkdown | safeHTML }}{{ end }}

{{ with .Resources.Get "sections/head-010-skills.md" }}{{ .Content | transform.HTMLToMarkdown | safeHTML }}{{ end }}

{{ with .Resources.Get "data/jobs.yaml" -}}
{{- with . | transform.Unmarshal -}}
{{ $.Content | transform.HTMLToMarkdown | safeHTML }}

{{ range . -}}
{{- with .title }}**{{ . }}** / {{ end -}}
{{- if .url }}[{{ end -}}
{{- .name | safeHTML -}}
{{- with .url }}]({{ . }}){{ end }}{{- if or .start .end}}   
{{ with .start }}{{ .text }}{{ end }}
{{- if and .start .end}} - {{ end -}}
{{- with .end -}}{{ .text }}{{ end -}}
{{- end }}

{{ with .headline }}{{ . | safeHTML }}

{{ end -}}
{{- with .res -}}
{{- $html := "<ul>" -}}
{{- range . -}}
{{- $html = printf "%s%s" $html "<li>" -}}
{{- $html = . | markdownify | printf "%s%s" $html -}}
{{- $html = printf "%s%s" $html "</li>" -}}
{{- end -}}
{{ printf "%s%s" $html "</ul>" | transform.HTMLToMarkdown | safeHTML }}

{{ end -}}
{{- with .tech }}Used: {{ . }}

{{ end -}}

{{- end }}
{{- else -}}
{{- errorf "Unable to parse jobs" -}}
{{- end -}}
{{- else -}}
{{- errorf "Unable to read jobs" -}}
{{- end -}}

{{- with .Resources.Get "data/projects.toml" -}}
{{- with . | transform.Unmarshal -}}

## Selected Open Source Projects

{{ range . }}{{ range . }}- [{{ .name }}]({{ .url }}): {{ .desc }}
{{ end }}{{ end }}


{{- else -}}
{{- errorf "Unable to parse projects" -}}
{{- end -}}
{{- else -}}
{{- errorf "Unable to read projects" -}}
{{- end -}}

{{- with .Resources.Get "sections/foot-015-edu.md" }}
{{ .Content | transform.HTMLToMarkdown | safeHTML }}{{ end }}
