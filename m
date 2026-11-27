Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754849;
	b=kzw6LUrvXwitz7ofk61y5VEhPotavtTn0f6bFwJbDRorQsaOAKgtEu3RpwxAIjgsA3R9
	 GEIlNiWP/rZNCH151shoOtR7DaiEEFP8ySFD5P2c27082dDwYgnv4J/SCh2o7EkkAmInH
	 QS8p5mBOXqhKMiMXXtv/TxlecnjJwIKjRLO6FBVUOBwtCMi4JImUZLUe/mkXkb+CMxxTo
	 NUwZmAXgMpL/YghEHQ+y9BOmsIvbCqUWreE+7r4MknBRZNBh5FrypZTv0HSuICCdiIsxT
	 NGTsJ/2EvyutRM9ckKnuf0ZGS0VAifTpAXewXhd66L4HIb4Zaof7O3K/EGOz0d9vPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hhWbnd1GeIVZ9hq0Bu34JgMJF0xS6SzA2+sYatBHwFs=;
	b=XFtBpZn4N+aoBnMn3HyEjkErGxEJvtqlCgZ4N1Gk1W1N0XiAAX4fuEHOZrRF6z8qseMQ
	 9eQe6PdQZHJ+BxoKw4uW/RHtlo2+COBPgmOgRXPWRJlA0yplUvwy+VWUfxso5X4kSJfSO
	 gjKT0gPa/E1aleD/6PFsewUoKneaiQVgntmygdBSrPk1Tpp45c9+A4aUF+Tv1VWUgnRzW
	 doV6HeYgwjRy4oxZpPc747GkM0SnuUVWbRG3UzAw57nKKq1BN0nfi3+rGAuKS6BgwGa51
	 0Am1qNV2Gyq2JBZuIxNXxmkYhFC2xJQyJtOYFlzIIwSKEL1mBCNGM/LmDbgZLLeNZBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMG77+b2;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA00606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA00606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMG77+b2
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3866a784546so10519744eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754848; x=1796359648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhWbnd1GeIVZ9hq0Bu34JgMJF0xS6SzA2+sYatBHwFs=;
        b=AMG77+b22JuIdGerH9kErHw+7ek4I23A2vLZan8A+0NggyvcIxby4Tg8V6DMuEOkzh
         QtT835xYS4w5Mt5xmRwcrbosW+/E3hW77ZNASyEn+0x3nsWmFAgiWh6aF3UFj2uAnhkH
         hf6k5JiOyqRvUoBTjzBLPgdtEIYrpXm24q1m4fqptOeV6KOmRjDCQ6nuBtlfuh+2hoJs
         iIZIYWiADDbAK46bGZe7RYt2mtxWipnFtQ80+mcPcM0zwFLohV610QHbLYAWJ99RioiW
         YNxrRRj439oYxpDSTBIc47QJTYVuq+VVu3yCKzyKvByYwsxjyuheD6+YUKDtlveYqtJJ
         /OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754848; x=1796359648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhWbnd1GeIVZ9hq0Bu34JgMJF0xS6SzA2+sYatBHwFs=;
        b=ebq2ug8SgztVR9brTkiRbv/GRU/UxEfCEQa7OYyPl3gJFRYnsqE17ddq+CMUWAmgJt
         XM82yHpGvQRaPrg32Be5/+CzPnjAA/fRf3aolzQ8oz9taUno6ac9UTUxtbHE06Am1d75
         dFpORjZEc38JTwaUBcRAjxX36BGsxGQZcAGwV8QcCcQgM3G0gzJLLI5lV3ZEWF9WG+xZ
         pvLvV75ySEtiI/23g9ZO4M8FVN3e7B7xFtw8QY/yMmRw6oxDi+dR64NdScRTuiFEVSfI
         q+70VSEARiqKF0FJ36f3xy6vBGzwH3iLhmlTvxHIbI+6sO2iBMt27jnGhJMWXbhrk2Ne
         XS7w==
X-Forwarded-Encrypted: i=1; AL+hErFV9oTKaIpUp30KZM3eUZ0Eqkk8jc1fRCiQKN8cRusAECUWxzyos8PIoG1ni15WciY0yRZiOIQ6nKVIHJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i6ogyxZeg7Ln3s9YNTeFPZeytdkIYu89RGrB0PziZaLtzZ4LM
	F0Liyhk3GvrIvL2IlFLEMHMitK/MMPBuyrDr5eIf/tJMnCADVV/pMWsM
