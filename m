Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874918;
	b=da2oAoAifXAvtfax1CTJu1NnUTIp/v7GsZoo6Wor1g30hn3u3hndum0LbcWYqUZ32LPk
	 gNecbIThn2OVEgMhYXDBghTEO4x82/x1TJXSH9mI5/hmoBgakd/Uu1eNLp0uNZkEZgMSl
	 /OWAbLwxepUqOUVfn9wvcKa5KOHFuTeYMM9/Ib3W/AMKKTA2jHqARrXGH6hKr4DM6p5bd
	 Tt/X7ISYHyihBFDgTRh9VZw5yYq1EG6nAn7fpbtD2cewCyivDnULZeFyCOh5FQoCXg/ZM
	 4Hy3bN+gR2fQcWhWlSrflKcymt1KFX0EOl5KI3QFkJOa27O+RaipUXV5fBkey8lqkjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y9d0KlkYkMPn1OGlex1T3FTiLNTnvIiCGzz3NKFSL5Q=;
	b=Hkl6yS3bczEEPNew/bYPN+SfTMpRd6I8EWlRAQCpBpW8z4KpcKBHiFY9P9SPFIofQH/q
	 rVz86P9PU0/LGQIi5TgCiN4pz0nBLFX2BZjDoLgLdg9Z1ZtjjrQns+Bt10TGqNBtOGxIj
	 GhTY/eZi9aUme1Q94uWb7p9q9Al3SdzGMMYCtZbV39gY/ZYuirG+S6TehuyBEhYmx7awR
	 jjgW2ARNZRjQHwYbucTTCQNlZPXKrGCr0UgOpaL5Iu8XsSkwEYOOEZUNWn1UxYzGi5BTc
	 kIC68gFO+v+eajxTDp5Z33wy/N7wn8oL8tgEeFL0P4ntsdH6cRXrHRy7ptMbEYvS62A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=none smtp.mailfrom=stellman-greene.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R2epY8c7;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R2epY8c7
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso80993427b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795874917; x=1796479717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9d0KlkYkMPn1OGlex1T3FTiLNTnvIiCGzz3NKFSL5Q=;
        b=R2epY8c7zatZG/RtMQ7ExJRvH9+vyyA2Z0aczkdjCHPzOeymu4tbOi+XPZOUhBAsbf
         c1w3Pi29cXSWGFk0WlBMVw2OAyrtsGfIwQ2CjHCyRekc827nzxluaeXObjSBaYdP4Jx8
         JhR3ixGFYw/8HUR/wVrYM/IjEgDHQrXSyvbsT+QCGgPoHJ8phpY5uGPxDvv8wzW5CUeA
         WEUSqfXv/1MteZTIKHC68tPLkeOcBR/60PA/OwFusgXNIEwQj+ZvGHx6Sob0o4b9EDIH
         8V7yYnVL125LpR0aSzazpGOp3gO/9FRTmdc9V8w3sNPwLq7V319kUsKhTcLfNvMs0ZTQ
         DNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874917; x=1796479717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9d0KlkYkMPn1OGlex1T3FTiLNTnvIiCGzz3NKFSL5Q=;
        b=FpC73Yt0JAZeISq/YXpbtVPOTpa7BvtgLbCWRna7FqBQeaF3L7NHtU441P5E6cmt6n
         DvmKJMz8BZqnPt+ubuquiqDT8nZuTall2xHctbEMXpVhul/tn23hxbkG3K6MOVRBi5Rd
         rNweVpJN65Ub1Zm8buIuw26yVn9BhP8IfV9MHM+4hiyLTaP5KRTwTpQMPv7Qh/sP6k7M
         cnkw0GgY2YfFzbNQ0xHu8DzlDzWKtAdjW5VBz5dR10UH+MB+xEY1chMBUsZt8yaTAOX/
         +JYzucH+vsHUnjOq2MJUScoAGSyoHsqw4p2hxwLfYxJs3GNBL2JvxdHncZrb4Dj9YDYk
         f+lQ==
X-Forwarded-Encrypted: i=1; AL+hErF+QIZIi8vuy/emkicXV3Eru6fvp6A9gatKv7JFa7Sffz6uNmkm8owsCpDmjomdkQ7GzOE7ErY7jhCwaVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93DkI0uCIiqOolI1tmyRCI8ESduig9mCEuU8+fTV/FF7qik0gw
	3m34ghn6yAsaacg7xlvMWJlnrzsCfdMPNfie9+FImyRL5vXcgtJ4IdN1AbEvkSUlqDs=
