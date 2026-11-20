Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185590;
	b=09zGTbQ/Wev7BSpJA3C80INmieebEZ7t1D0PSbJ9wNGTEqzYLHRaV+sbjJfxIsYRNFEF
	 fC0frV1gMmfavaz2uLs2zcdECJf1U8mW0+V8vFayLCQJGy9XoKFoL73GGgbGlPb/iXogx
	 pAribe6Nxj9J89OzHK/oLd9Pn+frlIhGhslRdIBBsXHd/Q9e7SepUkLlXVN2c8fhDvH6a
	 tIFjLycwsmAqQaYXVAhMWsOji+LFdea18dohTXXHEy35Zx54NJjW0GlVU4/mKofeHG7RH
	 YPM4nP75hsv1/r54YwiivMfRmw5PydUGoAHzUmB6+wUxG88LSeSOTIqOnErIp550c1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9HiUJ2tgMugCyQzI5P32t5LJYJ21TS1Yboz3dnwK9C4=;
	b=uzrGr0Yx1/n8U8VK9c5HNKbOA3KdjMhJ19IaurpPwcGV86Y+y6OpCf/WhBTONIi5qzuX
	 g4bDmk8xkwrSndY3wv5XgqTH0fgoSduQcG8XALmPxMsr6pwqoP/Q8UslGO0MXEDO/cuN+
	 qkw7zwIjpEDNVimPAVZOjCRJt8fhpLveboITjiWr7/EEJASWDZxXgy7yroD3lzWI+whvM
	 /O7VaxP45/VbQgpexDoJSmVhiBSCahFHTTWtGNCDvIyNPwm0vjbhrAkxTp1FIKzjJdO2Z
	 jUNqduoj+hrO7JTp1BaxM1AxaY4okT/Qg/DEvFE5KvIcOOaDVChRUaSbf2dzjU5j3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SApNAdvy;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EEF606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EEF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SApNAdvy
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddee4abc57so292805a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795185588; x=1795790388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HiUJ2tgMugCyQzI5P32t5LJYJ21TS1Yboz3dnwK9C4=;
        b=SApNAdvy/CSds9YAkz1YuSic+xqkFnKjbI+/kXJNDLRHkTHu3iCx/G0d6IzbluKETW
         mcfZU9BGuYJTGCqdKdGrUMZhbWpIMJpMLitixA4UPVYg94J7xUtaPM0w6T6l3JR1bAbH
         Gh/uaMv25hcjIDKyoPuOVZoqBOyL2qhWmiODX2MzSUo9DNTn3u8Q8PznEl9OX7esIZgw
         j3ETKyYb30NW9ZaNy+lO38djlFneetEioZyiriaX9R+ElaioBBjbKVt+uPyN2QgG58Wf
         KlBwlP4SXT/59xUxgEuzaWN9NOx1CnqDcdEgeXLF7nfGAAciw5GlVGYlsG+RaMELzgc+
         rZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185588; x=1795790388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HiUJ2tgMugCyQzI5P32t5LJYJ21TS1Yboz3dnwK9C4=;
        b=kvfvafZUCUC0xGCzp5/BoZJi2RsNsg0eR4xIHN7WqR9/EYKalSDI0Ycb4minvxuBGN
         ALRhoAqGHmZh0htZ0Z/wElHR9Og8hE719TQsCOPwKpB7gjcRTpSMnLBGrXPpBjIzhAb+
         NbVGAc/BKfycDmlB8xkjUqfZU4tDWGpjuT4Z+/v93+4hDTkFmb4hhSFP9vnqxhc8/sPP
         Dz9sgZ7RlYvnlr7b6FK30x+DpZ2B4xLAmfpJ5CjzhWwmPawrYGROt/hWlYyQ1ZT0CU1z
         o+ptLYjOBxI1FI2Di6LGUsVgwE32Po9Zb+4Ri9x8c7xjYEmEwly+Z46l5zx84+fFdwpS
         6+sg==
