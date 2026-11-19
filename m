Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090825;
	b=A7L/IY1xDhuiBtOeVOoMao2rfoUsEEFAMZ56CRTFwJzw24AZcS4VDbCg5ZWfNQ1nPZpH
	 v+wDdEYkX/jlx7fQ9ezjy8mkTAJbwCZLUPUnJ/1lCmCodvVacHZ+1tN/HnGlpitVXX1Jo
	 KVbfdXaCVC/y12FliddbYpr1mbBUR3xAAGZ6OKSR7rned6EHKBMtxLgIvbKc5ZGYV9AFd
	 q/ebvRsSfMNAU/B2QtmYJJyYHJ2LchQr9kYwXmm9xscY8Tii+eEbImFLPpBGQta8K3z9J
	 g7Md/7tVFvKoDR9M0d2cKT/k73sKhsizoCErLrfU+Bq1pgBOuj5JKYANmJuM5NUACBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+7xRvEg+xwDhzUl0OpKcCBhyEZfVnsH/Bc/HKtadj5E=;
	b=vtk12xOhjL1vXbPS+7mTV3KOF4Jn2BdhWSjz6Etd2Y+H7Rh86uHbXA+T3BRWEPjzEpJh
	 06eDVHVWa2LxBDq4MDp1gCmP0Cr980sWljisRvLXE3LPAtOTyaPDHItxK9FDRe6YXGo2/
	 QzaHD4noHmjlD3B1+RDDFzqtTYJVi3hMrTDq1LbnoU0QiiuUrE24MrLMZ5Z9+Z/KROebL
	 2ik8UNdHvcyoxzM+47rhNybMNmRYy/IitsiiyDu9LZ0WGjk+f+nrOTlELyFlmsvUeuIjK
	 eV5FUUJFD+uIKDkpRpiw51uF5iODT0qILHb1vKIWccAzl6IUof0UuebZLJQ67m7jvfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVJTfLcZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3867E606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3867E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVJTfLcZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so22201505e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795090823; x=1795695623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7xRvEg+xwDhzUl0OpKcCBhyEZfVnsH/Bc/HKtadj5E=;
        b=zVJTfLcZU5QGrrkl+NOShXgsa9P57cNLvp46KvzrUobFfzi6Xp5+Ek/Gv3LIdqHCK0
         Lja1D+auP2ObH18RnjTTX+Dt9+2ujqfjfKYDu3QA4OObNL8gI6f5vAZKwX903IutIdli
         ObTX5DpO3Q8qwHi2e52Qrag7vCbVdjv0Q+wx1qgeJ5+AwqSEA/YVcOCDbdrQJy2Lw9lS
         ZgPNj3n2ytG6bbnDzJjG8EHm936lXvBuRO1Vo5ruZZRsuFoAMLMVNGDcD44YXownYrla
         lECUARfltydKKu1F0VcHdXH+mYg6M8ENCgzmyuuQ3walTRmKXB5OxUMMwer7GS/DmAwJ
         WMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090823; x=1795695623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7xRvEg+xwDhzUl0OpKcCBhyEZfVnsH/Bc/HKtadj5E=;
        b=kRT+cxCKgT8FCZCPLh06uQpzc+yLJ0Mfp6wmTpwtOrgn/GDbKofYM8WzOI0BOrcBEg
         hOuCugNaIHV/y0kEda9XjE9LVgLMjeryQVJn4yTy6tyS2GJqWD6hnjtoLZWpuNM2/er4
         rJSGzVtFBsoJqGlwz0BVeuhuB7Oln+4DhFd/V6NAmV3f7h/nswNGyvKb5eGpDHIcVHpE
         N+XPBryFEmWMJ/fHxM0sYxnmGtjRuv68BwG7JNQ3+3XQdRlGthpUHCQPfi1lDRY+BNW7
         xQE6wJCgKkR/s6MjiYOLsG19JqL74uFaRF1MIwS/OACD/tzG/kNZpwmqvF73oghCJ1u0
         QaxA==
X-Forwarded-Encrypted: i=1; AL+hErFHXgojHNw7q0Hcs8WCmZIFcq/aFXL8ZWTt9rYWmdUC6Ex/jrv4mkJ1K4faAEGjDcMeaEworpGzNK4HaMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fw1XwDVSmiQ3CmLz+2hu5TJC9qx6teXAx9xB5FT6qQDL68bYw
	yPemSQLhW65zKm/V8hj/odSEy9VvaQt69JIHgInBZxlMDa4Of3VBEXwN
