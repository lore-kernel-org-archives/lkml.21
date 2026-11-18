Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024360;
	b=cNMuijCptXHLrAvSgraKiOrc8aPqi4b7jnktWtGczjM4u6LYR4q0IysSfVdm08t2icmn
	 B6Aq43RrFTQ4jKfjwyhDYmzfQF0vtH+1U/6EhXdIjbTknf/6wBfHx6K5aBoDkDT1TIYuv
	 hbyqvOfT2lK9A/rE4p4rv/7kh+Ij82Srgxi22AhRn8Ce15C20qcverYURc9nscTGuMq1p
	 lRnO+5Rr0v2gzCXcqI5joipEfYn3ZPpKWVrhczVGgMkJhXuzRpiZ7hC2+2rGVYjgnliO2
	 xF4VXZEVP7NoCmUC1SF+eDdy1rPDsS5QzolsRgx7BTlbCDlKf0L0GvUCDyAQlwQ8K/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=aKUtxq3JGEiVMt66Bm6OtfCap3a4xkXQXSy7MpwOvJg=;
	b=45353IxU6WC6Kmm3xNj1c+kA5yosZfpadfvAQYJ7/A3MrFmn6DopD3ki0HvXyjLl7gLR
	 /PesmxswidZ4emgomQ4UmA5VyGKDRGvs53Gec5QWHS9oZC8De4tlTU1cDn9EwLwroUoaL
	 mYRQ1/2dwSe7Rovo4YcI4De5lgq5X6VgFcRjecOmyX5SIhAvp3SKr00wsEQZiQSARrvDE
	 ytsZwKpIeyhvrh4orNEczFUTPsdw3gNR2L79hDz4yz6nT5BOZ5RATlw3bDdKJdKOFR5+I
	 W/l0gavqRC/npSzWhnhjBY3yXKi0lhgT5BBFHsP24Eo7CWS2XLoIb82uhT3qf+shE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+HBATH;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC78D606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC78D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+HBATH
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b28d9537bcso61474b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024359; x=1795629159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aKUtxq3JGEiVMt66Bm6OtfCap3a4xkXQXSy7MpwOvJg=;
        b=cC+HBATHSVHNRRJABnciF3e3gYl0avw3F11ef09tXNShn6SB5ytDKKdkWE0tXVxJ2f
         Fs3b5wg5re22Wnxvo/q84RPb/tFkym6QkWTXVTCsxxxpuWtHEqVjqFf24dy2zNSNH9Zp
         HzYSTg5NObhMACfw9MnOwC23j4t0naYB/vdpqgSvo7PSRu4cqd2Pcvk2EllPRgtwKPuf
         W4ewcv3HY9rZ6waB2+VCMml4yPRLRhY2k5IxJCJUoSUFicTBUpvQAlvj3otIOkjuXGwh
         LOAo3l5Y5EW2vEiI0NbHyrcvUOOnX9tOcWsK/wt3E2cd4YafJ6sXctM9K9/h61WbFW/i
         1AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024359; x=1795629159;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aKUtxq3JGEiVMt66Bm6OtfCap3a4xkXQXSy7MpwOvJg=;
        b=GC7VTofDFtmW0nI6pYhiI6wz4B6pXapl0S7zdL0nsviz4CJN5M1l7/1JWPQLsabE9N
         /orLEc9kob+a+X7MclFZRrzmlkyoZsu2BGwTF5Vg1z4Fc9XEnW3eidSS3cUgaodsxArB
         /xD9QzQHp6/073qQYOGUO8gCxaf7bXMQQ7jr2v0CMOYD6ZogFLPr0zSe+U2Qk9r5cXZH
         jRBi9RBCuqjGHu72RDZ/vroSfuVTooa4/1Gzf7BCb83AMi70Ms4BWejnxcb8wLKUxkrq
         VT3H+AJM81XdXG546YQWXUKW5eCRAViRsY4Go/pvYLuZq0nhgp6eRUcgViJUoBj8u7I5
         CAXw==
X-Forwarded-Encrypted: i=1; AL+hErHgKkQylVl6gxGEsbCg1oCaU5IuYayhwySULzGKboX5TgEq7jqTh2ZNHKyAct7rR5Bkaf0D/f5qehvpBGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z81La3Fvf0cvaRhLu6/pg6s8ttLLPmTEwOK0PRGSz+c4GMtdy8x
	pGFJ9FvJGhA0xiz/IsIbMElv0u4VqhWdxzF3GSmBDg0hxoADJD7gxnjlmL2wLZtV
