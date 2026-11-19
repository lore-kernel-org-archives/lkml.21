Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121413;
	b=R7ZKag4wcFjXfdmYAFyxI9e3T5zCwa5tNNiF+utlpy2MKEl7WkjnAylaoNkj1Y6rPxm6
	 6djxR7Es9X+RwMp0fLAvKTcohVV+edPFARobZb7k73qH9GJq18KXazFFQI5ey4DkAIb2A
	 8FhNQD5HnIp87p0N9pBAyMgIu3zzruoNUL++OA/WLVHPSUMz0Uk8e7Z8lE/NFeIV3w3np
	 nZQ0/FgbHEQgNrXgKnfKvucAkkY8eSxMKntAeS8ULpeZ+zLK9nK8uZ+Jl6PJhP+T7I/j7
	 bZ5dc37+J4gDrgE8jNCvX8QIHNQ5dR7SEa3AWVyBazGqwWZJ0mQkP0MxjU9g8OP+fJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+QHNVJJRcYMSrZ+awNmoabV0Kjz2VNfmnztyOdfowXI=;
	b=npaWkndf91RqzfCwHLj/MwX66h/L1QhK9KZf7/KKHGhmtz0VELwjoTuZVS1WtQCn0Nkc
	 ARKeD8mRiCm50ft9yMX4zpi0L8ef7unciSPAqZwhiRas7RBdyvBIgLImZvK/KQXZ46fe2
	 AxW2OxNMULCx39KU8ixhBh+q9vNJNnG7FMo27mLbIr3uf4K39NoEiQmYnag9TP1CY/Kxv
	 laDZg25mPxBndJh+Jx1mBo0Nwy2pC+d+tNWVNqFe7QHa5xEMA2gBLLcpfckaJWKjtH+Mo
	 5BJwMjsl1l5yc4Zpcip9inyCvd8ogwxsMAtnJlT9HKDjU8jJAzwgOn8x97PaUHSCPog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HRhHZgt9;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77814606A901
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77814606A901
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HRhHZgt9
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491846221ffso114692f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121411; x=1795726211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+QHNVJJRcYMSrZ+awNmoabV0Kjz2VNfmnztyOdfowXI=;
        b=HRhHZgt9049/cfpCUDey63TTQ8U4Cv27ADHsdIdF7wWcRekVVgbr52c8y3LovUE4kj
         Xgy+S8pHzfKrQikmk5NOT2HfU9ltsTWO3rq0Jt7IbyrksODBTYIypIgvvlZe4eljRTIk
         jbuvkPnmfcNcmu9BYE0v2N3/pj3QorPTtikK4or2U8scRjsnGYdnenEvBCCWwvXe0F3t
         Kkh5fp9r/9tZULUV5fhXy/VSXw6xI3DFrR5mwt2ozUuZoMzJFB9tgcQXrXrOOc6T0IM5
         S928niZuj0e0T76/d/iKyCwqczIlNR7BdjVYMO4vSdKtHruGh1KNCDZBNyCxBFIPCUsF
         aj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121411; x=1795726211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+QHNVJJRcYMSrZ+awNmoabV0Kjz2VNfmnztyOdfowXI=;
        b=jfhYB5/WJ+zyqk9CNwSNwodaFu1dcqz65f5l8yj5kaVmQ/rhSJNBit72YKz+DMzBFl
         gCjk2qz47C9Z/fXBrh39bLmCnJU7HGG3RRRl0vpeMF4LHeQG8Zr0rqfIECfbIRMf3JAY
         3q2TWw5KOckL+yN86xqDmqVSwPujWp0nAd/V0p+eMlXTLR4cWiqSTxxzgjnVMEvlj0Vr
         +6LyIMkqL4/4P+4fbZob963y7T5quW9ywXUodvuafjUk17DQoZiubdGZlsHVq7sk00av
         4Z7FOOZ4ryXbk2hLSRcQMlC8/6z4WK3ZC7+6nUc7TPZf9BVKlLd5aTS11uMADqDIrCN9
         HfPQ==
X-Forwarded-Encrypted: i=1; AL+hErHwssZMWuIC3CMZQba26j+Koif3YZSVmeSGxL0j76t61B6epOt69lHNIDQbgYdjGdhRXakhpU6JvArwWgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jqq/kz4dnctfaCUQp+XK4SeKDRs83wgbZ9G9dpKnUkNLuCsHN
	ZnLseW3hn36mbfgkkmtj+vuVOXniT/gacnns04KOxEhkQFiVXJki8jPmgLH8aclOSig=
