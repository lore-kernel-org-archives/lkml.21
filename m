Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703431;
	b=O5Q9dvVNZ/8hJYmqQAEIqscx5DisdOBlVVzz0s/aD8ONrF5cXYN/MptypWEnfVEPMWsy
	 6mXqVSRq/2pKFP1znYNcSGencg7NKzP78cdvCUthxPtcc/Kk7b8xJcCzB5IQ1XOj/z9Zw
	 yaH+poAQyNM4mpHFYE5dW1nHcAkxNjNfeOvFQioE+B/x4QeWanCkePDPQKLOGKPW3sezj
	 mgXm4LeBAaafhKBeIYwQsWzWYKYf/xakbMlk+F6GHEG5waneKWDNJtZBd+Mekcmye/6mo
	 Rr9tMgBzM7IsoeXZ2P2AKC5b89sxrRQFeIFSa9kzZuKLy4L16TSfKcIkvVtP5ck6UYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703431;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=AkPbh8+KOu2hEsqFeAAkm+a8IjfaUYYB3rND+Zn5rag=;
	b=yXmU3W+msKRbIYRDzVDY5LFA+UpSU7vnBOWElY+xAlT4Av1vmfugElc032104xfjCJiJ
	 ywrp+rT8C0DphjNLeXCB16baKVrWkxb6L+DT52J1H/nmXMgfH7WXU2Hy0wh+EBPWGSfZk
	 ze3nl6FtN9n+QerLARs6/sXadaXP8Lt/oa8zUZmsReAxqZZSlJv5ea+GB+4+yRbvgriy/
	 VZ+V7C3h+kCO0DqfIqLGJVBqO11qxK400qas2MQhOvxldFMqfR6r8Ptj0KCkdugSLbFKZ
	 viT6L5zT3RRVShWQQDpWhfLNyl0AGPYdAETW8w570GT1ifHgWZf4jowNrbruJTBvldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kMkJV8Q7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32327606A6AD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32327606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kMkJV8Q7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A3C691A17AF;
	Thu, 26 Nov 2026 14:30:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78C89604ED;
	Thu, 26 Nov 2026 14:30:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC64011E683DB;
	Thu, 26 Nov 2026 15:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795703419; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AkPbh8+KOu2hEsqFeAAkm+a8IjfaUYYB3rND+Zn5rag=;
	b=kMkJV8Q725j5hErRfJ74sJbGvw2UwniaL6L1vivoWIaLyYgeNO1mlS3dy8CTXOb7NL2TB8
	RN1JnrOV7taZniMV1jsLCARK+7i4El09wGlm4sqFgtGf/DtNp7ybq4YNGZZbrTG7PHbhrm
	Ls9FpXE69PG5JcRuLGgJaBHYw1Z7AQZo6CEvAIXqPAZ6Bg0hsGgT/tF11blYnEIg2/1hUe
	Dwt+8e6wvPZRrwccCGQSkprEYZVHjmM8+hQd0bY2veDW8ztaOyiILJ5giUSnX3ryAoLan8
	+k4x66Z9JYzcwArbyFjqdwuXHxIF5YOWoDLjzTMGks03zRzxnS5WKaxdz9Z2WA==
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Kory Maincent (Dent Project)" <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next] net: pse-pd: fix bogus budget evaluation strategy check in IRQ handler
Date: Thu, 26 Nov 2026 15:30:02 +0100
Message-ID: <20261126143012.1595919-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
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
X-Last-TLS-Session-Version: TLSv1.3

pse_set_config_isr() wrongly tested the PSE event notification bitmask
against PSE_BUDGET_EVAL_STRAT_DYNAMIC, a budget evaluation strategy
constant that has nothing to do with event notifications.

The mistake went unnoticed because ETHTOOL_C33_PSE_EVENT_DETECTION and
PSE_BUDGET_EVAL_STRAT_DYNAMIC are both BIT(2) and, when only the
detection event is reported, the function performs no action anyway.
The check does not prevent the TPS23881 from working properly, but when
a controller reports the detection event together with other events,
the whole notification handling is skipped instead of processed.

Remove this bogus check.

Fixes: ffef61d6d2737 ("net: pse-pd: Add support for budget evaluation strategies")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Found this issue while developing the support for the TPS23861 version of
the controller.

As the TPS23881 driver (the only user of this path) works fine with this
bogus check, I am sending the fix to net-next.

If any developer of the SUIE or Sashiko passes by, I would like to point
out that all my PSE patches and fixes are registered under the DENT
company, which is wrong as I am not working for them anymore.
---
 drivers/net/pse-pd/pse_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index a3d4a3d7e5257..59cc0dcfa2a4b 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1205,9 +1205,6 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 {
 	int ret = 0;
 
-	if (notifs & PSE_BUDGET_EVAL_STRAT_DYNAMIC)
-		return 0;
-
 	if ((notifs & ETHTOOL_C33_PSE_EVENT_DISCONNECTION) &&
 	    ((notifs & ETHTOOL_C33_PSE_EVENT_DETECTION) ||
 	     (notifs & ETHTOOL_C33_PSE_EVENT_CLASSIFICATION))) {
-- 
2.43.0

