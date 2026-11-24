Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510150;
	b=cAvJfEuMGGdFLOCp6R+tJpW7MhTqFBTiN782L9bw1NgUEMpdR8hr8amsYH3c0O7rCBLz
	 s7l+X/IrIQZknYWvd0Tg6BzPXUWHjP5GdL0VPkqZu8IAVKDZ/tYYD+SSZe9N2XG6Uiyed
	 QLxRRFSJ0tmuu36tJSxOesmdxfZVc0bLqLo/ill5w594Xsy9kWHB02pumz9wT/xu+HZTR
	 7KZpRPbqyMnRq2qBlRs33RbxICt0UZztc/QygMhmanf+qOW/oOff7LvC085WwYyVf9Y7C
	 H20PQQBehzlYnHlklA6VUApp+MrfW/KYK086Ql4Patg5znP4O5ZmJiFkpjFrjpUzFTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MFg6AsJZlAHZYkg8EWkBVHGKeTBRg/h+xqjFyeI8VnA=;
	b=RHRstNzj2GWjcAexnIZbY47g1f1WRuf58Yfc//T83F/0fkdit4y2LUZ6s+0FLi1icT4C
	 erD4xu0D0AyW22f6A24BGlk88JrSC7G/Zo0Lh080dV/cwTwkuPG0BouM84w59wdabymc/
	 70v0d9mc+Hk6+1h3Mqez5pOazHzyEKcuJ2S0z9S7qlVoQ3nMTE5kDCdSPf6KBc/d4EE0l
	 XYD65NH+kROMDCNXrTOGJkAitxDZcwfcIlQ1FPcSj94+cwOW7Ugn5SLqKzH1PRLhP56mW
	 FRR5+ikdz2CNcIiEbS9FgsdC8dGqWo1TrGRAO/pg91paqV0AE2pULpggfr17I0kOZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa+8K6Kp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F642606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F642606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa+8K6Kp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1934292f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510148; x=1796114948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFg6AsJZlAHZYkg8EWkBVHGKeTBRg/h+xqjFyeI8VnA=;
        b=Qa+8K6KpprmVocNR0qPP3+ECxTeqDLhv5D0nLQ9Q9rFR4ELA01sl8+UrM08OHiEQ0e
         gon9i6/HyR+FzMEpsPeoBgRTds/lHsT6AWq3Y16gVR3cqbxoUAHzq99V314EOSkyj2p6
         eYHf9s7uU31HhQNqxanx9elNSJj/CUAkJUKE+4R+57K1PlE1aMJP9hi8H88UNMDPhxWW
         Q2otxFGC3h9rnKdsfHnRO4dncMnV1y0z7Jp5v+NUmRZVEQbrvZcN6VgIf0ximeea5W0O
         /u9cbZYGGs3G8+ZYzbXkVVHFXrjpsmEVJL+i5skNNgQg9j7KBh01JOb8r4J1Yb9Ouj4c
         T80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510148; x=1796114948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFg6AsJZlAHZYkg8EWkBVHGKeTBRg/h+xqjFyeI8VnA=;
        b=ht+KFPpD/UhNosfZ7hFU5w90LLbdQhVUPdQrS5pPp89pB3xfndG3kOAQC1ALVCGoSy
         I8p+dXWEqwHCtP85CML4hkcu+3ocx57TAIZqZ7V7DQ8CYvDNv00dpxuImBTA0tplHFRZ
         baH4UFvkG1X0zp0mghH0kqSfkDro5oQcpgjPaKVZY8TMXFzjNPCtU/9L1OnJZCg15YUd
         mXd8kDbk3X6C6eWXrEgM2ROHj7b5X7HiDOKLFi6j8aBGAl6NixBrSs3ugZD5N6/Sa9I2
         7mc6kJNo4tQ1RVHLVYyFCVBPSWpLNUwSxMjeh1ure+E/+Y7eqLCpV1fELZUu9TUJXH/B
         0lsQ==
X-Forwarded-Encrypted: i=1; AL+hErFLm6wxVGxzK4EHYlf/KV6iyPaUnofwWAFZDiOBfngh9UwC+z1LnkNOp1FpFyDjgQkF19zEH1B4XiaIy20=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EgniCpk/cgYna68Fs4hwO5fbcPhODiX17JnfI+Rf9LqQMuppY
	kuAK+xIjNDc+PIyc6zWuu5RvtMVE9mMOEsbcizlJNn85Q+Euqb+oCGLq
