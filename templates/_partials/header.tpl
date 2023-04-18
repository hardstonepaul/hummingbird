{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
 {*vars*}
{$headerTopName = 'header-nav'}
{$headerBottomName = 'header-bottom'}
{* Banner almost not used *}
{block name='header_banner'}
  <div class="header__banner">
    {hook h='displayBanner'}
  </div>
{/block}
{* Nav in 3 parts *}
{block name='header_nav'}
  <div class="{$headerTopName} md-container">
    <div class="nav-conte row">
      <div class="col-">
        {hook h='displayNav1'}
      </div>
      <div class="col-">
        {hook h='displayNav2'}
        <div class="hidden-md-up mobile">
          <div class="float-xs-right" id="_mobile_user_info"></div>
        </div>
      </div>
      <div class="col-">
        {hook h='displayNav3'}
        <div class="hidden-md-up mobile">
          <div class="float-xs-right" id="_mobile_cart"></div>
        </div>
      </div>
    </div>
  </div>
{/block}
{*  *}
{block name='header_top'}
  <div class="header-top">
    <div class="fl-menu">
      <div class="logo-cont">
        <a href="{$urls.pages.index}">
          <h1>
            {*<img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}" loading="lazy">*}
            <img class="logo img-responsive" src="../../../../img/s/bot-esf.svg" alt="{$shop.name}" loading="lazy">
          </h1>
        </a>
      </div>
      <nav>
        {hook h='displayTop'}
      </nav>
      {*<div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>*}
    </div>
  </div>
  <div class="search-conte">
    {hook h='displayNavFullWidth'}
    <div class="ad-conte">
      <a href="#">
        <button type="button" class="btn btn-link">
          <span class="hidden-md-down">{l s='Payments' d='Shop.Theme.Global'}</span>
          <i><img src="https://esferos.com/imagenes/logos/pse8.png" alt="Pagos PSE"></i>
        </button>
      </a>
      <a href="#">
        <button type="button" class="btn btn-link">
          <i class="material-icons">description</i>
          <span class="hidden-md-down">{l s='Purchase Order' d='Shop.Theme.Global'}</span>
      </button></a>
      <a href="#">
        <button type="button" class="btn btn-link">
          <i class="material-icons">menu_book</i>
          <span class="hidden-md-down">{l s='Catalogs' d='Shop.Theme.Global'}</span>
        </button>
      </a>
    </div>
  </div>
{/block}
