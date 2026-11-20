Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179929;
	b=ljry9W2rNvwkND8ilOv7RM6BNVr/Y+t3ZHHs+pDq/P5CAsr3rqFdxUr07cqORLCc2ZeU
	 JEnUELo8cHSEz4rp0Iimk0tXJBj5yymf81xBZj3fr63pgd6PJR/q+RaG5KDYk9Ff0Afh3
	 GhRuYxkU2oeR6rGFanxLDznADDs8dn8MqjUdcqcxaZuHI3sHRhFrJkGY7yYzX54ywM4pP
	 7qmXerWU/tBur8jiB6izcYMw57iQ/r1V4qdg3e/Vq7ACIk+J6f1TZmrwkzoJbNbbOgHUQ
	 EqpEzwFnL8zoRd+mh2vh5itHp/NibVjbeHGRYV3aSBTeMfrldfFq2JH7OwScroJJnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=UJX8oFhF5HZjXzqG8lPPc0a1XOloJ0ueW0EWuNS+9t8=;
	b=vr52DwfV1CWSi2rwaZi3FC/So6njnERAlFyvTaWmGbP2Zr45VtoYeHYp/CbmUfOOxcP7
	 cV82wkqdSjLInSM/Qm43bRTJecNWR3dHHFvqMllFyas1AIDiEtl6MTSaRtyerYE8f3xaJ
	 hU1A/0q/TUBzD0qUnfRnfXdaBKHUiBd/oShm17SpH+6bhnnnIagVzCXbQGvgHbKshbWP4
	 iIRZV8225MRPHNp26IvluU3b32D+NR9ZuYZCPeaWiE7ycHgAmruAG1nE5Wx5uwKQa4v6E
	 O0RZ0vXrL2raG0rxMWAc2BNR4YJcSD5FQva4yvNZEEP+VkXRM6wTw4Ll+o53Kke/Hgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZFbM3V2;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216CD60A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216CD60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZFbM3V2
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso132688466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179927; x=1795784727; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UJX8oFhF5HZjXzqG8lPPc0a1XOloJ0ueW0EWuNS+9t8=;
        b=nZFbM3V2Ub5Cb3QfaQ6oTUEzvVEaKV5fWXBPi5bv3owPL4oFCLC3WSHPOSzfKhtqJk
         Ce8QisYnv9GG80ozJPQbAk4kBE9d4B8gHO2D29z3pkPNUdCLgyHpJG1zbEpAtj6EIolk
         GeoFRxgM4oaYETTnqgX/w8XDodXWG7O3ZONEI639mHJgTombUdnedg6CWLvC1nJqCtF0
         9DKjAjYQsuP+aJC5KIYCE2V2dbwCXyMLQMj79hNxSISPVFPNZPiAYxqsyt4d26wqNWwx
         A4fO5SZ9IT7QXvu/3qUe/X6fcGoVLmNhQaB/hhtD+JqSfQqtB0E2Nqf7uFhGbJFc2DBn
         Wqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179927; x=1795784727;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJX8oFhF5HZjXzqG8lPPc0a1XOloJ0ueW0EWuNS+9t8=;
        b=vbOODaqORD6hnU0DHHDzdAqz1TqM4EbT6oGT0dVHjYChlbZsdCojXLAuY8lIGRwHNP
         gwHcmPWWM7KVyJGPpLVHO3MdMqz16Gp5GN+kWz4o2FML9b5Vqj5/zRLEAcK7ReZL0Epg
         AAc7ekc+XwaCqEUc5oqLvdu1XTF42s53BRkPcBb83c4Wu9gC8oCnmWYT8lyKFHG0hLK0
         R7Y4vkhPvGeCuunCFRwckQTrGwDdzmYrd0W1knvyCWWY9SMLmsRiTv+skNohZvhxR6QI
         HEJDVc9YYswXEn+RZW1s5Pd5uWHOaRBSi3xc1VIam7sjeubg8MhONuwWaVWY5+3U0cd4
         dcfA==
X-Forwarded-Encrypted: i=1; AL+hErG/ivd4fDb5aoTVS/Ekj15KWrEJg9N4dYJQgzP9eIhaURl1iXWguHiKIfiEhYwIDvlLX203/LGXyb7Anfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ze+1+i+qoBRhqSkFItCtgNsR+KoQ+xRoAD2L9u4HyEKdwH5qR
	Gih7iiSU8NUNLj4wuzLla0NqaEskkViI/1krAOJ4T1w7snF7ZXw6ejGz