X-Gm-Gg: AYBFou0COO5xPpNd5iV0UsW+7eZkxO7Pt+bp9CDrY42X2ZneZ28zI9NPhUhfXW4Jw45
	UCQFs+7/yMj+tMd5M6pw8+HiyANa/kX2yujJvc2SITS8aswbd2HVjeKKyl8fMUipZyaRRm5yha8
	e11uRYZMPuprpcFWAdPEjc2Bcfw388yB1ogNS4Ab/7efwbAGoAPH8sLkKtyAVm/qA/A2uxLLRE7
	cUah0eGa+WvYUo6VqNngptBaQtJg+G7YIpu/YifE5IgSz60u6459i/fUNl0Flpt7bULBssJSYZO
	5aEjHmuqLnE8cJxHSqsHznqVYKpWToC7C7fZK1k5+7ZpkS2gfyln4q33invG+FXKGebHtwlYrZ8
	chaNDldUH9zAXzNbap6rskDvQFSkqtytUqzp5pilFP4VyWpBLweyE3FWvmHJROId44R2iXAVVtB
	wTju5lhPtVAXfHtbZtzUxc0nQJ1K9cJEIXaFFNxDzCcQwyNRgWrOcVTQb3vIU9dmflRLCLdiNFq
	ExN7VUPzoM4AgOXQAdEoreJDpzpGwcgID//240gaY2jigs3HHBASUtgMf+o5JhxG6yh6ys364c2
	04jZzyeZr5L9kPNfDmMjbNmRgL9a0xW+ZmfnOgvfQQdUYsOekdwpt0TV30lqbJBb6Ai3m0i3QmO
	f1aTxSAniGLQA70k4pM6I1vWtQ/juz79o5sN44veZQpJa72NVJjFAEMq2RJCzFprbE+ANKDhF7b
	4w7PsXimGV9idrgnBwwokIjSlOAtmUNSjpwm+LaEMSXeAdOUjsXWrWI1Alq8Kb00bYTbe2Qoelm
	qm8PLtzmloFmr3sLg==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb7da26333mr115390035e9.18.1795090822118;
        Thu, 19 Nov 2026 04:20:22 -0800 (PST)
Received: from coder-gsekar-hip-hyg-new-5c97b6d788-n6g25.coder.svc.cluster.local (ec2-13-205-193-176.ap-south-1.compute.amazonaws.com. [13.205.193.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8532f08dsm32579225e9.2.2026.11.19.04.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:20:21 -0800 (PST)
From: Gokulkrishna Sekar <gokulkrishnasr@gmail.com>
X-Google-Original-From: Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com,
	mika.westerberg@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Subject: [PATCH v2] PCI: Correct PCIe port type field encoding
Date: Thu, 19 Nov 2026 12:19:47 +0000
Message-ID: <20261119121947.204565-1-Gokulkrishna.Sekar@harman.com>
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
Link: https://lkml.org/lkml/2024/12/13/198
Reported-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
Signed-off-by: Gokulkrishna Sekar <Gokulkrishna.Sekar@harman.com>
---
v2:
 - Use FIELD_MODIFY() as suggested by Bjorn Helgaas
 - Clarify impact by describing the resulting PCI_EXP_TYPE_ENDPOINT
 - Add Fixes tag
 - Add Link tag to previous discussion
 - Add Reported-by

 drivers/pci/probe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 9a178e0e5f7f..93e2e1f688ca 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1673,8 +1673,7 @@ void set_pcie_port_type(struct pci_dev *pdev)
 		 */
 		if (pcie_downstream_port(parent)) {
 			pci_info(pdev, "claims to be downstream port but is acting as upstream port, correcting type\n");
-			pdev->pcie_flags_reg &= ~PCI_EXP_FLAGS_TYPE;
-			pdev->pcie_flags_reg |= PCI_EXP_TYPE_UPSTREAM;
+			FIELD_MODIFY(PCI_EXP_FLAGS_TYPE, &pdev->pcie_flags_reg, PCI_EXP_TYPE_UPSTREAM);
 		}
 	} else if (type == PCI_EXP_TYPE_UPSTREAM) {
 		/*
@@ -1684,8 +1683,7 @@ void set_pcie_port_type(struct pci_dev *pdev)
 		 */
 		if (pci_pcie_type(parent) == PCI_EXP_TYPE_UPSTREAM) {
 			pci_info(pdev, "claims to be upstream port but is acting as downstream port, correcting type\n");
-			pdev->pcie_flags_reg &= ~PCI_EXP_FLAGS_TYPE;
-			pdev->pcie_flags_reg |= PCI_EXP_TYPE_DOWNSTREAM;
+			FIELD_MODIFY(PCI_EXP_FLAGS_TYPE, &pdev->pcie_flags_reg, PCI_EXP_TYPE_DOWNSTREAM);
 		}
 	}
 }
-- 
2.54.0

