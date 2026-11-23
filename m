Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408383;
	b=Vqwgqaya2FEg0gNrhSTrOG3Ypqw3xw4pjuLXxb8b8dv0Su+utddGtYIXcbiYR19yTp6I
	 VoWemjYGGkgOvgOWYP3KyT+QHyvfs5wO6rIHMQfdN/roBLnHpF4OQuWIoLtsZpZuqry/2
	 ahGhtev5SqppCzvli41ej1X3Kw124WnTQo8HO4U5Cb2hWHvAqKchyecGERHzJ6yye2Xnk
	 EazToZcnvSPkM/5w3ZKe/JDrGc5U9i61njhYpeq0XeTD4k2U9O3rlFSEozAcXAI/xTVMp
	 wh0eNYUVUj+jFT2zArVlVx3MCajG9euuUtO7mApzErTpIZ9cjlIhOyQCkcJYpS7fV7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fjr3Mox6uoo1UtUYxeiYQZiVbBY+JKePkOMiIFJKCRQ=;
	b=1valT/W7LTK96zLCMXPLfeJKjOSHLexjKubFqCRer9Stw9fICrrTMlMK4skrUCHJQeXl
	 fYpN2Os6U//6dX18yCLACck+Pl8qqmBusT07FB7rh2ugVp9hy7k4v9c+f1UuHAqx56wau
	 cciKbof6cemccM/yqCVxnZbQi4YPfF6gkU+QICL21kqj6K19kvvOOBcfXnJnL4Hs8On2D
	 soalF3ixHPdA60ZptfLimKtCIXmHbpAny1kNiAsdW4zMs+uwuFbh6dJH1ihmFgijv+S+3
	 tYqXUztrCiulpLtVXwVuop0vfgsaSTqtMr5jPg5dI7ZsfJvWcaQCFdTHj+FKua+7r5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="thrje/tZ";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A621606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A621606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thrje/tZ
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0918f9e6cso1803405ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408382; x=1796013182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjr3Mox6uoo1UtUYxeiYQZiVbBY+JKePkOMiIFJKCRQ=;
        b=thrje/tZhyZdjPx+rdflKWPJOsFfOwPyIYVp6tK+F5pXcmmKS8j9c6kAW8ZcA/dj4V
         UuifOTTyVw6FY/JWb3u9i6GHUqqKoZU86mKgxFXTA2N6nrK6WkV4vexfsZEArSTE4itR
         SN1QepfIj26pm8rDc2Kvj6HLdCDCPFmlg+lW4SRjj5rSd8dUaZyEhSx7ofxbtJiJh9o7
         y+BqOwEQJk9jBp45OjMQhi/FnQz3KkB6viWxJFKiZpmeA4icWMQn6rq44qpdfXBI/4t0
         ++jYhN6Q7SbtuYZ4LNyVvE4Ays/0OfIhrzPdaZSZeBbChu2c2bGWDPgH+Urk8555hxnt
         4Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408382; x=1796013182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjr3Mox6uoo1UtUYxeiYQZiVbBY+JKePkOMiIFJKCRQ=;
        b=GaD2vS7S1l9jSfAfqlXape1d/5sJ6Qj4xnkdQOUnyr7B9+NOv8hNLU+gh3UDX/5Bcx
         8FP1Ksev8cf8ZLu6if7mcakKiEWNIljt4Q+TU87YIQQQFOJ1PHB55tJw2WBtktnRyLxJ
         aTTtK4iKDUY7qtEHckvlRwnqfkivmEfPPS05c0r1I4KOGULYotQxCKLcIo7T0/30cigS
         GjYRoqamEcnoFT2PydaeqmypvVpLsiVCjVKjC6Em+sLRUDejaAcCAyEW/baKvOODAQFI
         jm5UL9DmaD4L7ymbhUehtuW3AsJdWn3iXBe1f6tmwj1hbSYBQ1uzC11TsgL/LNmHtMFM
         NKTA==
X-Forwarded-Encrypted: i=1; AL+hErHFJfCFvLpbRsfGf2IXO0VzWhSjz9ojtpZBN6w+udJZ6VlQl7n0cwHE46n2/xT7VY9uPEoL4RSI79YU8s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z82G7EXDfxmxIhQy0teoDmocxMNysJf0TRutwdYDF88GHIexJZK
	XBWZw6HjemjtZ1URJL0rvEH2Etk/bdqtRzaer2t8KskYCAVL+01bAlia
