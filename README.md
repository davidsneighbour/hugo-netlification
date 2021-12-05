![repoimage](https://repository-images.githubusercontent.com/433661144/18c10795-5934-4ce5-bf3a-4084f78ceb07)

# DNB Hugo Netlification

This is a Hugo theme component with helpers to host your [GoHugo](https://gohugo.io/) generated static website on [Netlify](https://www.netlify.com/). If you don't use Netlify, you DO NOT need this module.

## Features

**Redirects:** Adds redirects via HTTP headers. This redirection is faster and SEO wise better than Hugo's method of adding `meta-refresh` commands in dedicated files.

**CSP:** Adds Content Security Policies for improved security.

**Headers:** Adds headers with caching and security directives to improves security and speed.

## Installation and setup

**Step 1:** enable modules in your own repository

```bash
hugo mod init github.com/username/reponame
```

**Step 2:** add the module to your required modules in `config.toml`:

```toml
[module]
[[module.imports]]
path = "github.com/dnb-org/dnb-hugo-netlification"
```

or in your `config/module.toml`:

```toml
[[imports]]
path = "github.com/dnb-org/dnb-hugo-netlification"
```

The next time you run hugo it will download the latest version of the module.

**Step 3:** Add `REDIR` and `HEADERS` to your home output formats:

```toml
[outputs]
home = [ ... others ... , "REDIR", "HEADERS" ]
```

You should already have an `[outputs]` section, add `"REDIR", "HEADERS"` to it. Add them to the `home` parameter, not to other definitions.

## Configuration

### Redirects

#### Per post

Redirection takes aliases that are defined in the pages frontmatter and creates a 301 redirect for them. This is done via HTTP headers as opposed to the redirects via HTML meta tags that Hugo is doing. This is faster and might be better for SEO.

Keep defining them via frontmatter and let _Netlification_ do the rest.

```yaml
aliases:
  - url1
  - url2
  - url3
```

#### Additional Redirects

- A redirect for 404 errors to Hugo's 404 page (`/layouts/404.html`) - no action by you required

- A redirect for your default netlify.com URL to your live URL via data configuration in `data/dnb/netlification/config.toml`

  ```toml
  [[redirects]]
  netlify = "https://eloquent-morse-196fd2.netlify.com/"
  ```

  The URL will be redirected to your `baseURL`. Right now this feature requires a trailing slash on both, baseURL and netlify parameter

- Add more redirects as required. Each redirect requires a header `[[redirects]]` followed by at least the parameters `from` and `to`:

  ```toml
  [[redirects]]
  from = "/old-contact-form/"
  to = "/contact/"
  status = 200
  ```

  You can add a status property, if you wish to output any other code than 301 for the redirect. The status property is optional and is explicitly intended for redirect cases.

#### Disable internal alias creation in Hugo

If you are using Netlification you can speed up Hugo's page creation process a little bit by setting the config variable `disableAliases` to `true`. This will disable the default behaviour of creating an HTML file per alias to redirect via meta tags and speed up site generation.

### Headers

Netlification uses considerate caching options. Stylesheets, javascripts, images and other media files are cached for a full year. Netlification expects you to use Hugo pipes to create those files, which will result in unique URLs after you change the content of the files.

#### Content Security Policy

Have a look in [data/dnb/netlification/config.toml](https://github.com/dnb-org/components/blob/main/netlification/data/dnb/netlification/config.toml) or [data/dnb/netlification/sample-config.toml](https://github.com/dnb-org/components/blob/main/netlification/data/dnb/netlification/sample-config.toml) to learn more.

## Sample Configuration

Add your configuration in `data/dnb/netlification/config.toml`.

```toml
################################################################################
# |\| [- ~|~ |_ | /= | ( /\ ~|~ | () |\|
# Setup for the DNB Hugo Netlification component
################################################################################
# Copy to /data/dnb/netlification/config.toml and edit to your needs. Lines with
# hash (#) in the beginning are comments and can be removed or will be ignored.
################################################################################

################################################################################
# Caching Setup
################################################################################
[cache.duration]
################################################################################
# set the amount of years/months/days that static assets should be cached for
#
# remove to have everything cached for 1 year
################################################################################
years = 1
months = 0
days = 0

################################################################################
# Content Security Policy Setup
################################################################################
[csp]
################################################################################
# see https://content-security-policy.com/ for info about CSP
# see https://report-uri.com/account/setup/ for a reporting tool
################################################################################
# Reporting is a feature of CSP that sends the evaluation of CSP lines to a
# server address. This is useful if you want to see, what activities are blocked
# due to your resulting settings.
# Set reportOnly to true to leave the "normal" website running as if no CSP is
# in place. This will show you what the current setup might prohibit and lets
# you fine tune the ruleset. Comment out or remove once you are done
# reportOnly = true
# Reporting URI - if reportOnly is not set it will report fails to the URI
reportUri = ""
# Force https even if http links are called
upgradeInsecureRequests = true
################################################################################
# Rulesets
#
# Each CSP ruleset (also future rules that are not in this sample yet) can be
# added by camelcasing the rule (default-src > defaultSrc etc.). Then add the
# hosts as an array. Keywords like self, eval-inline etc. need to be set in
# additional hyphens ("'self'").
#
# You can add every CSP rule type by using camel case names instead of dashed
# names. iframeSrc instead of iframe-src, scriptSrc instead of script-src etc.
#
# The default setting is to accept only local scripts/sources
################################################################################
defaultSrc = [
    "'self'"
]

################################################################################
# Redirects
#
# Manual redirects. Netlify redirect is for the internal netlify-URL to be
# redirected to the live site URL
################################################################################
[redirects]
netlify = ""
```

## Updating

To update this module:

```shell
hugo mod get -u github.com/dnb-org/dnb-hugo-netlification
```

To update all modules:

```shell
hugo mod get -u
```

<!--- COMPONENTS BEGIN --->

## Other [GoHugo](https://gohugo.io/) components by [@dnb-org](https://github.com/dnb-org/)

| Component                                                                     | Description                                                |
| :---------------------------------------------------------------------------- | :--------------------------------------------------------- |
| [dnb-hugo-auditor](https://github.com/dnb-org/dnb-hugo-auditor)               |                                                            |
| [dnb-hugo-debug](https://github.com/dnb-org/dnb-hugo-debug) :mage_man:        |                                                            |
| [dnb-hugo-errors](https://github.com/dnb-org/dnb-hugo-errors)                 |                                                            |
| [dnb-hugo-functions](https://github.com/dnb-org/dnb-hugo-functions)           |                                                            |
| [dnb-hugo-giscus](https://github.com/dnb-org/dnb-hugo-giscus)                 | The Giscus comment system layout for GoHugo.               |
| [dnb-hugo-head](https://github.com/dnb-org/dnb-hugo-head)                     |                                                            |
| [dnb-hugo-internals](https://github.com/dnb-org/dnb-hugo-internals)           | Better internal templates for GoHugo                       |
| [dnb-hugo-netlification](https://github.com/dnb-org/dnb-hugo-netlification)   | a collection of tools that optimize your site on Netlify   |
| [dnb-hugo-opensearch](https://github.com/dnb-org/dnb-hugo-opensearch)         | configuration for Open Search                              |
| [dnb-hugo-pictures](https://github.com/dnb-org/dnb-hugo-pictures)             |                                                            |
| [dnb-hugo-pwa](https://github.com/dnb-org/dnb-hugo-pwa)                       | Automatically turns your site into a PWA                   |
| [dnb-hugo-renderhooks](https://github.com/dnb-org/dnb-hugo-renderhooks)       | render hooks for Markdown markup                           |
| [dnb-hugo-robots](https://github.com/dnb-org/dnb-hugo-robots)                 | configure the content of your robots.txt with front matter |
| [dnb-hugo-schema](https://github.com/dnb-org/dnb-hugo-schema)                 |                                                            |
| [dnb-hugo-search-algolia](https://github.com/dnb-org/dnb-hugo-search-algolia) |                                                            |
| [dnb-hugo-security](https://github.com/dnb-org/dnb-hugo-security)             |                                                            |
| [dnb-hugo-sitemap](https://github.com/dnb-org/dnb-hugo-sitemap)               |                                                            |
| [dnb-hugo-social](https://github.com/dnb-org/dnb-hugo-social)                 |                                                            |

<!--lint disable no-missing-blank-lines -->
<!--- COMPONENTS END --->
