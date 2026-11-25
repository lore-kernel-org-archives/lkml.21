Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595482;
	b=PnV15EadMGIpEeaAAHX8PLsrtqrA8oSSutvtMtH5bzG50t69a3RhkU/3XrKpnZztlNFt
	 QbTW8GKCPFS50H1X6SMUu7v0dmGmrGd5x0Kxc6kb+WgBSSENyq/oVtdWwI1Mim1wE++Hu
	 3bAbA/Ktq9r7o2jTmk2gkXbjn2MoIHrp1R2aLOW37T7WSoJzaKPqzW5a0wVHSAmyvhWro
	 0pYy8KJOBCfSe5le6KD8zkFyq8hPwIPKu6+qXmwgU4rYR9xpNEhZumbRR9de8xCdXKiFN
	 Rv/9qpYjBm3Po36Qb/VUQ/6NE8exwmjT5b9jDdUTu2MJpPAoUU4NGFKIoW0swAPhfCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E+BGXrVqMMcOjoija3bnHKJo8eMQcws0efPUmCBxKAA=;
	b=4kk/Z5hl3CiGFu1RUt70yfii5Pkg/cFlIfBkqCTjsDRwQqpGRwxI/FqLRtwWt5aW0L5Y
	 j+tkoTN/b7+L0rRDGgA5YOnkhgLboZ3CFC4VHzxpUFqT3j7AxDBUWLgJ3JIJ8DQeNrRYP
	 GLMz+uKLc40w64HSgZuOjtxeZBQIkB8lmMW8NExG5pqbApfQwdgX3zn1DEZwadWNIyDuF
	 BuauXm+j2800AJOz5kDAM5wv1P2tSoO+Vd419QdI5olN16pQ8dCLDJ36uEahEY3neIBWV
	 2W6uC97L1E/ZpFDFOBfrRGkckM+HM+/UIA0w9RfctiqJ0hSTM4MVu/rLqr9O8N9fv1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnQ8szL6;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F72606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnQ8szL6
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7224786c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595481; x=1796200281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+BGXrVqMMcOjoija3bnHKJo8eMQcws0efPUmCBxKAA=;
        b=QnQ8szL6ohbVVpqxtT5eIhcVWtsHmMcOKM685nYGz98zYQquP1LF5UPe7tdRkv08v/
         RFv1WkkZsuctp9qIldIKbQ64gdsTD7XGdRc2FRLm+pDbpUevLfEQrOwjEIFXpOGnM0SY
         U073pb38KE8xeE10fA4FghIHBizOb6STs4fG4YsK3kow5h21EZ2ooCRKxTN8C9Zvk/9H
         IwkBxsjstzEBSK+sggQBsDQBizXDeBiaEm46orKn99VROXc5ZlswG8rKbuY8pKlcsx/k
         O/BFSQRb8cibj8gVy7Qz7k9dEwsnhj8zqXIfHTSg8tzU/dKbU072Df0V92jBStmgIPT1
         Iuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595481; x=1796200281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+BGXrVqMMcOjoija3bnHKJo8eMQcws0efPUmCBxKAA=;
        b=tRGlIF6OZ4VpMKdPncXncWX2wL+TJyhAq6hm6s6zi9NlFAbxkDobRhh8Ltj3CL7iqA
         tK2MrNKPPy5onVx5AqUPia1Wt8vANRwFFbaShM/4T0ycrEqDVRm0Va/INQc75FZu+buN
         T4FrQiQ6y8loeL3oMBv4CTPE2dUL6xQJu+h0O7VpRtRpnbtd4F6/FoEGdfIKXsrxpu57
         DNEqy/0coPIE+TN6goy/yeScYVMGD8fZGXcqActbPCenEO8vCye5nbV3cgpv09CDnjsn
         NdBbjCel7zthv3DbuOYl0/+loUUC9TdhBjGSgOVA6Vb2BOhmJzAPzTknUNOdN9/Axgg3
         iTTQ==
X-Gm-Message-State: APuU4Z/EpSyfdON1VkrSJvuekFnq5I/QIbXkUhzr4TZb/mimKNloFOd1
	qpAT1CdZ4pCvU/Se3DD+l0veM6eNMJARZDjOWLp9QBXUNcir+OD+AUpM