X-Gm-Gg: AZFdTZfjjB+Mk8vysc5UzSkVhBMYUIS36eWFcEHsrHQdMnOc17dXLkOdpt/k7MQFSCL
	p4YDJAcdZ87cLjPGeiqd5iauYhBWrj7Sa9zXAwvk8Mr9IMkfQZWYkCUVZZy2Dl0wvFJOueK8BOg
	E2+Al1gWi+NP/n8QmJgUIREZBOAwd9QdDVxVXyK36iasihte/e+BMVoat4/Id2MuOyJY8LVMCeW
	7e84lN7IL0IbuzcWle7Di4koZ77awel3Zg5Owvz++ewVCLS43ZD9sDmCpW3vj03ulKKqhepr8AU
	QyrUTOKUSuHpCcixoRSbSI6pnv2EDYPEntZh/s2MJFJOLb9ZXQvI1UVpv+PkVsCGntnZuZM0a2C
	lIScj22DmKSasQcs2wtpwaLKMV4gC/YQ6x4hzezALEXhtkEzFSep1LDqO4EUEZbbL90lU46J2mR
	cC1LjCpoO6NxXaN8lydAJSHW6hLD+9UHGVlp5V7+Y2jbXMSUpo2oyEwOdMaRobxle375vvsgqKJ
	KKHa5l4Lf0ws9Riw3v9+PAqxAuWtgt8dcvEiaCLEonxdfsoEmpFrJlSATV9+UXW7xDhvHZP6taw
	rcyi/H5mAcRrXU1SX1owGFL8yGac9GLijp/677UTV9QHa3VPaLs+oHmdqB/JJfOz268J2mLrLko
	FEnS29OTBf0nu6BC+sQ==
X-Received: by 2002:a05:6000:4812:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-4abb57f6e95mr1093403f8f.49.1795121410672;
        Thu, 19 Nov 2026 12:50:10 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:09 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v3 0/4] Fix clk-divider rates above 4.29 GHz on 64-bit
Date: Thu, 19 Nov 2026 21:49:30 +0100
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOOw7CMBAFrxK5xsgfSAwV90AUtrMhC/lpnVggl
 LvjQIOooBzpaeY9WABCCGyfPRhBxIB9l0CvMuZr252BY5mYKaFyKYXi0xBGAtty31x5iRFLIN5
 YSkuyIwRuCrXJC5NvQO9Y0gwEFd5eiePpzWFyF/Dj4l0WNYaxp/vrQ5TL7o9clFxwcLIQeusqW
 6qDs/cGHcHa9y1bilF9OOUvTpWc0lTaOWOME/7LOc/zE8X0Nyg5AQAA
X-Change-ID: 20261102-upstream-clk-divider-large-rates-872467864e39
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the clk-divider truncates requested rates above
4.29 GHz when computing a divisor. Fix it and add KUnit tests.

Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
new generic macro and were never applied. Patch 1 builds on his v1 and
rounds up with (parent_rate - 1) / rate + 1, which does not overflow
with clk_round_rate(clk, ULONG_MAX). Patch 2 fixes a division by zero
found by the new tests. Patch 3 stops truncating divisors to int.

[1] https://lore.kernel.org/linux-clk/20230519190522.194729-3-sebastian.reichel@collabora.com/

---
Changes in v3:
- Add review tags to patches 1 and 2
- New patch 3: don't truncate divisors to int (Brian, Jerome)
- Patch 4: also test divisors above INT_MAX
- Patch 4: round with clk_round_rate(), clk_hw_round_rate() needs the
  prepare lock (Brian)
- Patch 4: run the power-of-two ULONG_MAX test on 32-bit too (Brian)
- Link to v2: https://patch.msgid.link/20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com

Changes in v2:
- Patch 1: round up with (parent_rate - 1) / rate + 1, as
  DIV64_U64_ROUND_UP() overflows with clk_round_rate(clk, ULONG_MAX)
  (Jerome, David)
- New patch 2: fix a division by zero in round-closest dividers
- Patch 3: also test the maximum rate (Brian) and rates above the parent
- Link to v1: https://patch.msgid.link/20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com

---
Carlo Caione (4):
      clk: divider: Fix the divisor for rates above 4.29 GHz
      clk: divider: Fix round-closest for rates above the parent rate
      clk: divider: Don't truncate divisors to int
      clk: divider: test: Add tests for rates above 4.29 GHz

 drivers/clk/clk-divider.c      |  93 ++++++----
 drivers/clk/clk-divider_test.c | 394 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 449 insertions(+), 38 deletions(-)
---
base-commit: ab94dbf302331eed3679e262e1d8d1a73f308640
change-id: 20261102-upstream-clk-divider-large-rates-872467864e39

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

