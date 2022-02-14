# AWS Age Analyzer – How old is that AWS Service?

A tool to find out how old a particular AWS service is.

Welcome to this non-exhaustive list of AWS services and their approximate ages.

This is based on [an idea/tool created by jsrn](https://github.com/jsrn/howoldisit), focused on the myriad selection of AWS services and products.
I spun it out as a separate list at the suggestion of Corey Quinn.

## Running the Project

Run `ruby build.rb` to update the HTML template from your list of services and view the site in your browser of choice.

## Adding a Service

New services should be added to `services.json`.

The link should point to a blog post or news article announcing the launch, and the icon in `icons.json` should be the 16&times;16px SVG from the [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/).

### How old is "how old?"

AWS are pretty good about keeping old blog posts around, so you can usually find a blog post announcing the launch of a service.

Some services launch in limited preview or closed beta, and only become generally available later.
Since the point of this tool is to work out how long somebody might have been using a service, I tried to pick the date it would first be available for anybody to log into the console and use.

## What's in the name?

I wanted to be clear that this is a distinct site from [jsrn's project](https://github.com/jsrn/howoldisit), and I tried to imagine what somebody in charge of AWS might call it.

## Credits

* This project was originally bootstrapped with [Create React App](https://github.com/facebook/create-react-app), but is now generated HTML with a little JS to work the dropdown.
* This project is forked from [a similar project by jsrn](https://github.com/jsrn/howoldisit).

P.S. If you are a recruiter and you are reading this, obviously it is not *you* that we are poking fun at! Haha! Ha! Haa... please don't blacklist us from the industry.
