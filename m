Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477263;
	b=5G/RxFu6laKV1tX8LgjVCdhEikezp/3OJtaC4r+tNBUPVVkhTq6D8ZH01jZhDyVj+8+G
	 3fWdJF0iGzSe5tyW99Jup7P6T6Oaifq5u4WHRNrkiCU8h26Zg/u1Y74UCFx0kVp4o8E23
	 O8FbkZ3n1/LjKyYSt8o5IgVGMV1kVUqtKteIlCTryRNIFPwMnun8R3chZPRXb54P64J3z
	 gJPi4fhOn/vw5beDNAIe/QFWcML9e2U6Xpbvf/VvRfGRxSjjUXl1RMU8utIM1JeL0nHm0
	 TphL7mCobgi79ieVKENW6SZVWhQVzu8YazMvh1aY0nq8Qc3V6IfOeoMu9zLmAZh6f6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H3uATgv51kR5GwvABS02h/EcZTNE+WES21lxt1thsvA=;
	b=sHm/zLK/Q20QcC74m2vSdfhOndEDATqAOnA5XYByE0i6VlESDhlp6tAAzlSFnaQPQHTp
	 imVQ/Nr52ES7Z8lnyaJbRlOeITPpGdECrS7PZCc/lFjuoEiDd00pgoHK3WIgCVBFgFrAk
	 9crn4wlu397DWippnw5SaFRiSYDJhkF4M3RNOwF01VUPpIE42eulCZN4DsfaBipRhZ868
	 zag1TnEqkDNnYaM1e8WrMSfth3EthyiWvIYo96o0as+1pPnI/Y0hWxEQcLDYwGL31mMdD
	 ouwU58cc0anuQ2wg7/ALViU0LO+r3x6CiOV5GOwL2UA0N6XbZ0+vHifBQG3hvZypqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+pGi9aP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B90606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B90606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+pGi9aP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so39331085e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477261; x=1796082061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3uATgv51kR5GwvABS02h/EcZTNE+WES21lxt1thsvA=;
        b=b+pGi9aPHPJjAG60XPnEw4aJ2JauOkRfeYWtlxYPPL8XLvdIbaEVB5Da6wWxZx22CY
         fCvTGb0VaF74uc5irX+t4oGsYZdkKFohf0Jcy5B3cavSXYQWZVJe/FJeCr8hpukWOAt+
         P6JHOP3rR8x1+2vOQvDKmFbtT0KGMMCOj+nuuo6Dvklb2/vQ5k1zA+H1hW/tFxmoHVht
         q7zD2YlqPNR0baJyPzTuBmrZWO7EaQrWpkIlBBU+E5ls5PVKPPPvfvomFqvFQY3baSPA
         VL2cDhKqGKJTGMmd4G9MDQkuyiQeBEJyAGF/ADHEb2RlKXppyuYkzwzj1CLx4duSrmrR
         prOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477261; x=1796082061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3uATgv51kR5GwvABS02h/EcZTNE+WES21lxt1thsvA=;
        b=dWfK5IinGW6CNFNd6dB+vfQLbcMjNv40gtFGKK54vjK5dqF/j4kz1L6SioX4smPJGr
         F/v7zvD8CFp4VQOFhXO+b50nLBs5/8FJLTH02dPyspt/iGtBgSmnZfRy9A28pFrvz3Og
         Nu5xxywr3OP7VcV7GPjfkCnvtR3pCP41WQ0XLVyb/ajMMtrKyo+FIUOTUV73/B/TTSF7
         Q3Z0BhJEi1/nDUzwA3eCqEG6xCViewJXYQFgVa4LLzkr9/D2tQpj2/93aT+WWZBZffMb
         1AcYsrfmI2T0/JAOd5zQkGjUMIs6yQ5K3bWWSCPU9vPyzljlg5264gegTFHcFx1InVSb
         U41Q==
