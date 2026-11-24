Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533383;
	b=FVW21SVffWn+QGtxWoy1KSJQc5BF9XvfmnBsG7T9A8ep1aJqwhskQDFyW7NH2u1mi8cZ
	 7RrytDoWXTmfq1omatNMlLnjX04L84w6+z8FXiKX481oi9srsmX0a6/fZ5xBriL1DW7rN
	 ze763GTLQTCRHXY3lCUehC4CyTOUHBNmeCMku/FHDfSqwI8L/gmj4UG7mCZobNPCFnP24
	 E0Dyr0qm21HbdQDSVQYV1iohukIKMC/0rbZhoP2YbMANaNpebRG+1PsC6YbB1iHYkmP9G
	 Ev0AqzZnvn6ShaYFCItFBtpfJpfdew/jkT64dHWJ2sj7tEwtwUPdSE+c5DhasUV3yHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:User-Agent;
	bh=F96WSg5pTD28lUSUnHWWtFmWs2K3E3FdmPFxV73gVEU=;
	b=Z0d2j8w2XV7IRD4KNNvSFB4RXjeFlN9Ebn8OwRmsTUYgQOnkAurOkAXeZ76Dtt+O7KFK
	 vJV1kGpRQTadG+ggWNEeF1PfsAHuacpUxi9DiK4oXHi3AXujbUd1e0L3HEue8pT15PD/0
	 NkOWoiS04l9PtKODRKLniAf8LEq5i9fy11sMvUlc/jDtIYAez01Nv2pDoKrsvCMgzUIAU
	 cHBLs4tw5Iugxs4XkXV5OIaGaJX4Rl+76df64JTOpSpF6wFB7bI7pt/gKmDQt98XaImcl
	 aJBd3Z8FwlwR7xv1Xyfu+BjCWMNEP3motNYGAdksDXzQXkBUWDsWIZ+caS322cf/SPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkznfrrH;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215FF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkznfrrH
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2114345c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795533382; x=1796138182; darn=vger.kernel.org;
        h=user-agent:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F96WSg5pTD28lUSUnHWWtFmWs2K3E3FdmPFxV73gVEU=;
        b=DkznfrrH3uEXCcf0Q1btCan2uPBXxFeUswMEvzg734hyFctGoIV4QJMQ3y0X2+xiLD
         Z+VtwkZxt5LrDR4mGXK6O9yFOnUHpKyt2M5214U4PUIzJ1u0Yz7Ml1y1/jqlflqJU5Wa
         fWdTjt/ikkvZgW9wyZeavDKWiUw5znQLYxMi2uuPLzZa/IPRoLPtoeqdk/6iTI+Sae7n
         D5SaXgyRZFarh0+sVjdXq1cIav69zCnyW21wjOfQRNzjEhqHpL6ZZDhKGGsyIZDM3wR6
         GqREMwHBs0xDmLXLML8OX1EO6/+BNpnpH5aXdyZBGGhf11REF/uIih2+M9YbsRf+qbV6
         ZFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533382; x=1796138182;
        h=user-agent:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F96WSg5pTD28lUSUnHWWtFmWs2K3E3FdmPFxV73gVEU=;
        b=aH8XwWCLJ17AnKlJxgq5f+mDCvVNbyh7rNFRB+LQJGUuef5c8P+7f/0Bmy6gR9mqe5
         QjXTe1OnyJh+G8j65567j+Xn7BM9mqFfZFkJlI++CFyfO5qnKH8IXK6rdwWCS5sAVBmT
         qAxSya3JiUbX8aw8CB7nAfryPpirV9AiS21RV1YC/ux8WnWZCdWII42uCos0w1rnvUJC
         6X90B783PNUHH7jA6bZz5WjLxvhuhLz7IqNZiY6wFCvA4yMyurYe45jt1Fa52+lwqMnZ
         WAELR5hBjJxRVGLbtLg4/XlIpG86QisikKil5Zr4XuG84kt+AVKP8t5Wk9bt3MBccu9Y
         IoHw==
X-Forwarded-Encrypted: i=1; AL+hErFYhB40DLXOGAhJZhBxgm/JcFcpkiMNUtsPFfeOKyisVp0vXnZ8ChERQOg89Zd7cESKHsFs75lMPhNKlX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OBgkoMknpSoutzET5+vW51w32n3dL7ujCqjufdWXwEsY8PD0w
	qvqNnsaa+81wm+GCtFiZq85PpWwwINn45hZ+YrWpYvms8WXI5LcA4QVA
X-Gm-Gg: AZFdTZdebQ3yXoiAX4p359DpgY6t6zFk8IRDJ77QuP1jZnTmRtyBmGq644zAe1mv2Ni
	wbV9QfW9jprEeI/c3aYsU7XfrmKK10hG1+/AKs5Isg5litlWnMp7ex3eHM6eHInWyJGKednTgtS
	F+0CbxiRYtGEQsCJQGmLwNqKLwwdNA+IOA2xeU7gej43HZNrX68JzREMxv+VZCHZcmMslBeqIdA
	rADhs1d4pNzQuohlRc3ciPzKyvGT0jaeDyDOjMS0wN7v6W373hz/gUyIN/rpyF67YHmJE/cay7S
	dlGUXs7WaGqNBrwdBGPkEDk1YX4HERJCsmZJ5NkWPsuAS9IR2HqtPw3a4RZV2itLUDD6tplqB/C
	P3jD80aaemWDZV055oU7ZRybns3zyEsD9DjXvdS8vIGDFMiYUiSK4smcU3ClssxhBYeG6kPUjib
	BZvaVW/XlQbzqEvmhxZADd9+xDVnPU0hAbwqxm58YBrPCDvV4NL7MbnBcaZuS4c/awXahFQb43s
	qhqQ091UVvWLTMhDm6aRrcTzdk9wyUASU+FP7ml0R17LeR5pEPocCEsTM549nulTnh5V72Qw3lq
	H96TXm7Wj5Udc+voxuuHi8uPKUKevhexKNfJCMY0MOMwS77V1XSJTpQB4irsuTOpuWPp0p+iWCE
	SwqdMdpIDHTaDIS91WZ0=
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr14816177c88.5.1795533381990;
        Tue, 24 Nov 2026 07:16:21 -0800 (PST)
