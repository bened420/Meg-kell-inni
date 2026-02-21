# 🍻 Meg kell inni! - Kvízjáték

Ez a projekt a népszerű **Nerdhub** YouTube csatorna *"Meg kell inni!"* című ivós kvízjátékának rajongói megvalósítása, amely **Godot Engine** segítségével készült. Tedd próbára a tudásotokat, és oszd be okosan a söreidet!

---

## 📝 Saját kérdések hozzáadása (Modding)

A játék lehetőséget biztosít arra, hogy teljesen egyedi kérdéssorokkal játsszatok. Ehhez mindössze egy szöveges fájlt kell létrehoznod a játék főkönyvtárában.

**Lépések:**
1. Hozz létre egy `.txt` kiterjesztésű fájlt ugyanabban a mappában, ahol a futtatható program (a `.exe` fájl) is található.
2. Minden új kérdést egy új sorba írj.
3. Az adatokat pontosvesszővel (`;`) válaszd el egymástól.

### A helyes adatszerkezet:
```text
Kérdés szövege;A válasz;B válasz;C válasz;D válasz;Helyes válasz sorszáma (1-4)