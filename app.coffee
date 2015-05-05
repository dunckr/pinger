Cheerio = require "cheerio"
Request = require "request"
Job = require("cron").CronJob

onStart = ->
  url = process.env.ENDPOINT
  Request url, (err, res, html) ->
    $ = Cheerio.load(html)

new Job
  cronTime: process.env.CRON_PATTERN
  onTick: onStart
  start: true
