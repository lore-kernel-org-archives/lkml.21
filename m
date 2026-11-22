Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328358;
	b=kILLXAjvPghrxHDVRm5+byYVqfipRLS2tZMTvfw3g0/Sk2kSDnLvfN0u3qzNGqaKPVg9
	 AEZUGzhFLbVBqzbrnjidrMW/kkgvzasNZYmoM5WmrujP2mgZlcG0NTaiOOwAClR/7sfI1
	 UvC6GeLKr/CZkbnGpHPgREZmcDxOdKLEZ4vEAqn1DyRwA4SNF1IFuUxONk5GJ48XblyzO
	 z/kRQ0AnOFUUCbneKqV47wd3XCTWPuIi6BH3Cwn84PtNdoB229pMqqKf7SPC3t1hlnd2S
	 656fZ6t1lx/JKUdNM1Kle7RwpIrhzZ/rk3vi5OgWqx5glrzzFIGNQn1fni2d4B2jfrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+i5UXNicz+dDMLjLCfQXLU1+yF38ghxKYIXqlpkcYQ=;
	b=dfprG7PjGfyMCc8N8fQt0PRSZ5Sr6l5MV/1YjRKOzATJ1HZ1+dNj5C8lNwzSPgnF9uqZ
	 yGJppTfl+Ezd6hleW9QnhdPxcyEV5+nmWNuUwdlcQo9BU2bc2b15JVq7dMSs0PwKb0kpd
	 IDzEUgom4hmRt/DHU3PlQOEZQR1sRLMl5sbWEKL2cyqim5fwdwsz8g2PnBv6GkzxUl18A
	 bTJOYxuizw0xJyekRKXsJLhFMiX+SoUMM98hEPg5Dp92Cs9mq/FbkDlqjDWa5FQAFTW3/
	 kxY1DRX3dsbVwStG8VsCMmbNrAkur4j/6vL8UY0a8TGs9yQaINv/BE0IRnuEUr8wpHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDvq2gYe;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B98606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDvq2gYe
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so2934121eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795328357; x=1795933157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+i5UXNicz+dDMLjLCfQXLU1+yF38ghxKYIXqlpkcYQ=;
        b=tDvq2gYegcNsa/8xl4KYzS3V6pHEZwNHJnGrfEEA3O7TRJ2gW8DRlS/QdJ2IqGAQCB
         pnE9domTsFdLnxZOr/neuNNs/7asFBDooFNvfetBXd+kKO5nRRkchnpAf9RCyLQR7RW1
         ImG/XR8PgJtvTeeWD7qgMM8nJlU3oEfHKZ231vdDaL/l5k7tJVl2I2GiOFBJg4TNJLai
         JTwKUD2mqf/05q/V8nv/gywvnPtjJ5OIDKA8HHkoIdZ5K/CHuV+4vmXydufayUvt9Cgd
         KcbyC9CvdqvwJjhfFhmcDtV4Bu6Rp8U0YOWUBuh5WfmFO9tKZs57PPglRbLgAI6qIauN
         z//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795328357; x=1795933157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+i5UXNicz+dDMLjLCfQXLU1+yF38ghxKYIXqlpkcYQ=;
        b=x1cZ2/+xJj8aEN9ts2kaoGHvdleKYbTATS7op34Vpx7nmV3Nk+M5C/PTRZs+l8tyPH
         IHcpQQCW1xM7Q0zsJo7IdQfgPUwPvCW2djv1QaXx5pN8UZ2CH9uNe9kkPvV1TGlMrkgG
         uKEltZ0/h2JWxvr7/j0V5cphNlau8NhFens8xj1jmQZ/SMV5AMVktIgu5tmkVnHa/k7N
         ynzJyV5lRh15kBJMvS6q1dn2d9HUbsmvjsYTIIdkbgvjY1mNOeCzQXQ1FYeCYdW46yQi
         vomHx60XERZ7ZW7lEqH1juzNf232sQFfrTbGdCWuDqkHGb+prEDH3+r4cXNhsezSSIvt
         L/4A==
