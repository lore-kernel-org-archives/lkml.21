Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670304;
	b=CCoGaGenVdQ8syt4iHTzI216wkDjalyqhQx+E4IOuyZYC2iv93w+yX/P0ZVPL8MT/wex
	 GouJv3o2lcXp0dpquxfqyzrolsI1EHa/dtF3FIAwx6t3VkT8Zq7BefW48V9jSYymZOn2F
	 qS15FynF8w6nhqNOqhkEyH1hRIN0cw83M7AKIqHMe2143LJy/JLyqt2DvGObPXQlEKk7D
	 eZ2OfmPHlCoEpY1YAmPRRFKfv+R0xkfa/Utz6t4KVJjh/78WmJf5CawEtCaWrgLD3THAN
	 VUqcMAlJbbBg+AfEZBBag0ABnH5t7sOLxbTgz15CYhacZoL4C1f2Aq4AzKSW+XMIUOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zsv+xoIslAlTljqBg12NU+Wygtm3YAvMHqbGgsgpyzQ=;
	b=lVqNVpvqojnGj5CaVykbkMCyiE8kz376RxSS5iDkDzSuwn9amCu4INL6RJRHNH+xTQbg
	 LZuYvpWl3hhnaDtEajB4VPFZFaXeM02fcLtePgA+ZFDWTy61oautL3Z2W6uzSIzNSrcRS
	 bDq8qZr8Ap+IlhA+x0lX8BtLOV8/6bG14jjvMNe7PaNFreNbLOxwfQQg8ymXH/7MMoZkH
	 uikmmArCgagMt4L3ivOvvPgsrcAvl4O5L75gux3kujheZm89Quy6rFqfjgc8MU6r9RSzI
	 VKq6rEmrUjF+98qt+NQVGMka9kCXxn+3z/LfWeSgTJnb4zLrZ1jE1CXbUXj+ECNzO8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eavWJLn7;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eavWJLn7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14056513eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670303; x=1796275103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zsv+xoIslAlTljqBg12NU+Wygtm3YAvMHqbGgsgpyzQ=;
        b=eavWJLn729s79Wc2z8ut8r+vSxgpeCNFtIrwFIuqebEMAo51j3fYefHUoPdYa2JDNV
         MR16m50EiyKX4yv3e+JnyJP2mpwZGvJ2BjbxUVuKqtHqI3VTRsOYLmUiGTUsRNpjPzxU
         KE4k/DSy0TyPtnz2v09XGAR9L15fqWjqlTX1PGTZTxq1qeRyryUYyblyneusgODYCko0
         kgTQm8zZoa5dE1HBnZZ6xUEFja6VKZkLiUeB4VKnTHd6B6pVnxZxOjun0dJ4eXX/Z8Mq
         tX3rGup2pjBITvKem26XnDDowqL4klwsGxd2vc+bIufB+dzX++rS9sElJBAMs3ySVwwL
         GraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670303; x=1796275103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zsv+xoIslAlTljqBg12NU+Wygtm3YAvMHqbGgsgpyzQ=;
        b=S0X4X2llFvvbrFVpaSxpy1MCJwkyH3Wg1hiNAd4XRb8ZA3tAskeqJy8rbWb/KIyW/R
         HhFX3QGBYQy30mo6N4FLJbIA+rCHBGckrulRGSSG3qrl4O/14Dtq03YP+2H2GXjXeIDg
         eZHBm0TRFiF/V3BV15qtrPXwmjXUzpeJTCJQ7hIEoZgk6F6n3NnIprzKA56kul8R19tp
         3kXPemq6u8Td8OTD7wimyyusvYO9SdNzNboZX5OrGWo2aluyKVk1pJjO3BgxGLf1AdQn
         L9PTEM6CbEQ7Ja83Tk7fkgLZDoZHM6FA+Eg0ElIOI/F7WOml9EhNLMXaVJljyRkzpm0f
         BHtA==