X-Gm-Gg: AZFdTZcdyjuXW/efxKoy9ZPflrsLs++LODq8wob3a93lWsWclnVGfjIYI9daHG3DgEm
	KUWxOt3IfmE7ixADIp9rjoHJ2eurqZD9IL5ZVLgI0PJVXEa3LQ5B3mnLyzWEIdeZmTSukzc7KXp
	g71I6z0ssfG98VAkNT0Gh/N6Cm/f/Cwxh+GQ44/jsrhSw95bjTZSk12ZHYWAd9o02kqdHuM1Mw2
	yya9AOo2XIpdyDYFVI/o+bFbh9QAAXEYD/8YA3xjB77vNsgdhdFvSgWKGEaNOqtYmKGHq+/8Ltw
	kMdiCjtYT+oHMkRUdxDV/CjKSzr8nGeUSsRjJESUsWf+ZIvcl4F/qqV5/mbTvFBdEDw3EfRe1x+
	aShPHM+G4Tgz3XZ3xugIuP9BGPE4bcGwN7ptWY+AOqjIofx8/BDCpHpLZ0pB9rYmmuBtkSP0sVD
	iDBFdSJMcfN8vaRV6d83jVKii0xNXN0Vw237YxaBnRbeDxlkSDKF5oXl5Yvw7J+VvtvrxcOZNV2
	hYmYAv4G/fcu4Qg/yvc3pWxBZ/RCeafNyNjxy5OmOA0dZzeNg7fgcJTqMO3X2lY//fCcG6WFP3q
	oddFoSj6pFlJ1tWyg0EOrpbHZogK2izXrBtr4qAFtw4SnwzH6NK+YpZ/Zqd32TnyHxPCsNr8v13
	+PxN5u32j6zh1hpoM2TFL7mj2QxKNg2xv1AsCPob0tjCGe/qN3Q5IaMfyFToKLgrLK4VwVg==
X-Received: by 2002:a17:903:2312:b0:2f0:8c3f:b59d with SMTP id d9443c01a7336-2f08c3fb930mr22603265ad.62.1795408381961;
        Sun, 22 Nov 2026 20:33:01 -0800 (PST)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm45389145ad.50.2026.11.22.20.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:33:01 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] bitmap: ignore unused tail bits in bitmap_cut()
Date: Mon, 23 Nov 2026 13:31:53 +0900
Message-ID: <df5afaa49465f0990ac4e0078af39c6943de4090.1795407826.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795407826.git.kimjinseob88@gmail.com>
References: <cover.1795407826.git.kimjinseob88@gmail.com>
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

When nbits is not a multiple of BITS_PER_LONG, bitmap_cut() copies
the entire last word. A subsequent right shift can move unused tail
bits into the valid result. For example, cutting bit 0 from a 65-bit
bitmap can move storage bit 65 into output bit 64.

The bitmap API requires unused tail bits to have no effect on the
result. Mask the copied destination word before shifting. Keep the
existing pre-memmove() read of the bits preceding the cut so that
overlapping buffers continue to work.

The last existing test case removes all valid bits above bit 15.
Change its expected value to 0x0000ffff, which contains only the
preserved bits.

Fixes: 2092767168f0 ("bitmap: Introduce bitmap_cut(): cut bits and shift remaining")
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 lib/bitmap.c      | 2 ++
 lib/test_bitmap.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/bitmap.c b/lib/bitmap.c
index d1cb8a507..50cef429e 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -210,6 +210,8 @@ void bitmap_cut(unsigned long *dst, const unsigned long *src,
 	}
 
 	memmove(dst, src, len * sizeof(*dst));
+	if (nbits % BITS_PER_LONG)
+		dst[len - 1] &= BITMAP_LAST_WORD_MASK(nbits);
 
 	while (cut--) {
 		for (i = first / BITS_PER_LONG; i < len; i++) {
diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index ba09d057f..eb925d576 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -1138,7 +1138,7 @@ static struct test_bitmap_cut test_cut[] = {
 	},
 	{ 16, BITS_PER_LONG * 2 + 1, BITS_PER_LONG * 2 + 1 + 16,
 		{ 0x0000ffffUL, 0x5a5a5a5aUL, 0x5a5a5a5aUL, 0x5a5a5a5aUL },
-		{ 0x2d2dffffUL, },
+		{ 0x0000ffffUL, },
 	},
 };
 
