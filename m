Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359900;
	b=S6sEXW+1Eope5X8rsPGs2Yp5BEVpbshjqoakArTiLlBfkYwxr1y6gJSuR+oK/kDU7Eg6
	 QaK+BjO7AeL0i0V/obTUrm+M2IuKU6J5tkX8NozhrpmZFAuqKxREwhHAfE+UgsuN4xMSg
	 doMLU46Pze+uD2c1v0JJQMy8w8bH6cEHDPVuTuy0KVugAf4ll8P5E262/uiuLKzMtCTVH
	 Z0f6vDSy+Gjt7u5W5SXkwvgBpzCfCVTEy9Y8ArgrCHAZzupsNFtlPeqM9LTxGETOiFD4q
	 Myw1fRZD4ojxpGK0lkM6KV58Vy8e1N6wBUAQUZMpAQ2MNYX4y/oJf6FzjjYC6TrLvrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S3Kjv5gUA0i4xmmCT97hVtDcjtPqG6v26jtqrbXu5/I=;
	b=TR6uxgkscVnTDKfxHwYYt7BqfSuxZ2+n3JW4r5RfZxs8g6DhWaGn+InFQoIZ9T/L3oVV
	 T0sXFggNAgfLQHdQrnTl7gWEi75lTgENY61kAz/FRp8yeniSQiHAHUqDqrbC1lCIcZRSj
	 FbsJDLcnlKwEmJ5l3JUxv2QT7vyVVjNkhRcwZKZbYYssul06P4L56m/ptbIPfJKa9yfEv
	 f1/4EHzfbKI19n29ShK8hpMG0UcE+nmmK1XAeHjLwn8SGRYFKanPHckHe3Ltl52kMRTWv
	 Igc/mNxRobNapz5ho88UoGz2SDsNehQ4rhz/XGwvANrU6rGhtq9JZ0LA2daMyy3qZ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T5UqsM84;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE8A606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE8A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T5UqsM84
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c516a574bffso68291566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795359899; x=1795964699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3Kjv5gUA0i4xmmCT97hVtDcjtPqG6v26jtqrbXu5/I=;
        b=T5UqsM84sSbRtSgRqFzyGzslMGJxlWZo22b5JQyOfTWfbVRS4WD3j5myqtOvT5B2+2
         L+00Q6dnNWUk3LhZkBb3iM0/lmdDy4W1BQJMs3LTOx/0Whk+9XX1ar58kYQeJYOFmhHH
         IEhrUNO0+S+iWmshRIb29UAVl1tEx9otQvuzl9GO3rkknm/7vWaTsJ3NmyqdUs6swZts
         FrAjm4ziYqigWHx0XUl9v780VT1eIjdiQpeT+aUGMAKsOHAYcNbEPC7vkMNLAwALsuLw
         +soGEbpvh4XGUA/Q7s6NK0aBmkjeVuCfd+n3n1HsgKU4QL/ZjBnLXLltPKEJVKpKWXB3
         KS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359899; x=1795964699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3Kjv5gUA0i4xmmCT97hVtDcjtPqG6v26jtqrbXu5/I=;
        b=aZk+t5rbPPzwDRY9I44WFq0uMPojneJZFgOHKbUNEkK9QWcA9wdct+VIYpKsx8dGoT
         5t70MtdGo10rccEa9o6tFG0nIDVFxejZuwtyfWFze7632sBizBYNvu50ZMwOE4Vv8nBN
         kSkgLrIVbm5qmqqmq12lzNJSfnlAsDTnR0BShBK4i1aYlZ4cCJtVqaTfMnykY2pH1cpS
         /vfjGPBO5sdLCkMdVPWlYEnp7vRNpzpdrnPd6SgKjGATtWJJUwJhY6dLDMYB/MrkuvjP
         FiuBvxLFt+gRo7wi30uSzubct3tOLKyywRnhKHp/NuF9daoRpVAFvI6E+rv1e/kzGjOB
         etIQ==
X-Forwarded-Encrypted: i=1; AL+hErF1aWYxb4S5u8mkY2P24/OmkZ4Sm/QuhmO/eUJcxh/OVqNRNb2bOjN8c+PQslLCCtZeBAngLIuik4h1Xtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+KUMgp7sw0yLJRmyXNFt7UiSRZrsV1J0B7IZsviUaP0EsTOjQ
	/GR69KW4ziDZ5SmNFsX8/s7ET+BxUvnKVR1xYZjUyir830VzxKAvYie9TAk2Jimv7g==
