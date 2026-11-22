Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339559;
	b=rbCa0z3S99lBp7kl+vIwDZKdQTxBFd+FZ4XUDJSkAMDete0Q2Skror7092Abm5CACj7R
	 pNVi+2N34i7npeIRmbethuz3+IhPnVle4jUf8vLpCcdm47Ftmvb3Nr+yevWJxwjk0jxre
	 rHe8TjwtoE/36nlE+5rkoNaZa/XYV7ke3VcLXakR3YsV8lYRJHE4Zy6sxBoAxwuTjRcpR
	 xFCy5WF71Gf23eME/zqgV3VkVr3xR8ELMPD1T9zxlupS+FIH9AYS9IQL8CR0p3iDeU6eU
	 jrdBo4uuAvtpryhUm0zJLpQEMPQ8zuEmkDxAzXW+UJCtpiGQOJpEknFHiDI/h5mFGfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLux4IaKjACihTjDhvHAsFdwr8NDbNNSjSatrsNIAE0=;
	b=UOx901+9Ag7CNbttgsSo6cSo7qwZW1hSyAwmzKqxqeylNxU2DTJOcpzxM+37fj/8weSL
	 8VlKSgQ/x134A4MM43fzc3ofe18RO+yUM5w+R56SFLObJIYVLFCLLAMUoisCr9BP7tE0Z
	 Qyy+OrIYaQfuEbpf08G8ehR52QwEVyYbT6GnQsU4VR0bJbMy1keb3OB9N2L2or/xcuqEs
	 wq6tNnaStPYHK8lbVs73b7IhOHxtdFTtEKzrcRHc7DDRzXAKMKMxlU4YzoyihJKLlDhib
	 IZoxYTmZmtDqBap0BWI9SZCbQPW+mT/AreZphol5L2pNI9ZFQqJLSzW+bSkB3FlbUZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xs9Opo7/";
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320E606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7320E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xs9Opo7/
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55e0090c580so931502b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339557; x=1795944357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLux4IaKjACihTjDhvHAsFdwr8NDbNNSjSatrsNIAE0=;
        b=Xs9Opo7/eNxoZMPt/YYTB88CMLCtnNDN858vBx0SYeXA7hTIEeYVIvnGAZGGHO8nif
         tNoaEs8aIkCLH4y1SWvbwmCGgro5qF4vhKEdG8UMIGhJEmB+d9y2YDMri6i1RDcV+936
         f8HaWEUhRMU0GwcnPFAXKo2ccWO+LA8f42fe32I1sBx+NFzEKjlaUZOc96LYBfIJIlzv
         d2b04TCy+N1zIEaEQdF6bYBpyg55smiPcxDX5Uo0J2nxD/6r6zNl8eJ2vj+E1gLBMMon
         fjStYHHZlPkV0w6sIX7zy5IMnDiLdXdYk/je3K5cUxKDqY/cp9a3uiUZSoFghuol2LwC
         uFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339557; x=1795944357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLux4IaKjACihTjDhvHAsFdwr8NDbNNSjSatrsNIAE0=;
        b=UyS04c8PnpOJDmAnnYcYb5xWEiIWJaxxSaBtFc/fF5TAHRM4GoyHZDRtC0xef9Yw/A
         1l2FJCXg4wSxKJHhMOSxd0E16SkQlwDjR9IS/mEPp4UUS4sEEtCgIj1c1Z6xvguN7RXP
         sNvMlOkghx8lpANcudHhmO03SD7Ba2YIxH3MCviGhoDQYzK5uzw0YWeskDhzVPNgjdv4
         l+mjtSmwV/0tLmaT93rvx6bXbHtEMhqKfv8OlDALC6hn3vec6ItFKauh/8eAL+mlTW4m
         cOAHCOeZZwVpJ27rD58ieUaL8uu5UQ0MVMHuV6ImdeJ6Duf3/8lq+9RbgsNZwNUWMIhT
         k16Q==
X-Forwarded-Encrypted: i=1; AL+hErE/J94eEJUvOFQa8Dl6ZEIDiHm8/f2eEcPMdOEXAeTaNUYf81ajr9ygLo6JQPeC1qzIqCGUVaI38Wx7DTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sd5bCoLWNDSItZ9fOFSs4YtOOSBAaz4wxH8OmnTkaqvKgUvC1
	zKaUT2F6Np/Yh/hq5GIwAQ96MQH+TaiEqPYRbfqxPXdymBgcBcCBKbNU
X-Gm-Gg: AZFdTZfzcgV+/g0WC3xW5uY7GAcruMbjy/R79GDXzLH2ZFliRSOP2G+h/CZiZIMTw6x
	NGoFxjPBVRI9IHca0zvN9hmtHN+QbPw7u7BIiXdTHEuUNv4ZCksjVCCtcZIHozRCiTkDhxzshTP
	0TsnfIjYUvw0+KGtDzqSxQQ0NrGX5wzuseVjqUR8n9nXoh1/nJpIViz297D0cUrmzKAcXMCYA6Z
	zKexU6bno0XWcFtGBzNLl4flEwebLJuDHivHtCy9gxP6IibPtYaZmmEmV9E0pcU3OqdTPkZy3TC
	DP0DLFsQr9d/G/EK5FzAR0eTMVO9P7XXkKJMxLGNyAWIlMBZMBFiEvX5/pehp6dCuU/k5jZbrLc
	Grh7vGz64PDs+RhucxCpNpoHkb5Us5Ma0x4/7HzUgg5RnzNSuUy+l7J0uphlMhSXwOC8v1OpblT
	1hbikkoVEJ0EwjglIOEJYAnqF9JCdaPi2kgf22eVjr5BrbkkVv/PAWqzxC4PN47AosZA4bBv7sd
	3vcPITKNTChBUWuDklNCdf+yVuitn74CGmrnNqNCFXigPCO5HM30q2kcBcZtUhKCHCCeBqd+8eM
	nq8eT9OKS8tFD8dzUohUc+zeJDEi+W/I0ohZ5vWSE33OCq4l3PE/b7j+0Fomm6DkZMSsg5t/VCR
	uaz7HnD/AK0Zw2/aIQ2mGmrsjpFKVz5pGWJpkANtLzs55tEZ/FG+KIbmPl/cB+lavMCHkGpp5Qw
	hSRsa1J8dhIIAVKbvtmAUKq7B+z7LtZNREHhbBniVvFgLQlPef7oa7
X-Received: by 2002:a05:6808:1384:b0:4ce:a4fc:a848 with SMTP id 5614622812f47-57a06a0da3amr10323868b6e.6.1795339557259;
        Sun, 22 Nov 2026 01:25:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm8698476fac.3.2026.11.22.01.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:25:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 02:25:20 -0700
Subject: [PATCH v2 1/2] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
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
Message-Id: <20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com>
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
In-Reply-To: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. Normal NAND I/O
can interleave with these commands, use a different target or access
pages while OTP mode is enabled. OTP I/O can also run while the chip
is suspended.

Make the existing NAND serialization helpers available within the raw
NAND core and hold them across the entire OTP transaction, including
restoring normal mode and deselecting the target. This uses the same
lock ordering and suspend handling as normal NAND I/O.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Cc: stable@vger.kernel.org
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..2668f527e637 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+void nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 58dbcb004a62..2f1c973b8d3b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static void nand_get_device(struct nand_chip *chip)
+void nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 16847f28b19d..d7f5a9e7c240 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret, cleanup_ret;
 
 	nand = mtd_to_nand(mtd);
+	nand_get_device(nand);
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +427,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret ? ret : cleanup_ret;
 }

-- 
2.53.0

