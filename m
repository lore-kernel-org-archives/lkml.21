Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989805;
	b=CoNyaFZQWkyfoBDrMkf3mFF90zKZm3riSrHQGIoUE6EtKYXvAWi3gklurUncAnTDDgnp
	 DrWwzXAmZ5U++NgzBoCVBhxqKAKEvzKA7JHaPYMkWYLYgIPFAyfXhbB+Hp2nFpUNrxYeL
	 JiZuGr0GB6AEe7k6iUj/5lJBn8hl2uGYKWeXB5YFZfOqZzkk5oXg8OajbdNRonoly3+9Z
	 fFp2ScL/FzLxrdAiVl51yn/s1oaycXAWr6NU9e9y1LOSBVtrDI+EMloNp46aeoVI5bJ/n
	 f2/fmokY8etHA0IBzHB+12Y4LFRY3dfvT2uYWdvAaC+t8jK5i734ScDucg2nXQjt8fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZKY+qSfDmcc0hHBDLXPOUnxktprMn1RL6HXqKZAm1Tw=;
	b=OOQ5q6G6+47Ms4W5e79WWLD16bLF9dmkqYfpmS36bWqLjI7OV4VcW+VDGDcm9U1vEOCj
	 ujeQARNXHEaZcoS5XlxRbxBI8xNSarSnLj228l7h7G19RfRF67xKuoFE7ao9Q1jfMe3l1
	 7jnCjGnggUNPyYSE1/YXXRBH5TN8LyaLarWVqFOQeUY/lmGw5bcuvj7iGt5RmhuxrcjX2
	 Luki9VYil1JrUZpjCmWQgaEX/vHGcm3wIsDd/LmExcljff7w2Q91F9sYgWvgHZrYRpeZq
	 4D8fQQ+0hFp1iDZEft0MSNutFPdBxaJleU+08lz0ONyxy6GmxBUv3S1IDQvlt3gpynA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f/eBGaPS";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E36606A8BE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E36606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f/eBGaPS
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so355765b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989804; x=1795594604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKY+qSfDmcc0hHBDLXPOUnxktprMn1RL6HXqKZAm1Tw=;
        b=f/eBGaPSfQ+tdUuiXqokvtJldWZCtPmck9idSWfKmoXXqPRHog4ePkbaYeXBUjpm9n
         l3jTRRO5niLsg0ZlrnvEofzVelgCUSSLZ7N0m4YRI9ysYDaOpe3mz9goDsdfP8EmbtDj
         nyTzLQ2Kczc2gin89dd6BJJwoFiUumgGLXWnisNv1DZvRPzRwAykHIE4JqWvTdaYS+HN
         MH83q7NtqdgFLf++CvYYCAcoI76WP7/XBElQumZOMiGAyfGI1IcluGq9xzxqInHlwSSp
         yzZEbQqACPy1F2iW6XGzTKcq/+TDXeLolNdKHHlkGmwXHAnMkWgBmvGrv1j7+OOzaBCH
         SM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989804; x=1795594604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKY+qSfDmcc0hHBDLXPOUnxktprMn1RL6HXqKZAm1Tw=;
        b=c4AmoAnA72InLWniYG1UyX8B6EZr68J+hGOO5cr+5tPfR+Q/FyhvfOjA4tR5CwOYld
         NcZvJbSHIKTNGe6lhPZ6WDtcCA6i7T+9GaCZMFv5mZHdIQYEUu7xdqTTwoWgsJ77z2vC
         WceFa+DgnH62QDc6rzLXICmMAoXDNX1A+BY3KmngYkEvNq0BtvVbyoSHIAdjAQnAliyi
         j41LkJ6F5Ow+U1zdN5scA9BYdlGV5+lxS9RlyF1Vn8UlOkbSxN+J6XQfeOKuOpiYVttw
         Tb9Zj9SnOpqr2EJQeo4IbzuYbFAon8YXxTp2y1VgJ7Izt15UmCewac2tyvf/FQPBKnmW
         mM7A==
X-Gm-Message-State: APuU4Z80xgkAhCrg+qi5CpeCK4Qt1rN5Zno068Kp13cjnVQwc3riNGWB
	ggtjG1LJBvLQ4aE2woVbaI270nH4qI82v+O4FXyH6ud6E7etTjpTLsYTc9/lgg==
X-Gm-Gg: AYBFou3fvcVEx2ZEaAnikAkKQtTN9E7eGc6eUetroUSoDuOzToIQ01uICFaCtWmts0S
	6BXPiR/LfaPbdSvCq5HUrvpTAdYDe9PcPEC3nMyPblgaXfTxleYq6eImJETvlown9IotDfKc/Gy
	QTNGYinYKLYCXEoA5OAD2d/fGOkJ30q3ZxW1bglXThJUW3LzrV4thUGL5umW9jxXCvlwT5s7RvK
	Wf5B9zITfQ8ttumifc4OLKogU1YS2UoiwNWgDtx8oxLbBmQrXhgheGTd49QxxykM+ME+nsqbnNi
	hUoXDtsrxz6p1n7n4wnA4q52CeZqoVWekA0PEjhfN6A7gu0SIwsSVrZVGL8qOploYgSOZfctcVO
	FPAZRj34FaK3JdqAqJxqcqN6t9jlkP05Z04pfGA8EMeL2qZtX9yYbW2oO0jtZOANJVoJiFaogiD
	qsDH2RtSF1tC51ghqVoxScff/NzgrKwWIZRipSXcXT0wJzcLf1wcQTre1V+k1oHyvTd5I3oNRaq
	JJqZNqiB8RkfQvb2dvyHrBuuw/gARbDJMmfMxKJ8teSAGROxUO8CYhysbaiJR+fJZxoc1lAWDO6
	478fgsGRQvAbWTs3mb5mNWWuRacGLj2aH9qI3xrbGzSHXR6znMwjkfon9PRMoLRsqgI5xFJn
X-Received: by 2002:a05:6a21:8210:b0:3e2:9b5:b167 with SMTP id adf61e73a8af0-3fe8b3fc613mr2098585637.58.1794989803523;
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v10 03/13] mfd: nct6694: Ignore interrupts without a mapping
Date: Wed, 18 Nov 2026 16:16:14 +0800
Message-Id: <20261118081625.2399247-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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

From: Ming Yu <a0282524688@gmail.com>

The return value of irq_find_mapping() is passed straight to
generic_handle_irq_safe(). If the device reports a hardware interrupt
that has no mapping, irq_find_mapping() returns 0 and the handler of
the system's IRQ 0 is invoked instead.

Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
interrupts.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- New patch. Use generic_handle_domain_irq_safe() so that unmapped
  interrupts are ignored.

 drivers/mfd/nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 8d5a6f6a7143..048de767e543 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -227,7 +227,7 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		generic_handle_domain_irq_safe(nct6694->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
-- 
2.34.1

