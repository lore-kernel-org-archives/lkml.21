Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426931;
	b=KSBURK/PEWDim6Di9VlEz/Aje1dnxIQ16jGxJcXznFCeYHTCwShsRdsiaiRdfl4QmlhO
	 cIYrs2FI45AMcp0v6SFMA9mbPU744VcXKQ+vwvBh53y6JpHrSmAFora7vDpPZly/YunRr
	 9Kwskjqf+gbTbMDJwNLXVfPc4SCaeb7iHM63rwXqVzdNZVbOg5gxRZp4FwpYxOdlgN33S
	 /XjkdyRboCTTuL7+YW51oMl5r/KNKP1vlBQzsDXYNQFjtUPn9xNHvlEu4wp/nOgArjNNu
	 kPOYoLKO7ZG/op5ulwL3PDlIqhsqP1FF5IuE7AcIwVe6X4iXCU+itbHC/CpIWyWIToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Uwclkd70WMb7Wc7NZ9jA+4hNfpuCqx21LkN7LDxWsVQ=;
	b=Ed9AvuCd7uPw1dZTyFYwcqklQ9DhuZVJM6Ot3/V6Axw14d5EUyLGgV68cW4OfUmnUd6/
	 U82aKpQFp6DJjCTB0xSeYjQyyINJJyhDMc4plN8O/iXB86xP5eZh8pogu4QG9/rH/DVjk
	 2n3wjhsrPawpbF32TG9tlB5m2/J22JAfnpH1bv1VrI+eLRGxXf2TNOaMODhhPAXamFcZS
	 HjBc4UFPpMTEgHKN5hdtO96+R81vs6AvHKh5OkpnM5CHuuJR0MPIId6W+8D77W03fVGZN
	 3UX7L5/zRiEmejLKMXaK8+Y5jt4WdXMHxCRVGZbnm8JFwHd8ODFBj++T/oS480nOMbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuIktz7s;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuIktz7s
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16260005e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426929; x=1796031729; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uwclkd70WMb7Wc7NZ9jA+4hNfpuCqx21LkN7LDxWsVQ=;
        b=AuIktz7syzWPH8OqGO16+pChAtFpQRDoo2mpuAl8u9DlWKEE1sUfsFHoShkvM9Xu5/
         /EgCzn0IzHxG0v0ShzWMyJ01cLLfUpp9T82HK1JL57Kzx7JmkVZ/yhwnNYB/JXw0g91+
         p7XzdwZmdZ3wAJBBPHzC82JB96Dol6T7MUyH6cdkx3/iaMEa0m1GqEz5WyRMnut8vVGf
         gJpeTQQlkUrFTktXNgjfm82CqfmmjV2wOhRKL/cSncWKn8xoMeRxHk3e8y25AzFCu/06
         aHoiAaFCitU3Xqj7a2cD0ARHGjQaMdlcOLmVd0Ni98GC8tF9jZICJbUUSUAkJoTk9KQ9
         KlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426929; x=1796031729;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uwclkd70WMb7Wc7NZ9jA+4hNfpuCqx21LkN7LDxWsVQ=;
        b=ur70hZI10yWUzpqgkK6Xifx2hyRbmajmDBnnmgILPygPXixccb9mpZtNtQI/QeLUC1
         FdR1IK6nwMd6B5ihk87QKgmQtyt1ttnuc1x8p/hnm7uo4m/EsRSzXPOnZNqo9W4lno4l
         RxqRmz+XEyPcMsRfdnobxSpxNZ0l2ocxmHTib20U4pnWZ1lqS0lyFh6Ht3Vp+zODEQz5
         TlwncS4RgQueIhU/A09/WZ0ZsNBzMqLWm6IjvYmLD+V+Rs1WSoKjOjDWfmjptOb6yJaR
         +XVmBr91IFeqCNIhPYZP/rUra/YjGpUkp0WqSOIiujln6sY1UORXhdoFuOtaSRn6KVss
         nMYg==
X-Forwarded-Encrypted: i=1; AL+hErE9TO4gVfdTYDbH9OHiUCQqEtQTqV754TY0Okd8y0evXpPckgCFGM4VxROPRZHdwkLTEklaWP2k7k6mCgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6qIdUdiRn948Kl7zL03AqswFxNgKA2m6SNukubzWUkTYhwsLT
	3/+K5KxKaKTVQ31MQUQ+XQzLfrjlyaFuN/ZgxMzpRNAdD2N9F0JLqH3b
