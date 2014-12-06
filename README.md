# Blog Post Templates

These are some blog post templates and Ruby scripts to create posts for Jekyll. These automators are built to work with Alfred. I'm sure you can edit them to work from the command line, but I wouldn't know how to do that.

There are only two things you need to modify of the script.

```ruby
# You want to modify this to the location of you template
TEMPLATE = "/Jekyll-Post-Automaters/video-template.md"

# Change this to where ever your _drafts folder is
POSTS_DIR = "/_drafts"
```

Once you've modified these lines, create a new Alfred workflow. Create a trigger with a keyword input. This will allow you to specify the name of the post in Alfred for the script to run properly.

![Workflow with trigger and action](/images/triggers-and-actions.png)

Then, you'll create a "Run Script" action. It should look like this.

![Adding a script to the workflow](/images/adding-script.png)

And that's it! You're all set to easily create new posts with Jekyll!

If you have questions or bugs, please file an issue. I'll get to it promptly!

---

*The orginal script was made by [Cody Krieger](http://codykrieger.com).*
