Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771445;
	b=yiEUtdV6HqyUgI9+dO2Wn7X3EiWWy9kr7d7zRqL06RYewRRp+gFZQTwFYIx+zwbVQwTk
	 AzdgjNW2Rd+zWeFqkugnsmwMRoRzy8k/tUslFzbjf/DRz2D5TSPsEtGFabzg7jfHAzq76
	 88R9NEVfKIeooh+av4iaO03RGGTcLJgkP32FgvDExiDdrqMyCXCKYeq/NmRQSA/rwajaU
	 C2xRXNXDj9CwFjcWTlKY1NcEkzcnMseWep9U6A098gVGTbIAs2yNQDBiYabwURH7DAeMe
	 pzilfRKTLt3RkCSy7LMeupW35cAy4BzQd9u2fKGAiJisR3wPUae8TKiFB+EUxkeU0aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
	b=reWm/en894MQO3SH+v1133iYBoR0raA9wgwTel4VkRLWPrf0w+GMxzugFV2kDFiNqn5x
	 uwjEiPDir1rP2BsroovbLqLswkGiCn5uKKMu3Nc8ZGICSgcdsIRQljOdnSAFgnMUP4+yu
	 IkbWOcoUrV5jSdI7+V2iRrCPEuiqMpTKU0z3y+b2BNNGaXpGvwbHvsIZ+Nac/EAdoPS4W
	 QFGIVpN7ZSSQh0aMmNrtin9UwbbVwb8t3vR55Pv4Ur6QvmgWZoetBNhsMbQN4e++m9V5+
	 HxxQoq2NOGhR9FZ4340cN39a59KzZajyfFxJljq5sMGA9jZfjFZuopxVLcuj49tes6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nx5xe6UA;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA2F606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA2F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nx5xe6UA
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso5276938a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771444; x=1796376244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
        b=nx5xe6UAeTeMxVAyOoQtyhZ2he7JkDm/MJ8VuN0CTwLfOj3Kq9s8HM9PBYQiG9sLvF
         DxBMNjacBgW51PdfS65EKkpjwI8uRH1nQo70q98MPEAK/an/hyMXnqdvjF99VifjqQeZ
         kiPrveJZnkj/gAoCmvgGO4IDvVs3q/zMR5HXsSSaN+c7G+37Jt6T4ayn7Sp6cenIWr2p
         oRT9GQa2KpV2nD31988ej8xjounJNHAX2Ic9GL/eCPtDoVePFd7iDaiF5Mg3TaQXKnX0
         bPtc/UUfEei7WDQKVPSUJj8Lvu/oqav5FlzD2tIpk/jfbQOY3oi0Yzh7XEdhBZDNzPZj
         KiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771444; x=1796376244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
        b=pO4htAmb9ANXRHLptgK0gKk0455GqhmGR9bzQxuxLVzOt3c373ONpL59DbP54y7nAv
         cK3jtD7ZH308LzSEJMxbXdLyMm3c2a8KtjoqfgTtV5i9Hcj8CvXI7PIfDVVJFdQ6O0Ci
         E+8abv+p0dauW7t1R8CGZG2KgFOvTRulfXXcbb4t6ZH63JZbuogP1tnE7V4wmDAaR7sI
         Uj2Wo8w50aYTSLv3G2RCIp/vLd2RhO2q+UWdRws5SXiddN5EXpv8I+2yVa8EaOMuaGul
         idO8xcz8dgUU8J9PpXdtAXNroLYVlBYoWL3FjJg6FUqy0LKb5iqJyUU/DuWln7t4hehb
         V0tQ==
X-Forwarded-Encrypted: i=1; AL+hErGedFSLjLYb1hWtzU1Vww3uaeRHJ9XNopS5SNmiZsBryT162DdQ7/pBoo0wsT43L8RtoJX+51Wr5r7hvYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d3ppwEYWPUyy7QuumU+QDVRILyHMNcisG/Rs86wP9xJ6CtcQR
	q3hQfwxWQ6OD8GuxAbMANMD5GKEK0MJUlRl4L1o/VFQOJosdlAbW8l0puPWF3g==
X-Gm-Gg: AZFdTZcNnqdU28ZLP3kFAyz1wX1vRn0Y2kBLc66haPRNFCusW+csH0Gii0KVozWwJgN
	8yRe21T8d4yloNQSHlT6WbDFEFkZ5uJ2HfLhUlCUYEdXrF38sjq3uQ37OrFAUBwBZ8JP3bNHINH
	8BpkX2GHTsScFECPdGijOzR8n3mMVHt7jV3lvQ7h3FXFKSTqGMWfH+AR3uUbB0Al56Sr3PLO/gL
	uAGcdDiRxB0biwvfw8iyJ8221rcGfxae5jpHtgjgbm1uNKuEbIPEY2PBWMElFyimHDKhf4HGS+A
	9bj/H94483ApuM2EVJWNxLf2YvprPDsJV7MK8sRJ4x9iH7H/UfRmnMgRX7PYuvgcJVQvomucI+P
	eWWEAwU8Emhl4btVH/u10+Zv0+TRBWc/J0CdEOkkuZidVXUjYWA2ygo7uzTO5qSJaVkJ7PcJtt+
	VfgbstUX0YY5iekYkQC6fUzKc+ErBJi94Ffn6UYZetGkvEwPpJl4PLB09IHGOeKwWjwQi6Ywm56
	GuYBvPCNs//gv++3ISIN/Ao+zavDQepjR/1sJxs2wEJkFxeXROJtlRBXZX1Fvsnm/luxZdKQ1wX
	DLUCXNSGPXRf7pTHd17FH2wWPZ3jfZVj9p9kIO5CiL5+9SgD56dQDiML70A1U4Iof39X0ziOze6
	O1NGrU2ubSrhXxlGwC+euVUHEjY/Ey1c0ZGb3hviN1e8nCx6eZ5hNZQZbfLSepcwLUA==
X-Received: by 2002:a17:90b:4ec4:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b41cafdb88mr22056327a91.45.1795771444055;
        Fri, 27 Nov 2026 01:24:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:03 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3]  ASoC: stm32: spdifrx: Fix resource handling and startup
Date: Fri, 27 Nov 2026 16:23:42 +0700
Message-ID: <20261127092345.12383-1-phucduc.bui@gmail.com>
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

This series improves resource management and error handling in the
STM32 SPDIFRX driver.
It also fixes the refcount handling on synchronization failure and
ensures the clock is enabled before setting the substream pointer.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: stm32: spdifrx: Use devm helpers and drop remove callback
  ASoC: stm32: spdifrx: Fix refcount on sync failure
  ASoC: stm32: spdifrx: Enable clock before setting substream

 sound/soc/stm/stm32_spdifrx.c | 87 ++++++++++++-----------------------
 1 file changed, 30 insertions(+), 57 deletions(-)

-- 
2.43.0

