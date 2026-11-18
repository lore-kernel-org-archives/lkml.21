Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023461;
	b=wuQjxmFuNVvN7CeucAYzOVwFvKcZLkKolrIF4VY+LCyGaOEl6Aib1RrbJdk2udYbGTHR
	 1JrD9VzMKX0EFMs7WZU6fCYXrluOluQzS3ZybZup+TvdML2x7alq+g5nGp3YB8ppa/EAf
	 9F5Q97MEwCt2AMtdK4WX8G27Vqdo5MUW2SmP2FuQ5vpQ3IqZGAlmLcBY1jc0ED0TTmqIm
	 KUGM6V2ye9l+6n9hiQynf/TFlZ3+9Cs7xyTqeUFaKGVhWT7msVZpxoUDucfNsPHWfQIGI
	 vyRAMmmQ3+ow+AO6yqhPLqkeVHpnbuCB/nlOLMg0rv9ql/uOCy1dww0C2hFUO5hVAsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=A6PuFLIJYWuXo/Cy+3hQI8qFRt6kaCnSgJyOuAQlQP8=;
	b=hRTJUfBdJPwm6ZoXM5RhVi7cvhjAkOJcHnq77M7not7buRWfvvuGbgS6i8qo3IuZW5M5
	 x6a6J6g2JtNHmlxWa7xJIAewgUR3tm0gIEG3OBMplXthBXsUYgWRz/5ynvFHFWHj5yiRe
	 XeYXtk+HNDHk2W3VjKHyy561HXhjxjjNe+B3jdUwAtq8Stxkm45+xXbBdhGjH4umKJTMc
	 rj1OzolVrKzN2Pk7kvR4BATj95riuw7RobKN5HRausU2GwtpdXSLwjwPr7S+y3F2NynGf
	 mkM4vyATwwr9p8kVWcgDnvGzoAJ7Y2HjPo+ZCPEcFdeVc9UkOHLyhOqSrRl4BQoXUxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eeC+K4Y7;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F470606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F470606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eeC+K4Y7
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-716b58a4365so752283eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023460; x=1795628260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A6PuFLIJYWuXo/Cy+3hQI8qFRt6kaCnSgJyOuAQlQP8=;
        b=eeC+K4Y78exxOifNsTSTXjziuDNWsfhJ73u7XZhSOqAFgZjF5tlLZhtu3+M2ywW7wY
         xZ+zh5O+BS9YE+qs3c6o1zYvSh0wpTP/YB/+Kz/3iQhQY8Uku02tnSs5L7w1rYsH179t
         6wEg6c+P0WxQrJ5vywycNsyUXzOiI1yX6dumdQYH6TusXaw9aPAc9q5JjTStkGl2o78r
         sI8Y4eyT5b+O5n02lN+cdRY2MuohGVs5JUgRP7Xgf2AFXzXqwKUbIL7PbpHxvtw5rXWh
         yueEbOfP2OCFyGXJ2F47gL2ZVIRrWxzIQ0ldaBDsMa9wQe/AlYjBg+zLN4XWTR3TOjen
         worA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023460; x=1795628260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A6PuFLIJYWuXo/Cy+3hQI8qFRt6kaCnSgJyOuAQlQP8=;
        b=ojLAFdqAZ7G5KpVnQMUMq0J+MnjMYtuMUJdqwmMPj1ybzhwsUTNXQuPjEQHOQHnwvc
         LOINKhd81yL8KhlzjHXFq3G3OzYBB1RP/eMBH66+AEFKaiRK3/RNpv7i0hZks7Rdg2pF
         uzIRgQF/DM01jQ/RzknRmdGDskS5EEjyvT8L+9YL6UnErdmJdSI/tk8yJ/4dXJZPoBSE
         tRX5VtE/XqDszFM1K7D++o67WBE/f7xOyz574E5qNUybSDCFbPwbY5uykiTu8PRkSMZa
         SWdPLx0P1eJEmeM0DRrgcFogGFyPDC6N5u4KNFD/pyQ34R7lLdhpKoJI9bQDO2PLZYzr
         1HiA==
