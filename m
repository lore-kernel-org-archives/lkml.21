Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127286;
	b=Wsnt3nsukva/Wr+lnOSvzChT8ZLgyReKHlEm8dPxtk/W6jzuPRw3lmGmY8fedh/5N1m7
	 4MLtHfyqCp9q9u1B9JhHxMdqCedhh3qsVU6jkJ/ezwGoM+bRWvpLlZ7XZ6ZpVSYEFSjPr
	 buHefVGhRu3JYXAvAYq4bPPrRCzTcgvGFrmspPD3jz86AwVDo7F9Iq7H9Zb0/GFqLCyOf
	 uJGF0YyIxxGUA15peI1DRYSS4mfzM+nGeQ8+pl/zYRInVAAJ7IuudX9HBSrMGhlb/oqTU
	 Tq6KkAH+K4AFPv0QMzd1Ib5cPrSt2ZS1AP3U0tt6Tgy0o12L9VjlJSs1dhFGvlHGTTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127286;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=cExm4v1nnoeFCJIraxxSfsSKgi1zXrIFP4E1G6KpmNI=;
	b=U7wrA7JTpnvurlsPJ3kUv4eE/VmFG3rr6nR4+Eq4j5Q7Pwa/9dJcjXxKN0viJ++NFFIS
	 OcF2tFd3HfqXYykAfU7e+zy8F13KRNavm05KrzGjpA2UYH3gFMLu5IDgxve5Kjy+jwjMf
	 iNlTxR5SaC2YEgfGfHXTuznGMKCG454xZ6wwkyWUD2lgSlENNTvWRbpTScTpgUlJ0EV62
	 OppnY01VqB4kKSq2gFzJeOSrh+N2TwNTHdGrFy+6IVViE4c39Sar0rcES00zgN+QDbaPv
	 sYISrFAfV/iaf+xHgQroEmaVsai7LaZX+iKx4Nijl+hBbmhDbgGKKrncu89tSh74uNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNmJPseF;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C4B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNmJPseF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E98BA4E41676
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:28:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B64906035B;
	Thu, 19 Nov 2026 22:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7330311BC0D8D;
	Thu, 19 Nov 2026 23:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795127283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cExm4v1nnoeFCJIraxxSfsSKgi1zXrIFP4E1G6KpmNI=;
	b=lNmJPseFNU6vULqKZcykGprhLZSVuKKRpBsugkC0YpYF8QuJ+rjxj7KWOSg6gXxzEn0Ozo
	MmXv6ms9UDc7UFH3+FcoqhZoACPBooLFiFFrB+Xkux1arb46lRnNCCJlOg8b8gi+8EVolK
	7bL5+IhD8Ytp2HwWRfwNnPSURkki9miWsmuFokdhwhcpgFsUkvh35b8ILMYyPpE7yWFrbU
	R3tAO01HzsNJ2mKfcqD8OGfiyH/MQkZU+M+fj2ti+TuLbyl9fHoB/lDKLlzxnl9KBdoqWn
	Py+epuw9QflkkM/8l7B1ILc6pHoIwyyF0v2hohkZp/V2MXnP5PQSWExEzJaB+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: rawnand: cadence: Fix incorrect variable
 dereference
Date: Thu, 19 Nov 2026 23:27:55 +0100
Message-Id: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxA0atI1gYaRYu9SnExOlGzaByS2gri3
 R1cPj78A5xN2OFVHGD8E5dVM6gsYFyCzowSs6F6VC0RdZjYfMUt+dc4fERntPDXoBEn2dlxGp7
 1EJuujTRCviTjO+TJuz/PCxUg4w9xAAAA
X-Change-ID: 20261119-perso-upstreaming-rawnand-fixes-fb73bd596d1c
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Small series fixing a report dating from September on the Cadence
controller. Patch 2 uses a newer API for one of the DMA helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (2):
      mtd: rawnand: cadence: Fix DMA device dereference when DMA is disabled
      mtd: rawnand: cadence: Switch to dmaengine_get_dma_device()

 drivers/mtd/nand/raw/cadence-nand-controller.c | 27 ++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261119-perso-upstreaming-rawnand-fixes-fb73bd596d1c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

