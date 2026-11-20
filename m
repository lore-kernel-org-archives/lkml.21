Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189935;
	b=qlcEooMjGy6rVOgDVIqsdt6UHQtdSeTsIvwXUTB0dNrE3sGSHXmpNAOCAsQ295VKYQAT
	 aWh2wvzGUh/6Hy3WAOr59q+YCaPeOM8BdY2G6QrLjO3kD5LZPge/5J9o5Y+MTriyePRQt
	 RgkMvazNWRiv1QEdRqJoRr206Kl67vJVrsIW1Cc9bDTsbqu1rPKr1xhY5/sjMoPksMASW
	 dSEtAKlk6rGAYy/AKJsuMjSWuty7xeZ66/WHC0Lleqa4PGMVsFPZ20u6RpJ5PfHZA0z2A
	 Mn8a+T6ZeL3H0UvP+zXq50tAfPElh5M5ElbU4vIxa5daujAsiFxipEj8HEEmnrOm4rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o0nDPHjheNdO6zZdX+LgK+UkTDP3QtATTApjvPCGCnc=;
	b=vr5StrO9vMex6vYHH9sqPA3PVD/DaRi781i0SiI0mrkuq/azbbdEo7HQDt/zs6+IkE8j
	 ZXSHMsdSBanME84JYktUV1frUX4hgj8r0194phnLyGlmJfBjVj+GtbbRnh0p4MmyUDn4S
	 4gEJHBse3VXT+eVmv2akmjLSx1K873qtbMkGUViKk8n32Bu4wR2oO1yuptlmZevMMcyOS
	 kvWdX4C+pbDBOqGJUaCVtZH6xxxH6wlDXyCZK9Qc7PRHFMWpCqCNHTEGWwCNdR3etrnBK
	 jsGxyv4cZrtDtfBTkEVrLnMPZv5KdOCz5x1M17yvhKtKX1wYksSd3hEcnVKjR6JgwkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starlabs.systems;
	spf=pass smtp.mailfrom=starlabs.systems;
	dkim=pass header.d=starlabs-systems.20260707.gappssmtp.com header.i=@starlabs-systems.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WCwH1Rqf;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE5E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20260707.gappssmtp.com header.i=@starlabs-systems.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WCwH1Rqf
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so9603815e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20260707.gappssmtp.com; s=20260707; t=1795189933; x=1795794733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0nDPHjheNdO6zZdX+LgK+UkTDP3QtATTApjvPCGCnc=;
        b=WCwH1RqfXcIScdHJy67+kfLKwT3+/hNO+QkRu5Opt0VR+buDe/ijfkc2usbr/6Z4kd
         Kw0ewx5QbspFC6o6hGcEPJXruFv4weYCFML7eC6321KZMFDuC3gl0eBCNwyqSDyoMcdj
         uNBOrPNI52NZEo9THh9toLwpC5yMpZDUSXSsyBXag5r1HY+cqsjBc2RnElr3X2yhZMFS
         cprvs3KfotLC2ZdIK+Kvzk11nPb8YlTM7DP4/SSvQ80DKoF6MdKBrCZINJzExS5VmyVB
         diCTjoIWZZQkLyMYcLu/7wCxoQX/ip/j/HvBUN+PoB+J1phxeEq2zy9SXxKLrTpyfPpr
         ltPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189933; x=1795794733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0nDPHjheNdO6zZdX+LgK+UkTDP3QtATTApjvPCGCnc=;
        b=BOMu58opaBRMVNWIoh/jqFwLhGlAMghNKeXpCNCMWNh1gadPbGfbEG8XDJ8+FzJiGj
         ugdgmiciiMZ7kSQTexQnp6IALWWkB9hGTMGUy3XqYhezZm/sBmsP3MnqTmO/1uFeOYvC
         RrjvOxbAxxMQLwmogArxYTD/i8I9/1LUXd14abNIFAvpNZzS3LTgJbESI5kgcmqC+Nhr
         VAvIHsNfsF15QIXQUXOFmzfbf3hZu2QPqR6XhOrPkyIIbkaJf0az3gtcp04g5HDXILoe
         u3AKRa1cV/M1A36Fqvdw4avhKdQeJ+k9dN2lCctQqfVaZx95sbai3iprsqdEeQvYN2ku
         KKqQ==