X-Gm-Gg: AZFdTZe1lsFp7lALP4/SSGgJigBC3VHLoi4dSNOy0WJ4+TW9vZ8OPZPwCqISRUdCDon
	kapPGQKFpkZ1l+ByTwv7HtPQby7lbo2lMBh8My0NkN1wnThgnsEMWDx7cNc2P8USTdqqK4Z6GhY
	imtmqUJP+ghjEiy3ilQkQ9upKfRoEzUV3e6MyzRepJZp9Js7dcGW98zJFeWUdGABcKWHXCTHjN+
	42rV2v3GJ1N5n5b9jK1At6LhgNib8svla5eW+Tiukr/Ym3bqJ5HznYlbVQozl0fkKnC+QUCgCRw
	x5PlVYqpuPc3qP+LoHNYsmQKAL83Ylso1Sv6ycxAyfyUeovylFtgEW9fw4Xu8UBr3rqs+bPYwr0
	JC/4jTmbU/ssfFkS2nj2BPlTvibAW65VyTNWpKr6G8sN+AKLv9avF+ggOMlzOX8sjPJK53x52gW
	uJVuQBPUTzJEsGbPdl0wwBaAmCJ6lDD+tZJUdSaMLp05oq0sycxCt7jWBpiNvmXktCOCZrsYk67
	KPTe3HoZCooPFTqfSUnt6pk35Qd6bGH6oYZpYqWT9dFM4ODUx5L9CY+UJShGLHgxQFkxM5ZK32N
	P3VUeC+hmIjX/j3uEzEAaJlYIoIDDk5u90Gn2rm4uv0eiKI9Vp+ur4UY6yxm1SEcG/lxbYWV92d
	cgfP+lIddhIykUZnNsU+tAuY=
X-Received: by 2002:a05:690c:e3d2:b0:873:5c0f:27c with SMTP id 00721157ae682-8b5204ad248mr121148297b3.38.1795874916722;
        Sat, 28 Nov 2026 06:08:36 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4e3:fb15:aef5:60c7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm2050564885a.38.2026.11.28.06.08.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:08:36 -0800 (PST)
From: Andrew Stellman <bugs@stellman-greene.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tipc: reject bundles too short for an inner header
Date: Sat, 28 Nov 2026 09:08:30 -0500
Message-ID: <20261128140830.58925-1-bugs@stellman-greene.com>
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

From: Andrew Stellman <astellman@stellman-greene.com>

tipc_msg_extract() checks *pos against msg_data_sz(hdr) - MIN_H_SIZE.
msg_data_sz() is unsigned, so for a header-only MSG_BUNDLER, which
tipc_msg_validate() accepts, the subtraction wraps and the check
passes. The following msg_size(ihdr) then reads four bytes past the
end of the bundle. Check that the data can hold an inner header
before subtracting.

Tested on mainline (7cd8495c0f16) in arm64 QEMU with KASAN. A test-only
debugfs hook, not part of this patch, built a header-only bundle in the
kernel, passed it to tipc_msg_validate() and tipc_msg_extract(), and
poisoned 8 bytes of tailroom after it as a redzone so KASAN would flag
the read. No live TIPC link was used, and the bundle didn't come from a
peer. Without this patch KASAN reported a 4 byte read in
tipc_msg_extract() in both of two runs; with it, none in one run. A
bundle holding one valid 24 byte message was extracted the same way in
all three runs. No selftests were run.

Fixes: ef9be755697f ("tipc: eliminate buffer cloning in function tipc_msg_extract()")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix was drafted with OpenAI GPT-6 (Codex) and this changelog with
Claude Opus 5.5, and both were reviewed by me.

A reproducer is available on request.

 net/tipc/msg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tipc/msg.c b/net/tipc/msg.c
index 39dfd33c8eecc8..657c0709a0f7a1 100644
--- a/net/tipc/msg.c
+++ b/net/tipc/msg.c
@@ -600,7 +600,8 @@ bool tipc_msg_extract(struct sk_buff *skb, struct sk_buff **iskb, int *pos)
 		goto none;
 
 	hdr = buf_msg(skb);
-	if (unlikely(*pos > (msg_data_sz(hdr) - MIN_H_SIZE)))
+	if (unlikely(msg_data_sz(hdr) < MIN_H_SIZE ||
+		     *pos > (msg_data_sz(hdr) - MIN_H_SIZE)))
 		goto none;
 
 	ihdr = (struct tipc_msg *)(msg_data(hdr) + *pos);
