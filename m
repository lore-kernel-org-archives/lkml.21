Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670293;
	b=j9rAKXgxkhv/dgp1QHKl4pDa72KUdTL85qYJm7qyPKykjpiDhIUtqBqLGT9hoz0EPtJ9
	 MeyLoQlSixgVtc9b7uY27x6k2QdqJ93nT9ifOni6CvZ8V4w2G/0ZcT5WC4Lj0dfUiaqpV
	 5RhCTcrKaI0das+Qqj+Qq8EMtfL1+GqRFo6U++O9LOT64fXQ5QBnprHDrO7SpYd7bitHZ
	 m1+6slvXIvn16RjdM7TeTb4Y+9NdYoXDGMeaWXJpbFJvEFRdRoHU6vQk6t8IkUw0GTrcM
	 xNCZz9acPmdTYVo77s/uw0xifQzfnyRgHkYKDfD+PIKfzd3ineXDTamdfw0Zw3DJyTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YSdNyUgtJmI7PwDkbgXgw82KdpgvmE0VKK9YY9Y1cvI=;
	b=j2ndfQe6W2BkOiphqyLT2rJs+7DaMna4vyGkdyb4osSjhpwBKVMQUrLi6eQuSXeCFt4o
	 gl9p6JiVq6t9IWz6L3x6sRrRWUFbtqLxNxSeq6nWwJqKdI95PTr/q+f1hYnDAJpaMFbls
	 4/eKjDxv8EFNt4STKNKMeP72UUjBzwEsC6sOGLwVzc1fcrQvQT8raTsABrQTC0Mk/px5q
	 Re9ajSrqTh5gJknPN+OWOBPwkeqoVFfxBEU54et6tMJRXewENJBC/8edXL98p3qjYCDdw
	 +buj+3dQxDHXyLhyH/6/oqdBAwgGSWj/D8r33es/8BMB4ZU0MWaQUoSQv1kWtHUUfEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OyUqbDLW;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C783606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C783606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OyUqbDLW
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386ab9ab619so8558767eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670292; x=1796275092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSdNyUgtJmI7PwDkbgXgw82KdpgvmE0VKK9YY9Y1cvI=;
        b=OyUqbDLWPEHL8Fqc11/23WQbFDoFF+mCpIRdztARiwDJUZ4cc7BrZnSFF/ozJlMkSC
         BC3CdXAuar+pasfjNCFMsF7LeT5zIfOLhlnQ0UxqNFxAFUtgP9e1u9xFwOda7G3xuk1S
         Bsiq3cUCE4lkpZkg7FupQ0kGj/y3PKPe7co2UFcnQkLTdP39uivPDiRRKKdET5RNF7hI
         m9zMn3TkMFFfn7tOz88N0cujR1xqvj+kDezXoUVNKKgi9xX3wpbasuPPr0Md9I6giFMW
         fFBsskCUgk4ca3t34fjIeUKqyCivrH6rpquHLDFPWcKbUoFT62oIt2KC5H7AAmwciFLA
         Idnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670292; x=1796275092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSdNyUgtJmI7PwDkbgXgw82KdpgvmE0VKK9YY9Y1cvI=;
        b=cufnxuMO6WJKb77Pc7CIrFYLMeOBhElsg4tQMtEy/Bfb9J5uRQn34trFve9c5dbiTm
         QT1eM4d02EWryPDx7WeOZRGICvcgXbmJIsofjWmXSQ9kaQ7fy08tavHtQIhQ8m0KJsxj
         jkS1xAV0+2JEi6TAUOCWMHQk1AJU7uuzJs0DGfp4KCCM0jLUHy5TEHDAMmhBhJf2yymx
         HIRGepjisRk8BGCva12EX8ZhbsALPANvK4bpVz1/6sy36GY1KhGhxFYG6aWO4NGew2cy
         Dg/ZnUq6Z8AlAibwnXDHYBdAFnwZ3WWEd98Sp+GqIbju5iFlpaBMk6X9XSf1GO4kQSmA
         w4Dg==
X-Forwarded-Encrypted: i=1; AL+hErE5FKwHRWU4KCYqE+D9dUf0YbL7AQwYoPTYYCbDL6dpA6y8c7bXdJJgBBsNSBYlG2tA3djbd6wVq8W41kY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mhxORNgpVxwfjXGWwvPz8ZeTH44GPt3ejP1+egzilQQL3EZP7
	dQqAm8gPuUsvOe9b3m3o/yEB/dth7DUzSdy5NYZCAuQmrU44VyLUsUY=
