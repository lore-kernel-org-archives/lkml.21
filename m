Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700561;
	b=cOO63aXlBq0GKSoHOgl38fBshoqYB4/a6Jissl1GCT5orO88ShRtM8uZZ0c9JJnt/9Rw
	 KzPh0HoRXjX7eHvHiBQyht1ivTBCCVtPTHWx1Emr5El4uMKayyV95CVYdZmgJhDx9ORVO
	 v1YoWnDkSANbA9sTy40VsUtbb9bwq6/hqkcFJz0pWTxsgg3QxoXkFb69tpr66ewrzNHKW
	 m278I2LRltE0DtlMGfayIDQaABwMtOSuDCAttIwL7crH6fHpemVBGKhfJYJJaX9SUU1v2
	 zKfXLFULIOpbeO9YhyMJ7JPQCcNe3ZBpmS2ex6M8Jz8gI6B+bPy9h4xQ8h5mF8ahUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700561;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=xqUDWasaCfPhDHYSBTjnp6pf/Pq7EjevJ+F+V/SKQbk=;
	b=hWyKFqMIs3KltMLXtuJu0f6n1/glOBoZvZQzznZaHmvq+p/dq/nD/7Ak02iHfjZmEbE7
	 FtVvtidN0yz1yiD1eNBm/qTdm3EaJciczAOCHPD7MyOPkT42+ELbotzTi8Ug+tmENmFg9
	 i1VNwUGLKni/Vtl7I7F/GB6ugqYjS2MyVWHwVJDMI/iRZDl8WU/++TQCgKIwsR4RbHJr0
	 dybrYdUOcPSuAoVy9t4gel6kSDordSwBpqMg41XnV+2O3ssolAXf3suXtNVMFfRB1qhmU
	 vpVncnz8d9qCw3RQMfKFBxmcEpWDybEbwVMom3Q5RVFXQRJ6svaqYkkutTkad3JAMpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RSLNJBwN;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A464606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A464606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RSLNJBwN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C37004E4167A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87769604ED;
	Thu, 26 Nov 2026 13:42:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53CCD11E680FD;
	Thu, 26 Nov 2026 14:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xqUDWasaCfPhDHYSBTjnp6pf/Pq7EjevJ+F+V/SKQbk=;
	b=RSLNJBwNJl30Iyh9xdc5uiUZwuXvIUs7M+lfMR/4H+Ea1ZZu/H9d9hccz+BUQJcAHCM2GC
	rYUQmk9YGDtNbim+zf9rPwBO5ZTPUTmYnmXxg6lRl+aZGRPG2I4XKMWBHeksYRkGdD7lSk
	CHLZUfDryKFA+pLj5mq/+Ku2vH64fKmlPZGwbdRAKpTOpeGj00erJvHmKimrONzXa+gKuS
	biC5w3SXdOylf703p/1v2NE5o7fkD4XVDr/p6t+K61JokrMiKPrxBYsoGDzWTZeBQAuLDQ
	ol559AUelk6rzt3IJr+vb204MU863KV6t+sofRhOaIDorts03T8R+3OHZg+ubg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/4] mtd: spi-nor: macronix: Improve general support
Date: Thu, 26 Nov 2026 14:42:25 +0100
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0Jm7RgKKoSV9zAs2jLqJNDitBAM4
 e5WPIHL9/Pz318hkDAFaLIVhGYO7F2C4pCBfWr3IOQuMRR5cVGqOOOgrXjHC05jiEJ6YPfAMDI
 6L2h70m4aUed1eVbGUKU6SFOj0J2XXXNrfyz0mpIt/kIwOhBaPwwcm2yujicUW8K3++QQvbz3h
 7Pay/+dmRXmmHdKm6ou711trsb72LM7Jh+027Z9ADFd6BoGAQAA
X-Change-ID: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There are multiple ongoing issues with the current state of the Macronix
vendor driver:
- wrong RDCR opcode in general
- erroneous QER handling
- issues with locking

This series aims at fixing all those open points. One reason they have
stayed for so long, is because there was no easy way to define a clean
per-vendor RDCR opcode nor to easily hook fixups to JEDEC IDs *and*
extra conditions. This is all possible now thanks to the recently merged
heavy QER handling rework, so let's use these capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Also prevent 2-byte wide SR writes in patch 1.
- Replace patch 2 (no longer relevant) and instead drop the redundant QE
  setting (also redundant now).
- Clear the RDCR opcode and the 16-bit write that SFDP restores for
  parts whose BFPT reports QER_NONE.
- Use a local buffer when reading SR2 (to avoid overlapping memcpy()'s,
  see Sashiko complaint).
- Link to v1: https://lore.kernel.org/r/20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com

---
Miquel Raynal (4):
      mtd: spi-nor: macronix: Clear the default RDCR opcode
      mtd: spi-nor: macronix: Drop redundant MX25L3255E QE settings
      mtd: spi-nor: macronix: Enable RDCR for the parts that support it
      mtd: spi-nor: macronix: Describe locking support for MX25L51245G

 drivers/mtd/spi-nor/macronix.c | 120 +++++++++++++++++++++++++++++++++++------
 1 file changed, 103 insertions(+), 17 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