X-Gm-Gg: AZFdTZfh+LF2GOyQWgR+F0Cj8zuKZGAWDj/686+dIKocrSFb+08qIL19FuzzOpmodq3
	WWxQzqPAwb45i7XobgSSEmNIwE8jbG7U5e4vGnH6jLALwPPhNf/7Ok+HTrYerN3iWJ39BTs/1k6
	0sAnLZYa8vZhNoA99dsCEo8BLezDZb12KPo2vCJQzv+eMhKpAiUaNh9zkPKOFwkNcyVi5l9Ur5+
	84arkTdYLj5JSQtuWc5MimMUlLF8bDcIqmr60HE/S1hTloQ1jY/6wwDSxT7xu9kbZ16/Z6rD9WN
	KyPMT4PbUjJLYhnuW2TXtEWP76b1imh2gE0efUUV6PQvxudGyAUNVmvVd01NvSXCK45Yg9Fceun
	gRxWya8OFrO54ipc1+CYmMDk5nX6VxbdbOHrV9XPHnuUxZmB9r3EI+DHR2H0/GwoZhNzrIzQzB0
	wzkTOCZ9TqPOlLwERYU/T46ZngaoRw+F9ojoqyS9kP9bYpff6wjtQjE06nNioRQgDfPbnTJinon
	s67/jW0R/44R84tFzP8RNtemveq/x0mzjZVeu23srW/8J34/T5YF/EMxX+IzcjPXnQmmHpEtbrk
	W7KFWM5slXS+Z9+RMA7mVK8qNzj9vF4mrL6cn29DqhvsJhUtbUFJZdRj7AV7pfWMdwy2ZRyIeJM
	X3QelxAhc47rwcRTKMNK363/10uEOVay64yW3DgJXlsvRI+uWhRWiCoRFqSW1JcHBhurk6Faa6S
	LOQtqfDbVrvYYErR035dWiRQR6gWiYEFOAYJdb7SXV9ddrEWjol4d5M5Cm1nyk0R32u1sxt/4v9
	BsSeUq8zXxn8J3GVejJ7H/qRoF28p/bbs1gTDznEcRMdiRZ9eR/XLIhEVmLORh9XYra7MLBkZGI
	fAbhvnBJdKpSp3JvNMf3lReLf1sZ2A1PeOkQdI7PSdKbx2IAyuZEJFPyu48MCifSwzKcVXzz
X-Received: by 2002:a17:906:2b11:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c513aadbe9emr569793366b.23.1795359898440;
        Sun, 22 Nov 2026 07:04:58 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247132f00a1bce02c0b4f040c.dip0.t-ipconnect.de. [2003:f2:4713:2f00:a1bc:e02c:b4f:40c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm320086466b.78.2026.11.22.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:04:57 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christopher Griffin <christophergriffin05@gmail.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH wireless-next] wifi: mac80211: keep the 16 MB TXQ memory limit for HE radios
Date: Sun, 22 Nov 2026 16:04:59 +0100
Message-ID: <20261122150459.3108416-1-julius@bairaktaris.de>
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

ieee80211_txq_setup_flows() lowers the memory limit of the TXQs from
16 MB to 4 MB unless a band of the radio supports VHT, on the grounds
that 4 MB is 64 aggregates of the largest 802.11n size. The 6 GHz band
has no VHT, so a radio that only has that band gets the 4 MB of an
802.11n radio, and frames queued beyond it are dropped as
fq_overmemory. Christopher Griffin saw those drops on the 6 GHz radio
of a QCN9074 with ath11k airtime queue limits applied, where the radio
ran at 1154 Mbit/s against 1609 and 1622 Mbit/s without them.

Count a band with HE like one with VHT. EHT implies HE, so it is
covered too.

Fixes: 3ff23cd5654b ("mac80211: Set lower memory limit for non-VHT devices")
Reported-by: Christopher Griffin <christophergriffin05@gmail.com>
Closes: https://lore.kernel.org/all/CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com/
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.
I have reviewed the commit message myself and edited it where needed.

 net/mac80211/tx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..eb8a8441e9b7 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1656,10 +1656,12 @@ int ieee80211_txq_setup_flows(struct ieee80211_local *local)
 		return ret;
 
 	/*
-	 * If the hardware doesn't support VHT, it is safe to limit the maximum
-	 * queue size. 4 Mbytes is 64 max-size aggregates in 802.11n.
+	 * If the hardware supports neither VHT nor HE, it is safe to limit the
+	 * maximum queue size. 4 Mbytes is 64 max-size aggregates in 802.11n.
+	 * A band without VHT can still have HE, as the 6 GHz band always does.
 	 */
 	for (band = 0; band < NUM_NL80211_BANDS; band++) {
+		const struct ieee80211_sband_iftype_data *iftd;
 		struct ieee80211_supported_band *sband;
 
 		sband = local->hw.wiphy->bands[band];
@@ -1667,6 +1669,8 @@ int ieee80211_txq_setup_flows(struct ieee80211_local *local)
 			continue;
 
 		supp_vht = supp_vht || sband->vht_cap.vht_supported;
+		for_each_sband_iftype_data(sband, i, iftd)
+			supp_vht = supp_vht || iftd->he_cap.has_he;
 	}
 
 	if (!supp_vht)

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

