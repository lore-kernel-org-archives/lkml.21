Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670251;
	b=vRmXssgI27x49R98HxjfKzrzH5yZyrpA3mVcPFGjRnHJ1OtIiE8aoBKLHt675Y44XJEz
	 C/mgkmSUbXUo/LV7btcxu7YNPm6mKIZE2smME9QzxemwsPhXJiGVRN3oHP+qN81pXCbZi
	 3LyEpNYg/ANBRk6MXxlEhqL/gJnb4wMEe5p1XlywVmdsOQtPK7tqEITbGs54ofJryGMSt
	 BeCdnhLrM6K+UWBowkn4UOQvZZJVJ4tpKHTLwundlNRGthK1eTnsI4MtDPrg86+VgCodD
	 T5gSOAw3I+5VsVQNRO0xQrd6bKtUsU85NfPE1BEcDZVg4OfKd5zgjRia8m/zr+rLfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=;
	b=f23ANbGZNzzEihKg433/E5xAD2bawLusIhSBvl6XSPtuFSBxxRYTYmWg3Dmt38e//uRQ
	 SZNQl4YfJhA7BiYMqboI4og8XogFzXYpxeSbxtVM+BpCerG+/WuMcCmXgObrUqN8+LJeG
	 BargtF0kujk3EuksU+ennacm6pDi7z3qtgwYBU2lsoTvzWQ/DMHIhNLrWsrOAA0LhTgwV
	 b3a0ANO7urdrFhDLLA1cbZq27z4NOAkUKSpKewE66xWhNAIYRpDI0OrjbBZPfuXINe0DF
	 H6hkMbV5DjO0lG331hNRmOWYiKbmFrJQuwEPEDMDMlKFfKdY2vUQTq7oO4q4cVUmT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Rm/RtYZE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlYn4URt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D2606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20D2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rm/RtYZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlYn4URt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36N0k1812800
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=; b=Rm/RtYZEpjvuXLUL
	2SOInYpg9jaNYYpXjpjDEjyUMmWsh5xdVqc4CdwLuMCHtiGGU6v5z74DbKbA0hg1
	e0L65yxNb1WvyCRp9o8sEBywgp6gDRY73GHcnVTSq5UojZ0cP4m8IVzTfc3MuGFR
	gmDoMwtQBfcc4ppoIENkkVDMXk9bQcTAJcQmhvlMJf4qW5Ynha0ypy6w+BsTnK1q
	IouLXzCzVD08SH/GZkAwDjVA2ctFPELMwAHbnUyV6cyH70kEQA7LULj9J0zWrcfS
	Q+0ANjtShAsIdvIi80BwKBv73pFTSNjDe8PJF77Tv3pfytFECZN4u8dIyFYdwY0E
	5UWqSw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak00pva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:17:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so7092503c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670248; x=1796275048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=;
        b=jlYn4URtshDY3NrautA1CDeIRPq3l4HOQZem72QF9qDgqiq9lCj4lHb3WjsQoFeMJF
         9yyWDlJAROQI8g/iOVZaNm8biPq8yqpqBbtjagodG9oFoZcuuFE85pB6G3J7Oh3BnNT3
         UExrAjmCgSH4HaCtO3pp4fvqTrWv/ZeXSqXSkwe4/fdvMD4YFJZTHzFBJBJnctz+N95N
         gS+aN+sCB5ugYEjaE+EwkkO5Uo0/gh8Rq4htsaRsl5ROO64R6WBJLUNy2a3oYr7OUSIU
         lpkdgLi7e2WAOhK3SI3nBph6ze4/mFNesfsrI7VaQtfDcZFP0cBAhYH11aspT0Zw5PQa
         E6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670248; x=1796275048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=;
        b=fPakbzZOEyHVaHPEBOClaNHp9B+wiuFob1KR6YPYReogibUb7vcrKRkWcfsJ3ZcNKT
         gHbIau2d4z4+Bc8lGcHVIEGYDY+l6WV/oiUlLOxl40ePfSMaNFUOov/AHB9Z6kso/ThS
         USKKyHqWzHmyY4EukGrBQE9D98AVTtBgea94HjBYOTlp6gKh2azQD9+6utpINOG1+dN4
         6ae/wIw+i+koMS5sgPf5O8Gcd7oPsLb1bIM/H2TRPzH+0Gy4zate0PheT/rRz8PqyOb0
         4lXCFy8GkHqyrDe/mdaOFmbuzkH8U4BKqA9jPmSDXQ2+cWoDym+IQx804YTAM7x/Aa6L
         scnA==
