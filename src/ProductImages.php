<?php

namespace Digitweaks\SilverShopProductImages;

use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\LiteralField;
use SilverStripe\ORM\ArrayList;
use Bummzack\SortableFile\Forms\SortableUploadField;

/**
 * Extends SilverShop\Page\Product
 */
class ProductImages extends DataExtension
{
    private static $many_many = [
        'AdditionalImages' => Image::class,
    ];

    private static $many_many_extraFields = [
        'AdditionalImages' => ['SortOrder' => 'Int']
    ];

    /**
     * @param FieldList $fields
     */
    public function updateCMSFields(FieldList $fields)
    {
        $newfields = [
            SortableUploadField::create(
                'AdditionalImages',
                _t(__CLASS__ . '.AdditionalImages', 'Additional Images')
            ),
            LiteralField::create(
                'additionalimagesinstructions',
                '<p>' . _t(__CLASS__ . '.Instructions', 'You can change the order of the Additional Images by clicking and dragging on the image thumbnail.') . '</p>'
            )
        ];
        if ($fields->hasTabset()) {
            $fields->addFieldsToTab('Root.Images', $newfields);
        } else {
            foreach ($newfields as $field) {
                $fields->push($field);
            }
        }
    }

    /**
     * Combines the main image and the secondary images
     * @return ArrayList
     */
    public function getAllImages()
    {
        $list = ArrayList::create(
            $this->owner->AdditionalImages()->sort('SortOrder')->toArray()
        );
        $main = $this->owner->Image();
        if ($main && $main->exists()) {
                $list->unshift($main);
        }
        return $list;
    }

    /**
     * @return DataList
     */
    public function getSortedAdditionalImages()
    {
        return $this->owner->AdditionalImages()->sort('SortOrder');
    }
}
