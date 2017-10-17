If you have a non-library SendGrid issue, please contact our [support team](https://support.sendgrid.com).

If you can't find a solution below, please open an [issue](https://github.com/sendgrid/smtpapi-ruby/issues).

## Table of Contents
* [Viewing the Request Header](#request-header)

<a name="request-header"></a>
## Viewing the Request Header

When debugging or testing, it may be useful to exampine the raw request header to compare against the [documented format](https://sendgrid.com/docs/API_Reference/api_v3.html).

You can do this like so:

```ruby
puts header
```
