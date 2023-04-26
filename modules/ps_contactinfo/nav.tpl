{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div id="contact-link" class="contact-link">
  {if $contact_infos.phone}
    {* [1][/1] is for a HTML tag. *}
    <a href="https://api.whatsapp.com/send?phone=573212275275&text=Hola%21%20Estoy%20interesado%20en...&source=&data=" target="_blank" title="WhatsApp">
      <button class="">
        <div class="wha-logo"></div>
        <span class="hidden-sm-down">321 227 5275</span>
      </button>
    </a>
    {* {l
      s='Call us: [1]%phone%[/1]'
      sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%phone%' => $contact_infos.phone
      ]
      d='Shop.Theme.Global'
    } *}
  {else}
    <a href="{$urls.pages.contact}">{l s='Contact us' d='Shop.Theme.Global'}</a>
  {/if}
</div>
