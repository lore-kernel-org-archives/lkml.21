Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881816;
	b=FOqSXpthKHx/p9Oljcm+rWtOq01KMHnPPMUWqGkBE49FxfF2Y7zj0yyzANKTN+lpE5Y0
	 LzcGmxJGloIdXnZe+8oIr9O2H40dPu4bHKvkZq5bo2yYIIe7KN83nODhHEOopM9aw1SXc
	 IjhnGUQBrXr3abW3hic0kYN0tkn2qkg1hbfVBLsYzTPWt78R2cUX/a1C+aengmUQWz+IL
	 LvhWwM96zgrcZCcZHE0zKWyYkc2CJiG0BO+7lZC7OhnvGx61SpbKQxevtZKp/1qr9HzhZ
	 Tn9gbPVabfHXu/C6gBH+m1JOu+z1GKyXqWFaCrkjClMBb3RSmuoS68CXO/2ZmNs3slw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
	b=PukMVvsgVgAISEJwHT5vtf9rAI59xj6skdnOSCji+pLpIPbgr1PBZx5DWt6evF6ARH/y
	 AYAsFODUadOPGQgThZDk4i+pkjATnHvTd5CreBHH2FF0Oy4gYsKnlPF2TmkPBBNJEwJvz
	 N7eetOxW/MArKA1QLXHi6FF+diPzk07iwRGY/nSqOKSgdHg0IKELFMIa5tQjnOVa+z+pY
	 heDTg4RvEHBJTF62Ao8YEitAjGQWh3QBsQFdGmGbtUWdf1CYiTrs1FtIZcn4kTwbOakug
	 vwQxssO0FF0K5siNfFFhf14GD5Z1/35H0UlYfC7Q1x7dBFRM/ZnkIOLFsavUb3siSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oyEAUsMC;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581A606A325
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4581A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oyEAUsMC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4322d310e7so533636966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881813; x=1796486613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=oyEAUsMCC+7PlKIgQYpANYuQgqCqoj9CLvT2afDidmOWgz1kt/+bGDqEPqQM2LutNG
         PLM/r0cU7O0zJh4AtuYUV1QGyTj0ymVmy3m5JeQqhN2+QrA+aablZSVU80aICTIR1Ax/
         BK8jqCxfwxRUA1ys2eStluL4x1Fz9p52UoTu3I8+lwqbataqTXKvkyIQ53Z9XwUML5ig
         iokfUkW4D0gRkidMzt4ZBTMaQ4hNaJbIlQmn07m+jtBw3kTiMrCNTK+m1udsCaOfM7IN
         y2e9LeupMrYpgVCAkTWal99/TVdcl4zgGs4Y0Yy4mHuBmKtAaMuMydfniuHWS7IQgn++
         +6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881813; x=1796486613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=YQ/08imUPi8xWyfazsyH3tMp8wQZuo7cwIEroauwOZMzYQd1qiATxBLGbQHu4FGw90
         YczzDbi8+OX0V7lHH4N9iL8sqo1181mjcz5NYYgTS8eWXH7bTZbAwnUcDS5ISifDtoE1
         31yh9i36ygkM9fj8DMVABwh5buvNYVVqr1WBhY7tXgOPF9xOr5gTYEwlq5skz5On+7/A
         5QKKr3xSnBbAmja2HAa+Dv6nBsoXYSpvkY/jbOGBmfcXuYR1AqpS2967+E3dpt+BzRgG
         JvFQB3iEgY8ocQRKudNiRKaiddAMX5/fBwZSLZYqZ3fj1kWA6Qx9gz1RGROTpSQQOWXp
         tOhw==
X-Forwarded-Encrypted: i=1; AL+hErEXgY99cdwCeZ/fe30zF4V/UyqyIYN8tRM3qab1+OeWoFYPtsmtBqch/Ztau7xeomp8tx7kNNVq4g9YQjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UqkokG6/iycc+96UxmlEJLY0fdj16fSFBKAe/S3ZfHImCiI7y
	qMP5MnqCFtZX+SAuWu/ARNqlephYKcOjAkYTUFli/siZJvcqS7yL6nT/KCU2WUWnDg==