X-Forwarded-Encrypted: i=1; AL+hErFf9ZoV2L1F4q+7kGEPrmL8zhaeePmmUbDhndY0/oG8DuPgLz1vrlaY459x1MX0fa75eVz7UjmEdWLVTcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gSwZvB675kVjnJG0ltj/lx4TUdvWaS5ovEEqdvbSw8chzsd2r
	ZeMPMZ5VyslY7FBfsIngopaAacAR2sDAmmwwDdr69bEJGri8wwwj4ehKLUR4Lt5uJ8o=
X-Gm-Gg: AYBFou3qcwXh+HptCj4ZadfOXdG/qeeKp13H0yGYsZltya7Zm3ax3gg9giSKcdyoARq
	1zDviPsgMUHDb9wM1Yuk603d6GGJ7hKfS4EVcgyS0rMKan1xbY3i3Owq9MmJtETEDWgw4cBRY+U
	ml4jHvSM9nKkomRXN+EXaQF69s6jpYp9oqBxagZJJmXUeBWVLFh0EQV/ldlPdYl3Cd8yUBJCrn2
	Rjd9NPv8I10mF5IjUWB/jytqlMRT8AgrrB5xo80risBdlsVeUnPIO9TNpclDrKO8WoZDVG4euaa
	KTMGR+K1wa+XQEN6T4o9/PXvGDStbukqju9B9LT6Zhh4559ALzTJWR6UzFg+yllNfqLsxWfAp3w
	/DTbJqq9JmDUEQFJP/HID1nvVzBgn3qM/29HOWIq2nrUMqdzXh1g9RGYh1+AngXx4DXtXpOrW4w
	9LHHCvkBBAFTxugac7nvRGu29MZPy8fmyK83bqBbrI6xISLCYF7cNsp8BmG6pTpREnS9dLOE51e
	GxWo8NjAzUfWHkq7wWC4b31G1DUm8qk29qFtW022GR9DJrwZcChK6/KJxkndzrG2Taqo3EXFJSZ
	UvEAiyzxirpiZyH7pKXu6JbP
X-Received: by 2002:a05:6a21:32a2:b0:3f8:9a14:4724 with SMTP id adf61e73a8af0-4014d456c69mr3318620637.30.1795185587573;
        Fri, 20 Nov 2026 06:39:47 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm1577048b3a.32.2026.11.20.06.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:39:47 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stopthewar24@gmail.com,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 15Z95U
Date: Fri, 20 Nov 2026 23:39:30 +0900
Message-ID: <20261120143930.9662-1-jaehoon1744@gmail.com>
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

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

The LG gram 15 (15Z95U, AMD Ryzen AI 400 series, ACP 7.2) has the same
audio design as the 16Z95U: RT713 on SoundWire link 0 and RT1320 on
link 1, while the BIOS sets "acp-audio-config-flag" to 0x10
(FLAG_AMD_LEGACY_ONLY_DMIC). As on the 16Z95U, the flag makes
snd_pci_ps bail out and no sound card is created.

Add the machine to acp70_acpi_flag_override_table. The rt713 + rt1320
machine entries added for the 16Z95U then match.

Tested by the reporter on an LG gram 15Z95U-H.AU87U1 with v7.4-rc3:
internal speakers (correct left/right, no distortion up to full
volume), internal microphones and the headset jack work, also after
suspend/resume.

Reported-by: Andy Pearson <stopthewar24@gmail.com>
Closes: https://github.com/CachyOS/distribution/issues/516
Tested-by: Andy Pearson <stopthewar24@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: JaeHoon Kim <jaehoon1744@dankook.ac.kr>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index febf559..6104634 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -140,6 +140,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
 		},
 	},
+	{
+		/* LG gram 15 15Z95U (ACP 7.2) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "15Z95U"),
+		},
+	},
 	{
 		/* LG gram 16 16Z95U (ACP 7.2) */
 		.matches = {
-- 
2.43.0

