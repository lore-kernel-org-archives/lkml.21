Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126474;
	b=yFR+OcB7hdqjSUVm7NX8INpd6UNNg66mXkIUxfkidRcQ7DR+hZp+/XJxpCI1LQ2BCXcS
	 neeXn0/j6BNDvdPIEoEqnbVOuZymTSxstXmwyPe5auIKwWYyimwkIryKqqWhwpvmgEtrJ
	 cJFDl0FngFEg9IzfQWawJvFJdzYr0p7P6sA1SXmotFTZj+pdx+1VDs2Fc7UuOIQ2wgPr4
	 Rtv4iVhicMw0eIzvzShJTqUI3i5ehqriosQveGG/V3Zh9RntzOQOm/pgaOZl9wxLe8tfF
	 wy3q6P+b91ANCq7qFCLBkM/ffriEInmdsYYk5oo+K2UfdvUIVe47bGvYH1GAHBQwpBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126474;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=xZkfdjAIZ0vpg4kWbY88M4W9C6pU2KjaBqMb+XKfG0Y=;
	b=OQRo1s9NoK9aIn4Q7Aht6qRF6vsINNVHMXkufSVqf2fL8ChFqeDuaGm6FXtJRdVWAlTc
	 KEk66UQV6MpJgmJ+XLzOoXSSZX+QP9BQ3h9PDrrTnZLiW8wQBuGU73KMqRxo8OamBbWBJ
	 uSnWNGhrkF0Rb9oMydpwtvqievAJ74ACqNUv8nPQq7AjIh1Mk11x4Ia7VgNFA2D/iLvs8
	 1KQLKctupJVLOQqP/4Wiwo+QIZwQsNjxAL/H7PuAsFW6pKQ74p0ewwXljz/H4nYhRu3q7
	 JlUFxkWCj5YYROENPmKv4tGSb/85expyx6UXazzIXQNhF3V6mWMCPOHrSpE0CAGHmYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s9rSxsnZ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF83606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF83606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s9rSxsnZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5D3CC2F4C7;
	Thu, 19 Nov 2026 22:14:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6008F6035B;
	Thu, 19 Nov 2026 22:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D12911BC0DFB;
	Thu, 19 Nov 2026 23:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xZkfdjAIZ0vpg4kWbY88M4W9C6pU2KjaBqMb+XKfG0Y=;
	b=s9rSxsnZZpm+nMGo3cYu5zJMPVytz+74i7ANTtgVZXri8EZ1zpNnIA5+yZzDmr09DOor5P
	rsrZFvgeUjkzy/7K9WxSehM/pqtMhtU/YzZzKt9O4PM51GUwedJ07t8wTyOGAW3YsZApl2
	UHl4hKeBd/RqBqWPRaaEOaZ9fLbtC3Plj/56Xz02/pzunmCUy8857vQ1AJ/KKSk2XwN+mV
	AM80ttvQYYDIcPuts8ce+YfhZTLtKl9Z9ZrI53NNLSyopZDxTVjm/iEyR1oJlDJcrlOwC3
	sODzc6x3UaTXmHanR6n8W99bHdl3wzUH1oczDrzi2MKEA/e4Xdk5/GRMLfr7Rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:53 +0100
Subject: [PATCH 3/4] mtd: spi-nor: Keep RWW wait conditions lockless
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-3-da72ad9c2d4e@bootlin.com>
References: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
In-Reply-To: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The RWW start helpers are evaluated as wait_event_killable() conditions.
The wait_event sets the task to TASK_KILLABLE before the condition
runs. In those conditions, a mutex that cannot be acquired incorrectly
overwrites the state to TASK_UNINTERRUPTIBLE for the time of the sleep,
and then the TASK_RUNNING state set back, which makes the next
wait_event() schedule() a no-op before retrying the loop.

The issue is also visible when enabling CONFIG_DEBUG_ATOMIC_SLEEP, since
the mutex acquisition calls __might_sleep() which triggers a "do not
call blocking ops when !TASK_RUNNING" warning in this case.

Since only the state of the banks must be sampled in the conditions,
rework the wait sections by creating a loop waiting on non-sleeping
conditions.

Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 80 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7394c9a17334..d46c18e4401c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1166,6 +1166,45 @@ static unsigned int spi_nor_banks_mask(struct spi_nor *nor, loff_t start,
 	return mask;
 }
 
+static bool spi_nor_rww_no_ongoing(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	return !READ_ONCE(rww->ongoing_io) &&
+	       !READ_ONCE(rww->ongoing_rd) &&
+	       !READ_ONCE(rww->ongoing_pe);
+}
+
+static bool spi_nor_rww_can_start_io(struct spi_nor *nor)
+{
+	return !READ_ONCE(nor->rww.ongoing_io);
+}
+
+static bool spi_nor_rww_can_start_exclusive(struct spi_nor *nor)
+{
+	return spi_nor_rww_no_ongoing(nor);
+}
+
+static bool spi_nor_rww_can_start_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	return spi_nor_rww_no_ongoing(nor) &&
+	       !(READ_ONCE(rww->used_banks) &
+		 spi_nor_banks_mask(nor, start, len));
+}
+
+static bool spi_nor_rww_can_start_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	if (READ_ONCE(rww->ongoing_io) || READ_ONCE(rww->ongoing_rd))
+		return false;
+
+	return !(READ_ONCE(rww->used_banks) &
+		 spi_nor_banks_mask(nor, start, len));
+}
+
 /* Generic helpers for internal locking and serialization */
 static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
@@ -1189,10 +1228,19 @@ static void spi_nor_rww_end_io(struct spi_nor *nor)
 
 static int spi_nor_lock_device(struct spi_nor *nor)
 {
+	int ret;
+
 	if (!spi_nor_use_parallel_locking(nor))
 		return 0;
 
-	return wait_event_killable(nor->rww.wait, spi_nor_rww_start_io(nor));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_io(nor));
+		if (ret)
+			return ret;
+		if (spi_nor_rww_start_io(nor))
+			return 0;
+	}
 }
 
 static void spi_nor_unlock_device(struct spi_nor *nor)
@@ -1243,8 +1291,14 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 		return 0;
 	}
 
-	ret = wait_event_killable(nor->rww.wait,
-				  spi_nor_rww_start_exclusive(nor));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_exclusive(nor));
+		if (ret)
+			break;
+		if (spi_nor_rww_start_exclusive(nor))
+			break;
+	}
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1308,8 +1362,14 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 		return 0;
 	}
 
-	ret = wait_event_killable(nor->rww.wait,
-				  spi_nor_rww_start_pe(nor, start, len));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_pe(nor, start, len));
+		if (ret)
+			break;
+		if (spi_nor_rww_start_pe(nor, start, len))
+			break;
+	}
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1375,8 +1435,14 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 		return 0;
 	}
 
-	ret = wait_event_killable(nor->rww.wait,
-				  spi_nor_rww_start_rd(nor, start, len));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_rd(nor, start, len));
+		if (ret)
+			break;
+		if (spi_nor_rww_start_rd(nor, start, len))
+			break;
+	}
 
 	if (ret)
 		spi_nor_unprep(nor);

-- 
2.56.0

