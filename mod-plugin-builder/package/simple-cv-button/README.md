# simple-cv-button — recette mod-plugin-builder

Recette buildroot **dédiée** au seul plugin `simple-cv-button`, indépendante
du paquet `mod-cv-plugins` qui construit tout le dépôt d'un bloc. Elle sert à
isoler et clarifier la construction de ce plugin.

## Contenu

- `simple-cv-button.mk` — recette buildroot (télécharge le dépôt, compile
  uniquement `source/simple-cv-button`, installe le bundle dans
  `/usr/lib/lv2`).
- `Config.in` — entrée de menu / sélection du paquet.

## Intégration dans mod-plugin-builder

1. Copier ce dossier dans l'arbre de mod-plugin-builder :

   ```
   cp -r package/simple-cv-button <mod-plugin-builder>/package/
   ```

2. Référencer le `Config.in` depuis le `Config.in` parent des plugins
   (par ex. `package/Config.in` ou le menu plugins utilisé) :

   ```
   source "package/simple-cv-button/Config.in"
   ```

3. Activer le paquet :

   ```
   BR2_PACKAGE_SIMPLE_CV_BUTTON=y
   ```

4. Construire :

   ```
   make simple-cv-button
   ```

## Notes

- `SIMPLE_CV_BUTTON_VERSION` est épinglé sur un commit précis de
  `pilali/mod-cv-plugins`. Le mettre à jour après chaque nouveau commit à
  empaqueter.
- La seule dépendance de construction est `lv2` (les en-têtes LV2).
- L'installation passe `PREFIX=/usr`, ce qui place le bundle dans
  `$(TARGET_DIR)/usr/lib/lv2/simple-cv-button.lv2`.