X-Gm-Gg: AZFdTZc9c2f1H+QtS6iUCqZZWjGsPECNLhZZSx/S+V42G00wm+t6WRaXEHlF78rvg2v
	ailfZKkRt8L5yatewuuZKQDsS2AKuux2km+xBtCwm7vKBmb13+jXG1GUNHInheRIlAl37uFKh6F
	w7shRlKYocCLTygDs7Q1aKR3KbzO+5rJF/3xu9BqIcaHoyk7mcBU+snCeujtb9pzWwdIqXA/oIa
	64+FUaA9L00kR2v672EwixMKy5K0UOm+ZZQUmqrYg1NdC5lrs8Lnod1W4nTfU044whwxQ6kQSh3
	qGhZB0BvetyZ/MHZgKAdBQUzHulZ49C9kO+NYjwqmJuNZ10Ccw158sc7aprTJjK1ZohFb/dMs7z
	C7OstplJ6Dge+u7ANRvX3lO11wafvKIlfWOJi/bhjvIHftLm3h0gDhbp0XcqHWD7XwIA0nKkrNo
	UwZYphgxUY+OLbQK3wsAuY3CtPf2IpHQPHAligGYxX2c7JJ+o22FnnKdbjbTgstQrIvaWaHhgkg
	9cwlgTo8N8IvmjN2/soiKFNbyq2Nny17bku4NcN09w+vtDYjhF1xYny93L+JfZ8+qz3ho02/bq9
	blX9Pw2JuS3vZA8iQNIA9ebXcXVXPw9J1Iwx/BpgC/14mYZsBGW4yEUty01Kbio62dpPvk6ll+l
	iHWCnZgH6EFKLTjkTb3MUTYenkJ53OdJCo/Pns1UGWFPn+YU=
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr213486475e9.22.1795426929109;
        Mon, 23 Nov 2026 01:42:09 -0800 (PST)