X-Gm-Gg: AZFdTZfLdjR0ekLkJcuFFU0G54zrvgLih6qgqMio1uOmECEYzbHvRIvX3Qz62tcTRtg
	KS2m06B735GaJ0co3aRB3p3D9ChX1TZ2lB2bRt5iJHvPsW0zOMSlJM7TXRGfOeBp4T+YT8c7PaP
	zy5GEu58DKB/Xg2i2xoT2zlHMTXfmRfwFP15lUbpfeXFU6Dd95YjPZGHqy9xt0RdksaZk0Wc8eG
	mDmXPcUVBq8sf/z95loczC3Tg5YT8G8YjGF3GP8XkesnZD6B7QEu/ZWlfbZyWKfvAYUbS4vo9fo
	YMvCDirc0J8aww9+sex8rrKdq26UQVXaUOzRO6ABNbSynNZ0KOuGAl/5kcji8g7WgVdZx6QOMHy
	WZ6MZJWTbqTfrsuy+Y0Jle5O16MzBT5HUZSkBVPA0QuKnijSAB3hKx8ARbLAndIX8WRygAuDvUY
	LzSeFkQ7QmRRbVn46cDTyi0VfZepQQRXbGky4J/4pVVeYXSAqFWThomcha7uztkj0KxZBT/TgSc
	Ov8cCGFvml+EWbeRJqbCcMJOHt7w8o5pPqqhQ3YGDB7F8FsanXs8ujRhUfVTmMa+In48GJXoEnv
	Z9YaXd2d62xoYRnqf146lIdzBDJtM7Z1h1JiwYhi1HAELHsECQ47g0Qh6tTxYpud3wQ5LTSnkpu
	fjeRxA032NBw0
X-Received: by 2002:a05:7301:7004:b0:386:c5b8:960b with SMTP id 5a478bee46e88-386c5b89f9emr6662695eec.17.1795670291931;
        Wed, 25 Nov 2026 21:18:11 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54973501eec.7.2026.11.25.21.18.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:18:11 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	bo liu <bo.liu@senarytech.com>,
	"qianghua.wang" <qianghua.wang@senarytech.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: sdw_utils: Drop senary_sdca_jack codec device reference on exit
Date: Thu, 26 Nov 2026 13:18:06 +0800
Message-ID: <rc-b1-20261110-vc-07b-67948988e977@gmail.com>
X-Mailer: git-send-email 2.50.1
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

asoc_sdw_senary_sdca_jack_init() takes a reference on the SoundWire
codec device with bus_find_device_by_name() and stores it in
ctx->headset_codec_dev, whatever the jack source quirk is. But
asoc_sdw_senary_sdca_jack_exit() returns early when SOC_SDW_JACK_JDSRC()
is zero, so then the reference is never dropped. One reference on the
codec device leaks each time the card fails to register (including
-EPROBE_DEFER) or the machine driver is removed, when the quirk has no
jack source (DMI quirk entries without one, or the quirk module
parameter).

This helper follows asoc_sdw_rt_sdca_jack_exit() and has the same
problem. senary_sdca_jack_add_codec_device_props() adds no software node
when the jack source is not set, so use the check to skip
device_remove_software_node() only, and always drop the reference and
clear the pointer.

Fixes: 77272ecd96d7 ("ASoC: sdw_utils: add Senary SN624x helpers and codec_info")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, COMPILE_TEST=y, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=y, SND_SOC_SDW_UTILS=y; soc_sdw_senary_sdca_jack_common.o built before and after, no new warnings.
No hardware or runtime test was performed.
The path needs a Senary SN624x jack codec and a quirk with no jack source; it runs on card registration failure (including -EPROBE_DEFER) and on machine driver removal.

 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
index 1dab6f99877d..6954041b7962 100644
--- a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
@@ -150,10 +150,9 @@ int asoc_sdw_senary_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai
 	if (!ctx->headset_codec_dev)
 		return 0;
 
-	if (!SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
-		return 0;
+	if (SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
+		device_remove_software_node(ctx->headset_codec_dev);
 
-	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 	ctx->headset_codec_dev = NULL;
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
