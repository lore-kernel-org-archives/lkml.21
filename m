Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021723;
	b=K+Aq5KegmoSLWtYoQ+JqoGpigUoyzGtFTJxrSaIlyhZfE9cizVqp9XMLl5UJCNEsoVvk
	 +8gmtOARz2F0QRcW8aBx/yXmM81znJApbM0Cbp0ZLeiiRbdxA6blu3kamNF3e6P4bGpvk
	 QA1PuwAHWx2yYQfLSXrwr5TTQ22iCkxpW4fsP07eQgT60vUp+sGiWb9isqzqmjlm1duZX
	 hGoKXgQbuJInxdjFUwBYMDTM1QO27R9MkBueuCmHrqtrafp5J+z2SicWSInvm97QI6rKY
	 6urzF74NNTKkSkltdZlIVPDeySy5Z2LsC1zbQJApDtRwqhg0vJB6OHlcAUg3tO8ABLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021723;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=JPkbp5InV5FC7GB0gqDPgA6oAFNUik/9gOcMO+3HEE0=;
	b=WB6Ko9HLFDXbyL4n1bnqiMnGt67Avtiy5h2DoSzLF2WXDc/LcZMQZdzHF/F5iv/2u1mB
	 xG51yrJKEtuQ6+YrG0rMTCoN0J18uqhePjTZWmllcxM66wqgHepe1ig+D4FlIX0xap+iX
	 4WfpcXLbuI3xyOBtfz+UGFOMlyFwpSAwkMp6KUD2uYMCyzinkXUOIGtNQUBUhiy8FQdUe
	 fwDxBFvPE54XSI1/CM1FXmt1tuY9NagkLNal/2NqYuACBoVBxjGHb/opeZjGvu26oM0oc
	 Amwm8+eWPv9R6mUpz+RofZQ5HFd/ErBD+tnSYJCHlXZskuOvEJdJejwVyK3B0aXoQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LxWSz0+I;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E5606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LxWSz0+I
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D442C4F77B;
	Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68FEA5FE9B;
	Wed, 18 Nov 2026 17:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E39311BC2A1E;
	Wed, 18 Nov 2026 18:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JPkbp5InV5FC7GB0gqDPgA6oAFNUik/9gOcMO+3HEE0=;
	b=LxWSz0+IyINs03TcW1uibwyfC69+6A5Y5CsmTZc1NrniJPJIxtQSpB2PJFVIF1/4MoPVyJ
	vufNtmLaGVhi9el1YTWu0ijjR7F+jIGne+N7YKbVigXBjCXsHjEgkh1SeCdSGWONrCyJjC
	yBY6OuT7eClS12P86+Hmcu9CPEClX3hb7SNIknqS+A43JaNvvfcg3XJ6BMBXPgg5XLaFd7
	QXpZsKoHm2GEcg5la/4uqPC/pqTa65JSIn0mTeP96tjFrkrNC3b2vvi6jFIltZLCBCUCJm
	283qblDbAjDUE3V1HrEpZYFkuqnXaeJR1kvuSL26QRMweIL/tC6GmptY8BAhHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:18 +0100
Subject: [PATCH v2 01/13] mtd: spinand: winbond: Fix an OOB layout
 inconsistency with W25NxxLW chips
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-1-55956313d6cb@bootlin.com>
References: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
In-Reply-To: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

W35NxxKV, KW, LV and LW have the same OOB layout pattern. Though, in the
KV and KW cases, they have been exposing the user data section that is
non protected. In the 08LW case, the choice has been to derive slightly
from this and to only expose the ECC protected user bytes.

Make sure 04LW which has been merged this cycle follows the 08LW
choice. All LV and LW chips should use the same layout.

Fixes: ea609469a3e3 ("mtd: spinand: winbond: add support for W25N04LW")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 810975808c97..49fa545a4113 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -836,7 +836,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0