Received: from asus-ux3405ca ([2400:9800:1ae:2539:58d8:c556:ab51:fdfd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm28471337c88.11.2026.11.24.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:16:21 -0800 (PST)
Date: Tue, 24 Nov 2026 22:16:15 +0700
From: Muhammad Huda Nugroho <mhudan21@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] PCI: qcom: Do not power off a PHY whose power-on
 failed
Message-ID: <20261124151615.SjIkx%mhudan21@gmail.com>
User-Agent: mail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

qcom_pcie_phy_power_on() unwinds a failed phy_power_on() by calling
qcom_pcie_phy_power_off(), which walks the whole port list - including
the port that just failed, and every port the loop has not reached yet.
The phy_set_mode_ext() failure path returns without unwinding at all,
leaking the ports already powered on.

The first of those is not a leak but a refcount underflow.
phy_power_off() decrements phy->power_count unconditionally and invokes
the provider's ->power_off only at a count of 1, while phy_power_on()
invokes ->power_on only at a count of 0. Releasing a reference that was
never acquired therefore drives the count to -1, and the next
phy_power_on() returns success having silently skipped powering the PHY
up: no error, no message, just a PHY that is never initialised again.

The damage outlives the failed attempt, which is what makes it worth
fixing. On a single-port controller the very first failure is enough to
reach -1. It is normally invisible because a failed host init at probe
time is fatal anyway, but it becomes reachable as soon as anything
retries host init at runtime, as system resume does - at which point the
controller comes back with a PHY the core believes is already on.

Unwind with list_for_each_entry_continue_reverse() so that only the
ports successfully powered on are powered off, and route the
phy_set_mode_ext() failure through the same unwind. The PHY core already
releases the failed acquisition itself, so the failing port must not be
released here.

Fixes: a2fbecdbbb9d ("PCI: qcom: Add support for parsing the new Root Port binding")
Signed-off-by: Muhammad Huda Nugroho <mhudan21@gmail.com>
---
v2: add the Fixes: tag, and nothing else. Verified against that commit
    rather than taken on trust: before it, qcom_pcie_host_init() called
    phy_power_on(pcie->phy) directly and simply returned on failure. It
    introduced both qcom_pcie_phy_power_off() and the call to it from the
    phy_power_on() failure path - that call is the release of a
    never-acquired reference this patch removes.
    The tag was identified by the Sashiko automated review of v1:
    https://sashiko.dev/#/patchset/20261121113721.7OL6u%mhudan21@gmail.com

Notes for reviewers, not for the commit message:

Against mainline master as of 2026-11-24; v1 was also applied cleanly to
linux-next/HEAD (909ef7a9a30f) by the review bot's baseline run.

A structurally similar unwind fix for the tegra host bridge was declined in
August 2026 ("PCI: tegra: Unwind partial PHY ...", Pengpeng Hou) on the
grounds that a phy_power_on() failure means a broken system that an unwind
will not save. That reasoning answers a leak argument, and it is fair
against one - a PHY left powered after a fatal probe failure changes
nothing. It is not the argument here. The problem in this driver is the
opposite direction: a reference released that was never taken, leaving
power_count below zero, so the next phy_power_on() succeeds without
powering the PHY. That survives the failed attempt and breaks the next
legitimate one.

The same underflow was described by Vladimir Oltean in March 2026 while
reviewing "scsi: ufs: qcom: Drop the PHY power_count check" - "If 0, the
power_count would become negative after phy_power_off(), and a subsequent
phy_power_on() would merely bump it back to 0" - and the ufs patch was
withdrawn in favour of per-driver state tracking. This patch takes the
other available route for a consumer that must not inspect power_count:
only release what it acquired.

Found by reading the error path, not by observing it fire. The underflow
mechanism is from the PHY core's own accounting in phy_power_on() and
phy_power_off(); no hardware reproduction of the resume case is claimed.
I would rather say so than imply a bug report I do not have.

 drivers/pci/controller/dwc/pcie-qcom.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1445,16 +1445,29 @@
 	list_for_each_entry(port, &pcie->ports, list) {
 		ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
 		if (ret)
-			return ret;
+			goto err_power_off;
 
 		ret = phy_power_on(port->phy);
-		if (ret) {
-			qcom_pcie_phy_power_off(pcie);
-			return ret;
-		}
+		if (ret)
+			goto err_power_off;
 	}
 
 	return 0;
+
+err_power_off:
+	/*
+	 * Only release what was actually acquired. phy_power_off() decrements
+	 * phy->power_count unconditionally and invokes the provider's callback
+	 * only at 1, while phy_power_on() invokes it only at 0, so releasing a
+	 * port whose phy_power_on() failed (or was never reached) drives the
+	 * count negative - after which the next phy_power_on() silently skips
+	 * powering the PHY up at all. The PHY core already unwinds the failed
+	 * acquisition itself.
+	 */
+	list_for_each_entry_continue_reverse(port, &pcie->ports, list)
+		phy_power_off(port->phy);
+
+	return ret;
 }
 
 static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
-- 
2.51.0
