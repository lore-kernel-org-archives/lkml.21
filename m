Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525607;
	b=rIt2vAySq4G5JA6gqvrLflrlsrnSkmdoRGQjaPHDQB4ZZXGrnBiT3s1gR8ob3A+9sbpC
	 gCEHYYWvOSbxdha1fouxZgWP9BR/dufElFhpZ03Im7D2Obr92pFJi6X+484KQxtNKa4zV
	 ot9ozg8GFmqHnmiZ3nFumpJQXxXoBcU+gOeX4VivtWi5ulicHIvtzG61p3JMIHs+Jf2XC
	 cDncI1Ur/wfKr4b0Mr8xNyeLYTXES3Zg0rhIxrwaYpoShEFgk6Y0aQvv9iJZUzjqGn+Oj
	 y3xVTN4kF0FX9jg6nUJdPu/WipengCnp5cP4f/mX6acGLsJbqDo4w9KReg7xQ16Zykg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=EQHzCrvzke+hr2Xi0X+IPsE6+lahl8beI9U/c68AOh8=;
	b=qaA82XMzWrQc7Une3EMyokmHzn+2j5b+zioYwdgTgtjCgGgysWTlgXK9rDE75QFOI0dX
	 OdqSaMpXI6byTG77rBCPcyIjPAXZprJfLyaV90czk9gWXFr3VgOHNCoRWkC/UKG9oTsas
	 XJMWd6gXIJXGSJ5OHnSOB0cpDbTxSgNfoDPmdJisgiCdBIGzKhtu4viS2QI8pDkHSAQ2t
	 RYgmHiAtp1YfNT0ug3beyc0Te+QXqCF7/B1mpLM4NoRz+idKfXeEck0+h98UmjNFuDWG2
	 xU5MjrBQdBvepOBr6+OHPKTkDucL3i7fZz+41bwmWrFnzbzQUfnhZLUmTI9vFP+62Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Y4bAG+;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F1606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB0F1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Y4bAG+
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso4437397a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525606; x=1796130406; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQHzCrvzke+hr2Xi0X+IPsE6+lahl8beI9U/c68AOh8=;
        b=x2Y4bAG+KdkWH2rXT74EDRPqvO24M5wAjOWLSStMDSjJGJU6TvRSNVKzex4EgIxbR/
         mhigRJITCC8kJrdE2/gRQerH7XAlXCM6t1EhGgD6PEDPg1yaOUyCeYY4Oy0zm52Xr7uq
         vlBjCMALfAiIGV3Xrw+UlB8o/U7+jOv69mbw6JuCuyW+YoZK+H+1IdVH3aztxdgQvgfP
         njFEd2TjPebGLyEASpc6X+qfmn4MHEQPG5fqj1/tbIytPHr3u/WZBZfz0/U5ia1fXYem
         ny6GSYuly8w/Qgb3FXAVtb8ixsxDCvtJadmY7lnsQ5TuNB2HP7yain59n2HPH8yQ/IQw
         p8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525606; x=1796130406;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQHzCrvzke+hr2Xi0X+IPsE6+lahl8beI9U/c68AOh8=;
        b=nMafLzX+mhSh0Q6c/fRmeYjUPsXsmhrCNbGR++mGhhyaV6WyYMRcvYSWp/Bbrcw+rS
         6TC6mteA38G64yq4NiTLeLNUfHrgiVdHrUIgiVMvlj7UsMQwPIrxzYl7/9CLj6gS7MIa
         6VZLLl7vw1fDIZO+2lFLHPIHneVumTcqwZ2kKf7DmfhRUS7dP+BxU+8fcmMDYSFpeeWm
         Lq7OHXobH629Tut3S33D/zvlYNpmTdbfQs8U6m2ssTbILBaoiULSpqu++K+ZqWqFLlE7
         VfNfkm8/ii8sfYH3kpQiNC+sn/AFUl4Q2MiK8V8HiN3UgGkWQIa/5RxDlFLLdurV6off
         Chhw==
X-Forwarded-Encrypted: i=1; AL+hErEtEbCqtSqjSMceFgQjo3u9ZdAsOzpEPPJs8krEAICPkDwiId8EjnNzjx2ANqDIwRAd0QhmqYmsT/jYKFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FCTlUoBRnNeIDkjk+3lnh9alpm85vnnjJugFyX9eo9izmtyIp
	Vj8Qa78r5TVayklnrXVHcqnvslTIO4EGibmZ0z9fKDFr9DqLf9DCbXl0
