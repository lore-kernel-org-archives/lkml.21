Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107881;
	b=dCSLYDUtQRabr3vqf/igTUBgT1MsyQvM60OcSL6D3yfsVMxOPsENg0Opm6GkwXxGKuKG
	 If55yDWePQlG70szdsVvu9CfxwUKsT5szwaBhDg0vew+udYvLcFl0dWrQgCXmodXlo4YS
	 0WVIEvnVcKGzqQTyKheSuXJpaH/3SW36oLZdTeelihKKjAvt6OqocpBxXLigFfaYH4GvV
	 +s7pdQpk6cRfq8LMXPv9xPJUZgJ3RCKv7Yr2teMiesHedOpL9LMn96QLrI9JL0kGw1jMZ
	 Y9WP3q+aBbsqpPtxDuADLmzwPPprzcMxIAmGwfozjYsb0LHQQw2DCbI8uMerPGbzojw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
	b=VjuPUJrwF5B1vy+mLAbGFuUeUYR2XPavd/wIvA29HSf64ykm/nnZlL19Q/cENPndO84X
	 RMLtmvlB94XjN2SfBV01D01HY28cTFSwEwAj7s1psVvXjsO+4xymHmhWF/Ck9bB5xKiv1
	 9NmgRO9Nog6X4JAMvaVi9zg7GD5J5SS+lPC/FZHlpVCr1ta52QHa6Clg4ng0muGWNrLLx
	 uTjh4oOg4F9QHbaq12PWiKi/pKBgo+gkQMKm43iAacTFTJcpPC+mc45G2h9zu7opBaCbC
	 noHE1GoX4nX8vLEgXLCxVscMIA1pMPFiZ4k4iqMBGGdbcIfIRzRRKFKg2SOb2vEdbtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=flBkUQDJ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE460A3803
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EE460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=flBkUQDJ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383165e9b0fso1977213eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107881; x=1795712681; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
        b=flBkUQDJOC3iYGTXsEUtJ75OQ+9dDEj/P1WWS5cvQKALKVhJOS50dXWjd0IKwvsVZv
         mmqyg8o0z/4VkKJMTW2LmIe1h8jOUZQokc4IO4gOrtR1CG0FmWxyz2kC3WBz0uPzPu7x
         QQVSMGiQBVQWSbQMElagvXQWzzIKdzgVZzPoENeMa5IfZ0HY34k/6pqvZ/glZr7F7XGk
         vuLzxiYea+k+ftYMO8BMRyE7ohay4/vwaVhTDy2uhBbKljTX7RfTdcQjxlL0T5HP2Hq+
         nlA6zmHehphQvAWSm3XDBcspR91kG9g2MnQm6m4SXdT2FrC2XJ76ug7VKsoVIbgovHVW
         UySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107881; x=1795712681;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
        b=dWA4BtcRCRpcjftn3UzZhjQeOFKTvSNhT/n1A3VtpllypAhT/h/tg2TIQMiG+Ttje/
         gBwmkuekuDGmy/d/K1LvV1HvcmUi8ch5C3HMaxTsm9uIlwllI6WfoiCzLeT1Mal2OBCV
         j886Q4j53G/hpB7uhDea/lWzHoiHNUrY2Qd4qz0uYAd8st6sRIFm8VefRUrV5tDJPqPL
         nNQlnoUYJl+KAH423y3xckSNvx/sw7l/M0qQqNBqFoo98d3Ohmk9WX/f74mm0VoBjiea
         Z38qCQ8575lA2XaQyjAoYy0qsB1Jd2uCkJNR4jcx/Q+1NggUrUXrTCWUD90mo9Wr33z8
         z//g==
X-Forwarded-Encrypted: i=1; AL+hErEZDifqhTBRGAkFyywvvbU043bXhlvRIVWANu2sMY8b4cCsb9mAksCCIJXegae2gWAC/GNdfYu6mC5dRS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z582ZYekolXc0+1xtaywGgrBZHaP4Oa6jNRLwKsY0zWfn0p3/
	vr/eMX7yluNQ83zaZc3MqgJgWP2I3nc69s+Mvn0nFBlOADvrVQpLpmAyDZ5siJTNuyLvcQ0mM3l
	iVTN0f9O6ww==
X-Received: from dlbur6-n1.prod.google.com ([2002:a05:7022:ea46:10b0:196:1ea7:17b6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4502:20b0:152:9e88:daaa
 with SMTP id a92af1059eb24-1b55690040amr238241c88.36.1795107880543; Thu, 19
 Nov 2026 09:04:40 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:37 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170437.1512945-1-irogers@google.com>
Subject: [PATCH] wifi: b43: Use 32-bit signed integers for N-PHY RX IQ
 compensation math
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In b43_nphy_calc_rx_iq_comp(), the intermediate variables tmp, a, and b
are declared as u16, even though the fixed-point calibration arithmetic
shifts 32-bit IQ correlation and power estimates up to bit 30 before
dividing:

  a = -((iq << (30 - iq_nbits)) + (ii >> (1 + arsh)));
  tmp = ii >> arsh;
  a /= tmp;
  ...
  b = (qq << (31 - qq_nbits));
  tmp = ii >> brsh;
  b = int_sqrt(b / tmp - a * a) - (1 << 10);

Truncating these 30/31-bit numerators and ~20-bit denominators to u16
discards their upper bits (frequently collapsing b = qq << (31 -
qq_nbits) to 0 and corrupting the signed division a /= tmp), producing
bogus 10-bit RX IQ calibration coefficients compared to the 32-bit int
implementation in lpphy_calc_rx_iq_comp().

Change tmp, a, and b to s32 so the fixed-point divisions and square-root
input retain full 32-bit signed precision.

Found by enabling Clang's -Wimplicit-int-conversion-on-negation on an
x86_64 allyesconfig build, with AI coding assistant help to audit the
warning and prepare the fix. Verified with a standalone C fixed-point
test and Clang build; not runtime-tested on Broadcom 802.11n hardware.

Fixes: 34a56f2cae86 ("b43: N-PHY: implement calculating RX IQ comp")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 007940f3996e..7b020e0fcd93 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -4482,7 +4482,7 @@ static void b43_nphy_calc_rx_iq_comp(struct b43_wldev *dev, u8 mask)
 	u32 qq;
 	int iq_nbits, qq_nbits;
 	int arsh, brsh;
-	u16 tmp, a, b;
+	s32 tmp, a, b;
 
 	struct nphy_iq_est est;
 	struct b43_phy_n_iq_comp old;
-- 
2.56.1.708.g77570a6a1d-goog

