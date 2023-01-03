# motregen

My personal website, written in Julia, using [Genie](https://github.com/GenieFramework/Genie.jl).

Regarding frontend: right now (almost) everything is in vanilla CSS and Javascript, I'm trying to keep it as clean as possible. Maybe somewhere in the future I'll use a Javascript framework, just to toy with it, but I probably won't.

## Functionalities

**Blog**: dynamically loads and routes blog posts written in .jl.md in the `/app/resources/blog/views/posts` directory. Has a search function, but I am still working on the filtering.

**Guestbook**: page where visitors can place comments, which get validated and stored in a MySQL database. The comments partial can easily be used on other pages.

### To do
1. Route blog post filter correctly (tags set should be a pair?)
2. Change the main styling to something sweeter
3. Make the guestbook and gallery pages match the new style
4. Use JavaScript to filter illustrations in gallery page
5. Write AJAX to handle comments
6. Write tests (with GitHub action?)

### Pages I'll make in the future
- (Tech) projects page
- Book review page

## FAQ

**Can I take some *inspiration* from your code?** Sure go ahead

**Is Julia the right language for this? Why not use something else?** Yes