X-Gm-Gg: AZFdTZfrHiuwRThz3MS/FP96C/Akx47frr3cLshW+HFwNIHp7st8XQyDi9+ZpyfrwKo
	pbJ7udjYaxdTX/+7tPC15RBejooeMCbfgu36SGu82ij2ar7vgw0pMvx3zL9rKa5Kpm68R7276zO
	whL2jpSNxEXbP9kHHUcnZmHoHrONxykMg40j+iTPLfCzWVWAN608nv3vLRcPcgPb4d7Ddl0dGvf
	6SQhKl6w9F6W+rhVa4KE76Vv9hDJlfX3n0dWAwxBbwbyubR0kRjFALApjH/wk+jtBVgTH/HEG/c
	C/SypHCZP9EITKaLZTX06ZauRcW0WAqSLItRObChFpVqiP6W9DPZUUjSkI1TlJSpGQPTGuMyhm8
	Tk8kVoXaboKay/uil1/56i0kBt79WEqKUe5zRFwrO9nLMLRgTPF2wwv5FL29PpSg9M5rGJ/1zxZ
	D/p4IGtdumgAYu/GJtYtk4zHeN5OBYDTCq9IFnF3Y3WsEaQII6b0O3SIGz8VRmch4hLxOt3BkMj
	GQBAJr+oenOd4epwzWWBY7OGOamDpchH/ENTlxCeFlpLHEwNveIi26xkbCc1NNM0l3EKqWXpqoO
	K9fZ0YXmEdJ6yFtDNZJaRnYkn0TBZF6MyR6442FjhI2HWSxO2RM=
X-Received: by 2002:a05:7022:f907:b0:1b2:558a:d781 with SMTP id a92af1059eb24-1b5567b5788mr15355163c88.5.1795595481380;
        Wed, 25 Nov 2026 00:31:21 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm45162585c88.6.2026.11.25.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:31:20 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2] ALSA: core: Reject zero major number
Date: Wed, 25 Nov 2026 08:30:53 +0000
Message-ID: <20261125083053.3917-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6bd8ijb.wl-tiwai@suse.de>
References: <87o6bd8ijb.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reject a zero major number before calling register_chrdev(),
as ALSA expects a fixed major number.

Remove the redundant major and cards_limit variables and
use snd_major and snd_ecards_limit directly with
module_param_named().

Update device number creation and character device
registration and unregistration to use snd_major.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Reject major=0 before calling register_chrdev().
 - Remove redundant major and cards_limit variables.
 - Use snd_major and snd_ecards_limit directly with module_param_named().
 - Update device number creation, registration and unregistration to use snd_major.

 sound/core/sound.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..8ac3cee19e66 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -18,28 +18,25 @@
 #include <linux/kmod.h>
 #include <linux/mutex.h>
 
-static int major = CONFIG_SND_MAJOR;
-int snd_major;
+int snd_major = CONFIG_SND_MAJOR;
 EXPORT_SYMBOL(snd_major);
 
-static int cards_limit = 1;
+/* this one holds the actual max. card number currently available.
+ * as default, it's identical with cards_limit option.  when more
+ * modules are loaded manually, this limit number increases, too.
+ */
+int snd_ecards_limit = 1;
+EXPORT_SYMBOL(snd_ecards_limit);
 
 MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
 MODULE_DESCRIPTION("Advanced Linux Sound Architecture driver for soundcards.");
 MODULE_LICENSE("GPL");
-module_param(major, int, 0444);
+module_param_named(major, snd_major, int, 0444);
 MODULE_PARM_DESC(major, "Major # for sound driver.");
-module_param(cards_limit, int, 0444);
+module_param_named(cards_limit, snd_ecards_limit, int, 0444);
 MODULE_PARM_DESC(cards_limit, "Count of auto-loadable soundcards.");
 MODULE_ALIAS_CHARDEV_MAJOR(CONFIG_SND_MAJOR);
 
-/* this one holds the actual max. card number currently available.
- * as default, it's identical with cards_limit option.  when more
- * modules are loaded manually, this limit number increases, too.
- */
-int snd_ecards_limit;
-EXPORT_SYMBOL(snd_ecards_limit);
-
 #ifdef CONFIG_SND_DEBUG
 struct dentry *sound_debugfs_root;
 EXPORT_SYMBOL_GPL(sound_debugfs_root);
@@ -61,7 +58,7 @@ void snd_request_card(int card)
 {
 	if (snd_card_locked(card))
 		return;
-	if (card < 0 || card >= cards_limit)
+	if (card < 0 || card >= snd_ecards_limit)
 		return;
 	request_module("snd-card-%i", card);
 }
@@ -280,7 +277,7 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 	}
 
 	preg->dev = device;
-	device->devt = MKDEV(major, minor);
+	device->devt = MKDEV(snd_major, minor);
 	err = device_add(device);
 	if (err < 0)
 		goto error;
@@ -396,18 +393,19 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
-	snd_ecards_limit = cards_limit;
+	if (!snd_major)
+		return -EINVAL;
 
-	err = register_chrdev(major, "alsa", &snd_fops);
+	err = register_chrdev(snd_major, "alsa", &snd_fops);
 	if (err < 0) {
-		pr_err("ALSA core: unable to register native major device number %d\n", major);
+		pr_err("ALSA core: unable to register native major device number %d\n",
+		       snd_major);
 		return err;
 	}
 
 	err = snd_info_init();
 	if (err < 0) {
-		unregister_chrdev(major, "alsa");
+		unregister_chrdev(snd_major, "alsa");
 		return err;
 	}
 
-- 
2.55.0

