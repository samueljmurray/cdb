export default function() {
  const sirTrevorInstance = document.querySelector(".sir-trevor");
  if (sirTrevorInstance) {
    initializeSirTrevor(sirTrevorInstance);
  }
};

function initializeSirTrevor(sirTrevorInstance) {
  SirTrevor.setDefaults({
    uploadUrl: "/admin/images",
    ajaxOptions: {
      headers: {
        "X-CSRF-Token": document.querySelector("input[name=_csrf_token]").getAttribute('value')
      },
      credentials: 'same-origin'
    },
    iconUrl: "/images/sir-trevor-icons.svg"
  });
  const editor = new SirTrevor.Editor({
    el: sirTrevorInstance,
    defaultType: "Text",
    blockTypes: ["Text", "Image", "Video"]
  });
}