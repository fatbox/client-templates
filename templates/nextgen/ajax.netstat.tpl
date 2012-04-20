{if $status}
 <td><strong>{$status.name}</strong></td>
				{if $fields.FTP}<td align="center">{if $status.status.FTP=='1'}<img src="{$template_dir}img/fugue/tick-small.png" alt="working"/>{else}<img src="{$template_dir}img/fugue/cross-small.png" alt="not-working"/>{/if}</td>{/if}
               {if $fields.SSH}<td align="center">{if $status.status.SSH=='1'}<img src="{$template_dir}img/fugue/tick-small.png" alt="working"/>{else}<img src="{$template_dir}img/fugue/cross-small.png" alt="not-working"/>{/if}</td>{/if}
			   {if $fields.HTTP}<td align="center">{if $status.status.HTTP=='1'}<img src="{$template_dir}img/fugue/tick-small.png" alt="working"/>{else}<img src="{$template_dir}img/fugue/cross-small.png" alt="not-working"/>{/if}</td>{/if}
			   {if $fields.POP3}<td align="center"> {if $status.status.POP3=='1'}<img src="{$template_dir}img/fugue/tick-small.png" alt="working"/>{else}<img src="{$template_dir}img/fugue/cross-small.png" alt="not-working"/>{/if}</td>{/if}
			   {if $fields.IMAP}<td align="center">{if $status.status.IMAP=='1'}<img src="{$template_dir}img/fugue/tick-small.png" alt="working"/>{else}<img src="{$template_dir}img/fugue/cross-small.png" alt="not-working"/>{/if}</td>{/if}
			   {if $fields.MYSQL}<td align="center">{if $status.status.MYSQL=='1'}<img src="{$template_dir}img/fugue/tick-small.png" alt="working"/>{else}<img src="{$template_dir}img/fugue/cross-small.png" alt="not-working"/>{/if}</td>{/if}
			   {if $fields.LOAD}<td align="center">{if $status.status.LOAD}{$status.status.LOAD}{else}{$lang.Unavailable}{/if}</td>{/if}
			   {if $fields.UPTIME}<td align="center">{if $status.status.UPTIME}{$status.status.UPTIME}{else}{$lang.Unavailable}{/if}</td>{/if}
{/if}