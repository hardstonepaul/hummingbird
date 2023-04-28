{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
 {*vars*}
{$headerTopName = 'header-nav'}
{$headerBottomName = 'header-bottom'}
{* Nav in 3 parts *}
{* Banner almost not used *}
{block name='header_banner'}
  <div class="header__banner">
    {hook h='displayBanner'}
  </div>
{/block}
{* Firts Part suefull links *}
{block name='header_nav'}
  <div class="{$headerTopName} container-fluid ali">
    <div class="container cien-h">
      <div class="nav-conte row align-items-center cien-h">
        <div class="col-3">
          {hook h='displayNav1'}
        </div>
        <div class="col-6">
          {hook h='displayNav2'}
          <div class="hidden-md-up mobile">
            <div class="float-xs-right" id="_mobile_user_info"></div>
          </div>
        </div>
        <div class="col-3">
          {hook h='displayNav3'}
          <div class="hidden-md-up mobile">
            <div class="float-xs-right" id="_mobile_cart"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
{/block}
{* Second Part logo and menu*}
{block name='header_top'}
  <div class="header-top transitiOn">
    <div class="container transitiOn">
      <div class="fl-menu row align-items-center justify-content-center transitiOn">
        <div id="headerNav" class="logo-cont col-3 transitiOn">
          <a href="{$urls.pages.index}">
            <h1>
              {*<img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}" loading="lazy">*}
              <img class="logo img-responsive" src="../../../../img/s/bot-esf.svg" alt="{$shop.name}" loading="lazy">
            </h1>
          </a>
        </div>
        <nav class="col-6">
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
  </div>
  {* Thrith Part Search and other links*}
  <div class="search-conte container">
    <div class="row">
      <div class="col-6">
        {hook h='displayNavFullWidth'}
      </div>
      <div class="ad-conte col-6">
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
  </div>
{/block}
