Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994672;
	b=wejhgTJtTiXyWrHE5+blfdKDKRMF1pM2GsETrtvI3GiVShZncHfHbFLZ+2CoVr8ah3uQ
	 tTFSbiZtK0k6yhyuZO6rCC4nG7yHM+atycraq2dfKS4ema8q+BuaK6XtVEO8iZRpHBqVv
	 ns7tWw2k1Rc4ewpSBzpB9McZHNatco6qdbd7r+VD287vf3W01jVW9amZHwDmpUooQMDMO
	 Vn6ESQxe/0xV8KHubGazuxw5veTjxjm4Wth5HWCinDjf/F702zEXRaw0EiGuLj+v26X5b
	 lyVAevms5l10YCkyvGtAZMVCPzXSEBfxk3VIb/RI7hmi8OyuSZ2796qVrBsjvJ8rVxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=;
	b=GU5Xw7GxhXls0sbUUFkhYYagfUkRFlfLRObknGuCbnhZ9lMdxVwapNtKX2LlSLXIQf97
	 Jc+tCjsOPGnMFHnSYlecapsYSur5na5I6mVNICJtRNPPtrwoGBSw8FvgzZUh+1PpVeanw
	 NNAwyK8FCY36mhdW/QgsMekK8Q1QugSfoSuOO9Wky2gbrZaTum9ljchuoLAb5jTxlRcTV
	 HlJ/iQTndysmMF3u10nZs3Cp7YqDX1AAxFDsfZTuEjTXZSS6Kw7emRs8Hp1hwGm9JQSkC
	 akW7TC2lmY2TfvS7vkUigEId5XCGMgBD3zXOft+ByRLmyHh7RCwDllzvstQWnkdwV9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sx3up4GN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56678606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56678606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sx3up4GN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1157880eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994671; x=1795599471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=;
        b=sx3up4GNHY4PV5rpOWK47NqZzOdor01MkE+cmqVk5CeWHjoo9GXylbdQA+Q5hFY17F
         hbtsAlxm7oNEClUH2xh3iFQevvMmES3ILQTPcUCAIxKZSxqr5i5uv0RhmRCz84MQH/Zk
         t9Y063SLDopdZ78m2xHXJmSmd73V339XkkfHqrX6ibsnOYD9ygTxqbYXzSlpar6FKniR
         9m/1y6lV9VfNeGLLVayMyJh7nxtzTcIUuJOxWOYHf8GWfhW4JAkA+VD2kx06uQs8O2a1
         GwZ1hoCqbFRIIwySi3viwLEhjRmMHYwYdJ2PNE3s02PZTTuz3juyL3ZtHLsj6qawoNWE
         +BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994671; x=1795599471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=;
        b=lUhNpwScQjZ6JNYYa6RrYP16yQ0bBV9bDpXdab3WpUeyxOauHvPdRzw5E2XSb5nbCX
         K2vj4F6I1p8FNxE1FiLdkYxANDh6klcgKeEEzBMQDOeoYzuai6JbD0aB5dCqVhqFbwF8
         VCN4lOGMW+BkKeXdoBZMLVI28TSKT2/xcjrbdEWus/axvuzu8ENbAW9BkDB+BJ0CS7/I
         hni0OQyNuFWaRfuN66TFDLitxd52zG/xnCUr+CU1M7iBtAcVJqHhY1D+2K9Y4UWuGNqc
         lo18oP9CTYReYfbHgLHXd7A8wszboDNNmcUHiJOs2kRtYgtr8tVcupJWfgt9fHBGflnx
         hdOw==
X-Forwarded-Encrypted: i=1; AL+hErFq0ul9dyiGDaPhRmc0h2GoqfHNDyIBzRhOx+frCsSLLBaG9Yqz9EI/JRL0BHfxQnAgSIQLQd/rIJSKFFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z969cUHW8upc8cNQhar7rEPHr3emW7+9M7J/X01yrtX24qNqgTa
	pRJdEModCg6Kr5PZp0Y+wPUqYxENrMLeqG5CEJaMHBxKM+9a9A5N7beI
