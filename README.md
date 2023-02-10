# motregen

A simple text-based blogging website, written in Julia, using [Genie](https://github.com/GenieFramework/Genie.jl).

`*.md.jl` files in the `/app/resources/blog/views/posts` directory are dynamically loaded and routed.

Styling is done with vanilla CSS and Javascript, including [this lightbox script](https://github.com/lokesh/lightbox2). Rendering images in blog posts is done retroactively, since `Markdown.jl` is deprecated (thrown in the package attic 🥲), but it's all I have at the moment.

## To do
1. Write tests
2. Migrate comment partial from old code
3. Use `GenieAuthentication.jl` and `GenieAuthorisation.jl` so the user can lock (certain) pages with password
