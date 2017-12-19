defmodule CDB.Collections.Collection.TitleSlug do
  use EctoAutoslugField.Slug, from: :title, to: :slug
  alias CDB.Repo
  alias CDB.Collections.Collection

  def build_slug(sources) do
    slug = super(sources)
    if Repo.get_by(Collection, slug: slug) do
      slug <> "-" <> UUID.uuid1()
    else
      slug
    end
  end
end