Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951813;
	b=VrIahKWBZatcjjZl2YEo28f/vGykwWMZvL2PmKXiFzpZfQWgWxwT1+RWde6JJHu4C/gE
	 LkBwoFdadpl9fsyOLDll5E3ZTOcOxnfhnw8NKife/ZGtJh9J/CeRz3wzGULFp+jzUf/SV
	 /JAu8Qiq6OfwyQwhoVes9DXdRkGtx4ZOYpwAxA4fJcaqmjRt3iWMxBYVbX9C8mDnnGE5y
	 k5Goju3EREBtkWKGncAPm/NdSb/4S1/V+W1YWGCAnlkxI8fLHMau2IR0Df7epDeFuTwoE
	 qrI8hKMTvBEBG3MKWfHUB3dZqjHiAgyjYt/jsUUoPgsDeRhc36InOaRto9BT1D5jQEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951813;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kDVcn8uLG74ma32d8wtmy7ktrF0XJBSPshTOfgs6Qj8=;
	b=cjTN7ii2MhBc2YR48rgaNItYEURXSBBby9rOZaK4R2w0jETpLv7HUL6tUL0N4D1keVDb
	 vy0OS8o8JYPJn1AcpzZFB3EcubHAqqRGEzYePbp5wpUs1w689ycO2IQKRXQjW2lCO6EMD
	 8+hNKhemI5Ql3azbO8Nu1ih/2MOw7sM+jOZrqY9RW7vZNLRKIRhetMe/xYRUvMX3S8kUN
	 0Iq9P276Q/YGHeIG/V1ITVtF8Kq18pK0uARDM/kLrXnIki+dx0rSrKYs0wX425Jhr6jXC
	 /5Mi0ssKYBz2TtlqX+nY62lLa5RNSgs9LiXMEkldgfJqtH2E72xV7JK3g9R5pWOQAig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80F606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E80F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so507121eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951811; x=1795556611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDVcn8uLG74ma32d8wtmy7ktrF0XJBSPshTOfgs6Qj8=;
        b=l1u9DgoKZBhwAejcTn0qLcDTRZUtt6yl92txMcfY4BRIGVa6r7x2wcv+Y6f4VgCe/f
         trm0z/9borXa5X9xMjhNPUedcKAY3fA1WlAKIYsL5mfaqPYau6sXVTT+tMZaVcTh+FEo
         x+WHdJk1j1ecZk/pvO+JMUmWVOlzNG9NzGzm56uPz1E2iUnG9zgXNS16ip3HXZCVP2US
         NASEglJLpIII7XAjpDJiZhU2wimpqr7j9/2F15eZp+oK7HdbftC0Acbdq7qsoEFWLsHo
         udiwhbkPm8wm6V7SIVri6qgKwssI21JMngLAqYMtTNkvyW06XaCE7er792Lcnv0EikAs
         bM5g==
X-Forwarded-Encrypted: i=1; AL+hErFNW0nIHsCn/0HHMZYqi3YjYxUUw06KPJDA6CzaEks8NbycljZw2lmPjuUOsXTSiJOCoKE8L4HvD0kc4NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QUz5l6ZVrObO/+cCJwp2XRnizOmeK0AROcfEfBTxnK85IDelc
	B/p2VgA93d5lAwFLTCOKsPMbqMivaHFU/Q/qjZ38M91py/OTHFIvvgL8