X-Gm-Gg: AZFdTZdHCIwJ2YmgMQNZdp4QcCjAngdsf0T/dOOsHfVxOcsAWXc3CJtg1wm5/jJOsJu
	upC8SZbILL877gsqvdPHU6UXWzoO9C/CvQxurgbuQ0ZSV09cm1o/hEhMDPFxhw3vt+G7+uo6rkM
	pzWcWgxN3KYzZdB+eIPdFnk6pdKanjs0SS9as/oSiSF1HaWIN8GUwmFojA1lAt1wSZLOdVGpyTF
	3ZvJWusi3ekh9gm2yHMdqAn/NtdedsV13loWC8IifX/r64TO4Aq5gGAmjlGuMaYbMRa7ZFojjEK
	lyaN/HVGpWLuMnQZndt4+N7aZGtXDERBtZRkSADNVY7psxyKRM0DQMpcAB5n1kmfX3R/xTLcSXf
	J34qR8j4+YH2DTNk7ZBney7sY1Sx/EYdyvcNePHr0Ftik5zXMapW6+vRHuOkX0T1z1GoRIAN4Zq
	caTR+ssCBf0yvRRY4As+V7qeUa8A1GxjXGXIvoNnH/h2qvrMyn9/xb3nv1e+u9X4iWqXxba9tDb
	7PjuMDm/6141xMcyaBC3xFHHXyyF4pM5rxaA43IA6sPhUtsuSKY7J+W+qoiN6E2B7ZCA12rNcq7
	VZezx47a5GrJVTaqFOZjA0s3IZpB2WKbFbia
X-Received: by 2002:a05:7300:6a90:b0:36c:dbac:705d with SMTP id 5a478bee46e88-382815247a2mr1735354eec.15.1794994671297;
        Wed, 18 Nov 2026 01:37:51 -0800 (PST)
Received: from Zoro.lan ([2409:4090:2022:b216:787d:f4f4:944d:f4ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6353460eec.22.2026.11.18.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:37:50 -0800 (PST)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] PCI: mobiveil: Drop unnecessary msi-parent check in ls_g4_pcie_probe()
Date: Wed, 18 Nov 2026 15:07:31 +0530
Message-ID: <20261118093731.43980-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027094427.143733-1-vishalsatleit24@gmail.com>
References: <20261027094427.143733-1-vishalsatleit24@gmail.com>
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

ls_g4_pcie_probe() calls of_parse_phandle(np, "msi-parent", 0) solely as
a boolean existence check without releasing the returned device_node via
of_node_put(), leaking a reference count on probe.

Instead of keeping the check with of_node_put(), drop the check
altogether. The driver does not use the phandle directly (the irqchip
layer handles it), other PCI controller drivers do not enforce this
check, and without "msi-parent" INTx still works even though MSIs will
not, so probing does not need to fail.

Also remove the now-unused local variable np.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
Changes in v2:
- Drop the msi-parent check and the now-unused np variable altogether
  instead of adding of_node_put(), as suggested by Manivannan.
- Link to v1: https://lore.kernel.org/all/20261027094427.143733-1-vishalsatleit24@gmail.com/

 drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
index 4919b27ea..f31be6327 100644
--- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
@@ -198,14 +198,8 @@ static int __init ls_g4_pcie_probe(struct platform_device *pdev)
 	struct pci_host_bridge *bridge;
 	struct mobiveil_pcie *mv_pci;
 	struct ls_g4_pcie *pcie;
-	struct device_node *np = dev->of_node;
 	int ret;
 
-	if (!of_parse_phandle(np, "msi-parent", 0)) {
-		dev_err(dev, "Failed to find msi-parent\n");
-		return -EINVAL;
-	}
-
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.53.0

