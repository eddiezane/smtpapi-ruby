![SendGrid Logo](https://uiux.s3.amazonaws.com/2016-logos/email-logo%402x.png)

[![Build Status](https://travis-ci.org/sendgrid/smtpapi-ruby.svg?branch=main)](https://travis-ci.org/SendGrid/smtpapi-ruby)
[![Gem Version](https://badge.fury.io/rb/smtpapi.svg)](https://badge.fury.io/rb/smtpapi)
[![Email Notifications Badge](https://dx.sendgrid.com/badge/ruby)](https://dx.sendgrid.com/newsletter/ruby)
[![Gem Version](https://badge.fury.io/rb/sendgrid-ruby.svg)](https://badge.fury.io/rb/sendgrid-ruby)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE.md)
[![Twitter Follow](https://img.shields.io/twitter/follow/sendgrid.svg?style=social&label=Follow)](https://twitter.com/sendgrid)
[![GitHub contributors](https://img.shields.io/github/contributors/sendgrid/smtpapi-ruby.svg)](https://github.com/sendgrid/smtpapi-ruby/graphs/contributors)

**This ruby gem allows you to quickly and more easily generate SendGrid X-SMTPAPI headers.**

# Announcements
**The default branch name for this repository has been changed to `main` as of 07/27/2020.**

All updates to this library is documented in our [CHANGELOG](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/CHANGELOG.md).

# Table of Contents
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [How to Contribute](#contribute)
- [About](#about)
- [License](#license)

<a name="installation"></a>
# Installation

## Prerequisites

- Ruby version >= 2.4
- The SendGrid service, starting at the [free level](https://sendgrid.com/free?source=smtpapi-ruby)

## Install Package

Add this line to your application's Gemfile:

```bash
gem 'smtpapi'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install smtpapi
```

## Setup Environment Variables

### Environment Variable

Update the development environment with your [SENDGRID_API_KEY](https://app.sendgrid.com/settings/api_keys), for example:

```bash
echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
echo "sendgrid.env" >> .gitignore
source ./sendgrid.env
```

<a name="quick-start"></a>
# Quick Start

```ruby
header = Smtpapi::Header.new
header.add_to('test@example.com')
print header.to_json
```

<a name="usage"></a>
# Usage

- [SendGrid Docs](https://sendgrid.com/docs/API_Reference/SMTP_API/index.html)
- [Example Code](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/examples)

<a name="roadmap"></a>
# Roadmap

If you are interested in the future direction of this project, please take a look at our [milestones](https://github.com/sendgrid/smtpapi-ruby/milestones). We would love to hear your feedback.

<a name="contribute"></a>
# How to Contribute

We encourage contribution to our libraries, please see our [CONTRIBUTING](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/CONTRIBUTING.md) guide for details.

Quick links:

- [Feature Request](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/CONTRIBUTING.md#feature_request)
- [Bug Reports](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/CONTRIBUTING.md#submit_a_bug_report)
- [Improvements to the Codebase](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/CONTRIBUTING.md#improvements_to_the_codebase)
- [Review Pull Requests](https://github.com/sendgrid/smtpapi-ruby/blob/HEAD/CONTRIBUTING.md#code-reviews)

## Credits

This library was created by [Wataru Sato](https://github.com/awwa) and is now maintained by SendGrid.

<a name="about"></a>
# About

smtpapi-ruby is maintained and funded by Twilio SendGrid, Inc. The names and logos for smtpapi-ruby are trademarks of Twilio SendGrid, Inc.

If you need help installing or using the library, please check the [Twilio SendGrid Support Help Center](https://support.sendgrid.com).

If you've instead found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!

<a name="license"></a>
# License

[The MIT License (MIT)](LICENSE.md)
