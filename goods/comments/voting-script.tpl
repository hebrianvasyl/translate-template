{if isset($settings.voting.disable) and !$settings.voting.disable}

{literal}
var vote_values = {};
{/literal}

{foreach $vote_values as $name => $value}
	vote_values['{$name}'] = '{$value.value}';
{/foreach}

var vote_options = {
	vote_values: vote_values,
	button_class: VotingButton_class
};

var voting = new Voting_class({$goods.id}, '{$menu.www->comments.href}').setOptions({
	get_reviewed_ajax_action: 'getReviewedComments',
	popup_class: VotingPopup_class
});

voting.getRecords(vote_options);

{/if}