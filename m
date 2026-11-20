Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167855;
	b=qS3bfjVYZyGYEnOUY1F+qnNH96g1EzezIWi2urLEpyy265pDeYhf3hc57TIMYFQYFSPx
	 bFyEgRxpFTg95LuRratYQcj7MI7ylRX/bksw39HZAqNRcVf856GT6DQBxvS6aObWd9khq
	 emYSnWQ/HfhnCacE1gmoQJBmEoDyT7BGx87D59Of9U6i0hNqlIK76ZBxmhEtIGbSx04aO
	 otkphgn0DnEaT1F7eHF8gjKMEyBTDMNL6XVXTRmP3P9ANdoFEg3Zr9lsJ5zv2LyQ2+K6u
	 vJCMw9W7yeIS4wU9fXL9jrquCMTn42yAuYVvimCfoW4TMyFkXObXsfsSiFNbKj5l4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
	b=0guP+nfN/xsuMvzdBnmGWRLD/lfLx4/8OBKHTpb6Xg8dunPPDgCY+m9A1u69nFpwQTSr
	 ujMLyS+S0uFvpi2aJzuo8NE3W0ery6brw2lGl//lNYnjasrBN8tWgHCk0fO6djkjL9zvj
	 fSM0Qhe1RPeA5ZjqDLl14zb+usgvdploKfiHnFy/X5eDEEaImFZWDYtPqDmNAwgYLK6Qc
	 ht5gv7UGGaB8sAncchKg3549g2gv6gmhNa+CmrZWZhukqlhbcHTLBlkSIExel7eTCQ1re
	 9VHzz9h3OGM6tW4szun3zjgdZhiPmrihebY0W74n4xRB4KXlw6gjRCF4AhItCVD8cCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R/fCaOt7";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61690606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61690606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R/fCaOt7
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so28028eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167854; x=1795772654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
        b=R/fCaOt7h6VGBa2F7QoE5wOHp5I7Bl833ajUoiznXQnLT4az1H3l4+qWN0ERhk+mxo
         FID0w41tU3K1V3SK1XAkYXpjnx6F1lJG2sChXBseTM1OYW5WkM+j9Ta/zXPjmTzjeh+U
         WSKX8PF8uGt4P5tlh5U4SDdpwGLy7SEbteIWGMt9HVPrEJwHBUCBYHimLkmrRXnOM+nW
         lxLTu4zAjBGJHsdhWKcbebd1/WFSYunPCl9SF26MiyRljgqscAK6N9pV8Pt1CBbXYoue
         uEcO9ldw2qKnGnyd8RYCZS95gDjkDkZxkjceQk0VNklSi3A1rKCiXDK2BdNsMVsqHBBg
         gP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167854; x=1795772654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
        b=TN/YUShB/OMFqvpMEiBbLvQPdyAoaT0/8mNpy6B61D3b3/d+R5fsrzcn0EmDMrFauH
         LYvaoi4cqPW7uHh//MT5JakbPYwel76Xbn6KaXupV1IfP0rav8PwjTvOos1iC8N0r2Ko
         xshlBnM1eFE/bNvBM7RtowM8QRlT3uBjpg5/IeUp/6yerWS6+hOSgUONLevsBMzG6m1O
         8hgA0jgWDeWh93wGVnh9Mb1zH7xs+12xqo6TspKU4mhSgA8jFgwbKdWv4Q1dvoxc133h
         bprm8UMp85K1o6KKyydnRenqak/mZ+T7UhBlx86utYCvHYeCUDh5X7mfAz7/FV440QaP
         sSiw==
X-Forwarded-Encrypted: i=1; AL+hErF6CPPAZOLePweLxtpB2/pcHuypH/J/dP+GRBO5Ptu++wCcZ1ZzXzHLvs1uIEqB2BAQ72t8dGUwruv7QRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NYBFYAII5pIPxnhVjxd8BqmbJYnzgks5O+aM75ApvU+7R5fZt
	318k/c6waF1o9EZljE+YoiuxlQuVRYvJo9B2fsoFWITmeRZ76tcRCRK5
X-Gm-Gg: AZFdTZcJYDgb/S6imjXHqXmfVa9XDEQbhXO/VNQaa0NBqhtK7bZPuMuSFGRyauXhN+C
	sEoIinGsPyAc5fctfE+xvhKgFOfN3MUsog2LpvSZiu14fLJqFzVXMGXfhuhdN8OcMF/mW61xlLt
	sO/Df7TvMBWM2bhoszck2iTvh8OjOrSwT40mNF6MoUk5bmooRSkHHBJRUyo0t1Yb13oUV//YFVR
	2T2C0/E3Q1aD16qKtz3eAUVrFK130NrwPjCqrpDUKkXvqw3j408uEEGiIhdXWbwCIoHuFRyijHF
	dVgM+U4zAjAAXEzdHDBJr3bx48fANHIbh9OlDTb4wNtKjhG7Syo12GR4q9XhbCJmdmpU/8jpSfl
	+RYAkWaWwPUhFAkszt8yo8KNWt2qe7m6oedJB4It1CIahmCJu/gSm5AlaHCPmB/T4RpJ6oaj3EW
	Zjg4QHqtSRrzGMUxg9Q7extqr3rtZIuMiFZkh2lffFmE29P96bfAMMDqd9v4KlPW2R8tq40JytN
	JuWBKWlpEn48iUXzkqWyWtKjdDOsctrp4CmKEecnVK7iGWVU8DLW2ap1COTCZ7INWfJ7tBh5Re5
	3jSxa7nzle3EHuW3zy5fYn7Ye8WvMo+py/3+S7mYgZLH6hHlNLtVCFtFLBlZtHWpwYtDoMk8CUb
	G/k631tiBio/9kzvFQ4HhvorZlBktAnk+rpXIbcP2KmFU
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr1900177eec.28.1795167854304;
        Fri, 20 Nov 2026 01:44:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:13 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: atmel: mchp-spdiftx: Improve probe and PM handling
Date: Fri, 20 Nov 2026 16:43:51 +0700
Message-ID: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

This series improves probe error handling and simplifies runtime PM 
management in the mchp-spdiftx driver. It also moves IRQ registration 
after runtime PM setup.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: atmel: mchp-spdiftx: Improve probe error handling
  ASoC: atmel: mchp-spdiftx: Use devm helpers for runtime PM
  ASoC: atmel: mchp-spdiftx: Move IRQ request after runtime PM setup

 sound/soc/atmel/mchp-spdiftx.c | 77 ++++++++++++++++------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

-- 
2.43.0