X-Gm-Gg: AZFdTZePjxOXYR+bp9ohmhgKPB+s2FcMkJpPGA/1/3mnCFmP20m6/gAXzYFT5ai90Kq
	LUxV9njnMiBjhkv0QybwQ5mAXK+pE378Nn0hpcR7BaEq4Y5ctNonasS+E6NWbtVBubM1NXyKomO
	+vKTXYrT6wpsqsuzC3fM//OWiO2UMB/ttWadaNOXpKawCbOyQfybHENo+lkxD/kjs2mcxIuamxA
	+LnWAWOGq1QschOeObTOLxVG4hhSJWUZFNbdQXLSAf+tMnirb85p939KQhgsC+7tEGxCsvVowys
	18W6HAz9qe2ckEfkeCW+0+0OT5AuEbFhD9XJnQQnPGb5WULWB1IHYCZ6HSuKe6cctDTHoUMr1fe
	ME5o3v0nU/B9UnoETVKqY2SMjDcc2W3XyAd9EjmskCeXcz3r2/YkB1n+wzXCiyMemVB8wJCAgFL
	9VnL6C1gQqdC+UsWjbmmgz0EcDJw8yHErAwF+STMHJqd/iOX+yFzVDbAkaH4PX84yE2K3U2qUWm
	8muwaV2ExvP/JY7YUUsTh4EI52rFhDjHYc68kWDA06VvTYajCbrzliwS2lxqfFZ1RoG8L0J9Bs3
	nIbCmeKYF8cSQ7vyXVogJAb9Hq4f9nvCBbBKPmpNzA8xHo6Xj0IIRbNS5SFbiR3D2OkKwdiQbu7
	rV2vMU7xv3o2XPMg=
X-Received: by 2002:a05:7300:6a90:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3828101fb2emr560648eec.6.1794951811344;
        Tue, 17 Nov 2026 13:43:31 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm1303828eec.3.2026.11.17.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:43:30 -0800 (PST)
From: Sungwoo Kim <iam@sung-woo.kim>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>,
	Sungwoo Kim <iam@sung-woo.kim>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda: remove unused chain_id entries from fixups
Date: Tue, 17 Nov 2026 16:41:57 -0500
Message-ID: <20261117214157.2815179-2-iam@sung-woo.kim>
X-Mailer: git-send-email 2.47.3
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

Several HDA fixups specify a chain_id without setting the chained
flag, so the chained fixups are never executed.

Remove these unused chain_id entries.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
---
v1: https://lore.kernel.org/linux-sound/20261115132215.4084031-2-iam@sung-woo.kim/
v1->v2:
- Remove chain_id instead of setting chained true

The unused chain_id entries were introduced by:
- f1ec5be17b9a ("ALSA: hda/realtek: Add alc269/alc662 pin-tables for Loongson-3 laptops")
- f83bb2592482 ("ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model")

 sound/hda/codecs/conexant.c       | 1 -
 sound/hda/codecs/realtek/alc269.c | 5 -----
 sound/hda/codecs/realtek/alc662.c | 1 -
 3 files changed, 7 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5f2b0b55ab6e..5b5250043a50 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -974,7 +974,6 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ 0x1a, 0x05d71030 },
 			{ }
 		},
-		.chain_id = CXT_FIXUP_STEREO_DMIC,
 	},
 	[CXT_FIXUP_INC_MIC_BOOST] = {
 		.type = HDA_FIXUP_FUNC,
diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..96b691926570 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6431,7 +6431,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_TMI] = {
 		.type = HDA_FIXUP_PINS,
@@ -6449,7 +6448,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x20, 0x8000ffff },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_L101] = {
 		.type = HDA_FIXUP_PINS,
@@ -6467,7 +6465,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A1802] = {
 		.type = HDA_FIXUP_PINS,
@@ -6485,7 +6482,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x21, 0x03214020 },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A190X] = {
 		.type = HDA_FIXUP_PINS,
@@ -6497,7 +6493,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1b, 0x0201401f }, /* front lineout */
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC256_FIXUP_INTEL_NUC8_RUGGED] = {
 		.type = HDA_FIXUP_PINS,
diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index a0efd4596c88..6a65ec772e9b 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -629,7 +629,6 @@ static const struct hda_fixup alc662_fixups[] = {
 	[ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_mode_alc668,
-		.chain_id = ALC662_FIXUP_BASS_CHMAP
 	},
 	[ALC668_FIXUP_ASUS_Nx51] = {
 		.type = HDA_FIXUP_PINS,
-- 
2.47.3