X-Forwarded-Encrypted: i=1; AL+hErF90I1oFBiI9KLw2QL2qAlAuXmNfvcsfNIRSdZI8wh0G0IuF6xq+yIk53rG7RmY6E08Kow3J5y9lbDalbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bTd4V7E4dDv7IOJHoJxUE+EnRfjF3XRKmdxP/MtsEXa2wyETK
	2ZX+kWDjZ4+2A86Jyd+NW/P39gBHdHNIW201hnUf31jJRkTjXEaQl6XR4Ig+qdliWtCvhnOQBUP
	fmp4rFc0TONJEGewwmzckQuY4LhSQVyLEO7JV/B1vkvXJYLZ4Fio5XGMRc6xmg6w0xzU=
X-Gm-Gg: AZFdTZemVoALKisGa13u+D9GfAeRtfcveX4Myzg6ClqjeK9MLET2L4ELkNWzmbPxv6K
	mBRDpwjIyWj6ZA3WFZtT0fzLI8QWxgT6YhCxo5Q6ntwwrOqMiz01k7aHRb9DoAIIVal9pxBvYMn
	RM4HHEaBJZVl+WvUxH+reuDW3ogXz/zhGDcCgRdnDtsoUH7IDRuXrLKnO/xMkCJn69kv9J30IOO
	uLa5Q47WE6fn3dMBAS0Al8PYsnV+7TiVzJqiW/xKOI3HSXLnLgwfT6WWqx5Zahks16B06/zphhq
	3ufc3dn8QU538SV7f+ZGdPH+ZDTLRuyP5scQo2ncanNgxHdA7e96+uihk9HZBqMrfl2ZX1NPCmi
	SM3uFigR3E9rrnLchQT0bkk7Kwvf79tMH0F5nS2QRLunJFbrJkYDwfnDDs64zs5U/nzcq4qy7p6
	CwRIGDIIjT
X-Received: by 2002:a05:7022:f90b:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5568ebfaamr18385698c88.30.1795670248413;
        Wed, 25 Nov 2026 21:17:28 -0800 (PST)
X-Received: by 2002:a05:7022:f90b:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5568ebfaamr18385673c88.30.1795670247778;
        Wed, 25 Nov 2026 21:17:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm52132934c88.13.2026.11.25.21.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:17:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:47:01 +0530
Subject: [PATCH v10 3/4] PCI: dwc: Add dw_pcie_mask_msi() to mask chained
 MSI without freeing domain
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
Message-Id: <20261126-shutdown-v10-3-fed60d9687f2@oss.qualcomm.com>
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670232; l=3971;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/vmyVk4dz+wXrRT6tQz+Km7L+PUDZ3c6yimuyC/uNnk=;
 b=DSp4U2tq4ELe6YeAKN/099kZfgoT4nSP8EpgbSa1lH7xnwsRV9dB+lZjvAaOBX75GJGGx8hyC
 gASrQKKPwmmBIq9m+XrMqYdU0tih5nIl0LpAsMDQ61zAk9bZtcm4sku
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07c0e9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: Q2p8zURvNmN9in6v08tcOx5uIWbgS_2V
X-Proofpoint-GUID: Q2p8zURvNmN9in6v08tcOx5uIWbgS_2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX0AOv7fnohhRH
 Qzd6sqyivgFP3LodvxBL90Rg63GuDXC2/RC66GoRK6HbkUl801fLtfnvsU27PNECCmmO+pCUQks
 CBBaoH9LW2hXKVmbbpct681UgIpXHy3qjZ+QZHY6YIsDGTdapMR1BX6j3wN5CR8ULsITaLD3MBR
 K9t21N3KOqgslp44IsYVcrwp0hO+WjV5v+bKQp9YAOy+qVEbgITXZtrvkBjevYOUmEx2SCIPFxW
 zNP2MOcinOR1ihSDRofPIUFF2JJv/sg7h3kRcpIXwzLCjSoM28okaH/sw9pfu/Z0Yi6phBJYb+i
 MUhsqkfVYU3ISlRVcdd+NnmQ8TqoCGJIg1BI5wo2zcQeYyU0ADsVZ8P9ZTyXdJ88RsuwmGtq031
 fwVTLCGGGzd36CNoJRPVsvQbv3XIpFAjAuteMgHeWfoPodq/Y9C+QTGrPybNeNuLwyubx21A9OG
 3QsHyYMxPde3qqgoh3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX6DaILPPTj+dV
 ezoAwHXf5A7LMVoqPXdHF+f6onwqub7ujlVGVzCQ47ckUFw3GeLLIjSdEnOayXIeLvUfCp+6oh/
 lesOoxQGIbVLATnxieftz38fgbmVySM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

