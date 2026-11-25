Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581447;
	b=dT0xLyXi4oUrj+Z5z7oyxkuE6eG2qsPScfnAiA9tHvDeCWM3cWb1+nSiW3ZY8x4dVzff
	 lvKjWojYf/Z0Ui6ggEnO+KeaO20mhHykK8GIFDVF2VK5NgxiG/6aLhRWWOnrV2LWaLKeQ
	 cAWaMBs8oQ8fmdGvNN2VqKERXbHWbIbbVAEMCX3FYxdkVluW4hN4d/UKITbpDwNvIoTqd
	 ZxANcXFkPys+l+62lCqy3UgWSmRrcmojNhVtEPKdsS5QJx0Xb8dH1Yl65KiBmGxm+OXhU
	 cTmj22v1r1OQ5qhcZJCfzen1zBvZThpUA8/Hxe+qjbw1uo03qec2uoll5Wy0w0b0uMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
	b=dr9hr/BymtDIZhYEtIuLH/XP41wvIRplxm9LKyzgogCL1sIxJ1/RT2b6BiqSp95/yz6K
	 5Km+d2HYr4QrtxRibSQv8AzYShL0ujqBQCFNvOMaexoKUFljt2UfaQ9BtzrhBbgZmW8H/
	 xfRyK/S87vIQJ2zuIRbF0+bkwOXs2ipTEBmb0K2Ab5smv55VJNy9MDTDlgHRoMZArjNgu
	 eRDUm8dEUUtOEdGur4zMB3EsonDmv3F1heNmbrZNcc0fSxWZJ/c7XGPqxiyKpK1LJpsih
	 s33PWasCssopRnSHzkxJGoPresPXFfNLiifz3sid5p9Ar/kJBfn0WzkGaGCXIFaf/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr15ZfdJ;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206D606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C206D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr15ZfdJ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b439e37813so2569756a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581446; x=1796186246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=dr15ZfdJEWlFKiosbX0D7l9+7/idGVhRa4u95t0s+U28EotPIPmyI2a+lnKcCTISn3
         S83ipJQLhVZoPma58S0CxFaXppQbCjP0Df0vV2D9+SStuKA+umIhNW7QQSUz9lHe2Ljb
         jC8mQgsMmwAU2d2AxJRP/InN8vIA/0f6/ymJPD+J2WOGQbtKCNFmm5AeybuSWmkAqwtJ
         jIdyrqVbnPcE7hN5G8f+I5n0ge8+/Vx/orLpolDiqFu8ZMF8EES03C5sS6pL+Mi4eIYv
         3LE3GQ2ZuqbVwZ1kE2IaFXX67bbSv/y592kweeth4OlvGf2uRDCZKlXbvbJ/nm771M+P
         1F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581446; x=1796186246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=cRVtrsHKYuweGI5jNRioe+7z2UBSk0IGqJ6dodKX2S3KHmVlKBXrDO80Pk6p8qO/37
         RVJ3lelUyX0dYu/nQ1cV8EdnaBmpDcDQt6Od8na4Q6rNY3ZjfwcGS2fTaH6hFTUtQrGo
         0Xf91AbLf3aWcQOhPN7JBMkg/urMtfoN6HtuxcWdOB0KyYkRW+8W3M5ET8Jl0aUFZ49W
         y4Vv6378BVXo/827JwETRhqGKwr5mQHNqcxsBm3rrreExdj+L7pjDGU++/QFSjnYPPQm
         Yvki2nK+NxS5CnRrfII+WTAR9gT/31qhn1B61nWWMdBvWFhXX9/TK0jAXX7l7yiPLfoh
         lSAw==
X-Forwarded-Encrypted: i=1; AL+hErEnm96HiV0Y2WCsQAnugDjRTfLyTI0JFEXO8OUktCdWjZFG2f6d8l1TCP33vwwXpF7IjDRGj9L0jgNAyBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wP+QJsWMF81O5cxVKz//F/pSZ2mND3ZtVa1PUuq4b0o+Xv9AG
	1KCqRG6EZiJLiejXbQapFEQScIJe3p1tsbwtcAJvqWkrxK5zKR7rcUuL
X-Gm-Gg: AZFdTZefiMC0RRKhpN5l1y/OP+nNZk6i7TiTvG0OMJRclL0wkimyWGIoF1g4GqaVQ9G
	qmv/FlMDAAPhimdieZQuLHcDUzhDvoY+vU3UqZP2OdPM7vjvdA9JdLrnQb039vUvsdO4L6K1ks2
	MYycZCxX8xsHp0CIGvLQpk2SLu72+ceTjSFbQBKOyYFlQoCWrBXE5ZqPTgu+i06IiwlzfFZA2KX
	pFxJCoaAXzGytE4bmaa2hkOHrCkLUaHK79gvnl5aLjK0A7u06TRhlPA6ZJBATjvPjcHNBeZrCFz
	2P/AE9M7sTLIWUgGj7j0nDEJyr2s6Eyu8TOY409uy93+QIBiDJBxUtr+i182gDnw3n98O1B65IF
	6cWt8ropniiJSD/MOM8WmgQyg7EC3DpBJek5UN4hRUtn1GZ8eGti66CAdvnQ4WIyfHPGtIhtU1p
	pg03Ty1TDXzLAk3LjeVHWH8nf13lOcMhMNs0PElfEfjQHge3xvNU28PpQK7Vk4pLY8uOXxp/C0N
	dTqT3j+egg3k9w0/pI/TR3p1uA9atuCXZhp8Po3ZrQuhmD46sG1BTgjMVit+WInKPIcuGTNsvhC
	HxUGpClIJs3CpmbsbbTl2YWlzGg=
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr13865555a91.7.1795581446160;
        Tue, 24 Nov 2026 20:37:26 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm30506154a91.8.2026.11.24.20.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 3/8] phy: core: Make phy_put() ignore NULL and error pointers
Date: Wed, 25 Nov 2026 12:36:34 +0800
Message-ID: <20261125043639.249525-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
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

Add NULL and error pointer check to the phy_put(), so it can ignore
any bad and empty pointer, this will simplify the release handler
of the bulk data API.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index efbd7e139dce..5004d28b167a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -780,6 +780,9 @@ EXPORT_SYMBOL_GPL(of_phy_put);
  */
 void phy_put(struct device *dev, struct phy *phy)
 {
+	if (IS_ERR_OR_NULL(phy))
+		return;
+
 	device_link_remove(dev, &phy->dev);
 	of_phy_put(phy);
 }
-- 
2.56.1

