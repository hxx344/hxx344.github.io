<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="Keywords" content="blog"/>
    <meta name="Description" content="blog"/>
    <title>Simple</title>
    <link rel="shortcut icon" href="/static/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="/main.css" />
</head>
<body>
<div class="main">
    <div class="header">
    	<ul id="pages">
            <li><a href="/">home</a></li>
            <li><a href="/#/tags">tags</a></li>
            <li><a href="/#/archive">archive</a></li>
    	</ul>
    </div>
	<div class="wrap-header">
	<h1>
    <a href="/" id="title"></a>
	</h1>
	</div>
<div id="md" style="display: none;">
<!-- markdown -->
우리 사랑하지 말아요,
사실 조금은 두려운 거야.
I just heard you found the one you've been looking,
You've been looking for.
僕らタイムフライヤー 時を駆け上がるクライマー,
時のかくれんぼ はぐれっこはもういやなんだ.
ىلەيدىغنىم : ماڭا دۇنيا بىردىغان كىشى ئەمەس مىنى دۇنيا دەپ بىلدىغان كىشى. ھەم ماڭا دۇئا بىردىغان كىش,
ۈرەكلىرىم لەختە قان ئەمما،سەۋەپچىسى سەن ئەمەس جېنىم.كىرپىگىمگە قونسا گەر توپا،مېنى كۈتۈپ ئۆلۈپتۇ دېگ.
刀 怒斩雪翼雕 山 豪迈冲云霄
长 坂坡在燃烧 我 直播砍曹操
<!-- markdown end -->
</div>
<div class="entry" id="main">
<!-- content -->
<p>우리 사랑하지 말아요,
사실 조금은 두려운 거야.
I just heard you found the one you've been looking,
You've been looking for.
僕らタイムフライヤー 時を駆け上がるクライマー,
時のかくれんぼ はぐれっこはもういやなんだ.
ىلەيدىغنىم : ماڭا دۇنيا بىردىغان كىشى ئەمەس مىنى دۇنيا دەپ بىلدىغان كىشى. ھەم ماڭا دۇئا بىردىغان كىش,
ۈرەكلىرىم لەختە قان ئەمما،سەۋەپچىسى سەن ئەمەس جېنىم.كىرپىگىمگە قونسا گەر توپا،مېنى كۈتۈپ ئۆلۈپتۇ دېگ.
刀 怒斩雪翼雕 山 豪迈冲云霄
长 坂坡在燃烧 我 直播砍曹操</p>
<!-- content end -->
</div>
<br>
<br>
    <div id="disqus_thread"></div>
	<div class="footer">
		<p>© Copyright 2014 by isnowfy, Designed by isnowfy</p>
	</div>
</div>
<script src="main.js"></script>
<script id="content" type="text/mustache">
    <h1>{{title}}</h1>
    <div class="tag">
    {{date}}
    {{#tags}}
    <a href="/#/tag/{{name}}">#{{name}}</a>
    {{/tags}}
    </div>
</script>
<script id="pagesTemplate" type="text/mustache">
    {{#pages}}
    <li>
        <a href="{{path}}">{{title}}</a>
    </li>
    {{/pages}}
</script>
<script>
$(document).ready(function() {
    $.ajax({
        url: "main.json",
        type: "GET",
        dataType: "json",
        success: function(data) {
            $("#title").html(data.name);
            var pagesTemplate = Hogan.compile($("#pagesTemplate").html());
            var pagesHtml = pagesTemplate.render({"pages": data.pages});
            $("#pages").append(pagesHtml);
            //path
            var path = "hxx344.github.io";
            //path end
            var now = 0;
            for (var i = 0; i < data.posts.length; ++i)
                if (path == data.posts[i].path)
                    now = i;
            var post = data.posts[now];
            var tmp = post.tags.split(" ");
            var tags = [];
            for (var i = 0; i < tmp.length; ++i)
                if (tmp[i].length > 0)
                    tags.push({"name": tmp[i]});
            var contentTemplate = Hogan.compile($("#content").html());
            var contentHtml = contentTemplate.render({"title": post.title, "tags": tags, "date": post.date});
            $("#main").prepend(contentHtml);
            if (data.disqus_shortname.length > 0) {
                var disqus_shortname = data.disqus_shortname;
                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();
            }
        }
    });
});
</script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ["\\(", "\\)"]], processEscapes: true}});
</script>
</body>
</html>
