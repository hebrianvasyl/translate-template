<section class="b-static clearfix b-static-no-margin online-consultant">

    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

	{include file="static-pages-menu.tpl"}

	<div class="b-static-content">

		{Controller->getRecords is_section=0 order=order assign=faqs}
		{if count($faqs)}
		<ul class="b-static-content-l">
			{assign var="categories" value=[]}
			{foreach from=$faqs item=faq}
				{if isset($faq->parent)}
					{$categories[$faq->parent.title][] = $faq}
				{/if}
			{/foreach}
			{foreach from=$faqs item=faq}
				{if !isset($faq->parent)}
					{$categories['---'][] = $faq}
				{/if}
			{/foreach}
			{foreach from=$categories key="title" item="faqs"}
				<li class="b-static-content-i faq-layout faq-title">
					{if $title == '---'}
						<h4>Без категории</h4>
					{else}
						<h2>{$title}</h2>
					{/if}
				</li>
				{foreach from=$faqs item=faq}
					<li class="b-static-content-i faq-layout" name="slider-block-container" id="slider-id{$faq.id}">
						<a href="#" class="faq-link before" name="slider-block-active">
							<span>{$faq.title}</span>
						</a>
						<div class="faq-answer" name="slider-block-item">{$faq.answer nofilter}</div>
					</li>
				{/foreach}
			{/foreach}
		</ul>
		{/if}

		<form class="quest" action="/cgi-bin/form.php?r={$menu.www->qa.href}" method="post" name="submit-by-ajax" id="faq_form">
			<div name="app-message"></div>
			<h3>Не нашли ответ на свой вопрос?</h3>

			<div class="item">
				<div class="title">Задать вопрос</div>
				<textarea class="input-textarea" name="question" _required="required"></textarea>
			</div>

			<div class="item">
				<div class="title">
					Эл. почта
					<div class="popup_wrap">
						<a class="info popup" href="#" id="checkout_email_popup" name="info-link"></a>
						<div class="popup_body checkout_email_popup_body">Вы можете задать свой вопрос и получить ответ по электронной почте</div>
					</div>
				</div>
				<input type="text" class="input-text" name="email" _required="required" _pattern="^.+@.+\..+$">
			</div>

			<div class="item submit">
				<span class="btn-link btn-link-blue faq-submit-button">
					<button type="submit" class="btn-link-i">Оставить вопрос</button>
				</span>
			</div>
		</form>

	</div>
</section>
<script type="text/javascript" src="slider-block.js"></script>