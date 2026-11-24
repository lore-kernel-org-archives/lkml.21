Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494867;
	b=iH61PJAiKQYs22j6XC8OLJ8LUv9blHuS7hO9rI/Kj/MESD4qbXwHQg5pcM9/9dl/YTQ9
	 DQMMm+JxnxPOEgvwMtwCJaadPLFxm5VeuxaMSPRWqZFzo4Ak2aQxw6smINHKiwQvUMKEd
	 CZ+PyXKBpZRI6N9WAQzRm7FAktgkLyoDIucXePNX2q3RdZ4FK/lX7NVp5GinT311vhVHU
	 qzsO59YIlJH+2AlQyoBUfvlZ06OHLVs1au3wNdi4RArHRs8ifa609VbJconrW6+oFFv+2
	 /zAnbRWQG8DEqVrnLN28ERidBo3PHAIC8trIM3nW4bwO0vIT+y9IkvkiU6rlHX9TMDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494867;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=P5N0JEP5ejcvC7nFlE0Zn8HSzONrn/YAOlThtpbyJMQ=;
	b=V5P2ztq8hMWeCLsd14CTma2i8hoItUG4wx7S/zdVKIyPZX2JDr9irmNu8IyopL1Fs9N0
	 lSJf/dM/eZz2zY63kVFgHkKmsaXzb7qmMgHgwV3dHN0iAcd/+JOnQVVNGt+sJMvq/Px7l
	 0ZUsHhqRcrbYayIfgomdhMy+4PueKga8k0B5rstD0emgMqrhSwzMlhrTqF8VAfWEw74+r
	 cyE7SOOB61RP/VL6Dtj1skpedn+NL4AIT7IPTP9xgn3NX8ykfmWAmRDFlql45JPvERt4H
	 u8lI4DhMqPcJtvkERKY7XxU4fxKwDH8fhGVwc+MwZRVD5Kn4rKZWHS5qaQvNeAazuNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06A2606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06A2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b315dd057bso25501507b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494866; x=1796099666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5N0JEP5ejcvC7nFlE0Zn8HSzONrn/YAOlThtpbyJMQ=;
        b=FscEyf46kO7sYwZ28jpunNoN4AgZTy97uQkJyxpgkfK6IPFH6VWZspnFI7RHFsmccJ
         T+iLrzcHm9eCPpzz5OkRv7thr5VsYqqiOnxjaw0lWYzLYDIHJn4udLBfIg3jqjmy5hRO
         Pn+rJHY5SxdmG+TCrBoogGhmdZoAGvescQD0euffw0+HCczI3ZwzVQglqHDxjuo2pidU
         buwBdFX2aYrFzDVqA2U3UpVq5dSof0YP+eWoS96htjRmnFQSVSBo6Tri5MaVL6joXljW
         7powMZqwZSh6nD07D7FWSt1+zlZg7mrnLQbvWzloJLRmYKQ7aHL6Z+h9oKL+3W56vsNr
         SqBw==
X-Forwarded-Encrypted: i=1; AL+hErFWeG+cl8TJ1flJiOOjeIPZ/NOHECmPcKO235q76aUl+R4Tr7Qlp6bE3IcC0GJV6Yftpi2WHe+cqCYoJ1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z88I0uMP8jTW7sKz/TwoFkqrrtlubKDFjHeN/OGuZ9WWSZhxT4x
	vzHLwwKuH27MmTcT+whGSmr/zp+O8no8f1QLkmeZLCETf7pmQnGMHPpI
X-Gm-Gg: AZFdTZfnUm7UsZFMhLq+8Mx1/sVAYCr1/JX71P3QEIkQN9/5eTqWwFzzymvql27ZG/H
	yYp215wCIdy3lphjr9Keo/60CHUfFgRMbaIDUz5NhTYzHcHypZtcwRZtp/XAc0tYTnZ2hN4CEyf
	6qjogjrDPk/maEw7fWycXna2WQEjyYXQtjhPK5WpzyHpL9bSt8brc664BFgoFzPRsMf2g3VVtR/
	3g83dlmq+AjZ6FXEXt4G0i9JkCDkqPnOXcuhMqpTZgPxXJtTowYt1bmoW0SVRL9PwDZGV5I5AL2
	jXQe1YOltyegDuIs/9gobliQtNl0LMm5yw9xU+0HcHveUtYQtDPsQAy0okI5MOGT+OnGs+v3QPz
	3HAvPLuDpQZmv1cNsPQIfQksYwavlOQqRs9GAW9Z1MTDTOLFnV5wFtC/YhzDTJdSSbl9bOiSg91
	sIgUhgxgDTPUQJoi0WU1G5oMueNXqaa7uQj34JeQj8zpAy9+0Yvvo1nq/IigfbzkYfOJUZFznf+
	Ec3fk1ptKv3625Ci60x4ZeOxN3r828T/lLVTIfEEuNCsOSg/QfX3FS68VVTHIPAi/tAf72w6RQa
	l6BESj7/52pzgERwxQe51Vu7a/HFxvHg2SovmGaZejiUkKmwCTv8ZibhjlgI6fWY/HfUbL8284i
	bFaaNMwjI3vHjp+FVCXnmzgImyqaLP+o96D2S2ZQYN9aUqZHosnXBVhJCtsU36MrA5pSSolybia
	0hbD77D7AG11frEIC1mMtp7ut7
X-Received: by 2002:a05:690c:610d:b0:8b3:5121:3d7d with SMTP id 00721157ae682-8b520475df4mr57774267b3.30.1795494865986;
        Mon, 23 Nov 2026 20:34:25 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202fb0a2sm53106397b3.27.2026.11.23.20.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:34:25 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 23 Nov 2026 23:34:20 -0500
Subject: [PATCH v2 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
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
Message-Id: <20261123-omap-mcbsp-tdm-slot-v2-1-3e3aae215952@telaak.dev>
References: <20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev>
In-Reply-To: <20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

CLKGDV is bits 7:0 of SRGR1, as its comment says and as set_clkdiv()
intends with CLKGDV(0xff), but the macro masks the value with 0x7f, so
a divider above 128 is programmed 128 lower.

Mask with 0xff. The only set_clkdiv() user, omap3pandora, divides by 8,
so nothing changes for it; this lets the set_tdm_slot() support that
follows use dividers up to 256.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 sound/soc/ti/omap-mcbsp-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index da519ea1f303..324c5d7d431d 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -136,7 +136,7 @@ enum {
 #define XPHASE			BIT(15)
 
 /************************* McBSP SRGR1 bit definitions ************************/
-#define CLKGDV(value)		((value) & 0x7f)		/* Bits 0:7 */
+#define CLKGDV(value)		((value) & 0xff)		/* Bits 0:7 */
 #define FWID(value)		(((value) & 0xff) << 8)	/* Bits 8:15 */
 
 /************************* McBSP SRGR2 bit definitions ************************/

-- 
Git-155)