X-Forwarded-Encrypted: i=1; AL+hErECFGGZ8Fsn3kht+vqYfEHI1DShep5lybN+NT8bxeqphjLOhBIYluVmWGza6EezMKpooM05+I3Qf8Hb0m8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vMmKQuCEMn5koXZqr6z4bfPsQy7MKruMY9SK53yCUaZu+GQny
	srnUdiiDh4Brv18pOYwczcDONSL0IVeWg+yK0v++wo+0kANf5DNx4k+H
X-Gm-Gg: AYBFou3dYX0Qq3ekZyCURg8RoT+kkxuHrLaj+NT0QM+nOmuAGRV9OHRCr9UV03X4dV3
	cPJtUYpatx33TJaINULaerz8gIOnGKYzARWMvHa9Si7491Y3mVBUyHPSx5wKzndUMxO20EzpjSK
	SXy03oaJzcVPoNyDqlf5nX41EZAXTEtPWH+mjf+VMUkGd0hvvF8wieBs0LC++xotBv/J6U0wYpR
	PQyqemzS4w5/hYlqiiIXZlukNJ7M670AiZx7b93SqEMxvxVN89HPIVASRy8cmUROjXq0uCGfRZZ
	xpen5j016bQlsv/cyCLg7Qw/BfTpRYQTlLcVM/Z5sETmiJDIQYi1JJd0gL+85v9vJh281BTcaC4
	uSW5F0ofrUHsdvyTmFfqciSGQ70OLJr+E+qiAJd/iNC1SjBIsYjGtwAF0NC8W275RhHeFwMwLDk
	/88kx92XnQ1ya7YNrHrFg1QS2asAj2WwBlcg5a6C4hKOpjiHEmKotupuWY8yPamJiOOP+IpCgUm
	ud3q9ibuMIOoLgMkwi8L5dlrNQTs2coF4V0vPGVDy97+uc+H3X+HTZkKZv35JDRV8ftJ4iPSeGg
	1SpnXm0fjcO86nHtRuQRt0sA9utVPsta0i5eELebADzRQliOhgpDfjlZFLvKy4aaPkrepgq7hj1
	gH+B7wrP6w8fJsVWx7oSd4dWS0PHPGSYjxwxU9qOFUWTD+y+ln4qn9q3LAwgg6Z/fv5gRdgz3rv
	iFAR0TcDsjMKF1xTT3F8C4ssjDowa7fLBABHqmo4DUWTOImuUFHl+G
X-Received: by 2002:a05:6820:7090:10b0:71b:c44:1dc0 with SMTP id 006d021491bc7-71b185da426mr1708265eaf.76.1795023459992;
        Wed, 18 Nov 2026 09:37:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2863717fac.6.2026.11.18.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:37:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:37:28 -0700
Subject: [PATCH v2] mtd: rawnand: abort BBT creation on scan failure
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
Message-Id: <20261118-submit-rawnand-bbt-scan-error-v1-v2-1-c7b71dd22ad6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ7CIBBFr2JYO6YDatCV9zBdAJ22YywYwKppe
 ndpPYHLl/y89yeRKDIlcd5MItLIiYMvILcb4XrjOwJuCgtZySNipSA97cAZonl54xuwNkNyxgP
 FGCKMCIhaNVojHawURfOI1PJ7TVzrHxfHjVxevMui55RD/KwfRlx2f+SWIlSWWq3UHk/aXbrB8
 H3nwiDqeZ6/PVfV7uIAAAA=
X-Change-ID: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 "Artem B. Bityuckiy" <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A non-ECC error reading a factory bad block marker from OOB stops the
scan. check_create() ignores the error and can write the partial table
to flash as both the primary and the mirror. Both copies then list
unscanned factory-bad blocks as good.

Return the scan error before setting the table versions or writing
either copy.

Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block scan")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Explain how a partial scan can record bad blocks as good on flash.
- Link to v1: https://patch.msgid.link/20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com
---
 drivers/mtd/nand/raw/nand_bbt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 93f162805f31..3ca1d7fe573f 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1006,8 +1006,11 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(this, buf, bd, chipsel);
+			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY)) {
+				res = create_bbt(this, buf, bd, chipsel);
+				if (res)
+					return res;
+			}
 
 			td->version[i] = 1;
 			if (md)

---
base-commit: 292f737382d3913d0d9addf220b7170fedd7a04f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