X-Forwarded-Encrypted: i=1; AL+hErEiUjShl2HHpn9qLvG5rDn7zrrYmWFb3Fs54nk3PuU4yttYQzx3YWzbReRNxIfhM/r+q2Cno4baBKLll2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+11VVqB8xCkmjCaczrQ+2QcEf3Ui4/YnYdJtqa/EVCZJHUh18h
	LN46AxL6laTU68Nv+nyq6SnaKCdyDrNgPSHSpK9z4ECkji2C9MzSCkR1
X-Gm-Gg: AZFdTZcUuutOjO1o3mxbNEyW6Z91g7tpONC85Pz3vAjYwbhdzr2izuZo39Jl9UyQEFt
	MCjCITZXy36iRyX9vnhkJ58N3GEIlZrPijAXc9SE8Fl1v4Yjij20Y8Vi1dQbhjAuipVPSCqsjLT
	WwHHSorR1pQjZdajxvZ4LblvqrYYH4bQqqEObSi8gSv9dA6fK1kvDIuqYiVUyFKlQKGT3tjOJaE
	vPmw/qIW1tpdzaMZjHab6TAcwzncCghbOA0xxNscLIy0XEzxNJGgWKaJiHXcu4M1qoqAfwFB27Z
	OPoOAW4qaANVVd+EaeYH1kj6Or8hXaFIY8y40bqweOKW2KVFhY9KZ2bOf1zClAPBlSSWzQHUjFk
	EO4qmydqWR0d0T/A+FGRFXbVsM+gck/kcjF3A328XAKKIj9fhV2lXg/w4ZI/+njxfu1Kz90b5NS
	gKRqIIVeSMrvyQFiWcfnlhLQN4Cml4oqAa1wx8rtxJcDPbRg/X3xTNNYyDg86H5kdXA5d2FDXaK
	AXIzsmVRZRFRKmVXyrMNq7ovMFHvzbul536fhFLDaW0EV7xPzvDrx4o6Q16K4tFTEEj7YcCmDH1
	3ytuK6xXYK8KB1S1zMzt5mvtIpRUq4vq2PsZu32vEB9UQ2fHoEjX1vw/zb175Y7CVwsZ
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr9132677eec.13.1795328356540;
        Sat, 21 Nov 2026 22:19:16 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm21993624eec.16.2026.11.21.22.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:19:16 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sbinding@opensource.cirrus.com,
	Parmjot Singh <parmjotsinghrobot@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP Envy x360 15-ew0xxx
Date: Sun, 22 Nov 2026 19:19:08 +1300
Message-ID: <20261122061908.130239-1-parmjotsinghrobot@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The HP ENVY x360 2-in-1 Laptop 15-ew0xxx (103c:8a2a) has speaker and
mic mute LEDs that are left unconfigured by the existing two-amplifier
quirk. On its ALC245 codec the speaker LED uses coefficient 0x0b bits
3:2 and the mic LED uses active-low GPIO 2.

Select the existing combined CS35L41 I2C and x360 mute LED fixup for
this board. On an equivalent Arch Linux 7.2.14 backport, both physical
LEDs responded, both native ALSA LED triggers followed the onboard
mixer switches, and both CS35L41 amps loaded their protection firmware.

Codex helped trace the ALSA LED controls, prepare the change and
write the commit message. The LEDs were verified on the laptop.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Cc: stable@vger.kernel.org
Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6b5e89..76c06d1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7871,7 +7871,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a26, "HP Victus 16-d1xxx (MB 8A26)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a28, "HP Envy 13", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a29, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8a2a, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8a2a, "HP ENVY x360 2-in-1 Laptop 15-ew0xxx",
+		      ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8a2b, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2c, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2d, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),

base-commit: 0dfd513a15573ffa21710f77c2926c3cbb81a7ed
-- 
2.56.0

