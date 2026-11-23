Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447683;
	b=g92DtcroqgGsiox7rx0qfI/jH2ri4+TxQeAjGTaY/X4v/aZHqncqnwfrZikqEitfvzgr
	 y21Ybm/Odq5JqC3ZHUEuuOd3T+WvY2e3+Hr6EhKYjcMcdiNwzqrD0+BJkj/noAJxuO22Y
	 xFcldjcnDjGkkCTs60qaPM098dUHY1Ppz6LzGaX3ppQwkBmlLyyEkhLn+hHzsxcAoouS6
	 BTSbMEQ3g49zszGPG/vgtShMBhBbKr7LC9j0TUG/Cam9afHGYWgKsY2X4lS06OGhVyCuF
	 72poTryX8XRJtEVm7wIjKb4X8Pxv5ljP1ayfdEEPn+rqpFmk9KT6iMm568YE8lJ6nVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
	b=n95N5veVtOrjMdOZcuLWhEau1rBpu1hJy7Bv1hVoxLdYOwL3t4+qPRXh+w2TX3qTVqvI
	 HgTCYBaBat8v+9y3OfvtxMpZqdXZH/oiwqB8rKjQEPhQ9yNAAdu0Pj/B/NDhn+A8svfik
	 o/JeaFuItWXMPyGEewxxMyledfWG7pBNo+j/rH+pg4kfBZ0e5TH1cj13Hir+ftNkXZuot
	 4WRY0c9S71gbQORHEEb0aB5qzrvABHDGCrZFQey9W5nvtQCrOKKIuOt/nJLNoH2SqAigp
	 /5MlPDodRuO1E0PLHIK3bHquOOWjBb24UYspMsayDWkzZ2vLqidJNhPE9m04Fvsbbtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tM7/Lb4o";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E144B606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E144B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tM7/Lb4o
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so9393272eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447682; x=1796052482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=tM7/Lb4ohN1rjBmrP/p4jsqauMxS8DlnR9uOt5WOXDONuj9gtBL24ThKjhYyUJ1osr
         DzqANDmyaqyQRIj9/WtIAT/2YNLsDbukMTF8CsLrlVLEEj1u79LxziKXkIVO0kuI3yvd
         ilvhELHyvShgLq2T3GfJ2xb3ebiLdSzv8fG/1WUouEulxQ2bjODdAQn++ALn6A5oRrdP
         gp7+Nu5zsnypVzDnLckDqxN6joBc14yqFTXBNPePxokmg2P15CstxQ+L4Hii3L+lJDFp
         UW9V1QtAegU0c2Ex964UbGyqVPZzoLvvZqPc/2zQWmZhYNNwMxGusYtW/O0GQnjuA8yN
         3YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447682; x=1796052482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=SWxQNhsbhvIA0+QuLIJVEncIMmewLaWhqYbO2XlCGUgu9QHddbj4d/iRvXhpRXWQDW
         q3hkS6R2TY0UeKYS+iofcHw1l7u/8n3tAP3zyRnHyQrPSgc1YesR1A1aNXuhPTkfnnMZ
         bN7nhoT8xuh2iYobXXOlykhZE7OQHLYSuA/8uE6QrvZQ+II9MxChslEbgGhm/eVZEvzZ
         +1V14adSLZdeX80/5+oxE79Qpl6grLUBMLf9kWfC/xhrPB/dN1fMAHpzXzLOp1+kr7Et
         2qdOMsAaCZkP3DU2tTEoay55Iv45yR5rfmErCNFwf1dd9eIwxpWObuoXBvP2P0XDocho
         OZkA==
X-Forwarded-Encrypted: i=1; AL+hErEXGR6np4Y+k3wUAWEHzTq14lUie0nmLuKlDMSLkFb1bnZ8bilavbb6wvK2ftUisCGm0iz3ILgLAzJTPZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cnuigKoOTZBklbztFPiL4Pp4lPBlwWoto9vheShav7bgnTI3e
	ROrnqRCsaugjMg+tGmLtid5YECS9Fv0QBFcv1C8UohawsdumHYLLVhIT
X-Gm-Gg: AZFdTZf0IYTmLVZP8Qs2YJTnGJf9GXKxZ5+vH1J3ELq4QoDqJuVVGIoKkv8zFabs3gT
	tFJ9jT2AKfBY25YsL6sUmAbA2EeJebb3idtkTcvMQyFFkWYU5df8Zxcj0v5fFV5WBhASwXhs6Il
	g/+zKZ7sfuJSiUAQGNI2qKYvru7Dl4VZTR4bU4jtGXPEbHT4xZ4evjI+Y2xYM2wlCNZ36NYiDiq
	5mSZQwlq3/+SJfH/pg7JY5D6yD25aadbYeVLITDGDIuOvvhCSyBrrGM6HxHwN4BzNxwfNlARKNO
	QiMn6DxQikUl6FwJmQNqDrvDuVDlevZ+qvrMibmhG2vIyLu1S7MvWDUeGhbtvcQI6Gg79rhFb1t
	L9loGq6pSOqVy5S6x4TxJEdjsGHIyyiB7Owgv6222+02B6MmJFW5Rh7QKa6IPIN3yNNrmyCTBLj
	jihZpqt3ah7sRT1TYeIK5ABuSoJF8pCJGITRTuU7zAmNU2qXMyVq9nriDNY00TFbnivNxHo6P+/
	a/71Gh2BfFqYaZfD/EFOCD8YqgzB2YtowqIgSBS4uazztAKi18XaXbBxBbSEu/HXnJX3dbkng0Q
	NNrxh9LjmOYuKn/WnURXm88GhS49FVAYCYwfacrxi5G21Q==
X-Received: by 2002:a05:693c:8801:10b0:386:b070:6f2b with SMTP id 5a478bee46e88-386b0707075mr3467857eec.36.1795447681882;
        Mon, 23 Nov 2026 07:28:01 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:00 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 22:27:16 +0700
Message-ID: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

