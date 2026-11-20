Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175014;
	b=Igx/tka5EZOZ3xkLpAR14g0xUbv6BI7+9NMv9yX6fPTwt0MYW+me0+g05IwGv+8v1J1a
	 jYwYlBTfR2D1S6nqQPl+oGKWUGrTLJb0iPCY86Va2ePIfY5tOdYhguzLLJUa3WaEYdMaH
	 LAk7GEXWpIwD6WTZArt070+ShnrefxBB8LhJF3En4eV6wk/rPdte2cF8HTptjs07ZdG3Y
	 MZ45VXeoL994jJbs3bjcN9hr9Wh7RFM7r/bACa6/1zY1vXQDFjv3xRTi6p3DeIU51xFhm
	 5eqoWYw9Fgl0KeJtQ/PRy5OcajE71hqfQDISBHBCJrPgB3pIVufO3WaP0+kMcG0JS5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/7KVf5PnmXgwclJwx+CNk+Pd0XXzEB+lHICPBbjWm9Y=;
	b=k840JVHfAa6fQK/lxcjWhvjpufZOMmJFPGo33aLqj2dUBkmNeBppw5KyeyKVyEs6JUXv
	 MkMiR75e0q9ogBixMlTzmBsSX3pPizy6M9tccERxalF/jHES6DfhW0rqMN/9UQ17G+GDQ
	 A1+pQzR8fZitUHFX4hDzGvBtHQXbPmD2QqMqjG/ZOANSNFoaCUmLrpMzdUdTldTYxOqr5
	 3a30dIWyW6oRZS+Kr/YwisRg40yVrqRaZdC8BtS4q00Dh+OGQHW/bOKrK/f05cv4F8zHv
	 e7iWB49cVSJA1gr5HMmz6TR1EjVAEXRCf79Tcnyyh3S6GPcUhqZMcJfmzxGMVDItadw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U5T1S5dB;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2617360A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2617360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U5T1S5dB
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f042a34db4so3344775ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175013; x=1795779813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/7KVf5PnmXgwclJwx+CNk+Pd0XXzEB+lHICPBbjWm9Y=;
        b=U5T1S5dBgNcU3cmKk2y/NZqQqUhhacPbWBpgNS2tvJB9d3YN+acrHKPlYvbRJsUdFu
         CajRIZ0rWOJAl4ekZOM7DW9LDuXHS93SMzQ+ohVKjx9LfTJ4fYlZ1KQ4+D4S/IzzcAxs
         mQZ8VoGPUc6hz3II/nfBR/aePyQ0IizsTvcjRtpAODZvbUNplQtYKZk/vIrz1LoaR64q
         m3RrI0iTZ4Dl2a8+MN9TOL1KQZRsYsAwCpIt47VQTOs3AnJCuRgPrSY/nBRNSH56gKuY
         2hTEz3Ks1+8X47j74UjEBXwm4PZLuiu9VByJ5+cM4cVRp9vjHgH/zuvXxK6N9s2J8b1P
         ZluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175013; x=1795779813;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7KVf5PnmXgwclJwx+CNk+Pd0XXzEB+lHICPBbjWm9Y=;
        b=ZRvh2QMCC/dZep4oS7G6+OwvyaCDbiw/hmmvEwJNmiv5kHUR8kOHbf1Wbvggek83nj
         AEhBYS5L9O5h2SC8p3WnD8rxKW3PCeZomQGDUdeqfzmMGQRkmkG3s5NwuXR1PO2L406P
         MrqqR/WXrG0E/jlKU0puPehnuwJIRtt4vt2RCxDD4qVT4PpRhBykGvrr2itVQY1OoeoF
         ivjoaEmBgHRI0McY7vYRc/RUpOlxXZntbE2CUeF98j42HtcxIl5aGktiHpZnzdqLMLi2
         SxebB5AJHtCpwwaGvDTp1WiMghytIRDXabSdpZCFYweyrs6cCQyiUU1VUlHw6/lYxUki
         m1dw==
X-Forwarded-Encrypted: i=1; AL+hErHSKkoww9U4eezmJ1Hn/zJQrl0Tlmhtvwf5tRKMY6qTYT9I/aGK1JT3WdG5b3HjoM3wV7IanXYcmN1FomQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FngfskJ+0BhEJt82gZsLmDvwj/2PdSTmwHFINAJwOFVWaL1Bg
	KXMvVQcloi+UujnOD4scXphXaRLD4D2DloVk+XYa80XpGRfTLq/+dVf/9bAcEFZAkxU=
X-Gm-Gg: AZFdTZc1nDI7JuYuzy40z3EgisU15SAeeOtrsaA0ehGan/t2QMprg5rgglVsMc8breZ
	n1OO2dwXixXFvLXSg6qbErvwBm/o0G64ynedOGUyeYb2/evJexSaOxlSNS2Mo+hIbYxAeoPHlvb
	l1UvqFjTnmCuKqn6ohyuO6kO/eVPRJ1mb6S/MScLtzHGmzPrLQ6f0zx1CXUCOTz9yLMDH06UFPI
	gEbz30QpL8lXmB2BrUw5DbMgN35w4nfvFy6fx3bujNpuk2hs6rxOw7GSlv+UtTvcz8qpYD/8ddx
	egRjUymA0CRv4VtHEO1C2ttrkmYg9/JEMQes+lQu8DaBEOtQvUgCTRDw7tmshVpnX70H5t3VS7L
	pQJ4LYh5/Siu3Sgc9XIjlO5a9GlXr3ZppvOxx92UmyrCCgx3hnZkSRjnCHJHBjg11x9eAiwYBka
	PRUo0ee1BweN9JLvqBK3rKJoWYRZfrphMnFiyiKFefIMDkL7IqsRu+ImUj/5XyoE4kJixoBuolK
	x5Eafx/WumaazMAEJEVVknelAIJhcvZZFwVF4sNAM+SGZPZ9Stoh93BkR7RN3dIEN/eRblO7zId
	PoN7FMARqp8CFndWK/Fqa6lsRNl4L8NCtNX43oSnhjsoL0NgA4bgEYUiKLiJUavmwlT9LZgG76B
	q6FdcSlOP+yzyPU7WZcL9mZ3/+3pw1tHqHINd
X-Received: by 2002:a17:903:41cd:b0:2e9:6645:e9a9 with SMTP id d9443c01a7336-2f03f20cc4fmr22356425ad.32.1795175013537;
        Fri, 20 Nov 2026 03:43:33 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm13252465ad.13.2026.11.20.03.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:32 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: aacraid@microsemi.com
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] scsi: aacraid: bound adapter-declared sense lengths
Date: Fri, 20 Nov 2026 20:43:28 +0900
Message-ID: <20261120114328.3072332-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
References: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v2:
  https://lore.kernel.org/all/20261013150420.3168223-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
