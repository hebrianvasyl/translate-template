<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
<channel>
	<title>{$head.title|@rssspecialchars}</title>
	<description>{$menu.active->parent.description|htmlspecialchars}</description>
	<link>http://{$menu.host.name}/</link>
	<language>ru</language>

	{News->getLast assign=news limit=25}
	{foreach from=$news item=item}
		<item>
			<title>{$item.title|htmlspecialchars}</title>
			<description>{$item.summary|htmlspecialchars}</description>
			<guid isPermaLink="true">{$item.href}</guid>
			<link>{$item.href}</link>
			<pubDate>{$item.created|RFC822}</pubDate>
		</item>
	{/foreach}

</channel>
</rss>