X-Gm-Gg: AZFdTZfbyGEikqrAjJzMhvVzkyIIPaneBFyhcwodvRHK60EpTL1t9j47InfcelLWlmU
	RsAgmtAzA91rX+HmNYYcZjrumdjO2Rr2DPjoixDtIzL+50hb0ut/vkrGlqe7BSQkjhOnZTMNsu8
	7gL43UD7tPXeOVPVJs1bhvcRofEkEK7BuyEL8jJr7/2Cjmz2ObMu2agwwDrMk1G/HVmzOGt5oiw
	wNPs5JkYUDZQHSqDM6+XOE5puppC1SHm/n0xs2WdMluzmJuJbUg36ZyvK05G4eO6dkJ5lULq3a/
	Z9BCrp8N64x23ipevkPBvOGopMsJEWmFbvztWH5kYZ7hZrkS79rW9Z/uN14vEhdmMJoj4VUHzpU
	y9CLnO1JPLRk75eBICi5sVkmMHuob2hug15EtKRgnd4/FdMaZ9Jje9Ss9iJAXa+UVnHoHAC3vlY
	wuye+4ki4t5YWbJzcZB6XM56JxHpifeqhvLolmDgiSjuYMb0rd9i2kLOT+YeLlQ+RPokM0Fsm4N
	DchmV3XOsYC73vhFnWRLhYwbJv75uzH7xpEmdDCqKrcLOununNrhDf4gduD1bJDGXRp3ZkCb+Ij
	TNl/BXANb3ZXmyWC9ID4jrPmzBRh59U9
X-Received: by 2002:a05:7301:d809:20b0:386:b070:6f1c with SMTP id 5a478bee46e88-386b0707151mr14752841eec.21.1795754847629;
        Thu, 26 Nov 2026 20:47:27 -0800 (PST)
Received: from archlinux ([114.79.176.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm77084648eec.26.2026.11.26.20.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:47:27 -0800 (PST)
From: Gururaj Naik <gururajnaik166@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] HID: amd_sfh: Limit DMA mask to 32 bits on pre-SFH1.1 MP2
Date: Fri, 27 Nov 2026 10:17:16 +0530
Message-ID: <20261127044717.129941-2-gururajnaik166@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127044717.129941-1-gururajnaik166@gmail.com>
References: <20261127044717.129941-1-gururajnaik166@gmail.com>
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

Commit c45d2b54cc73 ("HID: amd_sfh: Use dma_set_mask_and_coherent()")
switched from dma_set_mask() to dma_set_mask_and_coherent() with a
64-bit mask, allowing dmam_alloc_coherent() to return sensor DMA
buffers above 4 GiB.

On a Dell Inspiron 7405 2n1 (Ryzen 7 4700U Renoir, PCI ID 1022:15e4),
enabling sensors with a coherent DMA buffer above 4 GiB (e.g.
0x110ff9000) causes MCE hardware memory corruption faults in active
memory. Limiting the DMA mask to DMA_BIT_MASK(32) ensures buffers are
allocated below 4 GiB and eliminates the MCE faults.

Set the 32-bit DMA mask only for pre-SFH1.1 MP2 devices (mp2_ver <
MP2_VER_1_1), leaving 64-bit DMA unchanged for SFH 1.1 and newer.

Fixes: c45d2b54cc73 ("HID: amd_sfh: Use dma_set_mask_and_coherent()")
Cc: stable@vger.kernel.org
Signed-off-by: Gururaj Naik <gururajnaik166@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 1d129f30b48a..fafba3ec9ced 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -484,7 +484,11 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->mmio = pcim_iomap_table(pdev)[2];
 	pci_set_master(pdev);
-	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+
+	privdata->mp2_ver = (enum amd_mp2_version)id->driver_data;
+	rc = dma_set_mask_and_coherent(&pdev->dev,
+				       privdata->mp2_ver >= MP2_VER_1_1 ?
+				       DMA_BIT_MASK(64) : DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(&pdev->dev, "failed to set DMA mask\n");
 		return rc;
@@ -498,7 +502,6 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (rc)
 		return rc;
 
-	privdata->mp2_ver = (enum amd_mp2_version)id->driver_data;
 	if (privdata->mp2_ver >= MP2_VER_1_1) {
 		privdata->sfh1_1_ops = &sfh1_1_ops;
 		if (boot_cpu_data.x86 >= 0x1A)
-- 
2.56.0

