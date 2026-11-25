Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596235;
	b=WLHDxA3ZVvPh1Pb96bRZn9M6ap/SngOxw2A5gAo8nq+dVqIPy55gZPQQjKa3RuntVVR6
	 ztOmPIoBHLsIVjG44KIVaUYP4KBeTKcOHreGTeDslZDkn8lB2X/HFjoMr/7remmpPIevK
	 qbjpYAI4szqcki9hqVNhyaotHuwqQgaYmjb8CSOjv0w/PWwgiZoYLTHxni/iH1Ho/00gk
	 E+Q1vl0oKjqhYNZaYzDNxPp3qEgQyz3QcBf/TMsguIZ+gcMnjViKXjVwaauRRlqiPK04j
	 0uWtxZ4ctJhKWAA4YoVeb4OYo0+xxPIhlRtAsqqa2wUyLHATj0zhRjLGCokMcl/OgaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I0dqCF/aThIiDafyh6DDh0Xjc0ZnuFb8l+reQW+4vQE=;
	b=T+43TQv9lHGiF0xfKymP5uPppXhYLjG80IBf+sS2NyDrbJCPRFdDDVoH69rIbHm81mTW
	 zpwFtonwtyCwIKRlgyVeOAlXoIFIKNr+C6QIvyQri3jXkHoXirFzbYLNAgITZEi/Kxeys
	 d0F1CnbjPWSblkwF8S5EdyGiGwebCOze+8xsC4KUGSs+nQCZgbdjPxbwq1+ZWlPqQa+ng
	 lCO01lr7kR+QTDTTZAE/mgIAEa8yCHzYJBVTbePqcYKhrA+z21LtbefuTVibvFHyQ2IiV
	 TEwdcqCZwDT35PJi8gjaXBMFlWvRWI8gzamkjduT4fGftS3Rcxp3d1+RTJGcw4ojFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCsvPD7y;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCsvPD7y
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-18818daa3e7so3264624c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596234; x=1796201034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0dqCF/aThIiDafyh6DDh0Xjc0ZnuFb8l+reQW+4vQE=;
        b=RCsvPD7yEXdkYl5Fj/SCcvUdjYbckUHnZc2iBk8ZXGQSw7ScjtM8TZux+6Vy03oHTg
         a7T/gH24lg6H5hsI6EQmh9KjGqtA4PkdcaAf1+OPQrK+1h365ITVpKElt5q6UoMY+3vG
         X9wILFPdsmhkzDi+DQYoc0J1ldNkFP9SOB1ALQP1MnxTzcBg81WmeGG+jmQ1kZVCCARC
         G9nhjkrWJ46g6UWGWzdCwIA9t7euu7C52B2lK6X88OToMZ42wnXBwwdBBAYAeA2yivh6
         Wx9Ph6tn43yf+yXe5vysulSsn4hUDu6Z57W5QEOqrCNJFNa0LodZFo85GN3cZP2YmmII
         YgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596234; x=1796201034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I0dqCF/aThIiDafyh6DDh0Xjc0ZnuFb8l+reQW+4vQE=;
        b=rsDjRhDQE4hKPU8j4qvJLqW4kz5V1sLfY2hSzQUCNIjTZYod/1vzkf2V5yf2uUHTIQ
         +PuJLq4JnLE7fO1IDgGJsuNVrWuty63U+EmUZG5PH4aKSwRLa8zC5nZBnrOsTs/42nco
         7FkthDaOERBfPi/ko4kvLZ1/oTHlsCohjzY7wjYW25gGn/zrcZQS9DpDG46vQD5UlcdP
         XXwiV1SjrufC2CaL6NYgyrROunQihYB7Bedk4W+i3CxR5lL8kTIvdDFgNu6hIt9Mexws
         km0YRjGT+l9R3gCsiqHSpx9kugWkanufoZ+Y3S/7uPwQHxU7+vVZvhCV2iu6nRQN6L5k
         KHHA==
X-Gm-Message-State: APuU4Z/qShLsnrnEnAHCARqvssNthnVmmMydqAzPSoVmLQnB+V6qqOPW
	tJZPNgB0Zq/DIvvQyzdDHNvYNpI6LxM5zaU/sIEuNnu8ALHs/1nHUeRh
X-Gm-Gg: AZFdTZf2LUvrNudK3MDcNftiQHOZSdEEGJjtxA8nfzwbZ3uBgZ9eaKfiA7IAJF6HmME
	Qm/WbcNE5rrpGBUO1rguZoUlcr3tF7i5BiKyuRkl6Fc5NVnS+DIAVDFsChiHoWV6pZYclTQWu1V
	G9V/m3WeGQpjlCsWHu3kZKTWKDCovg/ykP9kYfhzfCkWZjFrURmAxoPUxFivh9x8QQtnb4lQNQx
	aj8IIoyJZGJ+fF4fKwL5mGUk6Ts2fVuScWdtVT276tUV+EW+n/6h28IklE5AmDxdZgyrdNQelNC
	4f7tIG40M2HfOYdCkSajnlS4gc9EMPybjnufBXwxMTbh7226vYHZeJN7hlpRYptM8FhB4/X6xUW
	noyWMvybGbEn2jsutDoT1n5T3+3ygWCfIs2BJtRtny0ZlDWwE7PcHnzX7mZBbLM0hgAQs4FfdH7
	1eMoW8XigYkLQ6XOVx31N0EuVENPVR5cyIiauNlzKJ3hWJUhKoQavmGl6oFY9cgZtzDJHOHqRvK
	6m7P8rFzebjftzNetY9R+EqoKEW0N9gnuwjsOlxMtQMneyDflNI1GgMKMDhVos37a4SFaCQ79Ik
	aEY+v4jU7ia0PQJHX55eNEYnYMTCk8V5fVgl9wG3xFWLvo3WsvM=
X-Received: by 2002:a05:7023:a41:b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1b55691518fmr16313131c88.17.1795596234387;
        Wed, 25 Nov 2026 00:43:54 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm46168566c88.13.2026.11.25.00.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:53 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: [PATCH v3] ALSA: core: Reject zero major number
Date: Wed, 25 Nov 2026 08:43:24 +0000
Message-ID: <20261125084324.4151-1-sreekuttan2156239@gmail.com>
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
v3:
 - Update the unregister_chrdev() call in alsa_sound_exit() to use snd_major.
v2:
 - Reject major=0 before calling register_chrdev().
 - Remove redundant major and cards_limit variables.
 - Use snd_major and snd_ecards_limit directly with module_param_named().
 - Update device number creation, registration and unregistration to use snd_major.

 sound/core/sound.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..4c71f2bf440a 100644
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
 
@@ -426,7 +424,7 @@ static void __exit alsa_sound_exit(void)
 	debugfs_remove(sound_debugfs_root);
 #endif
 	snd_info_done();
-	unregister_chrdev(major, "alsa");
+	unregister_chrdev(snd_major, "alsa");
 }
 
 subsys_initcall(alsa_sound_init);
-- 
2.55.0

