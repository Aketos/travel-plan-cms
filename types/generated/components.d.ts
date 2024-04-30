import type { Schema, Attribute } from '@strapi/strapi';

export interface BlocksDescriptor extends Schema.Component {
  collectionName: 'components_blocks_descriptors';
  info: {
    displayName: 'Descriptor';
    description: '';
  };
  attributes: {
    value: Attribute.String;
  };
}

export interface SectionHomepageHeroSection extends Schema.Component {
  collectionName: 'components_section_homepage_hero_sections';
  info: {
    displayName: 'Homepage Hero Section';
    description: '';
    icon: 'crop';
  };
  attributes: {
    introduction: Attribute.Text;
    descriptor: Attribute.Component<'blocks.descriptor', true>;
    background: Attribute.Media;
    Test: Attribute.String;
  };
}

declare module '@strapi/types' {
  export module Shared {
    export interface Components {
      'blocks.descriptor': BlocksDescriptor;
      'section.homepage-hero-section': SectionHomepageHeroSection;
    }
  }
}