Received: from [127.0.1.1] ([85.97.71.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm334955785e9.7.2026.11.23.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:42:08 -0800 (PST)
From: Sercan GOKMEN <gokmensercan@gmail.com>
Date: Mon, 23 Nov 2026 12:42:07 +0300
Subject: [PATCH v3] platform/asus: asus-wmi: Skip keyboard backlight
 read-back on B9406CAA
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-b4-asus-wmi-b9406caa-kbd-readback-v3-1-1e6875af3703@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf8V07Zg+kFBX/odxMW0HqAiYFlBD+
 HcBN7rT5UluzrkjixQ8RXbYjCzQ4KNvmxnUdsNsiU1B4N3MTHKZCi4lmAQw9hHutQejE55aRKi
 Mg0DoDNoKkFwm9V65TGk2e26Bcv9YG6fzm2NvLmS7RbwsSh+7NjzXE4NYdv/0BgECcqMUOZ05J
 9JjUaO/7mxbs6U3yA+j4r8Y5Wy0qJUxmiudfxmnaXoBUeK9lDYBAAA=
X-Change-ID: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Moad Tarrih <tarrihmoad@proton.me>, Burak Goncu <burakgon12@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sercan GOKMEN <gokmensercan@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426927; l=4769;
 i=gokmensercan@gmail.com; s=20261022; h=from:subject:message-id;
 bh=V/Am6+fbXbJkDo7e2qx/4cM5ZZeA3AaF52oI6Qyyu4I=;
 b=hmm8VSWeyUoWR4KByn1xNXfl0UiZ+b8uLlR2Wn68E3ZDfBIp/X6Iv3RHGNigB11rn5TtMUMgE
 oT2Wn5Q176IBSL/oj4FXCWMQCo3crvT47YZ9un1BnWH+I6HbgEMbvXB
X-Developer-Key: i=gokmensercan@gmail.com; a=ed25519;
 pk=nFIlLCcGouUfBov8xxW0K4qUtEjdhJniMOO8WCSqghU=

On the ASUS ExpertBook Ultra B9406CAA (BIOS 312), DSTS(0x00050021)
always returns 0x550000: the presence bit is set and the level is 0,
whatever level the EC is driving. The DSDT builds this reply from
constants and never reads the EC. Writes work.

kbd_led_get() stores every read in asus->kbd_led_wk, so each sysfs read
resets the cached level to 0. sysfs, UPower and brightnessctl then
report 0, systemd-backlight restores a dark keyboard at boot, and the
next Fn backlight key press always gives level 1.

Add a kbd_led_no_readback quirk that makes kbd_led_get() return the
cached level, as the !kbd_led_avail path already does, and set it for
this board. Every path that changes the level keeps kbd_led_wk current.
Until the first write after probe, the driver still reports the 0 it
read at probe time.

Signed-off-by: Sercan GOKMEN <gokmensercan@gmail.com>
---
Tested on the B9406CAA (BIOS 312) on Linux 7.2.3: brightness reads back
the level written to it, UPower reports the same value, and the Fn
backlight key steps 2 -> 3 -> 0 -> 1 from level 2. On 7.3.0 and 7.3.5,
with the same change built as a DKMS module, writes of 3/1/0/2 read back
unchanged.
Build-tested on review-ilpo-next (2268d837dea1) with W=1 (clang).

This conflicts trivially with Moad Tarrih's G814FP patch, which adds a
quirk_entry field and a DMI entry at the same places:
https://lore.kernel.org/r/20261116-asus-wmi-kbd-readback-v5-1-f2f170836bf4@proton.me
Applied after it, only asus-nb-wmi.c needs the two entries merged.

The patch was prepared with the help of an AI coding assistant (Claude
Code). I reviewed it and tested it on the hardware.
---
Changes in v3:
- Rebase onto review-ilpo-next, after the move to drivers/platform/asus/,
  and use the platform/asus prefix.
- Trim the commit message.
- Drop the comment on the quirk_entry field and shorten the one on the
  quirk.
- Link to v2: https://patch.msgid.link/20261030-b4-asus-wmi-b9406caa-kbd-readback-v2-1-ca93bb9039f6@gmail.com

Changes in v2:
- Shorten the subject (Burak Goncu).
- Say that kbd_led_wk keeps the 0 read at probe until the first write
  (Burak Goncu).
- Move the test details below the cut (Burak Goncu).
- Rebase on current for-next.
- Link to v1: https://patch.msgid.link/20261022-b4-asus-wmi-b9406caa-kbd-readback-v1-1-fb33ed98dd16@gmail.com
---
 drivers/platform/asus/asus-nb-wmi.c | 15 +++++++++++++++
 drivers/platform/asus/asus-wmi.c    |  3 ++-
 drivers/platform/asus/asus-wmi.h    |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/asus/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
index 3b0f3346dc..420fdced34 100644
--- a/drivers/platform/asus/asus-nb-wmi.c
+++ b/drivers/platform/asus/asus-nb-wmi.c
@@ -93,6 +93,12 @@ static struct quirk_entry quirk_asus_unknown = {
 	.wmi_backlight_set_devstate = true,
 };
 
+/* B9406CAA: DSTS(0x00050021) always reports level 0 */
+static struct quirk_entry quirk_asus_b9406caa = {
+	.wmi_backlight_set_devstate = true,
+	.kbd_led_no_readback = true,
+};
+
 static struct quirk_entry quirk_asus_q500a = {
 	.filter_i8042_e1_extended_codes = true,
 	.wmi_backlight_set_devstate = true,
@@ -167,6 +173,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 }
 
 static const struct dmi_system_id asus_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ExpertBook Ultra B9406CAA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "B9406CAA"),
+		},
+		.driver_data = &quirk_asus_b9406caa,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. Q500A",
diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index b33ebdb21a..725f827a17 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1975,7 +1975,8 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		if (!asus->kbd_led_avail)
+		if (!asus->kbd_led_avail ||
+		    asus->driver->quirks->kbd_led_no_readback)
 			return asus->kbd_led_wk;
 	}
 
diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
index b45f81b38a..72a43586ff 100644
--- a/drivers/platform/asus/asus-wmi.h
+++ b/drivers/platform/asus/asus-wmi.h
@@ -52,6 +52,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool kbd_led_no_readback;
 };
 
 struct asus_wmi_driver {

---
base-commit: 2268d837dea13a78639fa3dad60472bb67478709
change-id: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839

Best regards,
--  
Sercan GOKMEN <gokmensercan@gmail.com>

