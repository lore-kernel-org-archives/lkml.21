Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644996;
	b=3rYhCEf2qzlRiFCq18AbNe0P5XSPmF8aM+jNRZ5N/62SwbZJ+L4B0xp641J/U8KaceVY
	 9F9TmRaORdarkDVSMKD7FZF+kX3bJ0Go9yUqwE+eXzxqn7aMiEC1DcVIJh/UDqY05S2M3
	 mD346oUv83p3vCbnUWT//SVr9La3H1Cwl2lhCDq7P4XlkNbBQeNN6OVuYB6bGiftfRjTb
	 FCvg5uvUaJpyWMzdg8Y7b1SSi/1b92r6mUIAXiCocoep3dSAS5pBIxkFoKDDsNL7uLq5P
	 jQA/IUWSi3ZDXxFbIH1tBwofm7YZKqQcq1XHp7MN7UFwgy+G03rwciH/4G3L+eK8S4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
	b=l3UTv7V/dFuhx6HL5HVLvAmqCifYetFxjPyVyNlq6He0T0kYwWjxTRkIjVr/5DRvIVbD
	 Ntm2wdAZ8SgsI2wSIcIUhUqIewu5YOHpclXIAFLM7oSfA1ZjR6hpn4XXiqtND9yn2TBRZ
	 IHl/19ouUnIdbU8Iw28FMOMefSa5GsnFdDtt/61ZNOh4thdF9jIHB6H6ASrftMbcRkXST
	 QRVpjFM7ms/pwUSDnqe4V+VSyU0TRwPGbVWCAEfPHvhOEaYEiHprxmxWX+WcxmJlRAFfw
	 WWt0vyNm/VGCIWNrklHFoxB2vQcOx64Mg57CnJrKUV+IDOMeXyGu7fJRS4sY+vwzryQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Teo9NpwM;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C0606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Teo9NpwM
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so6800699c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644995; x=1796249795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
        b=Teo9NpwMC8++rq2N5VzSXEBY28G3IyCvEyTmeGoWzfeKOD38o/o53G3uCPTR54GSyy
         dinPYPYlmuh0l9ATRyWKbafkOXI7YwfDzWn07wLcEE/OkhI5oVPSATtPWGssnCkrTInA
         KGYYdVRONNUG4RCPdqaQz9cl18CIjw5fUIIuz4hMWsmxolBtobnk/TVBLgt6FvegUuFa
         bMBxO2rOlx0McaiitvROzCh1kPyYhSOuwP/YueXJxwFGeW+txPvEjpfM6Ocf8MIqDN4F
         /1aO9DBgh+THvP4Tj0+ISB+nOXDb8THATTrfiuqNVqy5t86CEOxOMyKYcpC9OYROisdY
         C+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644995; x=1796249795;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
        b=imUnligoh9jxP59N+rYPXFPMidFxDpfHGLrMyXdegevD8Y9uH6Cg605PPLJq1ZSLOW
         Ige92buEchfHwuifyt8XR3Yt0FrhErHashXtAK1HZpvIvcA4HiZHi58jWCTv6dVqvPiD
         ydKfyT4M0KAUQIdnCDipH8/XCmaEq2obRua5mXAsqQYCLqMvLkpfOm51MDlWi2Dh/Oct
         4S2hUQ+349Q4XbL3cdOhwIzAaDhFPFmOAFlk1Y/rgEob5Isxm12SZ/A59Y6IGshH7bIg
         Ov3xcL79MV4XqbQx26OglsMhZ6Jg9sv3U9hNHNzmTGZLfOJDtylwzGqFSCCAPGwEerYD
         tjyw==
X-Forwarded-Encrypted: i=1; AL+hErGH1l88raDX6wMkbpLYBQaJfhvr1ucNDn7AYF7tXOdSwBUvgCHjJbkerC3eLEO3sGIlu1xMXOERHoZjCgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HdSdTP0keiaVyFLqNUTBE2ukPLcTqabAoZIsJmUll+Jz6AYIN
	A9mCt0QC4QJjVNLxXGc44rCHPqK+v5kHiyiCKr4IOTmZwUczUzSuhY3vqN4+EMtqmcUnCuxAVqr
	K0A==
X-Received: from dlbrl2.prod.google.com ([2002:a05:7022:f502:b0:19a:1425:bb9c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3f07:b0:138:30b1:4c00
 with SMTP id a92af1059eb24-1b5567b5685mr21927000c88.3.1795644994359; Wed, 25
 Nov 2026 14:16:34 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:27 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221627.1419412-1-elkin@google.com>
Subject: [PATCH net] phonet: fix use-after-free in can_respond()
From: Elkin Cruz <elkin@google.com>
To: Remi Denis-Courmont <courmisch@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, 
	"=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?=" <remi@remlab.net>, linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In can_respond(), ph is cached before pskb_may_pull(skb, 5). When
ph->pn_res == PN_PREFIX and pskb_may_pull() reallocates skb->head,
the check `if (ph->pn_res == PN_COMMGR)` dereferences the dangling ph
pointer before the code re-acquires ph = pn_hdr(skb).

Check for PN_COMMGR before calling pskb_may_pull() to avoid accessing
the potentially invalidated header pointer.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: c3a90c788b74 ("Phonet: do not reply to indication reset packets")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 net/phonet/af_phonet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/phonet/af_phonet.c b/net/phonet/af_phonet.c
index d89225d6bfd3..e70ade97bf17 100644
--- a/net/phonet/af_phonet.c
+++ b/net/phonet/af_phonet.c
@@ -294,10 +294,10 @@ static inline int can_respond(struct sk_buff *skb)
 		return 0;
 
 	ph = pn_hdr(skb);
-	if (ph->pn_res == PN_PREFIX && !pskb_may_pull(skb, 5))
-		return 0;
 	if (ph->pn_res == PN_COMMGR) /* indications */
 		return 0;
+	if (ph->pn_res == PN_PREFIX && !pskb_may_pull(skb, 5))
+		return 0;
 
 	ph = pn_hdr(skb); /* re-acquires the pointer */
 	pm = pn_msg(skb);
-- 
2.56.1.839.g22a8290db9-goog

