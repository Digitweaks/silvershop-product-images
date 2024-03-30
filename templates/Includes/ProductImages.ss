<div id="ProductImageWrapper">
<% if $Image.ContentImage %>
    <img class="productImage img-fluid border-radius" src="$Image.FillMax(450,450).URL" alt="<%t SilverShop\Page\Product.ImageAltText "{Title} image" Title=$Title %>" />
<% else %>
    <div class="noimage"><%t SilverShop\Page\Product.NoImage "no image" %></div>
<% end_if %>
</div>

<% if $SortedAdditionalImages.Count %>
	<div id="ProductImageGallery" style="margin-top: 0.5em; margin-bottom: 1em;"> 
		<% if $Image %>
		<div class="thumb-image-gallery-product">
			<a href="#" class="image-thumb" data-image="$Image.FillMax(450,450).URL" class="active"><img class="border-radius img-fluid" src="$Image.FillMax(200,200).URL" style="border: 1px solid white;" /></a>
		</div>
		<% end_if %>
		<% loop $SortedAdditionalImages %>
		<div class="thumb-image-gallery-product">
			<a href="#" class="image-thumb" data-image="$FillMax(450,450).URL"><img class="border-radius img-fluid" src="$FillMax(200,200).URL" style="border: 1px solid white;"/></a>
		</div>
		<% end_loop %>
	</div> 
<% end_if %>

<script>
jQuery('.image-thumb').click(function(event) {
    event.preventDefault();
    var imageUrl = jQuery(this).data('image');
    jQuery('#ProductImageWrapper img').attr('src', imageUrl);
});
</script>
