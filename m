Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084470;
	b=37tP31C+3+wk4voUDT1GGerYmcsHr7jecVfkh7ZiQP7dVZCGKrGARR8rySk2s/jU86bV
	 WFAmuZC+Qr6AiVGd8a/FtK+jDvN7r3PE7jSWcApAhCs3RwwKh9XMedfuIMZ/Ukjy8kMnb
	 Q873aPA4RToEIwGl6ZGs0ICwqUupExHIhvbz4ZZvJyJtwPd31qrIBv2sdLnPQl7zIilE3
	 nP3WsPcxz7CY6sQiK52/08Je0wcr/lMb5RkxIkPNyM0VMI4VUVCF6Z1SsGpb+phWCfgNc
	 TxtnHftZ2rKozMfarhBXUYR9/ASWPr0IHtiD9EpNpGl5tBRtGuL1BXvP6bZGYpu6TGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2BJlLviIlo2L+CB1E1yEnGBnM12+e15DyXb6ICfwQJk=;
	b=IVAR4w2Wz8GMYxN/xHYHcg/jjFC2hL/fxetTQXsY1+12Z4F/59aer9lMFIdt1RWQGoyJ
	 a4mjbSlEdQ0MSAqTILK7r6vpA5SAk8RV3IiIEHLopfekeqOWdpVNKIGxGgWfND4j1XQXr
	 8K+IHNtIJVU5OCqtXm/kL8uLmOHCtj/Lj19Utm/7hwlqoz9lelD2mUzCPeTqAMgf5jHu7
	 yYm1itBcxztsJeoYq36GD2Ewp15mX5UsfEtmMJ5MTWYthAqBwo6v1Ws7rGXsL3HOFNtxh
	 QsypGkB7W5QTxCTOcDzv3MwWODtTz2evl7knZxOpVTc04/zrVtyFQrPZJva2ff7F/yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZcjhKUI;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892E3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZcjhKUI
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9eb579c0eso13367255ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084470; x=1795689270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2BJlLviIlo2L+CB1E1yEnGBnM12+e15DyXb6ICfwQJk=;
        b=rZcjhKUIcB3TXU/ZSZ55NQDIE9TSRT9sQZK3kU6exPm4VpmJmqOIlK6Cu+L7UUFzjr
         KHcfL1yO83C59KufrG0pPongUA6/Nme58qp12JECpS2bQ5CGRJfHTza85DKuO0NNLhr/
         qt1LLYqx22TcUIXW+ao0PLxRs/ZQ+TNsjjdenlDQuRfMo2q5a6FjTuaPrVtsvoo6kTtb
         7fnvaRv9yfJnPJS6NLRhZfkMHQG+kgt0hEcBd/CKyUvjjoZ4IHWEtmCc1nhRY3ZonMfT
         Zet8Dd5rrf5zEG168Z5SO0GCm6BoiJ6VvGlkC5x36YEUPyeW+pUzsC9yaKhsqygq/WTj
         Ui0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084470; x=1795689270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BJlLviIlo2L+CB1E1yEnGBnM12+e15DyXb6ICfwQJk=;
        b=BpxC1RU8gZslr8b/Ll+I3xVpECcSMhk0zYTN+Q9FtNZABhCbsdd+sSZBUBdqkizBpm
         AYvXUUy0+5aDMIFr4DiwEU00gszU5zCbMqShPEPsMpSBAHRBsFLJ+ZX6FseCyDWtQgPs
         QUG1UI+PICi/3+dDB4vC1JblhdBwr4r+ZfNqBJ0qRZH+x/LJGVGnjnwmm88jISay9RM1
         5J8utSfZRxtx10q6XFnXQs1GDkX9vOIWgTVcA1HpLSUgt5b9GL8/07XfyjU550dH3vva
         YXXil0bRPTkk71TBYbYeGkWCPgAev2QDFZ6ZxTyipdz49BYSK3O0A+KkZoG6qaJiM36U
         Urbw==
X-Forwarded-Encrypted: i=1; AL+hErFK0B8UM0A/VDBM4bOrkniEH804arZ6sErGPbgKviPmaE/VtCH9L4buy+Gk51qOZKnv6wPMWyghFBSsfUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ne6gAKs7LjlemEVTe70wb0qcg1zXXfyVbvgleUMBq59754INu
	5HQ4Ie6bTjKE1kRAe0hQdZjcNP7Cm3YpF6IXoxACgTSt+FgaJ0iLzbYM
X-Gm-Gg: AZFdTZfuqbXQMcRUj1qOcWeMIC6hTWj6WNafUgG7RI0LLpYoO0XKInOjNhKE3uR1gVC
	WozDw0Dbve2fDb0JFrQpw8hszver1w9YXXNKGkcMyAqAJaxHMBcvzjXOgtWj4QJJ+PhUSekTuu5
	/XSJYmHDFHKXHdwegrZJgepIsKp5wfkQW3slUK8Jl9+kFheS5xaXzqS/C8Hf24eLWnqmwR8DKAR
	trJT9SDpdR5A2g/0gUYksSYUSF7Qupv4fI5hFmCMZllLN5+gLvS1Zd9jcjG+1TQEie+EbMuHZHb
	iq53MduZ3dpnSldicfrvUNWxSviwtdHgPS/vweOUM3j0ptWYK3xnglyYLPwjjTcRpah0ZC+Kp2C
	Xa9veygyMSO2k4XVWb+EEN7CIXdbzYVeejWjVdzjICwOOFaKSxP0+V0vg7pIcNddtlkhbPNYiRL
	dqVc+ms1lNX8unmrwxaZMOhu8gxGBdjsatZj24dEbvkGC27j9VSMHyZkQ4itS0negQUVgtfysQ7
	MhmuQyYKLrijpVj9qDGS84dL7a+QRwl5u/Broe74dDYptLWTiCHyyd4BNkMcVrr1a/3W4pivOTk
	O+cIz7FDeqBLPtnn8CYOvMhFfmYxMEvcERXFrEFW+hJXjfNbXDvES70P9BVLpy868pPt0/R49KC
	2h0XRWNQc9m/jyqRONOyGEveaawzKC2oJZwCNeU+rgV3Z
X-Received: by 2002:a17:902:e94c:b0:2ed:fd0:e736 with SMTP id d9443c01a7336-2eff70fdc62mr50594715ad.6.1795084469832;
        Thu, 19 Nov 2026 02:34:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:29 -0800 (PST)
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
Subject: [PATCH 0/4]  ASoC: atmel: mchp-spdifrx: Improve driver cleanup and error handling
Date: Thu, 19 Nov 2026 17:34:09 +0700
Message-ID: <20261119103413.31729-1-phucduc.bui@gmail.com>
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

This series improves probe error handling and runtime PM cleanup, 
adjusts IRQ registration order, and fixes error propagation in the 
ulock get callback.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: atmel: mchp-spdifrx: Improve probe error handling
  ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
  ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
  ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get

 sound/soc/atmel/mchp-spdifrx.c | 81 ++++++++++++++++------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

-- 
2.43.0