X-Gm-Gg: AZFdTZd7A4N20JbfPsLr+wcrqORWQdAm5h5h5JMvWE+sCc6YLbLIinM9jobA5h4TQGx
	xWuozss2UEi30T7QJ51sUg01eIDaWN9PLY2aCA8T5X2deklOnCWCNXpRKW5tYHmwwDoBsDOn376
	YNswtsvdoE5tt9CEFGNuvz0g8bNE1yxGuEXRi/9bC+d+p+KBI2thzQEMRpYiopwqbEs7wvJfSxd
	lNdGoLaKZTDuqG8Y1AH63cK9Vrnr2Mnk/+FvVqLJuXAtjwyAWzMo8W0QrOY9hrgW9flOOQ0/OnH
	nh+Nny0VH9auUkb8KVflVb64o/ud4DKbYGbSoHf/RUvVpYmpKmRMHFwjn+jQMSQE1sajca2nIgU
	hcWHSZSAeZO9vlC4Y6ptXhX4ZROk8BdYHltmE3lT6pVYFuNw/cLbIewSw7bo4ZoHZyZL0es4xU5
	uDlbzeuypscSfFauYx2I1fwFjsXRxN9ql8Z6peR1DTAUhK5342kDCafUajiq/99l37OtZ4wnJOA
	OFJUqLO6FvZpwNMVdJ7sH+s/jk14MYmJv6fOK8dkoWl5LfwStq3btHajNwTD8EuPCt7qeV672kR
	F2kdFpJ7w6JAX0f5klG+i3M2y5X9CoUYceiB0YwYuiB0Jf1SSRhn
X-Received: by 2002:a17:90b:3fc5:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b41c91135emr9461581a91.23.1795525605953;
        Tue, 24 Nov 2026 05:06:45 -0800 (PST)
Received: from Fantast-WT.localdomain ([120.229.37.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm25959489a91.12.2026.11.24.05.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:06:45 -0800 (PST)
Date: Tue, 24 Nov 2026 21:06:21 +0800
From: Teng Wu <gigadevice2025@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
	linux-kernel@vger.kernel.org, teng.wu@gigadevice.com,
	weijie.huang@gigadevice.com
Subject: [PATCH] mtd: rawnand: Skip timing mode readback check for GigaDevice
 NAND
Message-ID: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

GigaDevice raw NAND chips (manufacturer ID 0xC8) support the timing
modes advertised in their ONFI parameter page, so there is no need to
verify or enforce the timing mode switch on them.  The supported set
depends on the supply voltage: 3.3V parts (e.g. GD9FU2G8F3A, DID DAh)
report modes 0-5 (3Fh in byte 129-130 of the parameter page), while
1.8V parts (e.g. GD9FS2G8F3A, DID AAh) report modes 0-4 (1Fh).  The
highest supported mode is already picked automatically from the
parameter page by nand_choose_best_sdr_timings(), so the only thing
getting in the way is the readback check.

The GET_FEATURE timing mode readback on these chips does not reflect
the mode selected through SET_FEATURE.  The strict check in
nand_setup_interface() therefore misdetects the chip as not
acknowledging the requested timing mode, printing "timing mode N not
acknowledged by the NAND chip" and falling back to a slower mode for
no reason.

Skip the readback check for GigaDevice chips while keeping it for all
other vendors, and go straight to updating the interface
configuration.

Signed-off-by: Teng Wu <gigadevice2025@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a225b10f8145..8d77ebac4939 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -890,6 +890,15 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 		goto err_reset_chip;
 
 	if (request != tmode_param[0]) {
+		/*
+		* GigaDevice raw NAND chips (manufacturer ID 0xC8) support
+		* the timing modes advertised in their ONFI parameter page.
+		* Skip the strict ack check; keep it for other vendors.
+		*/
+		if (chip->id.data[0] == 0xC8) {
+			goto update_interface_config;
+		}
+
 		pr_warn("%s timing mode %d not acknowledged by the NAND chip\n",
 			nand_interface_is_nvddr(chip->best_interface_config) ? "NV-DDR" : "SDR",
 			chip->best_interface_config->timings.mode);
-- 
2.43.0

