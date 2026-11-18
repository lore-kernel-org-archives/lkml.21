Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010118;
	b=ezMb9yAWC/LiLfloj/laxWjgkZc+tSvGm38ZBp+E15rb3RNb78KD0zo471lgXx7HzdYk
	 bUG/SwcqW4meytiJS0gqmPbqwVLoJB0cF2VNYf6/8tX94MRoCSkfwlJ78ZH0jHV4PpiRR
	 Uzu9N20qFTknEncfrnU8XM9FiOp/Bzuh5AL/tKaE3l+m4cDP5EkDoqa2A5Duor7gVMlrS
	 Z135mnZNETg6dkun7ntOv7+fSrXK+AXtquIh/iziyYWEzwWTHmBI8wLE4dwmtevS0MiNP
	 nV5u7UNXW1DMzrAQgYTAcCY7YTSBBknsOLR1fPkR1B5+A/qEbL+T4ao9H35kjDLtvtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010118;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=BNHb2upVNRY1oGSJTHZzcy5zKsk+4JwuCx/BHx8TrMs=;
	b=EW+5X7i7qohPPN6RrDcLVuJ8FdF1cRDFim4lE02YTNWRlMiZdWk1AKaXVroBM6Ep0GP9
	 nvJQK9a2MgN9keQDZhUmTqSLnxRGU5rvX1L7ATuWBBpWrnJAZvAvsfFuzZ7pol6dz/jVb
	 wzm6pc7aetp/ggXkpXfhnbblOtKQC9CB96jyG0dN2QIYmQREGb4oL5xcy5qOGb7jg4V9h
	 moqq6jm4mMlPtw6I4KSQ/fzRuSAKwsAnV7+CA3itP7+G7xzpaTaML0gPOvtQEHALNsiJR
	 +/CbnArh1fL+ExF9k0Zztwxa2RAmiAfdj4y5nrM9GEuFoQOHLh3yOzlU9B6rhZamuYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1qPAgq9+;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BA606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32BA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1qPAgq9+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 78F664E4162A;
	Wed, 18 Nov 2026 13:55:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41D435FE9B;
	Wed, 18 Nov 2026 13:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E80A811BC0D19;
	Wed, 18 Nov 2026 14:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795010111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BNHb2upVNRY1oGSJTHZzcy5zKsk+4JwuCx/BHx8TrMs=;
	b=1qPAgq9+GFSv/Un0KX3shDlC84r25LP5ddJJ/+Xz4sH6rqddbyR/7o3HxtN7uidbJmQ+3a
	UpaOWuUhbF3yw/Z7VGf73VfN0z7nNLJw1C3FIQRTFbyDeBMgD5OnbmYUOUv8nvvB117Zod
	lZ57zwXAN0YYSflc/4Z0D1WtEt9Qctjt9aLpezb8/QUlsv4mCBafvIbhT1XOWF2kJoN4iH
	xfK0oOTjkmskMCI5LV2bSWmdHIe1iCSUEMWrbc6DhiZbUjkEDFadTHHXWeFULp7qCRLPKf
	Hrh9qQghPazm3NekrIV8HAFm1ybXB3xN/ixliH9EVbpxNwY0MTA5UvMzHzcXaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:54:56 +0100
Subject: [PATCH 2/3] spi: ma35d1-qspi: reschedule during long PIO transfers
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
Message-Id: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-2-e5066ad2efe3@bootlin.com>
References: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-0-e5066ad2efe3@bootlin.com>
In-Reply-To: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-0-e5066ad2efe3@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The driver performs every transfer byte by byte in PIO mode, polling the
FIFO status between each byte. Since spi-mem operations can span over an
entire block (128 or 256 kiB), the CPU may be kept in this loop for a
long time.

The spi-mem ->exec_op() path does not go through __spi_pump_messages(),
which is where the SPI core adds a cond_resched() after a transfer. On
kernels without involuntary preemption (unlikely on embedded systems
with this controller, but still), nothing would yield in between. To
avoid keeping the CPU for ourselves for too long in these cases, add a
cond_resched() point every 4 KiB in the data loop.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 1ec631afa403..65dbad6f63c7 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -328,6 +328,9 @@ static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbuf,
 		val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_RX_OFFSET);
 		if (rxbuf)
 			nuvoton_qspi_rx_byte(rxbuf, i, val);
+
+		if (i && !(i % NUVOTON_QSPI_MAX_TRANSFER_SIZE))
+			cond_resched();
 	}
 
 	ret = nuvoton_qspi_wait_ready(qspi);

-- 
2.56.0

