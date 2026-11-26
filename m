Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670130;
	b=puiZ3Ij3l2axx/e2QKGBsfoZtP3b6p2uLeBXuR2E9CelCkqG1FhDbAQTlC/DYccWI2Kv
	 Ys4l6pzSQAi7PVTj15gCrnQuvJbXOWOAfSlC+X1fOz1Gxw6G2O958TPl0oMYYRRS8EQXe
	 H+rsTxcJR1mCw0OMIu0kMHlIhI65AJVNldPNo/G/Y+2K1jlVUAMXc/JwkG2A+gNSvxNZ0
	 eQNG/+aGt0PFjH4MJvzA/3X6QsOLi2nq1d0f6I9oL8yngAXDPDdvrjj6E2RWwcsloT/WK
	 LgO8twySWs6EmowtmwdUu1oNoGOefl+izxJBaf5B1iw3SbztnKVKCN8+BF89+agS+bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aBxl91IFHxSp98BX9SH0COzdVVb1RDUdXups0y1oPJc=;
	b=SZJhKLTQ0k8fzulRFkBc4IokSDcXuaNnOEKCAf3czDl81XEOgBvGNy2uQtB+152JroBm
	 I7YaDNBTJw4o/NGpNBNQrhKGakQaO32qMnmmCb1KTcPiOKJxQkQ+ZDwt1DBt5QVF57sxk
	 IAan2obTHG+bEbEwfsaDw5e1JDKYrCQcS5pk5t8j4OHBqDzlrIlhkIhvw8u018UPotcqM
	 uv7NbFDA1NKtCfFPHteeDfzns/kBB8N20wk2HxbKy2l0NtoWh5WsZoysIhtU3Pgc3QvXO
	 W4RMfon8I6kb/H5Pr2zlUTbLf3uGlC3x+Kixki1uu4Hd48msvgwUN0AZRQuybRvh+zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqh43eIt;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB6606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqh43eIt
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a07078200fso3550361b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670130; x=1796274930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBxl91IFHxSp98BX9SH0COzdVVb1RDUdXups0y1oPJc=;
        b=rqh43eItLw2VvBUu8/ab2PM+vFYDTvks8O7GhSnvGrrkV0IwT+OBLvnt2+k5oM7AkH
         4EGMrSiOPtUmOsnmsFdVGXAp17J8K5Erz1xWdGyCX5wSSVu2TpDMlrqNx8nw2XYPE44H
         QYUmvs0mZGiZAZyR/dEzR7ZnVgVDEEj2groWruErQaHCXSun8lchlU0NOYeZf+ne5sVx
         exZIDgeRSlZg84S8pNMldg7c/GuwFsYotHQFMK1FSfkMU7trke11p9A/4EYE0coAqkDr
         WgaieWFnAE19Mh8Y1X744Qs7YEN3Wqo2GT9Noudp/kjpFDCajHJeM4chrqSpK9McxuKE
         8/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670130; x=1796274930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBxl91IFHxSp98BX9SH0COzdVVb1RDUdXups0y1oPJc=;
        b=Y6orCj16lPUBy4zVGRazC28FuBjl9nRlecrZcsqJaybCCvmXvg9XyUqsiLbNykafn1
         wzfWf9is9RsU+O6Sny5qc1aJdELRIsIfIkptmuV7LzHablZxAPkp8aEf9qcjJu49yugd
         UI8feoZ4TChWeLaAMl9FMkcRdoOWELr6WBgWb4/qIhEQ4DCskOhjxbfCrO+e8YV4f/v0
         HN6VucE135Gg3fYNCRx7u6LPepn/zSg/WReI1JiICuQe04K0s9m5NkJuYnuiYfn1CojY
         ljo1utNNNuPXPEvNIoAi6ZWTtk9o5Kp7aU2u7USiaU6fmyzaIJpTc4uWUETgrsANS3id
         1/5Q==
X-Forwarded-Encrypted: i=1; AL+hErFE0NSSnJ5tqvT3ifxeO3a/SBucjjv24YovhzIltzoLs419732G2q/UMQrJUwCZ62P/0cXa7/FWZ85IeWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92FphDWOZnjTXD7GqP6KdT7qHZ9OI/jpviH+omtVPq8G+UVX+0
	5nBgF8Sh0+UAcTuobG3E4mFHkwT9oQMeeSSw2iizazmxvPd4ycLtAB/b
X-Gm-Gg: AZFdTZdGy3zokTzPZsW2D7k6tbmvh8hwmCFtOnqUZnZNFsKxLd5XpgH2YX/RebgsXcv
	p44mLI3noofdJroXJMsbKBtqDDgg5mtLkR+RLVrJ4X79wQ0hTGrnfoK7oAy3G/dfcga4I6DlR9O
	CmRN6sR3XFmjigi5+sRTW9wzIdkI1yRRzuF3SYI9OW+6Mk6IEg/plQbFgtduwl1Xj8synAmhvcJ
	+78EjnRsaBhkDlkeVLKIqf7brZVu8b1leKihNV8ce2O4PTiPyyr7VaW5xDNX84YyKZUSP3E97Y/
	M1oX3l4IYgYjKv/u1JT1SkWSouO3g2WSF3l4auJ333BLnE743Q0iiBUMSnLEOc7TYQCctEv7ACp
	zctIOL7M98eYr0uv95ZKS7aq+SP32Y6uaDYl4BdCY+0vKj0CeyqsIb5ZSZxIDwd1Qjgsw2Pt1hB
	/LEe/ml509ceKg2r5+jV9AAO9Nt5Pcf78vacZ8+XaqU9XT+gyCJE3nLk5AdwfTGJeOcB6jWvCPU
	DFPDgk3WXU/z/UK2eE8ba4oBr4Ob7jNNHIgIykMx94bzy9qdIidJ+SBZkxQqSYMwmQ0ZOTSz4bn
	MhRdp5Uch6yu1OhFM3Foqq+9tmD57p6letTFrPSF0FqYLw7iPQ==
X-Received: by 2002:a05:6a21:6e82:b0:3f9:c2af:37d9 with SMTP id adf61e73a8af0-4014e06373dmr20130506637.56.1795670129999;
        Wed, 25 Nov 2026 21:15:29 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10179820b3a.8.2026.11.25.21.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:15:29 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: vireshk@kernel.org,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linusw@kernel.org
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 4/4] ata: sata_gemini: add missing newlines to error messages
Date: Wed, 25 Nov 2026 23:15:23 -0600
Message-ID: <20261126051523.14431-5-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126051523.14431-1-artem122novak@gmail.com>
References: <20261126051523.14431-1-artem122novak@gmail.com>
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

