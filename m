Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378473;
	b=39ige1heyuP2/+xnvyKct4YR6ExsOtJEOFgsG+GBLlGd3AWu94fQcBdlqdlJKZWi0Vb9
	 lGYi8CfmwexRcZ0IlC7DORetSUoa6YhlDAmRR4r/H5DwKM9yzqn4U4c6JbkQ0OGChCUi5
	 N13/53E6qiHIFr2+xGySZpg3Al9s9AuOfpYGfkd0TGD4yM1Rnkl5NXRiedHtyKMQG2DRq
	 5axrxYG9vdhc53cBmCH9xuYeZePiCqxYnLII0LthqmbxeRyQHmIZPM7W2JFjnpqLpQHJj
	 NnGK1SNdmRs3gy4PTOhD3JGyYoiuy4fsiydflG5P/utg5Jw3XEXThy0auj9iGdRsX5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
	b=alCG2VEq2g7TwsE5bbAggX0r8E7XOfbIBGSagcXK+BR0L0z6Un5wKv0dcwo+ckKKzzux
	 0G2RJ8rZ22H2Vnair/Nxm2fg6pbD5IjF9KHJbw1EpKNnODU/0J70puy3IKs/1WaLiyjry
	 8xDX21Q5pXolEQ0GTFu0/iCMZrTECmUhuSBphq5N0bRqAlBdm/3zXIOYHcJ6RvwHFGHfV
	 PZx61130MuvF9x5MTyKaAFyDi09u0yiikabfckhMpHCuNJn5zLz4cuiLORdVrPulDxC8M
	 VqebB8Hi0GfwMMLj9Hs9XWVPOFHZDbweERQ0C0CnnRTH8wcqHfNSvT79gMMDblklPpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDgThwnl;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBF606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CBF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDgThwnl
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso3042631a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378471; x=1795983271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
        b=pDgThwnlWfNp0X+IZJlpY9eY/oosSNsnD3BDUH3Ybk5y1roHWZirM1XA5N710J07zR
         LQFfSexCEO5f8nPezjvJ4kGHNB69Ge3PvLeb4Hh+jrWY92+Ir7rWwLGbBTkp+rfdKiwi
         UfiorIfpm3dEMY4t35Dj/Z+EaJdkQec5WxwBQXYwu6y0X5MPwNwBua2sCCiKrT32ftWt
         y7mYElmVxyP5CNb2Vus1Ydr6YBD1HtTJOfuE7QbMx0qwaLCRA7ic+MTp07lDERQLdkcs
         SXHJx3lcmJqgr+DylvvcqV3pDY553xlZ7v2QLHFsVuSRWAvhHApKPEI+VV0ClJpbCwTc
         Q1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378471; x=1795983271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7Ox/HWcDEqTDXqAyvemUYyn9XHfrtj/jPusHQ98loU=;
        b=oRZ5ApbJJ/LOaX52Jn2uks0yuj2UJZpL7F0cGp6tFGTlSBxjBHOhm1G4TjFpMK0g6I
         X17/g9ePXkE/ann5P1D01qdP9f9DXHumJszSi7UUKxizrx8b43tUrUPHRA2+yfpo3Cov
         KG5gU96kdUAMjP80F0SfPzIAagqK1OUjEjnRkCyUBF0I+10GZghcVXgBXpdp+gDm1wIN
         fMSFyLsgCaITLFvPv0e702b5ts6RkRSVMEzmoqW+O/dGF1hCWGnXUF5b5SSb4Ttr2YWh
         otovtJZUsd0TZ+m4INS86sFjE/aXqZPBI897iBEeeohPSFCbxrtEBqemveXxmsntlPPj
         omIg==
X-Forwarded-Encrypted: i=1; AL+hErGNrEwESO6p8Txr9A7LJUJ5H+3UwPUYSI8rWBlsTYB+IbdqGVjP7+2Rer+7bnWKdQcHjhf92F8farnkBDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xx+wqlxH735fK3EItNrbWOOqubYtBwkdiV5YZJVDCVFTrUaAB
	1a3ebn2aJsYs4vK8s34uvk2H8IwOYaEwvJ8AIORRsQtM7sYC8zlFyefA
X-Gm-Gg: AZFdTZd0JxBfMze4rwUA6G25Sxh1m+XRN/aRnEsl2IdSnATOLwv15ll+3E7ZDMfaiUO
	McPmQ7IETYgxk2NaJV/4UNVlqaNbBkP9poYyEYqlBPoKgC3WXeJAOOCic35jizAC1MdB3YC3TXe
	V3PV28fn/Ajt1pd5h1eBIyHp3Oa89UxwYgGXdAICmKjKmZq5up6NGRMN/+s0o8xuinw85WS2RiR
	bQMzGybuHP1wneeerKx8mBYW51I1yl0wzfNbmSw9DYSx0jMTO0Xt+oSm7uFGGUsapXc/gL/eHGD
	/tPmS+PND0DwvNHmhk+Bizq2cPZIFQkv77oGmEx5x7uvJezAKnLlSaAa9lwbH+mxLWuKMbitR+X
	cG4FVZHnG2ZRsZk5fDyPMVAYjQnk1ERUBAy6Esw1axwg2P9hSVQWQlZaT5XH1IbaJAJo5h1xDBx
	4k840FpNJIiQPP4Zop0nQXzxwDJYNg4pqHgwWCsuXOQM3Zi5LGZ9YCxYQtycOLgp/CN9ps7gXSv
	yhDZEDjoOFQQk6QBrpTixEl0AEaFKEqy109Vuv98ocpZQzo+2PEjk3wFPiMz8TowqcQJn+8BSIK
	tASOekaYHsOnUy+onvU2RWT/bmd3tBIR4+Ypt8vs7b6sEr1KklM8Vt7hzHgg1Af7QqwAnepUrYP
	GAGG4QN69/A==
X-Received: by 2002:a05:6402:400d:b0:6b8:5b54:bb9d with SMTP id 4fb4d7f45d1cf-6ba37d62876mr6316804a12.10.1795378470876;
        Sun, 22 Nov 2026 12:14:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/18] dt-bindings: ARM: tegra: Document Tegra Note 7 variants
Date: Sun, 22 Nov 2026 22:13:50 +0200
Message-ID: <20261122201407.23742-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Tegra Note 7 has at least three known versions, two of which are
production (E1569 and P1640, along with P1988 — all classified as
"tegratab" by downstream sources), plus an LTE-supporting version
("tegranote7c", which has a separate board and tree downstream).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index e7545c8c2911a..dd123b0ab8ed7 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -120,7 +120,12 @@ properties:
               - asus,tf701t
               - nvidia,dalmore
               - nvidia,roth
-              - nvidia,tn7
+          - const: nvidia,tegra114
+      - description: Nvidia Tegratab based Device family
+        items:
+          - enum:
+              - nvidia,tegratab
+              - nvidia,tegranote7c
           - const: nvidia,tegra114
       - items:
           - enum:
-- 
2.53.0

