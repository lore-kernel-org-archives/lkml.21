Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107989;
	b=kDDtVB+JDKKbowub+pSnt+YMCk/w7BMzWblmTOK5r467LC1x08b52wgIvO1OgoqyIKct
	 H23TTMrCKu9AxfJybR4Z+mmzjEscVpZp7I7y/cbYHX9QZ8mmkkTRbSXbqoDuVXq5oqXJb
	 DqZPF/2qbD3m7zVRYXXOrhCXZnolx10eC2r8A41lDrE0iGGP0jrR8OZJ/U8QGWb6vc0lu
	 WXGwp3h+FvsnUNJkEFk1DrO3WS9aRomXtZKdshvCMDbZmUSFvsLKhdcNLomzhfLD+4FR3
	 84Y+d2uSbs2wDX5eIb5ERLGmlKKO3oYVKFq1F8Q+KeRJH+W9kD01TvF0EkIaNaDG4Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
	b=T01cZ1vVmD0iL5qeFqvrv197SqRFi6wrBnuIFi1M/sQRFN/BNZ+TqvKvijbo4H8rmTga
	 5MLzNx/NyZ5bjQ5rrQNgGzJ3qWFwLy29IohmNEMcoC7aZyonMl02z69nkHlby+spXJvZv
	 ubOErAx8rBJOvWsiXdjlNW9DiYie4KbSK/GjyQB3lMRJwrUZbAAzN/U+PvrFc8O9Y/Ttq
	 yeDgekCptylNK/2bAsNGJWSBSuaL3M1/O9BIhf64506fn+xpTpTSf4IzlrB6der+rFw7Y
	 JGdQBCYeN+ApRHW281+7LJnrGpnj4F2SjYU/+JG6nL8FE2AoQE1Mg8Nzo82e70gtZbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZWPE8zhV;
	arc=none smtp.remote-ip=209.85.161.71
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6888606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6888606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZWPE8zhV
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-716f23c53d6so3103125eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107988; x=1795712788; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
        b=ZWPE8zhVuI2oOxKdlGh9hwyWpz9uobD/aMVeTe6vNt2ot3ExIEIWAJN7fADNEQW9Im
         Nuk3iZ4JsnzWnb+eB/qsWu/8MPPYEB9nEJVWnNs1UtKSZ9zYu4vpz8dCePHjf7WuHeeP
         08+0pM/H3gpZgOWbz5HfS4vxhD8Mo+F6ZXBLjcm3Twp0gA3oX2gm7NGiaDQL7EKaAOcG
         o1FKmFHLGkwlW5xHly/IgrqgGqdHzfUBBlfiO+VG4ZWUhXTKReBN6PYGmZZltxGrFggB
         ndttMwZ4kxkuiRTe4b7RfkggA5saBq/yPW5mckhapECxb9tKA9PpnFTopUzhHnJ3+Y5s
         jsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107988; x=1795712788;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
        b=fXlJxbQf52FKpATZoJW6tUo9DgCb2DqH3dXXfmZAbKySu1PRtmUKYuAJ6baltWv4g5
         eUzsrFMThHn7EkkPsQ/a7tOhYKUNFZd+TAsq9u58aKYrdgaf6JQ//V3X4p9dqidL+QNx
         Ypk35iEzwRinq0qdrOxFNjiQLb0aUX4CrBtYOKhiqKS20KjiiNBUNGVQHoPfOJ2+aFwY
         cfg+Vk6Znk807v9/yhogZEwlE+v2N6/3ORqm+hmDKqcw6l/1FbbzbfdRMGQKFK2397eF
         xc5sudoycSIzNCxo9+nnZb4aBMD49yeTndx/ukbyIaI2QQHCBZrwqOR/iD/Cd4vJmWc/
         qwvg==
X-Forwarded-Encrypted: i=1; AL+hErEkmu4XQ1M/T6iyhy8fm6Ha4hBlM3XUzzRngGevHSctKGe77D/U9//XI3tnJkh2Y7FNInT856QXjl2saj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p1lFD8kqqSQpOPTLUAvCvlPEwy3y1S5Wa6y8NxjTK/LQCyCmU
	OWa9aalVdpit2Ga047VeGuhAOY/m12EPvegBaiBNL+CE8qV6QsfMz5tE56p7Myl7xEaAW6Bd0zN
	JukE+0zlnIg==
X-Received: from oacia7.prod.google.com ([2002:a05:6871:e307:b0:49d:e3f5:f8fa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:3388:10b0:71a:eb23:a7d1
 with SMTP id 006d021491bc7-71b394fc7c6mr128920eaf.53.1795107987578; Thu, 19
 Nov 2026 09:06:27 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:23 -0800
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
Message-ID: <20261119170623.1519909-1-irogers@google.com>
Subject: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: Ian Rogers <irogers@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

niu_txc_set_imask() acquires the parent lock, reads TXC_INT_MASK into
'val', updates the port's interrupt mask bits in 'val', and unlocks
without writing 'val' back to TXC_INT_MASK, making the function a hardware
no-op and leaving per-port TXC error interrupts masked.

Write 'val' back with nw64(TXC_INT_MASK, val) before unlocking, matching
niu_txc_enable_port() immediately above it.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wunused-but-set-variable enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wunused-but-set-variable; not tested on Sun Neptune 10GbE hardware.

Fixes: a3138df9f20e ("[NIU]: Add Sun Neptune ethernet driver.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/sun/niu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..b2da560edd82 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -4650,6 +4650,7 @@ static void niu_txc_set_imask(struct niu *np, u64 imask)
 	val = nr64(TXC_INT_MASK);
 	val &= ~TXC_INT_MASK_VAL(np->port);
 	val |= (imask << TXC_INT_MASK_VAL_SHIFT(np->port));
+	nw64(TXC_INT_MASK, val);
 	niu_unlock_parent(np, flags);
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