X-Forwarded-Encrypted: i=1; AL+hErE+4+5JnkWEce6635IXdMjCk4xY9bTZBwH4xtPpUbWkqtnzJYqPyKG8OpgYxEC6UPiGp1edgsP012or4Ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3zO+GPukmLblGVp24H0kAioqNZiqoMm8Ag+gQpETDvRpBQwym
	vecpTJ3kLIeCnpcGlGA8+GKgIOSzRoNbv1iEbAgNKvhKawngKCYwGvw=
X-Gm-Gg: AZFdTZcaUyrTWip0UOMIhu6bjI8KQ44UssUMFo2WBg4CWQSo0jOibffZOmfmkiz3msg
	aFH1XMGsGWeNf3IYRGpSfICXgXQUGtbp0ITaJaK4lzF8KxgJ5yk1DXTDyz4WuMnxKGjYrl4rEFd
	cbTimQ13Vzr2vDE3NWoWsmaCNJaYaRT2+SIZcl0a009XrnN7R3PorVPtCUlHVKJoDTYuyGonGc1
	Y1wK6HAF77EHBB74O+vY0bjvFlpzMkVUHZfqxVg+bMqZUgzY3pRGBa11OvgMS3gwlMcUpFnQCg3
	1bYEe31Si4iqjyTS8K6ik1gevfXL/6RyBYaDsVEfs397WKOTMgTZg8K/7Ogha1szMqxLkSj7NBD
	a87vjF/O2C6gBs6wh/c6lAI2F2AuVKKhppCZkuXhGWpmSy6i7JmXpPyQ2KqRBNAY5i9f6/hsR0C
	XtlB00COLZwt3AfGimTKtzRTyItCPuP5f81F5b8xI6dvsXWPEHjKMsZdzysSS5x+Ct+qfzDuohU
	SPyWy6o0UOwEjMwXcfnKne42IVZk3RrEj8K+pGWGvczJnNL3VjFd3gr66usxKcaZt3wONxOQZ9A
	KjEhetIUGAHs4h2dl9beRVJ4g2YTgSRbnlLlBzXaqx1786Ssg+RqJkrnES1aGOtD4vk=
X-Received: by 2002:a05:7300:8811:b0:386:d86d:d445 with SMTP id 5a478bee46e88-386d86dd49amr3135963eec.36.1795670303265;
        Wed, 25 Nov 2026 21:18:23 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm17282954eec.17.2026.11.25.21.18.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:18:22 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ASoC: sdw_utils: Drop rt_sdca_jack codec device reference on exit
Date: Thu, 26 Nov 2026 13:18:17 +0800
Message-ID: <rc-b1-20261110-vc-07a-7c635620fec1@gmail.com>
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

asoc_sdw_rt_sdca_jack_init() takes a reference on the SoundWire codec
device with bus_find_device_by_name() and stores it in
ctx->headset_codec_dev, whatever the jack source quirk is. But
asoc_sdw_rt_sdca_jack_exit() returns early when SOC_SDW_JACK_JDSRC() is
zero, so then the reference is never dropped. One reference on the
codec device leaks each time the card fails to register (including
-EPROBE_DEFER) or the machine driver is removed, when the quirk has no
jack source (DMI quirk entries without one, or the quirk module
parameter).

The jack source check in the exit path is only needed because
rt_sdca_jack_add_codec_device_props() adds no software node when the
jack source is not set. Use it to skip device_remove_software_node()
only, and always drop the reference and clear the pointer, as
asoc_sdw_rt711_exit() does.

Fixes: 526a1876fc48 ("ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, COMPILE_TEST=y, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=y, SND_SOC_SDW_UTILS=y; soc_sdw_rt_sdca_jack_common.o built before and after, no new warnings.
No hardware or runtime test was performed.
The path needs an rt_sdca jack codec and a quirk with no jack source; it runs on card registration failure (including -EPROBE_DEFER) and on machine driver removal.

 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index b4e427d55130..7902d423c8b9 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -188,10 +188,9 @@ int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_lin
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
