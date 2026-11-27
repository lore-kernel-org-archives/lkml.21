Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795698;
	b=fDGsMRRAcVWb7u1TmYTQyW75h0beLmjiZU+wmC3R90mtF7PKSF8NXU7kc8GcXRwOmTfR
	 15Ml6ALsULKhuAvYu7ZJjowqtSPAZLe+SlqUQ4patIfhDYf3CGgZvZRSLAXR1aSFPVFaa
	 vQJutobXJ0F8UxmtlJQWeAJQ/EU7C9CuCYvYuLtfllZew2v2ftApHeOJNB+3RXt1hKza3
	 FDCFTKWDVy7Pq7GXrc4UOscgTs6bDxrNPGxJaEhgcxtwt4LeTzRw6eqiE2JOo09yKBaQt
	 32PmyHkXPRGkhVUiykJiLgFPWK3SceYpDTN67jkbiFLhoopHnrBOrVqK0VKpDUE2TAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795698;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=D+dJZoe8QTBbGgbOgaelWl6G+q3tleTD4jbeb7V0wDw=;
	b=dSTsCkZ4mrYk61Nn+J6KgwKnNLlZE0H+zF/ngdk/q/hOiHDYw5IYLXaPb2rVuMdPtkRe
	 RlW+U5XNXb+UHBy6pW8jnIPVGDCC/ZkQ5gO84m83W6UWtikyPmITeoWoGTnliY0uzTl7c
	 pAwxgMWzq5dyIKFbOgFoNhE0RnS6iJBW8pT+yES1DFTfbXR7jtwBlplRieLHN6BEOubPb
	 +IZE9HSQKHr57mgI72SBWugJpb+gjgaqdFDVGQsOBO5I+ZC1hFd3jULoR5CSc5P/vpBdC
	 arpIwcjop07hXZyP9SrDKQI/DWJPLxvZEBPzFNXmvrPqQXkxq005hO4Wx+zF1qEX6Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="F/1HuFqM";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF09606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F/1HuFqM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B7D54C2AC4C;
	Fri, 27 Nov 2026 16:08:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4BE46049C;
	Fri, 27 Nov 2026 16:08:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84607102F011A;
	Fri, 27 Nov 2026 17:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795694; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D+dJZoe8QTBbGgbOgaelWl6G+q3tleTD4jbeb7V0wDw=;
	b=F/1HuFqM6NrC+Qpxp9dH3xJSJ6Not78sGZ2D923BGLEA5BymmntItozhxnVX+r98En44R+
	QSPRPZs7aCF/0Ciju2i4eVfcPqwtrbY+YY2opktm2nSfgQVpYSDeklWRs29glUucm3ByZR
	yOp4mwGODQGWaz6Z1F4T8neWKFETBiHVDVatRQ31Ma7IAMmPIWiSNTJre21FiZIa8U1/Lw
	ziNKWHzjcqUJW/AG9VQG3mvLSCHMvoiMJKUGa3sUuZ+JVez5WmMhtuNTnkJkzKssI13WQp
	fF7aJLvWq9/bYJHfFOBfedb7b6gMiMauoSvuxgQdIa5qqSq4L6IA/3ShuHdYxw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	George Cherian <gcherian@marvell.com>,
	Witold Sadowski <wsadowski@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v6 0/1] spi: cadence-xspi: Fixes and ACPI changes
Date: Fri, 27 Nov 2026 17:07:58 +0100
Message-ID: <20261127160759.249979-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
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

Hi Mark,

This v6 fixes the remaining patch of my "Fixes and ACPI changes"
patchset [1].

Changes in v6:

[1/1]:
  - Properly handle errors of devm_platform_ioremap_resource() for the
    xfer base

Cheers,
-Paul

[1]: https://lore.kernel.org/linux-spi/20261120115925.173568-1-paul.cercueil@bootlin.com/T/

Tanmay Jagdale (1):
  spi: cadence-xspi: Rework resource discovery

 drivers/spi/spi-cadence-xspi.c | 61 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 30 deletions(-)

-- 
2.47.3

