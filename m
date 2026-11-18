Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021718;
	b=CrvgvQyh6lpPAiPOhDPmMVGWYIY9zQUfph/U+zDGfPp0QA6kcB7ZSmgxwF2reJ8wqJs4
	 zbvR47sbd4lgCQTWtz9UZouEiDVaXO8G2ORaG0HlZIAoSKF3HwEnTialQT7f1BiSvNP1f
	 J2Djvm1D+pPWtVr61Z4tN+T5xa8EgbDb3MAO/f+0NpqZ3QCOxSChNJN0Hony4RLn04x6d
	 lOBnJL8xkkIo7JovxUiLBBTa8hkMG9Dk8G/VuBmuGxpbySe/ehgGEt3IUkkIEUIgTzR5r
	 WQQudGIFjk/S5Q/ZWfr4z3qrpcB03IXuHTUwYB2Xvz28hn76UUiMYWJ2XOEoMRBfRAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021718;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=nGZEZN5yjs51E9V/Ro0nwhidiwUYChKgL/6iUuAN0ZM=;
	b=qtViS86cnivfgL6j91YdoL4tEoDsoVlWOZWak1zYjGa+av9oB54dazeNGMJcNY0WvSR/
	 wVTJ36HQc7ELbwHo9HIPZuyJ1Rs+F2YoLPnzqA+lkDXgjUeV5c0UnQM2vhXxFseNEjD0n
	 qLVQGZT/LeHKkoHtl+tQ1KmWxN2O2sRz70x80Fg2Vet28T0yf0ML74q+ts1D6ouyWV/j3
	 mvQLnKr8He4Lem2vJe6h5xEbSYpQZXgw6c8rgWEmYogUTamyxFSKdba0tDyhQ5m0IUd8B
	 MCY9XHAmVxIrTZy6u0i5jdImlw+rGMNSTPuSgBjyxq65opnQS2Ltkobf+QRljK8sMyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fKYX4w52;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36260A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE36260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fKYX4w52
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E2FA1A169B;
	Wed, 18 Nov 2026 17:08:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58D5A5FE9B;
	Wed, 18 Nov 2026 17:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7876B11BC2A14;
	Wed, 18 Nov 2026 18:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nGZEZN5yjs51E9V/Ro0nwhidiwUYChKgL/6iUuAN0ZM=;
	b=fKYX4w52wCxpxiHcfpLjtfUddfoTFt6Kp2cS+HKEPaChvwTqoiOGfWoxx1IsSrY014ZpVJ
	72UAl4gV8ild4iOH/HooSg8pfdlCDtpS0xHy7FVh1N6TW5zBDimiCvsiha3WLIER7NTV3W
	0NF7W+Zkv7KNluVM0L4B693EMTjiqoHn6uRhW3W13GSq1VsmfjVFMwOTW+7Ozmc78CRPy2
	rMQkN7sGWqzU7odJEcbrGVPjP0oULdkRCqN8oDQoQHWk/cGonTTvsmXg92H5oaZrZCpqSC
	GHlhiM3BJ9sdcES4hyMZtK8balLK2NIsPxUjtqYSOsk+G78S6HeeGzQcUHQWcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/13] mtd: spinand winbond: Add support for W25NxxLV
 and W25NxxLW chips
Date: Wed, 18 Nov 2026 18:08:17 +0100
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBRFt0Le2GfaonwcuQ/DoD/kJdCSlhQMY
 e9WVuDwnOSeu0O0gWyER7FDsIkieZdBXArQg3Rvi2Qyg2Ci4qxkuJJT3hmcZFxswFXc3baNaUX
 eNsrIUva1FpDnc7A9bWf61WUeKC4+fM6nxH/2j2jiyLDlfVXfWG10o57K+2Ukd9V+gu44ji8Eo
 kOdwgAAAA==
X-Change-ID: 20261030-winbond-master-w25nxxlvw-198bda3af7c2
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

These chips mostly reuse the existing infrastructure and have been
tested using the mtd-utils test suite. In particular, I wrote and
contributed a new tool to ease continuous read testing:
https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com/T/#u

A bit of reorganization and renaming is being done as well as
preparation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Rebased on v7.4-rc2.
- Fixed the mistake with the KV OOB layout reported three times by Sashiko.
- Added Dominique Martinet's tag.
- Link to v1: https://lore.kernel.org/r/20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com

---
Miquel Raynal (13):
      mtd: spinand: winbond: Fix an OOB layout inconsistency with W25NxxLW chips
      mtd: spinand: winbond: Generalize the KV OOB layout
      mtd: spinand: winbond: Generalize the LW OOB layout
      mtd: spinand: winbond: Rename the ->set_cont_read() helper
      mtd: spinand: winbond: Rename the ->ecc_get_status() helper
      mtd: spinand: winbond: Add 1S_1S_1S continuous read variant
      mtd: spinand: winbond: Add basic support for W25N02LV
      mtd: spinand: winbond: Add basic support for W25N04LV
      mtd: spinand: winbond: Add basic support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N02LV
      mtd: spinand: winbond: Add continuous read support for W25N04LV
      mtd: spinand: winbond: Add continuous read support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N04LW

 drivers/mtd/nand/spi/winbond.c | 187 +++++++++++++++++++++++++++--------------
 1 file changed, 126 insertions(+), 61 deletions(-)
---
base-commit: 7b88b1111079cc2a43be02198bb1e07e649f367a
change-id: 20261030-winbond-master-w25nxxlvw-198bda3af7c2

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

