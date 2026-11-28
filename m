Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881817;
	b=E8MF4FaxJ7LlnoCMwNrVEtAqT0j3hg8MZSwet2rf7FVGIaMyzxSymb7rReiUTT+pOx4J
	 ykQTrL+Cb++52R7/7MChxwnEQ2E+BdIUaMCn22Hwg1Qah94a9UXHQnuTtD5jmoCe0q/IS
	 tyKN+wzOOjeXGQfQuqZjZ0i7GYDpdASyGRL3iFag7njTIa99jt49PrGLIr8i0PGJHMZTh
	 mnc1jscRiUoE1EIVRio2CJP5GCXo5qTMWEOIIJEa0gKilDRh4BuubA1ENhQA04F4teMkM
	 xrNwIOXcHJFzVJ7y38llBrfp9cPWz4+aUb+WlU0vkdrV5LR7TbEfE1AU1khNxHTcQWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
	b=0TTmkO/wKCrqLhc3sf7DOGrbRM8nDzgxjYaDi9LUTP0ecP9Xa56rqrfQ2RgTT6mpK8pz
	 HrYXlPd3xoqS1/xVuBTGmcu3q8whRJu4scYBnog3yLRHYUsYJgbKQzrGBIrExvddiY8FO
	 yg+BN8CBBkRLHwMu7bAQLKW0Zkc+bDQmdAxH2mrUkBUhAcb56r/Oe6dbipPPdcUtZym6n
	 t8lEOe7aGGTqQlKYkBCLn3u35D6IkqqZz5HdH2AYF877kgP5FvFr0IWkNZ5JUmk8pM8/w
	 /2ITprxUuWDuSaXHmXwz3nu+/xBxvdm5jX5v5dJKJTwqm+lkCKGqtyaFze/LbPASa6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jaTmPPUB;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54434606A697
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54434606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jaTmPPUB
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c51d158acc6so290683866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881816; x=1796486616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=jaTmPPUBUGrStpADo6rAR/YisB0UqLRwonQeqSZXy7t4wtbFCNzWSmaQSsIKTN8+si
         KfKzZRgHOmnpsrGmGxwmN2FpSF2+uOTjdWcEkEyYeac8SO5xwXRCilma3GhY3QZNtcqi
         tH1M+wm5TTK0wuNhrNqe0nJH1yEbMrpViRoP06HXbZfHsQ6vWTExLIjCFxNqfTCCjtbk
         u+mAPddgsuP/ti8jkKpO/OO8d1jLiAEKos9lV/4HFYqbsa/rkuVP3OisJrb6ySGHjkB+
         ktlXW1Lqxw0x5FjozyTuDc7n9e0IaQ0k2X3qPcSfiKICCGQ/MROu4hxpjaZ9O9mlms19
         XG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881816; x=1796486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=2CGa+BYlahEnked5v2J30oElnusgaAwx96fjd1sGl+ZtcuQFMuJn5Fya2HNsxtEzQ8
         p3WB3OodNh6hgWUyg2Bva0+RiUOM1M2imWhUYpC33SeRSLzfkdgr3Qndrj6le4LN7jjN
         C/MuKzuVzYTL57dU9Z6Gqa/VstbHg+EL4EEC+pwVchTRyITBoMYmFYF7+DRf6SPLXKG0
         LBKUy0cf+5CiTkex7oMkYzmXQuzdpAQrh8V/o36vu19x7G1U0qfm7B9sTI1F3XB2ud/c
         xgnrPEhKaVwcMwBMY343Fu0iFPJAtkdvEuEEGnzWRURaBF0tce1PiIRyBr8+lf167/AM
         iBSw==
X-Forwarded-Encrypted: i=1; AL+hErEJeKnzL9GV4MQ0XNa8B7m5nmbZjSXiF7oAY7Ce8puwHf6iAaAWo+fMQwHezmznY4AG+BU/jDbFq6Nuh9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o7MIJoptRNNfworyX6aaZZ4EAenBEODlGqDnWjo2LtSXWPLD/
	Z61mf7ZK0Z4bjgk4pFcT44S4rCfs0jLxEAzbxODKMH183eyOMmOQ78Y4g9J/XKqqpQ==
