Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746691;
	b=DaWHIVqBxNj8s3/dVE1QXPz9pDV1RV4aovUlpEc6CCNHUodsUYzBaS9ukxssEAZ6lxkw
	 xdnnR2Ncvo8/9cXYaqLPGtwh+9YO9rTNiZHUhd0GeVdHUDhYfOOxDjuXOzmBK2O2R90yd
	 rNTAhxqXMzCU3MNLJRFNnCtKzIo4ntRFiQtgG4vYWp3LyCJtnDkTqWH3UrL8UHe4mmYXg
	 DEEVYOZiIdt5JM3W2CZLccxNMZiprakfScVwlcA43+kSVz4T6FXUqYsIxEIQm8Fkuf4br
	 VjMWQv1f4H8/y2/0rcUq8l64tfi4bX8it9Hde4NvGI6u6Z/veJNVKvidGAssdPg+PPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746691;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=eSC/IavhEKD/jocr6HtDgEw6LyL8PtYnkl9GbB/wsAs=;
	b=Lwgh2U+5xDZia5LQZYxJx02i66lKMW0cvmx6xaDLkBXiDZIlhn7vShr/VQNjQicmQYE+
	 LtoFfW5hPqIzwTSw2bQm4Vt1sBHpsrjO+OYd5/4nLnCuhc1EUpu2/KXv279fzal0rSuDg
	 wmp0ehRluozU+LPIfZvmMJOvMAoeYfwd8ntVHNP72TMCfIT+CXMX+q8te3c+16nJPT9XE
	 jHV53JwmSrWigdZXGDUg2sISGDpM7IqcBf09nzGVTokqF3EMTAxfB7SArTNHpvE7UOXm9
	 VSFSkEsLXuCkhjdZMm4FkkohfoWzsG0Rhori7Z64hDlacAeuywYx8BQ3CphMx/h35SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aa6vOZah;
	arc=none smtp.remote-ip=95.215.58.178
Received: from mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FAD606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aa6vOZah
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jL4HqBe3D5kj1fDFSZf+Q/Cum3V75XKW6K6TrEyTK9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795746688; v=1; x=1796351488;
 b=aa6vOZah75HUcSQGXHkpgtXfAqhuddV2Nv+grXbNtHwI5qB6ejbb/sq2eLotHuyxekcq3HSj
 XB7Zhm900eiXqJ+xXI5Bu0YhPiptLZapWjGhSPHbA5VAeS8hyLnXFU6Nbo/OKeLjFsA20ippyKQ
 suJBI0uX9PMOVwB0kcoSZkI0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34e7e2ce6f4617a5;
	Fri, 27 Nov 2026 02:31:28 +0000
X-Mizu-Trace-ID: 34e7e2ce6f4617a5
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: linusw@kernel.org,
	brgl@kernel.org,
	paulmck@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qiang.zhang@linux.dev
Subject: [PATCH] gpiolib: Use srcu_dereference() in gpiod_get_label()
Date: Fri, 27 Nov 2026 10:31:23 +0800
Message-Id: <20261127023123.28459-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The srcu_dereference_check() already evaluates 'srcu_read_lock_held(ssp)'
internally, so passing srcu_read_lock_held() as the extra condition is
redundant. all callers of gpiod_get_label() hold the desc_srcu read lock,
so replace it with srcu_dereference(), which provides identical lockdep
coverage.

No functional changes.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5dd4d142cf52..47ce89bfb578 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -124,8 +124,7 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 
 	flags = READ_ONCE(desc->flags);
 
-	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
-				srcu_read_lock_held(&desc->gdev->desc_srcu));
+	label = srcu_dereference(desc->label, &desc->gdev->desc_srcu);
 
 	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
 		return label ? label->str : "interrupt";
-- 
2.17.1