X-Gm-Gg: AYBFou3KHwrgOWkQ/JES9ekIlZUtY1MWXX6B+3S/yXKHfViYWlrdMPlfUqQPRaVwmgU
	pkn3c6r3MU2Mh9+vQ5HJi3F4JD9KFmP2BxtlKqkazeZNG0NdaZDbYumCcmfUKgKE0Owo/9hkQXd
	atHrMpBudshxpD3a57hzpsysfx58X4PSPnS8fgo7ISwZuu8okrZnsIFOOpPxoga8ZMZ350D8+rl
	22F0wIedG7tU3jATMmMafHnElu1nO4fqKenCrPeflEKnqcWHa11YBN1xzVYnzR5opm6scBqajgR
	DO2kiSQJE2yiBTArDYS3Rc81914QQubexF7AHSgvNhemLxErLmpNvFimeV1BbQlpfYtpwk5rTyp
	I9OOiCRsNUxAK7PCZ7W8nrZuQVzSfZFlR2PoaC5EbwGi5JwtcRp6WA0BcqM5EOB/DkZ2f+Cv6ct
	NkOTn3LZB4edSfdbSIHwQwl3WQiew5UAZS2Q0NnWBK4C/vZiJsXEsMeRRsB994ORFWq6gRcW5oJ
	vXlYgVPKfRRcv27KHXQQOjCoEtskMEvYwLunaejtLo5bt7MPjxiPbrVC/sul1KMLQ998ljbsCxZ
	l7th99JhpTyQPh1zaayoFneubv2yjpxJxRaLoqkm3VOtOjD5JLuag/bVKK2Y+u0Ke4rGA8QkO8R
	Zc5afFRcXBS26cr9Qj0KFvc7XVRvzKTgTQKf2meVWDFRLhBWruJuq7buQPGsLhRYZ3A8EtsypsG
	JS2kQOfvIbAhNFy3N3hyDxwgWEC8oJZf2W2bvTUupXpoq9Ip8UF6dD
X-Received: by 2002:a05:6808:6d8e:b0:4b8:46e3:e229 with SMTP id 5614622812f47-578b95284a6mr194814b6e.21.1795024358723;
        Wed, 18 Nov 2026 09:52:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777a2bbc1bsm2095003b6e.5.2026.11.18.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:52:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:52:25 -0700
Subject: [PATCH v2] mtd: rawnand: propagate mode-0 fallback failures
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
Message-Id: <20261118-submit-rawnand-timing-recovery-v1-v2-1-d14d4b79e543@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQrCMBBFr1KydqSZ1AquvId0EdNpO2ISSWJUS
 u9uWk8g8zcPPu/PLCIFpihO1SwCZY7sXQHcVcJM2o0E3BcWWGMrZa0gPq+WEwT9ctr1kNiyGyG
 Q8ZnCB7IE3TaNwgHbQRlRPI9AA7+3jUv34yK5kUmreG1MHJMPn+2JLNfeP3sl5YxR6oiK6gOeR
 6v5vjfeim5Zli+Q+qbI5AAAAA==
X-Change-ID: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

When GET_FEATURES reports a different timing mode than requested,
nand_setup_interface() tries to restore mode 0 by reconfiguring the
controller and issuing a NAND RESET. It ignores both return values and
returns success even if the fallback fails.

Return the fallback error in that case. If GET_FEATURES itself failed,
keep its error.

This also lets nand_do_write_oob() stop before programming OOB data if
nand_reset() cannot restore mode 0.

Fixes: 415ae78ffb5d ("mtd: rawnand: check ONFI timings have been acked by the chip")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Narrow the subject and rationale to a failed mode-0 fallback.
- Link to v1: https://patch.msgid.link/20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com
---
 drivers/mtd/nand/raw/nand_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index fe8c6dcc9c07..e050b27aa578 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -840,7 +840,7 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { }, request;
-	int ret;
+	int ret, reset_ret;
 
 	if (!nand_controller_can_setup_interface(chip))
 		return 0;
@@ -909,12 +909,15 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
 	 * timing mode.
 	 */
-	nand_reset_interface(chip, chipnr);
+	reset_ret = nand_reset_interface(chip, chipnr);
+	if (reset_ret)
+		return ret ?: reset_ret;
+
 	nand_select_target(chip, chipnr);
-	nand_reset_op(chip);
+	reset_ret = nand_reset_op(chip);
 	nand_deselect_target(chip);
 
-	return ret;
+	return ret ?: reset_ret;
 }
 
 /**

---
base-commit: 292f737382d3913d0d9addf220b7170fedd7a04f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

