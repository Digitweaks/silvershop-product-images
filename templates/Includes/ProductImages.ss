<div id="ProductImageWrapper">
<% if $Image.ContentImage %>
    <img class="productImage img-fluid border-radius" src="$Image.FillMax(450,450).URL" alt="<%t SilverShop\Page\Product.ImageAltText "{Title} image" Title=$Title %>" />
<% else %>
    <div class="noimage"><%t SilverShop\Page\Product.NoImage "no image" %></div>
<% end_if %>
</div>

<% if $SortedAdditionalImages.Count %>
	<div id="ProductImageGallery">
		<% if $Image %>
			<a href="javascript:;" data-image="$Image.Pad(275,275).URL" data-zoom-image="$Image.LargeImage.URL" class="active"><img src="$Image.CMSThumbnail.URL" /></a>
		<% end_if %>
		<% loop $SortedAdditionalImages %>
			<a href="javascript:;" data-image="$Pad(275,275).URL" data-zoom-image="$LargeImage.URL"><img src="$CMSThumbnail.URL" /></a>
		<% end_loop %>
	</div>
<% end_if %>