X-Gm-Gg: AZFdTZeTHlTHU/PC2vTh/kGqzID1XqakpoueCzd7UDBkpcWdDlNwZJnxofEUhLtLDnq
	y8I1hDb7DmRhg6S8QiyIxCuA0BMpwsUJ9Ez2tLfMvhQg8gxCXiV7/ItA1SrCvfbHzAMxg8BceTp
	nzy9TjYAy22xihIvP2xnjv01XW46uucfKWjCnzywHxOGOPfJmHrE642T/Tpn/bLXRf5J8EWlBED
	JyEuzs6M8ECDcCCA7gR521n/AXtXjq7eaRn8MvL0Xblbw10WrxKASpvf/eHiVK3w7fyzneriaBW
	ckn9edxuv4rC6bb+ETeh+5ww1DQdvbMz2a5ZfmGjZcEZtBBaiyKGqpwf6g6mdV95WtyMhq4RO91
	h9qpOflTZnbXco//IISnJPnkVex+2w1JVAmhV1K7eoLa1pyLwjrml3BtbvuG5uy2hMNK8ehlbk8
	EpDessHgSNEH4JcTsUHTlZrmB1+B55IRKoO4+1X4Hao4xcKcypj34zVW7UG7pFeNAUmhNF4UhVp
	RZwiPNK1yhx9zVRJSaCynl1OsDl5k6G4Hh4CtQejjCAW9cHPJR+dMDcwy8SREVBJgAgqCOXIASz
	2nNhf5dgMKiNTqWZ1YLcptVL8PSys4XK20za2gyaXjcsrEm4njVI1N3o0Ef/HO4oeyEJwrcsXck
	vMRE20SFPQLASwh1v4x8FO/4bNPUeAfJXFuQiIeY4Mi7NAD7L+vjHteNBi0K9DcpXHtHBqde3Cx
	jru7ZMs0cg3r4iVpmmA5/b0LvnQs4ea1kLiwiqA3sgB9beBaLs0S+5EsbojYzSxPjAQearNTqk9
	fbal+R4vzW4GgV34cM0J3b/v00DMfjUuJQUms9SqvfLnFfBfkl2K+SyGA/p0XK6xk5OCYW0M8P8
	UZ49HfAlY/2vdvY=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr2433115666b.4.1795881813536;
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 1/7] wifi: mac80211: compute the airtime estimate in 64 bits
Date: Sat, 28 Nov 2026 17:03:29 +0100
Message-ID: <20261128160335.1815537-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

ieee80211_calc_rx_airtime() and ieee80211_rate_expected_tx_airtime()
multiply the duration of an AVG_PKT_SIZE frame, in 1/1024 us, by the
frame length in a u32. The product is the airtime in us times 2^20, so
it wraps once the airtime reaches 4096 us. At HT MCS0 a 4096 byte
A-MPDU comes out as 945 us instead of 5041 us.

mt76x0, mt76x2 and mt7603 compute RX airtime in software and pass the
length of a whole A-MPDU to ieee80211_calc_rx_airtime(), so a station
that sends at a low rate is charged a fraction of its airtime.

Do the multiplication in 64 bits. Where it did not wrap, the result is
the same.

Found by the hosted Sashiko review of v1.

Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
Fixes: f01cfbaf9b29 ("mac80211: improve AQL aggregation estimation for low data rates")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New. The GSO estimate of v1 1/4 wrapped here.

 net/mac80211/airtime.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index ee5dc524347c..55bc451d4a9d 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -616,9 +616,7 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 	if (!duration)
 		return 0;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
-	duration /= 1024;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE * 1024);
 
 	return duration + overhead;
 }
@@ -813,8 +811,7 @@ u32 ieee80211_rate_expected_tx_airtime(struct ieee80211_hw *hw,
 	else
 		agg_shift = 6;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE);
 	duration += (overhead * 1024 >> agg_shift);
 
 	return duration;
-- 
2.53.0