X-Gm-Gg: AZFdTZf3k/FBd9hOG9+MU9qjWZAuL/FFtqmD/j1z7HPPjgrDPGxsy6oRIP/G6NbAPft
	QVJm+thu1M95RZg0dZB9u+b91zVdAaz9PEhCRfbb6oW8arKj+76iIc/1fowZaHDXRGFhQ83Z6a+
	xscT+zHmrDzzFbEkH8deAv7vF1pH0Gt4McCQtpTiCD3iXySeSEpivGw3E+7Q6JlwxZdoJ7BxMgF
	Os91ISnQIdNF2yABYl0/R7/kVVidV/2hEQiMMVfcejegkTA9sQcWXl2Nb4ncVWlEymOki6UzulX
	w/zSYJ4yXRGnmYIawEu6Z1JJdW5MyKaYJ3D8EfcboknSu3L1+ZDPYACFy6rmo/JYcfd/Lo1HuD5
	tCscUy8VVh5DbOUH2SCG/SAe3maV+Lj+ukKA1h8ARthgPQKUKZGHHUQ1osBnOTGCjFEZ6jATHXZ
	5+YHtdznCBEec/Wwo9k65OeB1JSqzKiweqoYAtvpEyJVoZuZRJN7SRWN54YIe8fUkDnnYiibIYH
	FCOnUy6K+jzU3ojhVw8ze5LTVS1BXCB2DMQJhMbfPMgObQGcmrgxKR1slC0djNN+PtAZ9Sn7VBA
	xnuz7EiXnunJCfbjNXjVVzO0IDTA125WEMuYXIAsqAMsvffLRTbA4cnZ
X-Received: by 2002:a17:907:6091:b0:c50:c04d:cbb3 with SMTP id a640c23a62f3a-c513a1dd710mr320288266b.0.1795179927367;
        Fri, 20 Nov 2026 05:05:27 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42easm92176166b.60.2026.11.20.05.05.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:26 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 1/8] char: xillybus: Improve sanity check
Date: Fri, 20 Nov 2026 14:04:55 +0100
Message-Id: <20261120130502.17056-2-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120130502.17056-1-eli.billauer@gmail.com>
References: <20261120130502.17056-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The sanity check in fifo_init() added in commit 1ce74f6f2216 ("char:
xillybus: Add defensive sanity checks") is unnecessarily complicated
and may not work as expected due to the incorrect assumption that
1 << n == 0 when n>31 due to overflow. Replace it with a single
check at the function's invocation. This check also eliminates any
possibility for overflow in this function's left-shift operations.

Fixes: 1ce74f6f2216 ("char: xillybus: Add defensive sanity checks")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20261109112800.48663-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - No changes.
    
    Changes in v2:
    - New patch, replacing v1's "char: xillybus: Use unsigned int
      literal". Following Sashiko's review, reject log2_size >
      ilog2(SZ_1G) before the left-shift operations, instead of relying
      on the overflow check, which a shift by 32 bits or more could
      bypass.

 drivers/char/xillybus/xillyusb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index bd3babd39f35..c4ddde221f0b 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -374,6 +374,9 @@ static int fifo_init(struct xillyfifo *fifo,
 
 	unsigned int log2_fifo_buf_size;
 
+	if (log2_size > ilog2(SZ_1G))
+		return -ENOMEM; /* Reported as greed for memory */
+
 	mutex_lock(&fifo_buf_order_mutex);
 
 retry:
@@ -390,12 +393,6 @@ static int fifo_init(struct xillyfifo *fifo,
 	fifo->bufnum = 1 << log2_bufnum;
 	fifo->size = fifo->bufnum * fifo->bufsize;
 
-	if (!fifo->size || /* Unsigned integer overflow */
-	    fifo->size > SZ_1G) { /* Avoid signed int issues */
-		mutex_unlock(&fifo_buf_order_mutex);
-		return -ENOMEM; /* Reported as greed for memory */
-	}
-
 	fifo->mem = kmalloc_array(fifo->bufnum, sizeof(void *), GFP_KERNEL);
 
 	if (!fifo->mem) {
-- 
2.17.1

