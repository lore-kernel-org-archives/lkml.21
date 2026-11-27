Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803387;
	b=fVjy2EmywG7TfgprKHSZ+ds/KUNXS42PanPActtWdP289HfpYKZOtz+1oiGocXDaG4Va
	 qWbVU0stVX6UCcYrvMdzrXdQLhcLJBE1Pgy027GOC6spcBMvZAHTVJBFtLTsjAAjVGMU7
	 Iir7xGdFIAmQzsBWgvyHFZ0McW80Cpk+U2bWa2Yuiftfe416lUfjfWPM2lRFjEgawLW68
	 aZjOyENjKnjIWXA2cxWeBny5EgBWTCeR0WShUkplu2m3hkRPM5sXfqr8Wpi6b4CoZQP88
	 +czNmngVnrtoZR6YITTGw7ofuM/BSO/R9EfqSCt1eo5/gZ5HrJ211508LMBIKYbw06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
	b=U5qdcuQiFOTNPzzGhMpU/d0ljQdwCq6B8496tvw4Yl3MID/sDYMhGv+3n4YKkDTQU5tE
	 f6grnUfl04zucCod9AaKlDDqYpSRbWyDTe99+LGViyOQdEAfLcOzJc7/WZlXP3cnKP58e
	 ejRC11MWMU1yEUY7Woabu/s3C3zuQf7JxGFRWqwtiD5EeqJ4X+hzkehZ66CUnevSXKNxP
	 UF3cndYJ0Z/1QMQ3WyzuuWDzqjECAt9ML1lrzcasR2wAP7eKvqZFOBVDa9Amlvqtr2gHQ
	 5vcSdfWuyKbYU+Z2DRPcl3zf9qFBfY+5M3yGSJTi8ghproU7BZm/kDA9fVZ+MwKjtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtosqRNs;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F359606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F359606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtosqRNs
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3448672a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803386; x=1796408186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
        b=HtosqRNsbIzl2DkZ+uJhpkTEt4vU/840aWS05VouFYYlnAck/LeVeOAEagvhtIXJNZ
         NvlNWH2HslKtJPUCc5ItcJuPDT23SrAwyIT9Q31Q8/m0X9Tq0P3D3HmJf7P9WcrA31Wk
         Uj4DrkuDewnSJt+xPqL/qyxL+egAMewAxCAurz/pJKUaRiqVNV4/eLjXUyndwq+GPtET
         8d/jzQMRGG/ManIlCXx4q1V2xrq0Cux3kC10ONrg/d6mgyObfdjUBzh9LjuO15kFUtgV
         UrvqNA6SFr1A5wsgEaGZmGusEajxI/pVn+n5EGWw6qiUtfXNnbNMPJ5WZhdevczWLKlH
         hWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803386; x=1796408186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
        b=NylUtwezol1iQ1wVPbD3c8koS4ppk/1ULvPMFYzdTbSl3pgdIO5O1foll01L5s7T1i
         qUjqJB1ExEo2SuJTJ88aQEwR6HDoWJXU0nQLY3lvACWVkKR/8X0eTOJVu6hl9weig5Ul
         YZbosnXMNFr38RxP2gTJ8apkuxeLU+AHFsbpYCGVDbMmHH6LFiS4AbYUcaRLRaVjLCIr
         AOtugQEPTe8iGKeo9tR/e0mmfWc4W8XtJvupuzIiGwRCmRa8dGGCsAdZY3Gaj4F9RfcI
         1tozlEH/OOW5pPMVONr+1+AsPlvPMZVvK3r88hhICxCPq4SbH27ejval5K4DPeYJJUwi
         p0Hw==
X-Forwarded-Encrypted: i=1; AL+hErF8Z08rNzKb6HJLGXXqGJSyfRFtRBMRWxilL7JqdYBjn2JXw+ZdChfQruDugMXdmQWKElZQwd7yi9uAPG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o2f/X9tXciT17g9W8BfViZvcK1tTkOYr0NQe8MYT7Ge94tKbU
	Vvy7l3UlXjdp75jg/vboFyGOdu5wGk6k2mLzlYJwlmpCzV0QzxnM+QKD
X-Gm-Gg: AZFdTZctfCX8zwO19uTi/2qLGdYEvmmVdrw4CJWOTt2ch2h7FPU2uqYV1Lw5R0jVHCs
	nxkfwlIDwCLoLyve4zsD9Htvw6bK5uDceTiD3veVioxXyzq2LOhnWF5Avq1rjyajHH5ue6IDBsJ
	9GyKo2yd4ExB2npLws0DhrHqLZagyIqJ3qquX2Dtzo7n2lj+drzweK86NbCcmT5/GJhGyx5F800
	kAqEDfD2+z/zvqz+B6XYXzm1V/jGypj2ZHQT5Hb44ua45WsZSzM/Fr4NXpmXFcrgGQO7GYAeV/4
	V2u0nwNU1xYwrvBprsIf/TdBdY1p6Dtxj58u/pJdjhCHQeWm6ynt5occsTblCzdEXTeUBz3IIzL
	bfhfnZ3Abqrud8QHr0oAD8Qgj837fpSzBPMha1pGAFm3dzhSPkkcp0DEeiTwPvYEYQbKtkRYkJ6
	bQ94jxGuitjsvngR7nJy6FUpq1zbZ3z+fONTd/nde1jRU1CREtQ7PQ/vfBQxR1Ujlwb3Jxka5oV
	RKzD1qGdSUIGzTs90NzjZJvqGk1vvxoEKoZqyMPyLbn2wP9gCU5agtmOJcEmEh6Yb20kt57Nx/G
	2eEuDRUOvBPCLgfYNvKQqIcxef1KLVDvQfniG+C/uKkU6GV73w==
X-Received: by 2002:a17:90b:3810:b0:3b3:cb3b:1965 with SMTP id 98e67ed59e1d1-3b41c8fe1f8mr25142628a91.16.1795803386248;
        Fri, 27 Nov 2026 10:16:26 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm39867121a91.13.2026.11.27.10.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:16:25 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	vireshk@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 4/4] ata: sata_gemini: add missing newlines to error messages
Date: Fri, 27 Nov 2026 12:16:19 -0600
Message-ID: <20261127181619.183139-5-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127181619.183139-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Terminate the SATA clock lookup error messages with newlines
to keep kernel log messages properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/sata_gemini.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index 9d87603ef531..b69db749b49d 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -227,12 +227,12 @@ static int gemini_sata_bridge_init(struct sata_gemini *sg)
 
 	sg->sata0_pclk = devm_clk_get(dev, "SATA0_PCLK");
 	if (IS_ERR(sg->sata0_pclk)) {
-		dev_err(dev, "no SATA0 PCLK");
+		dev_err(dev, "no SATA0 PCLK\n");
 		return -ENODEV;
 	}
 	sg->sata1_pclk = devm_clk_get(dev, "SATA1_PCLK");
 	if (IS_ERR(sg->sata1_pclk)) {
-		dev_err(dev, "no SATA1 PCLK");
+		dev_err(dev, "no SATA1 PCLK\n");
 		return -ENODEV;
 	}
 
-- 
2.56.1

