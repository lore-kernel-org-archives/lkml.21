Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126458;
	b=p+CY8+K+wS1Bt8mfwRBexcsCb+ooR8tcQ4oKyaIHW2KXU5VKkoJXHUk8ZozSmWeQqCyC
	 Z9A12DXyBbUUrXtnTNZcyQ/TXmmxskyFgv8OWYulCMGw+1GrZ3cKO4IGZA0g7uMu124CW
	 4aMOcCFQGg0N80RqWzyq2+flkecJ2uX+YUeZBUbocZByHN5ijaAU4qQvRnZHESlge6GeD
	 Hw2VSPQPx5IEHrv/rR9FXJnzrAoVzyCWmY4dppg9DgGszPsbneGFwK5KVJQw0hc3QULN0
	 i53hE5N+koe242h5f3uM/3UIq6tR0xev0wmil/74KKjqrP1FNXyEgXGWhqyJVC/ua/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126458;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=YTBk4U3HpQNPKASTxC1phBriKEjLR0Op0tI8THMijAY=;
	b=0muwxjxLhTogZgzbL4t9BmO9gLyJqBEl6BRH/iT0OHXWaTcDE8aUtVAEAhEPAZdt0g1q
	 5SMN3JICaJwQwCTNfeRmeZ3VGpzXRAVWbNFVp58Tyfuw2/7sau0aavOzkVhiMYfeLpiDI
	 f64nvAkk3eT8gsna373xvz8FVWVNhbG4DGfjLf2NyJHjD5hqHuoHS2IWIsbZWsZHz3nXz
	 OnpRi7qoPxVcTdx30v/MZPVYPg6fnCjvYshKPPOvnw9KWqccMmhJvovy6h+ITR/APzrJE
	 9lHxzywEI9Haf7xqL/FczKTuwoqYhltUBQyNWzlZzSr4Yh6mA1SxLYM2i3Xe+SJclxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="cc2f2/U/";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B4606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739B4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cc2f2/U/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 157D2C2F4C7;
	Thu, 19 Nov 2026 22:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 869B76035B;
	Thu, 19 Nov 2026 22:14:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8A1D11BC0623;
	Thu, 19 Nov 2026 23:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YTBk4U3HpQNPKASTxC1phBriKEjLR0Op0tI8THMijAY=;
	b=cc2f2/U/1CEHvYmwgM9mH9kviZcEFHMwHkqq97VzABgE1V2NaIWfOY2UHJMt+4a6+LDtK1
	oTu8Ok1i6RMdlka44fvLSYwCwxKk4UV2BsZqTkMzjAjad0QMdd5DxUry75ZSARSVBG9QU+
	Y6HQykWU1XmWIoOsVRKVzzrWZLsEj2ufQsvs5mIT1f+eEI+kwDury9iG9kOBDn7wNpz8Ni
	an7Btuqtw6ZebvtcmJD/UnIgUSwzq7KMxxZWkdl9eA7jq5KwKndXIUWFfZBy9BDJZomvxQ
	y2Z1tB9sw/pI6sT2v4TCazxqACerMBTTCMt4s1Sg37imZ8dsO6onhyxhqBH4Cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] mtd: spi-nor: Fix RWW locking scheme
Date: Thu, 19 Nov 2026 23:13:50 +0100
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NMQ6DMAxA0asgz7VEUoFor1J1SIkJHnAiuxQkx
 N0bMb7l/wOMlMng2Ryg9GPjLBXu1sA4B0mEHKvBt753zj1wCaNm4R3XYl+lsLAktMIoWVG3DdM
 aNOLQ0vTx94EodlBjRWni/Rq93uf5B86N64t4AAAA
X-Change-ID: 20261119-macronix-upstreaming-spi-nor-rww-guard-80efb238eed5
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

The RWW feature allows to read while a write is in flight, but its wait
logic was built on wait_event conditions that acquire a mutex. That is
not allowed, and breaks the wait semantics. The series reworks the
locking so the wait conditions only observe the bank state and the lock
is taken afterwards.

Link: https://sashiko.dev/#/patchset/20260811083111.403453-1-runyu.xiao%40seu.edu.cn

Two small preparatory patches keep the final change readable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (4):
      mtd: spi-nor: Return early in the non-RWW lock paths
      mtd: spi-nor: Factorize out the bank mask derivation
      mtd: spi-nor: Keep RWW wait conditions lockless
      mtd: spi-nor: Prevent KCSAN warnings in the RWW path

 drivers/mtd/spi-nor/core.c | 190 ++++++++++++++++++++++++++++++---------------
 1 file changed, 128 insertions(+), 62 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261119-macronix-upstreaming-spi-nor-rww-guard-80efb238eed5

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

