Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512133;
	b=39bbAjVJTMCEqB9puvyhC7vWojXscYD9e6jfNs0VfpfxoJoDp/3fzMzrD29gnBk8naaI
	 bBdFQbDuqZlsLFSFYpNc/OsxKSfyLKHY9axFYX1f13dlPIqM0vAQ3gX+NMAblGcD0k5kC
	 jXP8HsulpnHSX40MN/RfMnFJuzXAbia5v9AkSyBp/aOBrIGl2+ThQVejcpvSJC/KUwXFP
	 cd5cse0Tm0qPPg1SFEhSXmVyja9BZqDBpThFai9Woq7kXPQBwBKmGk43IIl+BSozGg/yt
	 +kAMoOL5nyeEO89Q0KOoyUD74dQhhiLD4CEIv35RkoKbRt2MX/Jk4+7bHVyE3hwbZww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jrYGP2NUS8MDFLO947LbBcMGV4wVMpRFW1toqHZsyiQ=;
	b=xIhunccY/xa9RywYzR6JWS9YANve0D0IQFKQRn/CptvnQHB4HNrpmbuhk2Fd3MMuZ1WY
	 T1hNpvmm50hjqKWeFIt0TIMRH1IJURFndz12111/xbkjpRECHibkc7m7EyTrzBt7+ESa6
	 zDF+mq3BpbNP///+9IuUyDdeBkgEY8SXR94WT9sk39vI9IIPgAwrbKNn9ifMpkURZayFw
	 UH9xchmDxo6nwOxTUzij8YCWm/Wrq49/wmpM81L2CvzbrZFi31gIne0m+Hjrgzcy025Bn
	 ux9luW/GPfG21MC4v8uDLCFv4Mmgv5ss50lgGFonziBG128A2PtgzPJa3SSIqLerWSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHelgFAX;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D29606A6A1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D29606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHelgFAX
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3869f03af6aso3508799eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512131; x=1796116931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrYGP2NUS8MDFLO947LbBcMGV4wVMpRFW1toqHZsyiQ=;
        b=yHelgFAXHZlKvExHvczgHRjsBLUOzun6wvv98SQTI27ld6w0gqkFpdDqLZPkzojczO
         Tlw/xOZqjwWcfDKs3kzRys1VVO4NdDw/PXwWSZH0JTk1QltoBrVwBrilicExolBya0Na
         4m27JH0nxVIkJsCpvEZj+BVwq5kk98fyfFmjdlUt18W+ao1sUebf/QiW/Ap/10RSghII
         XOfPl8vbmPQyLuAbklXzAwt5ucs96Pm9ipadzRAQsH6gE4u1wZB0aBPX263P/YqncJ+g
         gD3bqiW9JTfzTN62bBJEeO7q9vVV/iA5EUGIPqwHG2WS5xxRkytsiJOUO2H35LpwKC0t
         km0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512131; x=1796116931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrYGP2NUS8MDFLO947LbBcMGV4wVMpRFW1toqHZsyiQ=;
        b=mpIAVwIAzTW5LEc+x0j46OZSpRMtWVYpRqyqh8GHJLY6TdFADLUQGh3fVhMw/+ko+u
         /M55wGcFsk0ynHWYaQcmXHt8I4/6VuCVL68/Gl6OwH2KbuPqcwadAM7QQj/hdLbA4AYB
         Cp7SoIVRv6I1ozSHO4u8YJiopSYdgx1po9gwfOhmvGEDesN14zLGek4n1hMLOQgSB/qn
         LsnX4hmS10Uvk4RvXSX/aeKbujm1NKBGQH1f2UlWrCstOB7Ll6KdeO/HaQ1XmTqICczI
         8tfX//ooeiNRZsqL8X6+2bg9TTOiS4oO9lbc8cR7q68pzxgEXJvXvDslfIDLf1C6cV3w
         912Q==
X-Forwarded-Encrypted: i=1; AL+hErH9LoAyMALq6aQU5xvoWOz2ST5rpWfb4H5v5gAu77p8WdebaDziABkH7abqByrveurfTWxjlAZIwV331SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BdTJGlkvsElltpX/MqQZrWZ8ZRwXquWi3eCevZw+bbzlEokol
	prih3iEPUwVHyj7EoSEm3TKZ9ikVWVUh0YhwSPp2Vweofgb9rxFqZ87X
X-Gm-Gg: AZFdTZebrDodds7a0htMC5RhXa+0n6ykvfnpc0KGYV63gD8fmQ4ce0M+1f6R5NidFfK
	MTgOCchXRR4rnDSuucUBc3MYDCeZxvxVfuS2nWjH+4t544syQzTA98eh7zw4DHRJORzpfeogd+v
	9S6A2D7exE2BkGzE9Q9LlrR2K4BxqXLn6krQfzDEv3+g9Oo4cXYNBxX80znK8dPlTukOisYhj3P
	1K0t1KkowtS6NDUDBP/KwgZXyzxmBIF0Q7yvND8zr7OIATePPPTmW1BhJgQnB1Jw0N4yXF0wO0B
	3qzuUupPQukY7M0Frn2Jktk2pQuZkADQGLSvshXMU1xDJFO04DVpB91kRVfNqan7cs9MhnpCO+0
	gmVa2Pi9hd34ReQ9StFjtRK7PtoTVbghkexaJeimaQfnrUErV2j9614htj1s3Z888Csr3NsV1ZQ
	gm/OAo7onxwG6XaRWur50bsHea/pUakrT6CsqFdJgZhTTsp41YHeFJv7t61+svU9/f/v6Hwe2vt
	YBOLRZJCW/PzRy9rpGVlrAGcBfM3BYUBd3DJvHtyln7AS4t8X4KywiZw6VZloLbDjavJIgefdnm
	kDoChE0dnjqYdTdE+fw9WFnzsS7ETLnpRafX3FD3ry2y8Ik=
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr13672914eec.11.1795512130689;
        Tue, 24 Nov 2026 01:22:10 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm45902545eec.22.2026.11.24.01.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:22:10 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Vignesh R <vigneshr@ti.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Josua Mayer <josua@solid-run.com>,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: omap: do not deselect the mux-state twice in remove()
Date: Tue, 24 Nov 2026 16:22:02 +0700
Message-Id: <20261124092202.3766910-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

omap_i2c_probe() gets the mux-state with
devm_mux_state_get_optional_selected(). The helper selects the mux and
deselects it again when the device is released.

omap_i2c_remove() also calls mux_state_deselect(), so the mux is
deselected twice for one select. Drop the call from remove().

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 43c00f2bcff7 ("i2c: omap: switch to new generic helper for getting selected mux-state")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 4dd111f77ea0..d3c576ca7681 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1520,9 +1520,6 @@ static void omap_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&omap->adapter);
 
-	if (omap->mux_state)
-		mux_state_deselect(omap->mux_state);
-
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
 		dev_err(omap->dev, "Failed to resume hardware, skip disable\n");
-- 
2.25.1

