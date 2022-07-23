{Users->getUser assign="user"}

<div class="cabinet clearfix">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {include file="profile/agreements_block.tpl"}

    {include file="profile/body-menu.tpl"}
    <section class="content-wrapper content-waitlist">
        <section>
            <p><br></p>
            <p>
                <a href="https://www.intexpool.ua/wholesale/">Открыть условия сотрудничества</a>
            </p>
            <p><br></p>
            <p><br></p>
            <h3>Список изминений в условия сотрудничества</h3>
            <ol>
                {foreach $agreements as $agreement}
                <li>
                    {$agreement.title}
                </li>
                {/foreach}
            </ol>
        </section>
    </section>
</div>