X-Gm-Gg: AZFdTZdbz6sn2AVfl7Ehe0ToEpeu/Lecq761gjOm2GLpa8jGTgIR0pY3PVLBN496PSD
	rgWOeGRozuuzdEITkF0kJf0rpHiKCY8hQqN343gvcnTxzFZD9KK9oPMBNlG/6XLLTVrxri1uGsX
	lkie+y848HBS06di8/W4aQgc1a/Km6Lii4FsZeBQ+AcNVkvJWWwJeo59U/UhoDZ7rWsyeWVaJW2
	RzHvHTjFnlF/lcgradGIfhGtlH3ZlefyJsHGsbxddr7SCusHWHXhJI0fYlD7/ixSpLSfuDMuMNV
	EigG/GMOoz9/RSL6glb6C21OX6g9A8XljH8ecD1BYZCkUu7YZfTaFJCWDPalAs6JElETTK6/PYG
	FqHDByLNB6TjmlBi8FHfJyrvzOEpM3YOuKPdjTriP16NyORzq3V7ar7zuPZw0SGqtl0Y7mR92Q7
	r6JpQ9hD30uXIFvyhzXuOxWgEeVUB80XZqPmrL3asvTHhjjQ5OupX/ownxqkDJBCn1j/xkQ7d8r
	MsjycvFgU/03P6Dmw9psGWueHNTqZ3wvUm3YVIwLqinc1W36p+FMaQPInvxuk08aHei3ArLsej2
	/EMWuEXPJ2xjuPd4xwsHnMGMw4GBbZbg5mYD4c6TLbQuVBUGUUjS9W05Ubqn4dPIkcTQSWkWXus
	tZSZhrGfXmjVynRgicwevmH3DOnTJU47wmfxkCjdqkHJBhoj7797QAVWjJHVuVRsda8fmLDKNDJ
	PT/GgizIOky5+pAgYhFnP7WcgpWlGwiLKVltHISYV/5vmL7XAL+/lFYNtbfkZ/3bFfIbXQAquSR
	+5r0rk6ugqx/25563Dc8wKAURL45O43SAnJsTuKjurk0z6mYTrgxwAgdVGTrwQXOCqURuf8xHCc
	6t89oMl2YJ3Kcx0XCWnidFymjT3eOfjJbZQ=
X-Received: by 2002:a17:906:27cb:b0:c51:3acc:9f86 with SMTP id a640c23a62f3a-c513acca092mr1932323666b.39.1795881815705;
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
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
Subject: [PATCH wireless-next v2 3/7] wifi: mac80211: clamp the AQL airtime estimate before narrowing it
Date: Sat, 28 Nov 2026 17:03:31 +0100
Message-ID: <20261128160335.1815537-4-julius@bairaktaris.de>
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

ieee80211_info_set_tx_time_est() takes the estimate as u16 and clamps it
to 4095 us, but ieee80211_tx_dequeue() passes a u32. An estimate of
65536 us or more loses its upper bits before the clamp: 65540 us is
charged as 4 us.

Take the estimate as u32.

Found by an LLM review (Claude) of the airtime code.

Fixes: 7a89233ac504 ("mac80211: Use Airtime-based Queue Limits (AQL) on packet dequeue")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 include/net/mac80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..ba16096fea3a 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1425,12 +1425,12 @@ struct ieee80211_tx_info {
 };
 
 static inline u16
-ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u16 tx_time_est)
+ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u32 tx_time_est)
 {
 	/* We only have 10 bits in tx_time_est, so store airtime
 	 * in increments of 4us and clamp the maximum to 2**12-1
 	 */
-	info->tx_time_est = min_t(u16, tx_time_est, 4095) >> 2;
+	info->tx_time_est = min_t(u32, tx_time_est, 4095) >> 2;
 	return info->tx_time_est << 2;
 }
 
-- 
2.53.0

