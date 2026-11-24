Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510256;
	b=IbpenlZkmEaRgTLqk9nP51f78wq5ODEwhRdAB6PwVC7CncsU6tyR9ILUKZNIDkttP97a
	 ogbIgjlNyu/g+vTbXr4Zd+2BWAuQcQ4LOJ//+crvo3LP0fCF7Qq2UkmlnVvGPdYcqdsQ1
	 hKLk9gVtECJdDmzIHuJ4lPrlqrGw4hH+BnloGg05FLGpttbcxeE79sfZuPEXTaVyh6Zv+
	 Uoio/v6WQ+RfDSbJtLNxpFwqvPbnzTkx3JD7oj1ipGmErcQt3DnTD6Y0zpHKeUUNjOLLu
	 /hcOmRPg5GX78f1ny2JGPHXIBo2umelOPFwrPv7beRpZ7ZM36Cp3LoY7ZzH9mJonEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ad/K9RZ8sjTi38+Gyzvh9/ZX8PvYSN6LWjOvymfH5Kw=;
	b=CvqCNcwTkRuVIM2ANlSkY0AKfivGrabKR9lbK7ZcaTUxOk3aBtaL2xY2tjp5sKvHnn8w
	 3tehmKhQB1qcW8nrZznca6znjbEtJE9su2uFXgeAbu+S9QGvwwxFNauoaigaMSdySg/ly
	 pTU5ECtS/al1Qa1Tgg78l3fUsASMslZdyMh0nr1Ba7j99ZlTpmz7NILzNPt3sazhMJbNj
	 XAtxfOjgycmwvpv3p1JRlevMFz0McMcUrl0Hv3Ai494THyh52a6pOmg8wzO8oWqxPSQ2P
	 Q5LdEqtGZgw+fMKnv844obMCHdd9mYjfKHh65+oEjPynxvJP9rrjWhKWZjWqVA1CcgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi09bL4N;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C13606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi09bL4N
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so32430785e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510254; x=1796115054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad/K9RZ8sjTi38+Gyzvh9/ZX8PvYSN6LWjOvymfH5Kw=;
        b=fi09bL4Nu+P4qLcINKdD/gVz6zffLlsVwuQ8SOkfniyHUxDHZQEhIwfN577UvZsg7N
         BAsSj/b+p75J6GPKBCIl18T9gkOsnJFUDbkTZVNa08eJM5ZAbj5BtmNjH0x2YUJ2R2O+
         Q2SU5bHstC699qqDLaUXcObRVaC0Q1w3Uz4apNp9bwAU9STQhsCiRAnPRLXy/j3399Qb
         zJpQHwttnL6eYhl9ZQWjgvu01Eie0JNHqGsoCnIPx4yM7w754j6iJ8jSoQr9nLBBtXmL
         nI3Odpk3XbIb6C7MrK8vQ3VRr4gNrpuMvX8buF5r8L+b2Es1Ckgt6XmsSCR6MztIaQDF
         lovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510254; x=1796115054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad/K9RZ8sjTi38+Gyzvh9/ZX8PvYSN6LWjOvymfH5Kw=;
        b=FZenkqLgOKrVBlnBPVYU4kRnWUOvogiyWBjKxIfx0j1wN9bMEU15XWLVXWKN5FVAj4
         LtPnW2LESdbilBd7UTl41wRXnr+UuOcr/i41RTl3tHnDjWzlAoPiYcnYwtA+bXntAkwM
         izUlKTw0CiLrPZ7uEGDZA0bWqYbwD7H+XUicKNw88l4xDIJrkMfR6womTNtOfmaIqK+B
         wNq2YJqjc70r17TD/86TkkV4Hpq2crJPlJ7WUt6Mellf5rg9AT2Exd7hSIk5AtOj0gAH
         rx/zXuOZ5vCA/cH7hYgHo2L2hTacIIi3gI88zmbgk2mGkzZycui7XwKtnWMX01/EPr1/
         CZAA==
X-Forwarded-Encrypted: i=1; AL+hErEBVwpBGpP6//GkBObkF2CfrYDm0UNMS6VTZJ2ab2CrSGPiUDYefqrEMRj4knoGY3Dn1wkuidgr64ZsTzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pSRsLLxL/ATchjy1AR5Yrt20oxK3IGrilblpb5q++7eOtQ8F7
	axtdo/ogD/O2UfPL7S+e4OEv/BkkYiLyaqFrYvwZuJ31Yly+N4bwAuZl
X-Gm-Gg: AZFdTZc2oW1YsR7+0wkn9CW9TW6nnoQlhnvisgp6xZ/SFc6hcgDnamzJhfK+FUmI6uq
	B+IBW5szVF5xf8o/Y0Y4jd49yypzB5yPe73FUosY97xZYT78t67w4ziiHtVpxR2ewmpAEnCU52D
	+pb2DgSIrCE0ankjtt7cNTxHX27VnYaAU54b0i1h25llz5ULEUGUlcIdhT5y2KlNEw1bFfZWeFB
	FIMqutG9vfW52kMPbN9xDnS1Zi4C8+2/bvJXkhAROqbnO09vSZA00UCY4QYr2akFYnvk0hOx5qv
	HGw4BS62saUnLHxzXXygfX6CtV/jnaIzI2/20Oa3bJRJ1/3BFdlErDXoUAt9z3StpD3TSqFpog4
	dvFGoKm/8hpOLySIgnxTAEms0R7ccjMK3/7ioT+PPRE9tay2+zYPckI9Mr5f95zQsSmGAd7WRzW
	ZLL5nzj/PuLzdLyegPv/ieAEyJK45AneZkS1BE+Z+Bpv7f9TsUIZOyqeDZIGMEwOTrW81hvQsW5
	yQ1SQ+WJLf8c/4Z4Q6Ave/ZyAoo5/tVOdPYSJRx/TokqgaslNjRL8hSXl/g1bw/eWCwmLJGA7tJ
	nm3PkSu2kNFrtxAVfYEuQ+TOyA17lz9h0KrZy/KTd2IwDDbaPE1Iy2GF6QYz+UrKPIacvBjkB1b
	+Q1l9CLVdfKJc+aCeMU98789C8rihPwxsSvGy7wt9B6okaK3ZC5CfSMo2oE784VrywGibARWQmy
	qfvmPEY7hSMf7HvQQ6XZoT/7qzkgH66r/PW+yKrQIGWA7qASHNUjvqwhokXYG6R3f9n2wtQXsd3
	gAeg0Njjhl2V9YjrJw=
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr287431895e9.33.1795510254155;
        Tue, 24 Nov 2026 00:50:54 -0800 (PST)
Received: from coder-gsekar-hip-hyg-new-69bc66c5b4-skkj6.coder.svc.cluster.local (ec2-13-205-193-176.ap-south-1.compute.amazonaws.com. [13.205.193.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm407308165e9.6.2026.11.24.00.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:50:53 -0800 (PST)
From: Gokulkrishna Sekar <gokulkrishnasr@gmail.com>
X-Google-Original-From: Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com,
	mika.westerberg@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Subject: [PATCH v3] PCI: Correct PCIe port type field encoding
Date: Tue, 24 Nov 2026 08:50:38 +0000
Message-ID: <20261124085038.17299-1-Gokulkrishna.Sekar@harman.com>
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
v3:
 - Updated Link to lore.kernel.org
v2:
 - Use FIELD_MODIFY() as suggested by Bjorn Helgaas
 - Clarify impact by describing the resulting PCI_EXP_TYPE_ENDPOINT
 - Add Fixes tag
 - Add Link tag to previous discussion
 - Add Reported-by

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

