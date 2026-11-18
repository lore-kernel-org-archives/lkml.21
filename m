Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009263;
	b=NyUChir9b/GqTc1admR+fECZRsnSNHJ6cWm5Dm6CDTon1otcaLvF9O2LObxhsEfhQdpU
	 JijHjjw1A0udTtMLxUbDPIg92c9y4+t8DfSQogG6bkwC6g7IlXs7y0hR2rOvV1Ex5HOq3
	 5ykInlCGiY3rnFSm18UEJbLHchlDe7UaqdAi+O/uTGkNzu5AGM71sNYSwMjozwOCoZfT5
	 XVTzmZwxa5ZubjQ2tEH3aPRyURuONy+NhwJ9naaBnNcNXURRYY2Te3lXj7/DDuHwOMzmG
	 b+jzXO7LoeMstlv36x+l2w4+gBtpxGGqdVTt/vHU3MksOPYO7Dp78sGAmhfhGm07YrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009263;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=KZ5BCkqNb6oprSxD68qfjURy1vbangKtIh9R21+lBIo=;
	b=GJbv3kFs7wmeI5f7+kPU0C34B/n8o6t3M0d/MIfKtUPzEqMm5yFfF2gJg/AWPwPg8Yjh
	 ITNIugr84IAgHlsTUQ5UlECw/wLmzWTlJMxcb+Q9vm6rzBE5JBlgaL45xee3JRrZTfESW
	 Yt2nR+CUcr2ggFykZVvHmneeLQoVq8rOB1vd5dKliQtuxlhy3x8kQzpjFA2hig2N0DTTa
	 9v7bABP+ZVo2ocMs35r5sI5dac0eUqfGM34gtKjZQmXLtZGrKSMgkIX1V30OR5i7cCZYz
	 TFZDDdike1tX0NFlr0czsqNTREw7YHWvzxgcmjhNZv49te1nzQWsUF1qN2Y74uiAXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=r3MLFCNN;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E2960A2622
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E2960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=r3MLFCNN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81EC4C4CBDA;
	Wed, 18 Nov 2026 13:41:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB8CF5FE9B;
	Wed, 18 Nov 2026 13:41:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8834A11BC209B;
	Wed, 18 Nov 2026 14:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009260; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KZ5BCkqNb6oprSxD68qfjURy1vbangKtIh9R21+lBIo=;
	b=r3MLFCNNbOt7LAY/0Shsphf2JysXbMTTxlI6pjahqSeJOIpEoWHsZ72hJ9SVTdUEYfx5MM
	CyhKadqlFZGzPzO8uRobZuylYQG8UM+jnVRgEiuwryvQBf73WaX0wlBOo5R5JjlEh7PoNw
	q9XXblIb3tOIEdCxR7tm+5yFOUwI1WZlY57bEhGCBdAParAdmtY4KLDB6kYEDOzV1TXiuz
	M+w45OoaaT8boo+b8w/8RITpIS6x+BF4uxoGfdVsxlhg4j/GDnaw8EwqOG8EtWnx6hJzuq
	1BDZ5SHei/Ar6iqy4xbOMmhJZVs4IAUX9wBuqZW/PeviATCKggWIuDzfof1WFQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v10 5/6] i2c: atr: Set adapter physical device
Date: Wed, 18 Nov 2026 14:39:14 +0100
Message-ID: <20261118133927.366482-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118133927.366482-1-herve.codina@bootlin.com>
References: <20261118133927.366482-1-herve.codina@bootlin.com>
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

For i2c atrs, the parent of the atr adapter device is the adapter device
the atr is connected to.

This parent is not necessarily the physical device related to the atr
adapter. An ATR can be used in a split serializer/deserializer topology
where atr->dev is the deserializer, but the ATR channel adapter is owned
by the serializer device passed as desc->parent.

Fill the adap.physdev with the desc->parent device.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index b98442ffff94..7c599d2d09c4 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -824,6 +824,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	chan->adap.algo = &atr->algo;
 	chan->adap.algo_data = chan;
 	chan->adap.dev.parent = desc->parent;
+	chan->adap.physdev = desc->parent;
 	chan->adap.retries = parent->retries;
 	chan->adap.timeout = parent->timeout;
 	chan->adap.quirks = parent->quirks;
-- 
2.56.0

