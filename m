Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629740;
	b=rKbkUEq0o+pWXQE39ab06hdKzkZ+KF4ZPPI13vOYNX1l3ErwWk9IJ99KHdchLV5IRfF8
	 0BKAFZLwtEqshixDUjVbVfmI7J78iDmXR/M0p8/OR9UZ2cT05RzxJIxrEfmDE2Yn0MthE
	 eIn+0Mnylj3dlg/EWbYkXPKUVymbDYLxKmOljArUDK1IdD38uPAnQr6vQBOBCaXBajfiw
	 zu+iH57x47mptjJdUEhPaeqcKBhfcxDToEkg4tcvCQREv1PAZKPKQNw7XE3k2nhW6bIOT
	 NwuXBAAcI7+DFZ9BuZNHzNDjoll/HcGJlA8J0/EBEQgBoqeqqUZ2d+DsoufUK3kS56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629740;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=tCuIzxl3yS7yER97h03fbHyTUvRxC3cOGhv0cQ+k4KI=;
	b=aeXj4+37S6kxxuDVO70QXxlxLrzNmEvCgHJjlCFPwAyS/02Put4XTkTwy6nh11cSMC3a
	 Gchm3Wg0n5g/g2dtNQ5NHpuX7OlZ6nOpjTrZSVAsUiT1NuEoWEwuDtz/xh4zDbkt11F51
	 Ps6rFRYAZaAZioKcpCbETCqHmrui2fK20JLNxo2dRNEFL+rYgcY3PCj28/QKxO6fhyDvO
	 dHB9Usv6EnoUsTu8thg20tWVFPF5bokSumnm3FPhR6iWzk0kOwr+m2CPXCr3GJXzE3qfv
	 9TCrgfbb93WxZTemEFbfuBrDIWQYjGvctbjfPFTY9bHq0cB6wKhJXgIF3qiTnWI56zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oxhv49Is;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A767606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A767606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oxhv49Is
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 170A8C6221E;
	Wed, 25 Nov 2026 18:02:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EAC360480;
	Wed, 25 Nov 2026 18:02:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A9E111E6B0DE;
	Wed, 25 Nov 2026 19:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tCuIzxl3yS7yER97h03fbHyTUvRxC3cOGhv0cQ+k4KI=;
	b=Oxhv49Isr1blQ1tRXrq61D4mu/qNgs9Aw4FD1PlbFUy67HK/EUPfrYSriu05myDYKM+FSR
	VZpA8hSk5VE0mWJ8mhF2CzaazmvhjO/7tatFROW8XpIh4XIJpkLszxo9x2aknyXbiu16ki
	Y07pQC2YY79X5UZ1NosZagGRNGE5i9fmkKJ+34lOeSVrA4Wwr5HFgT9mny3tP3wWufvSdZ
	0Ulcjk+oafCAONiVlcf4yBcrYmVr7Tyl6BtXgKo7VHiy/RnYahLNpMvYRQDWAU+W/e3Pnp
	uKdCVLyafJE4zissHm7bjm2aMeUhn6RKzYeJpdPfR/TxAU/RjcKJTeQnWBK2fA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] mtd: spi-nor: macronix: Improve general support
Date: Wed, 25 Nov 2026 19:01:33 +0100
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBCF4Vchs3YMBRHDqxgWbRlxEntxSgkJ4
 d1tZPmdxfl3SCRMCYZqB6GVEwdfoC4V2Lf2MyFPxdDUzV2ppkOnrQTPG+aYFiHt2M+YIqMPgvZ
 D2ueIun60nTKGejVBuYpCL97+med4WuibS205RzA6EdrgHC9DtfbXG4ptYTyOH9iogCmiAAAA
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
Miquel Raynal (4):
      mtd: spi-nor: macronix: Clear the default RDCR opcode
      mtd: spi-nor: macronix: Clear the RDCR opcode on MX25L3255E
      mtd: spi-nor: macronix: Enable RDCR for the parts that support it
      mtd: spi-nor: macronix: Describe locking support for MX25L51245G

 drivers/mtd/spi-nor/macronix.c | 91 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 6 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

