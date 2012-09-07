{if $action=='preview' && $profile}
    {$profile.firstname} {$profile.lastname}<br />
{if $profile.companyname!=''}{$profile.companyname}<br />{/if}
{if $profile.address1!=''}{$profile.address1}<br />{/if}
{if $profile.address2!=''}{$profile.address2}<br />{/if}
{if $profile.city!=''}{$profile.city}, {/if}
{if $profile.state!=''}{$profile.state}, {/if}
{if $profile.postcode!=''}{$profile.postcode}<br />{/if}
{if $profile.country2!=''}{$profile.country2}<br />{/if}
{$profile.email}<br />
{/if}