X-Forwarded-Encrypted: i=1; AL+hErGUv+yEQnnrv5E9mg9cwgsIxWyxmCtOKin0V0XjgYMA4bQUU4FT4fUSshEFLw2QsyaWWcX8x07TZaIZbvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W3y1Mv/xiYkUJYuS9fo1LSN8wMNITWiHdbbKt08rjMbJGiJhP
	te4PAI59t0hamXRknyl00JsYfORwppUALhKO642mOF/kP17OBqFve1G10ioK/Gq00w==
X-Gm-Gg: AYBFou1XIx1nAGX34iO2+VEZFuK+l4iq9DqYp8ZPxI2pXgsUAIzs5A8Rv6XLeYi/699
	af37rCR33do2hF/j3L5aCll2ttiqW/7ZwqDb+3Yl4EiZVln1shg5eMjvB0Es8a3YlWfr5FjQjnb
	kzPsird0TuSmmV+KWkHegc0ecR6rQ0CN4WJJ/vj5RwxWCS/xVX74xffB5fw4tbELyOnNgVgCRqx
	UlmkA7skGdxySLpg5fg7kXhv6saDsyn1xr50DpQpGBZFWyuu4H1teQmT75mMP8emMP5utdLG5b8
	U0J0l7hw7xdWLaLdjndIi9Z1lcI9BM4Dvq3CEcJahxr5hL4fPBsynvDfxwPi3mOOXX+P3iSoHOf
	e2EpDZMhtxFiaTrr927LeI8i3M2s45zwrd9PnozxruWyslndZ1/NO/L5zIbEU0CwCrUEr/RNm/l
	b8817UH3RqTUR/a4pgx0zw0wIRYTcVErD6YULB2Z3dT2dlP4VMMxahbmWThg+fyBXjnexa0Fwr9
	RlcUhXoTdhvYN4MrZEW1aaOcjNrMy19YkoU3COhzJcraquXUazJsyIqZbCavV6FYsQks1b4BYja
	p9zV1OQRhyHRMFDqHXRJSPx7M7cUKwcAtrD4ga1UhUAezykYLuwXMaX1q6o6Pc+FirwNW+sSKmP
	9p0Vum9BRYL4S+PbRMKqJC1Ipe+Imd1sfjBkqLA==
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr59500055e9.10.1795189932934;
        Fri, 20 Nov 2026 07:52:12 -0800 (PST)
Received: from fighter ([2a02:8011:ef47:0:33c1:5cb4:17b2:3e17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm132029365e9.8.2026.11.20.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:52:12 -0800 (PST)
From: Sean Rhodes <sean@starlabs.systems>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Philipp Jonas <pjjonas@web.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: rtsx_usb_sdmmc: allow legacy SD init after CMD8 timeout
Date: Fri, 20 Nov 2026 15:52:11 +0000
Message-ID: <20261120155211.2535908-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
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

According to the rts5139 staging driver, SD 1.x cards do not respond
to SD_SEND_IF_COND. On an RTS5129, a preinserted 2 GB SD card times
out on that command and the driver then rejects CMD55 and subsequent
initialization requests with -ENOMEDIUM. This prevents MMC core from
trying the legacy SD path.

Do not suppress card detection on a timeout from a no-data CMD8.
MMC SEND_EXT_CSD uses the same opcode with a data transfer, so retain
the existing timeout handling for that command. Keep refreshing the
physical card state and retain suppression on other discovery timeouts
to stop repeated probes of an empty tray.

Fixes: 7185b6d33b17 ("mmc: rtsx_usb_sdmmc: suppress false CD after init timeout")
Reported-by: Philipp Jonas <pjjonas@web.de>
Closes: https://lore.kernel.org/r/523eb7d1cc0811df4a5e4c534538f3dd@web.de
Tested-by: Philipp Jonas <pjjonas@web.de>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index bf37fab233cf..55fb83f29328 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -879,10 +879,12 @@ static void sdmmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 finish_detect_card:
 	if (cmd->error) {
 		/*
-		 * detect card when fail to update card existence state and
-		 * speed up card removal when retry
+		 * SD 1.x cards can time out on SEND_IF_COND. Leave card
+		 * detection enabled for the legacy initialization sequence.
+		 * MMC SEND_EXT_CSD shares the opcode but carries data.
 		 */
-		if (!mmc->card && cmd->error == -ETIMEDOUT)
+		if (!mmc->card && cmd->error == -ETIMEDOUT &&
+		    (cmd->opcode != SD_SEND_IF_COND || data))
 			WRITE_ONCE(host->suppress_cd, true);
 		sdmmc_get_cd(mmc);
 		dev_dbg(sdmmc_dev(host), "cmd->error = %d\n", cmd->error);
-- 
2.53.0