X-Forwarded-Encrypted: i=1; AL+hErGu0iCcE6E6nCT2Im9XspSV2Xujyi4NBgjLb3+JIf+TEuZE3Yx28ooNikztlKW+P5IWPKZ+Ouojz4wDy6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qkwR6NTWfiYZ8azj/gb2PSVBddjFEQ0DWVVr4eRjoyJMet7fw
	2R+cDxAV6y4gI95zRyWnIKTqDc0gHb0r0CQ55HAYlaeLrLi8q9Ua+Rg=
X-Gm-Gg: AZFdTZeaNJXWJSIg5tD4MybANHwWeyU73GF3HBpl5F39ueNbkpCIsYgamebVNigWuCj
	KVVU4R3ZX1TgnCKUUqSPwTJ1meD2yVYff7qNG9CXXpbetD0U+AEKhTXuY/JMZwjsCLuMjTCaaxu
	gwU9Z6VYNpErPYndZ6x1qACPmUYzZkhYzvuRnLwUUx9R0EB46PkiK/U67UFYWOPCqWL+UNpfBe9
	7K+rfCaxKiRYi439j4yQyZGf9f4kLJOB5kAeXQew++P0gjvJeZxzslanxLfAAT5Omd7wzuOcdXS
	A+MsnXYXPZVKib/LZGG5N6UyrP74ZbaRhcHq/avVUcTyDv5VyMluFGtRpD78NmvzJ1y9PBKxlx5
	dAqETMaIgi6Rup2EYEUlC4C07P/sCrVwKurrd4K9LHqaVpc/XnIZ8TKgbLeGBKMXo9cAoR+0nCl
	pLSLDPiOQGyFip0ufrGcUy+b5O/Qi4RUG29W/mzTAm8pN50uU2HuMp0BNO/RyvMRoxX6+W3WZFZ
	MgKTqHZWaAhj/EQfLsoPZF6iiA1YN24eggkaiJYKqPiuCb3l7O12B0rDLnhOj6/0AZOxl73rRpF
	61m+AVi96ut407UD8mUoFqkWPmXM8SSdp4zRFleopD1gyHMNZpYEUQ==
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr264518435e9.11.1795477261465;
        Mon, 23 Nov 2026 15:41:01 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:01 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/4] ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
Date: Tue, 24 Nov 2026 00:40:47 +0100
Message-Id: <20261123234050.150364-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
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

The HPR and LOL output routing selection registers (Page 1, Registers 13
and 14) support routing the opposite DAC channel's negative
reconstruction filter terminal as well as bridging the HPL and LOR
output amplifier stages for mono differential configurations:
- AIC32X4_HPRROUTE bit 4: Left DAC negative terminal to HPR
- AIC32X4_HPRROUTE bit 0: HPL output driver to HPR
- AIC32X4_LOLROUTE bit 4: Right DAC negative terminal to LOL
- AIC32X4_LOLROUTE bit 0: LOR output driver to LOL

Add the corresponding DAPM mixer controls and routes, sourcing HPL/LOR
bridging from the HPL Power and LOR Power PGA widgets so the upstream
driver stage is powered when bridged.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 875d934bb5c8d..f39856d0b1f19 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -323,12 +323,16 @@ static const struct snd_kcontrol_new hpl_output_mixer_controls[] = {
 };
 
 static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
+	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lol_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LOLROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_LOLROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("LOR Switch", AIC32X4_LOLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lor_output_mixer_controls[] = {
@@ -495,14 +499,18 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"HPL Power", NULL, "HPL Output Mixer"},
 	{"HPL", NULL, "HPL Power"},
 
+	{"LOL Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"LOL Output Mixer", "L_DAC Switch", "Left DAC"},
+	{"LOL Output Mixer", "LOR Switch", "LOR Power"},
 
 	{"LOL Power", NULL, "LOL Output Mixer"},
 	{"LOL", NULL, "LOL Power"},
 
 	/* Right Output */
+	{"HPR Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPR Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"HPR Output Mixer", "IN1_R Switch", "IN1_R"},
+	{"HPR Output Mixer", "HPL Switch", "HPL Power"},
 
 	{"HPR Power", NULL, "HPR Output Mixer"},
 	{"HPR", NULL, "HPR Power"},
-- 
2.25.1

