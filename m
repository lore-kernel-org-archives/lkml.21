Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774066;
	b=O8SPHhwLMOZmJaGLdGsEge9oqn3y4b8/ZLu2yhG0h/X4tkAiRBPFNhSZKwcr6Q8lf7CN
	 rDp1WaBX2QOHIJ05WEzN9f5igkv0gQ0Dk321AH16qJDs7FaBVHhQ1Z/3IaGVWVMrNtQy8
	 9E0Ow/kMvNIcO7UCIxMao8Pw7lRncKHE/ql+s4EablzrMvWD0glXBRzbWIFktTCwPVMaf
	 vGlr3i6OTgxTJiHFxBp/DrbbHir02NsY43FS3MRdYJ+7OEKROvcosyME3cmqXSZO/aWTY
	 kStNNpVi2p8bkN8/sBHoolW+E8ncVEhpeSeGvTfARkrP8gLoqg6EFobA+hLRupfw3cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2TsM750EvEyHCTYANfGa2Nzz7ULmsTnF7jQbx8T+XDI=;
	b=ozun2UXK7UMW1hMPlg9TppviwwTDnmUxYHNSa8QhD3PbJz96TNmIUqVxGvUHIh5PbQA7
	 53gMuhLN6m/jsAWfoBq7UcfOTaKJcIIpRtU2JY/FmzkQQfkwY7l64hU2hUaVZRwHATThL
	 JFPHcJhoZvx4paZYvb6FAZKzZdlDBb0a85t2CZnhz/vu2sRL4WYT+GJOHRKZVab8AxJ8S
	 ioOWka7/pcyj7UcQBz66SBaLGsmRVf5iRQR008rxSVolfU1nqL+IT/NjcunCPWTRUqf7K
	 RSrIuwQ7NB8IUt/mXYL+biiW9ibG4MRScklKIAIVxGWhMGp7zm2F40BIBW+qRJy7HKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU2ZaTq0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DE606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E42DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU2ZaTq0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso61359495e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774064; x=1796378864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TsM750EvEyHCTYANfGa2Nzz7ULmsTnF7jQbx8T+XDI=;
        b=BU2ZaTq0d6nf1kovPAqoaEy2B2Z5juQ86UZVsyi7FuGSzKihaXuQNzdd9WoQLSo0aM
         P/cXUEp9Cq6z31xzVzvNqN4PsDGGRlJA9l0YVzY8kORBXq0HCy9XTMBUlgYoBKEB/+kH
         IL0Ddpwbyvi/NKWtVoybkKI/qsVd/SO//vMsn0OIWuTdk/ogGN/eMjoxufZ9tTUMRgJu
         aIr9AGk4gLT81BSknWgNFrXZ0ecEPnsWBwvpyBWSn/8bQUJ0Ge98uGy+cLaAMIeiDyeL
         5IbxBwpY4v/lcrhdUGRT/qtIIUmL0RpW4dv6yYQ7ZN/jacHFp8DvBkpzBY6C/gSIlzjS
         qaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774064; x=1796378864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TsM750EvEyHCTYANfGa2Nzz7ULmsTnF7jQbx8T+XDI=;
        b=IYVdTYnAng1tG+93ulI/GHNIJDbUFVvxueJKGKqjcOpWXIr51IjtWxgYgwCUIPd+as
         mvKOUsd8Y/aRGQ8AxHJ8wbs8brtQ1+fgqm6ln1DX9ys28d/aGNCsi944kOnryiTaxavc
         iCqQ5HYhbwcB7Jv0S+aDzvAYHKiKM4j/xSUHIIAGR8MCFT1Nqo+NljwJVoMQewS4gcKs
         daT0w4bYzUmY3LC9ICntmPIRcEtA2xKf/f8IeLHKZzj28qR3RmrbRYsmIjUNEw+7osJ/
         F38YSZ63PgUXBzUxv3Nmq53fsprdIhUkuZpR32TgdGlQ0irOILLK1pPLOM9PanlYVwhw
         n8Zw==
X-Forwarded-Encrypted: i=1; AL+hErGhLOjJKU2TDWaPvSWfcy4q2hPOSPlfzsxj+U115T7fYMZ3IyQ4SbqWMHUQfPKcsTEbZUOuWmQvHfNkq6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DWUYgXRWoE02WGy6vognl8WGcltOy3ZidTJ16pjgzbulIdVZj
	ngpUFNqR3bf5kr30D1LPDO1YGzD62puYA3v8RCtxxjHjYSmfwrzYnktG
X-Gm-Gg: AZFdTZdtDRdWgTTU02jnZ5y+CB90+GsOySDgJrcVB5EvsnsAwMEAjNxu0fjsLFg3eFQ
	03BvJJXi89HKE0EVnc488s5gl+tUjSdV/b8mVsENjOBjsCS8oh4WKL5OUrJJOrMyx1PCMgJD/d3
	e36w+qNKleapoMwi9FM6WSIArGFjT7eDfPR59TZFCJeHLuADpUCLnnspWc7g1HW3GB1Vfk8sadA
	ji5guyPlxj6OLIHD9lUM1jLnBISnW+ht76G3uySlnwEZQvjNOui98M7IzTwt+wcRgosDO4vrgy2
	ZlGxdXjejFIQ5a/GEnD306t2O6pP8IHxzS3q2SeOdZO0rsmdaeTv52LzsyUsCCiIgTOzLOezTvZ
	nExwz4Xv9MflDV5GYZLHAtZt8X3eISEqgtKwZ5K1eGYiNFkeKobcYK/Jp19DakpU3ty/hPZvf25
	AyM/ySWu2nb5eooqTFFbLU9micRvKV8BslD3V/XuK+eifDNw+/VlxY3X5MTufZMRZfE/r4OgrqX
	hz8dgffY5+bvpDRkUqC16I0Um6gwZ4V+gUDUDn5kuf15YRKJmV6wCPHF3oYO0CQEQjfkodaNmIl
	xrx6O2EEYTLtBRZePXgXGSNpBM2V1PNfgNGMLKRiIqDQKMo=
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr516683475e9.20.1795774064226;
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm196561955e9.3.2026.11.27.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:07:43 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH] PCI: j721e: Properly check the error of a syscon lookup
Date: Fri, 27 Nov 2026 10:19:13 +0000
Message-ID: <20261127101915.1348807-1-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The syscon_regmap_lookup_by_phandle_optional() function returns NULL
only when the property is missing (-ENODEV). On other errors it returns
an error pointer. The j721e_pcie_ctrl_init() function checks only for
NULL and passes an error pointer to j721e_enable_acspcie_refclk(),
which uses it as a regmap. Propagate the error instead.

Fixes: 82c4be4168e2 ("PCI: j721e: Enable ACSPCIE Refclk if "ti,syscon-acspcie-proxy-ctrl" exists")
Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---

(Accidentally bumped into this while working on BPF stuff.)

 drivers/pci/controller/cadence/pci-j721e.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 822602836b12..fdae51e368e0 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -334,6 +334,8 @@ static int j721e_pcie_ctrl_init(struct j721e_pcie *pcie)
 						"ti,syscon-acspcie-proxy-ctrl");
 	if (!syscon)
 		return 0;
+	if (IS_ERR(syscon))
+		return PTR_ERR(syscon);
 
 	return j721e_enable_acspcie_refclk(pcie, syscon);
 }
