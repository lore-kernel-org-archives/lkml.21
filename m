Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169067;
	b=pg5DnLoAf+J1tPU25c74iu4Oszwwz0OfStGHJUr6oZPg2trQ4IpatNJGnZVYv4jS5J1A
	 6oeNe+VOF7HyjA4Dcz2Sa+ZfK7e517aFlIBLAq4npyW3SLdppT3szeGEwFmu6LkxwGxj+
	 GTmXeNY/Kz3B/DaAKXc2HKMgCA1Zcl5TynmbxOaH1XtaLTjYVwc/rxbouHg7IBdefB/0N
	 4jZg/d1Fm2x6dluv3YE/tdz6LuETMuDoi6F9pF0Tw0XvjIXPv7cX6M91MDqoxmIdSkGOA
	 pNPm1Pu/ac3hCIEfasE68OK+7Z0Qc06oqDO7FMLrA/msLo4NUYMEG+50dDcPG9J6WsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
	b=hsVRSO/oBmEFL8G4MekxyJdH/mPIq/feelF5b3zE7E4+j5yoS+3tpgSHYE1xq3Wzvk6X
	 C38pPb7Wm6C5ksb8x1WjiVMxLkTrVYIruMNvqRXhxHLHHUno/I7orcaDhXsed0jvvQpZ3
	 9iv/XgiQ9T7BAbX5jJt++mhwW+hex0pX364vi0pOBadIS2q70BVihBN/qma+2TtKavuLx
	 20ufu2eElj7VtiE/yKmlCLOHrYJ3DY33MjH+4QSDc/jcWvtdaW3rEJG0FZTtn+wfWuNdL
	 ESof4BYyqcgra8IuaaOm4rQLjnSQwT0FdqJQFIust7K26MAqTdyoSvApp8UrS2dSRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYhegRtB;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC71606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC71606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYhegRtB
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efd659464aso2382475ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169066; x=1795773866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
        b=BYhegRtBsgi5AtmDSa/ZiSPpHJlDcOCqCcFjFdcBrD5xolD+l+zguPhEfK8XLP/mDo
         e12fLcPt2o7Me+ql/gtc7eTeHurPyepx+CLa7Oz+nNvTuQ77QKBGyIYGba4u7ZtqBWQ/
         hHG7wTw7DdWAjr+AT18xGcYVnt+3lJMH8N+n6AxL6PeVkn9ItjCCSKzb8/eVudnRe9tv
         RtfF2mjbt9c1VM6fTyDFE5jnul9NRetK9zwr6HH1EWMDPICSTOQEfmrgE5nBtipfJl6C
         KE0DFauDto8VeDl2GGaAmNoncIEnnyaRn1oxROtZupgcPHrVdRMq+Nqi0ZXeM9JaBqe3
         cQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169066; x=1795773866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
        b=jZGmfp6SdrHXUcFmeoHOWMipMKRvtnmvePTB9NM6r6DqlyTPuhpHhtVsA1il82MmKK
         7DvAk0dqBqWIFgLLk8WblMCZ+jBQwF/bmh8Nkpqjam5+mjtznZ+YCkWcuNjYnl9CCiU9
         nWN46BGJh8pPMjYuulZMl9uQB5kFK0yaR7rndmg4I17u9Ss7g/dmiKPRtkTppdSZ9tgq
         oRaw9oZcmtRCIznaWhMPHlQN9CDM4AYm/YTTVpkANvpoN6dixNb69n2xOxjr2+Zy0Qxh
         sEI2fidpgUTG0O/mfewUYHK1fHneGBpVuTJ8P/MDxxdwOlT8jNLu1JD2qs8YZp1JKfsx
         VOjQ==
X-Forwarded-Encrypted: i=1; AL+hErHXan8+w2eRbKhIxhIKLIkdYBWya3TxNGTYvcYlrDwnvG177dkOzRlJVAjdTWqzVEnLJB4G9ajFWZ1VXVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ji684MlVxLiQOHUOIpTfKyDXoJy6zAdj6xLtHUp/nLWF5sMin
	x1AA0Mnb9WTKD2mCb49lzXN3V9rocoHx6jrTsET0GvUF/oEdAE40drLD
X-Gm-Gg: AZFdTZcOwdfofCrmnBfflPZuf5uzuvTqb1Lk0WvRihVlA9E/fEZyJd2YfGzczjAHgcO
	YptkMH14AuQ5B19YL+1Ei/ep9VjMNPg6Prg4r10uMk0O18jlWxuRhcbZE4WpBNPqZBDiXuvhl9e
	gbJNRvsRSHx1CZbHD00IXr+YdCccWkavr0lUdi5j80RCSD+KFzbG28TLCQfQuybl7+RUA73ANAy
	UKy5lAmkcpj8FV/WaxApcgyswhwRDPyfe56qLmz/p/bJ/WZslVbs7RVyELoaN/YBljy700LjukE
	EMgUAgBK3iEqQjVEN42OTrB69wL/zpBAs0XoIhrocv40YMXYb74sZmA3jrSsGQ830o7vcAhJ77R
	bQsZu/YBR5uXY02RZFE55jettz+nICBQhXk7kto/mlabbJLuHbUYB9L+YDtA5WW0IrVxI5b5hrU
	0er+XkZyP/ozoEMK1zTmbmXxs7n2K3Dy8kkshPdTMUAvIrfPLp2tkEdRmBJL9w6tnIB3Y5eqrE4
	vv0Rf2N3E5gEzycpOcZa4UEgnyBHD0MmlFZyZ6DzY8ZUNRpUPvK95pjIn3hTzQLwQk2G5jwdDAa
	SyqNqUNo10l4qg3c7vcsPCRPsYeXKUexvwbDezEvZlax5j6wPidL3VTSMqwHEywyz1XBpFSjCNO
	3+SSb8Cc7lmKCU/S/ajgzge8MtvTGswB2NLjUP/ou2bwM
X-Received: by 2002:a17:903:4b07:b0:2ed:379:1592 with SMTP id d9443c01a7336-2f03f14473cmr23954385ad.26.1795169065871;
        Fri, 20 Nov 2026 02:04:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:25 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: atmel: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:04:06 +0700
Message-ID: <20261120100408.8053-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series marks the interrupt mask and status registers as volatile 
in the PDMC and SPDIFTX drivers to ensure they are read from hardware.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-pdmc: Mark IMR as volatile
  ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile

 sound/soc/atmel/mchp-pdmc.c    |  1 +
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.43.0

