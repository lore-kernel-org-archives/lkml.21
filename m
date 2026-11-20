Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147195;
	b=RURS8RjqwO/zKiHDnUWNE2itnq4jMo1FjiQdB5S/EzpD2ltSpUeID9ODmzzI3qERMRaA
	 rKQ3idQgCPlGylcJOHicDjrJpvhdJKiaKo35r1sHZPCx0CtRslBSERMutQg1UEyDtjbDJ
	 QkzZeak8hkHVz+1GbCf2IvPEnsx3N5NzFg7n9at0GG7esSfHzEazJWY3FZLq4oCcBBhO1
	 pyvxOmfMzfNyo6AFwc0UKTHBqyU3tgol3gnLIAdbW/ETW7BBt1EEVisztdhcdM0F2gadL
	 DaOupU36fMhbpPiCvBByRkqgxqEQD9ZFyL1Ab6pdI8GmUIkVT3yrySGLITm6UraxF4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
	b=Sd9bFbzD2Xie2sSuNGKPcpbqzryP4/eqp0eBcWHoZZ7lwTszh2V1SiotV6YZWd5ptDLe
	 cN83Alts4JQkPFb0DQsUt7dBPXWnFTBbLDBpcRdmsMwqm6dPkUGLTP1j/IE0XyZ/JzlSA
	 ur5/HP2g0UI0THYZuRDbneQj4UWrTI7zgaUgD5Az6QtZXSSVlZ2I3zd6YUb+m1In+GThu
	 dcxKSA/hTqWF34G1QgXjq+bbn/IJ8JffPnO29raUaL80lqxS6jJLj88UU8Wa55rbyJE2Y
	 toT7kVihVp26Nu35BToCr1kXpiEhoEDqyX8IrKasSPaYrAqyk+0TBvLgzF+iK4Lp2Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBVnolz0;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D5A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBVnolz0
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f01f296937so3491235ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147194; x=1795751994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
        b=xBVnolz0bv5d4/cGi+uBX4eAA/DCXf0AhdVOAQFaKejy7TuVmtSsCA2qnKUsyt6GGc
         zts501lTFAqMo5fZhIE+l8jEqqR3IarsNowOFwVzwUiddS2MIstUzED9v9iUUnoK7cDp
         LFiksuFjw0O/ROLEa0M8bX+4dD5JyLnqNbkO5xe8hCtAD1hMj816+0cpik4n1vq1mT/O
         j8Y+vZ+D3V1wM0AJviDBC/8a0LRpJH4E/82RNkz6Zoh1uradxrNsQp1/4P/6ArF72DH2
         rEjnG7oC7H3pS1RsKilIGON9eKUDG1V6x7hnbSrjWugOP28uVPiGE5M4XYsQWdqE/5sj
         +FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147194; x=1795751994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
        b=BAB1K26yGQ4OQG629/EGPmMQF0ZM0zHpcnH0C2lv5es1ZUlEQCkhsQMy+XEGCP+/jy
         AnqFWGvXOHNOm0iAUIZX/DHxsq85gCRVY7cxbyrnXMygCJRZ5aM/se48l1Li3Lv1vw/s
         hdqRyZOvhyUUgZBZe64Mg2OtjPzhf64VLC91ZnsFSI3O9bK2/BxyH99wnUu9UV/BP0pN
         J0jF4/H26lwJ3mVFR8ZZ+A2lwmQZQIE1JNX5nNx4V3CI9WBONGaVLg0zgut2PSFarHxS
         wyD6sM/HxeoRIlPwRqTA++nfVsAfR7OKhFzewTtqqgoh3T+OP8tPM4Lf9G+aGGOyBInc
         +2aA==
X-Forwarded-Encrypted: i=1; AL+hErE4zHk0kelTFt4c0oeHDbw5HT+iX7MWK4nJN0dGcgERk4IG7pEu/nGMUpV7XlmVUhz9MBHlLrNg0m9mA/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWllSoHR+YOFJ0Msw7ZNE3ZEcuT9d0QYYM1m10Y0AzNjAjZ4s
	ZihW9ELuE78AjAmbL4lnH6ZoLPQM/M2DafQyfI4GawGCYfdn2TAbb6W+
X-Gm-Gg: AZFdTZcoLzWyX3uuDH98tlkdjaKMw3WNEv/rcKc0XnxICeM83x4yQz+ECLy5WPpTeqm
	bbtAh+HIZBRgo2+QfoJ2IPaOvaDBkGfRJVXmF/yTp6lPG8Qs+GyYQyVCt4Tx25377a0kQT6vi1X
	6zBlJcNS5LbS1wbvL26ZfG02MzRihnxhMzbOkLEgwkqxol+drXQ0E6DeOq5hqlix1HKBduddgTQ
	7Cj7oWPA4Few9p6uu4xsXlFBOIl6caLMEY/oRD3OcmYgXQ7pL1/7YjOcrgxFDQ4ULdNEgnf6wro
	i9B7zveNdKLeaRk/91TNq9Ok4nWAdlKje7GuR7id0pMJ3PS6e+pq30h0lRlGuW9Wk+u5I0O281z
	EnXewcYGBy0hFSSwryY6Ohy7qNi3OSZ4jVwk0xbLJEapBYDQDgYbehrWtFP3aE0+JaPS/TuwL6Z
	FQZ5WbKQCmjVTWBFSHHdSfLGqyLEGIuX3ewBas361pAvmK5jb6MNr94OkGqC9Nsau+QBL7m64Cu
	SWqegE5EeJL2cEq4gbAnw8eiEGIMiEiNLqr7IHLTRWsNuwD/XnkgjnmaG/M+6B3QuNL94CPA2QT
	cv/mOAd482Wiq6PhUaREqQsVoNHMVHEU1rXFldaCBhOV6BsEMfZN2eGHoou3QCIJpXya0bpbxXi
	rLY74ga7jvc2A5LmQ8u6aDN8XeWdPJRhAfJL0/QMJGWZg
X-Received: by 2002:a17:902:ecc2:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2f03f2b52f4mr19751355ad.61.1795147193940;
        Thu, 19 Nov 2026 19:59:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.19.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:53 -0800 (PST)
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
Subject: [RFC PATCH 0/2] ASoC: atmel: mchp-spdifrx: Fix format handling and MR configuration
Date: Fri, 20 Nov 2026 10:59:37 +0700
Message-ID: <20261120035939.12774-1-phucduc.bui@gmail.com>
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

This series addresses two issues in the mchp-spdifrx driver: inconsistent 
handling of the 16-bit big-endian format and MR register updates 
in hw_params().

This series was developed on top of the previous series:
https://lore.kernel.org/all/20261119103413.31729-1-phucduc.bui@gmail.com/

Since this is an RFC series, I have kept it separate rather than including 
these changes in the previous series. The previous series should be 
applied first to avoid conflicts when applying these patches.

The changes are not hardware-tested, and I would appreciate feedback from 
someone with access to the hardware.

In particular, the MR register change needs verification. If the current 
code works as expected, the existing full-register write in hw_params() 
may be intentional, and the actual issue could instead be the default 
configuration in dai_probe().

For the 16-bit big-endian format, the current format check is clearly 
inconsistent with MCHP_SPDIF_FORMATS. However, it is also possible that 
the advertised format should be corrected instead of changing the check 
in hw_params(). Furthermore, I could not find datasheet documentation 
confirming support for big-endian 16-bit and 20-bit formats.

Therefore, hardware testing is needed to determine whether these changes 
are correct.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check
  ASoC: atmel: mchp-spdifrx: Preserve MR defaults in hw_params

 sound/soc/atmel/mchp-spdifrx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