dw_pcie_free_msi() detaches the chained MSI handler(s) and then removes
the MSI IRQ domain via irq_domain_remove(). That is correct for the
dw_pcie_host_deinit() teardown path, where PCI devices have already been
removed and no MSI mappings remain.

It is not safe to call from the shutdown()/reboot path. device_shutdown()
does not remove PCI devices or tear down their per-device child MSI
domains, so endpoint drivers that do not free their MSI vectors in a
shutdown callback leave live MSI descriptors parented to the domain.
Removing the domain there orphans those descriptors and leaves dangling
references to freed memory: during a subsequent kexec CPU teardown, IRQ
migration walks irq_data->parent_data and can dereference the freed
msi_irq_domain.

Add dw_pcie_mask_msi(), which clears the chained handler on the MSI
parent interrupt line(s) via irq_set_chained_handler_and_data(). That
masks the line(s) at the irqchip under desc->lock while leaving the IRQ
domain and the downstream MSI mappings intact. disable_irq() is not used
here: the parent lines are chained handlers, so the standard flow-handler
disabled-check never runs, and on irqchips without .irq_disable (e.g.
GIC) a lazy disable would leave the line unmasked and a late MSI could
still reach dw_handle_msi_irq() and touch unclocked DBI registers.

dw_pcie_free_msi() now reuses the helper, so it is exactly the shutdown
masking plus irq_domain_remove().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 17 ++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0837bb9e67e0..c81424e2f95c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -227,7 +227,16 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_allocate_msi_domains);
 
-void dw_pcie_free_msi(struct dw_pcie_rp *pp)
+/**
+ * dw_pcie_mask_msi - Detach and mask the chained MSI parent interrupt(s)
+ * @pp: DWC PCIe RP private data
+ *
+ * Detach the chained MSI handler(s), which masks the parent IRQ line(s),
+ * while leaving the MSI domain and downstream mappings intact (unlike
+ * dw_pcie_free_msi()). Safe for the shutdown() path, where PCI devices
+ * and their MSI descriptors are not removed.
+ */
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
 {
 	u32 ctrl;
 
@@ -235,6 +244,12 @@ void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 		if (pp->msi_irq[ctrl] > 0)
 			irq_set_chained_handler_and_data(pp->msi_irq[ctrl], NULL, NULL);
 	}
+}
+EXPORT_SYMBOL_GPL(dw_pcie_mask_msi);
+
+void dw_pcie_free_msi(struct dw_pcie_rp *pp)
+{
+	dw_pcie_mask_msi(pp);
 
 	irq_domain_remove(pp->msi_irq_domain);
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f774fc6d2a24..677e5423c5e4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -908,6 +908,7 @@ void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
 int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_free_msi(struct dw_pcie_rp *pp);
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
@@ -938,6 +939,9 @@ static inline int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
 static inline void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 { }
 
+static inline void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
+{ }
+
 static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	return 0;

-- 
2.34.1

