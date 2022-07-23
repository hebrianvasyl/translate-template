{Users->getUser assign="user"}

<div class="cabinet clearfix">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {include file="profile/agreements_block.tpl"}

	{include file="profile/body-menu.tpl"}
	<section class="content-wrapper content-waitlist">
        <section>
            {if $user.user_type == 'dealer'}
                {Main->parseTemplate content=$settings.Contacts.applications}
            {else}
                {Main->parseTemplate content=$settings.Contacts.applications_client}
            {/if}
        </section>
	</section>
</div>