X-Gm-Gg: AZFdTZe/xGPYJD61zQMgWg4xWhJF7rpYCcwPkt3UNPe3x6jY6eBWzBUNkkg4lsg6YRP
	Hr/TVEKVMSFCbABfezt9JGI4R1wJgc90WaQSNmcTFmpUP1Djs8XjnYb91KJoza2Ya39bmBSzCO4
	fd/fow2Vmv/jgf254cJWNyY1YMxopQijE+fkMadT2JMYMetWJZVeYE1JqVVhTv3Qil4tLHgtD8o
	2ckzNYLsT1CQu/SaTp+moWr+Btav3uOWxpr62qRozy8BM5E4EizSZRYIPnmSiVaAos+0iUoNgnc
	ipNoRMho/fG5hwyYkD/bkXhfbCIqgvxRtKaj/Rp67MigLBXHIMVMRvAcdkgXtLv6Zi8lA9yxsNB
	XxpC4h5uVcCICJdX5o6FoJRKTZRVJMapYrzcVvmke7cOxdCk2aO5isLPopkcuXTk35AvbAhWNa3
	stvXB/YHFmixk/e4g+tRphZqm5iF+pCbd57WhivEUdtVPkNqbrPI4QQxK/sOBe4BXvoqSnLI9pu
	RG+43plkrZLhIUkpLIP0ogfgkzwMEmOOGQMcl5XedkFKCYoITVaypz44IUEkQEjFtetrzOpCA3Z
	0MWWVWzHa/SlR7B+HReZ+Zb3cI/3PHDX0tAJGL4LM8h/hDiuqb03uPr05V0uWZZybF+dtXsvOn4
	b0wQd+lzVSwRmKWEw3uywZ7SSaF9+aYwYsVgQY8Z/d43sU578Ij1yJsFfNPpgNCTtBPs3oehzZq
	645ugJqA2vPTKh+b1g+T3BG0laXaK5X6CTILs0Y5SdNkTzJFdGC0KndBlocGMeePBIxU8uPYzqS
	CZnwM/pyAvz+DRSpzoQ2saI7QD/GwmPDSimQQ8=
X-Received: by 2002:a05:6000:288e:b0:49e:4ba2:a775 with SMTP id ffacd0b85a97d-4abb86e50eamr26630676f8f.56.1795510148163;
        Tue, 24 Nov 2026 00:49:08 -0800 (PST)
Received: from coder-gsekar-hip-hyg-new-69bc66c5b4-skkj6.coder.svc.cluster.local (ec2-13-205-193-176.ap-south-1.compute.amazonaws.com. [13.205.193.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm27270565f8f.3.2026.11.24.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:49:07 -0800 (PST)
From: Gokulkrishna Sekar <gokulkrishnasr@gmail.com>
X-Google-Original-From: Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com,
	mika.westerberg@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Subject: [PATCH] PCI: Correct PCIe port type field encoding
Date: Tue, 24 Nov 2026 08:48:28 +0000
Message-ID: <20261124084828.15318-1-Gokulkrishna.Sekar@harman.com>
X-Mailer: git-send-email 2.56.1
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

set_pcie_port_type() validates PCIe port topology and corrects
invalid upstream/downstream port type information in the cached
pcie_flags_reg value.

When performing these corrections, the code updates
PCI_EXP_FLAGS_TYPE using PCI_EXP_TYPE_UPSTREAM or
PCI_EXP_TYPE_DOWNSTREAM directly. The PCI_EXP_TYPE_* values are
decoded port type numbers, not values encoded for the
PCI_EXP_FLAGS_TYPE bitfield, so the corrected type is stored in the
wrong bit position.

As a result, a device whose type has been corrected may subsequently
be reported as PCI_EXP_TYPE_ENDPOINT instead of the intended
upstream or downstream port type.

Use FIELD_MODIFY() to update PCI_EXP_FLAGS_TYPE so the corrected
port type is encoded consistently with the format used in the PCI
Express Capabilities Register.

Fixes: ca78410403dd ("PCI: Get rid of dev->has_secondary_link flag")
Reported-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
Link: https://lore.kernel.org/all/20241213070241.3334854-1-gthiagarajan@marvell.com/
Signed-off-by: Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>
---
 drivers/pci/probe.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 9a178e0e5f7f..4c7e0ad1aa1a 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1673,8 +1673,8 @@ void set_pcie_port_type(struct pci_dev *pdev)
 		 */
 		if (pcie_downstream_port(parent)) {
 			pci_info(pdev, "claims to be downstream port but is acting as upstream port, correcting type\n");
-			pdev->pcie_flags_reg &= ~PCI_EXP_FLAGS_TYPE;
-			pdev->pcie_flags_reg |= PCI_EXP_TYPE_UPSTREAM;
+			FIELD_MODIFY(PCI_EXP_FLAGS_TYPE, &pdev->pcie_flags_reg,
+				     PCI_EXP_TYPE_UPSTREAM);
 		}
 	} else if (type == PCI_EXP_TYPE_UPSTREAM) {
 		/*
@@ -1684,8 +1684,8 @@ void set_pcie_port_type(struct pci_dev *pdev)
 		 */
 		if (pci_pcie_type(parent) == PCI_EXP_TYPE_UPSTREAM) {
 			pci_info(pdev, "claims to be upstream port but is acting as downstream port, correcting type\n");
-			pdev->pcie_flags_reg &= ~PCI_EXP_FLAGS_TYPE;
-			pdev->pcie_flags_reg |= PCI_EXP_TYPE_DOWNSTREAM;
+			FIELD_MODIFY(PCI_EXP_FLAGS_TYPE, &pdev->pcie_flags_reg,
+				     PCI_EXP_TYPE_DOWNSTREAM);
 		}
 	}
 }
-- 
2.54.0

