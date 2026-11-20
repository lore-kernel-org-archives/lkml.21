Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134195;
	b=2uj+4L2/a0V3arm/apPuYj1t0xPTxlZ2Nd7PsY/ujOTa0mJC/EOau1vWfQkYJNyZuV8w
	 Vgibr2Qp6t5u88ynumajlZggsb+LBb6wVmZmjUO/XB0jY/mAxbqfk3vMH9WVWlRXSvGsj
	 lMYJHyzyiQt/xZ8W4Oj2ic8XgKp2622jQ9CXsdmUqZDIxWeDmrds7pBgrRSPLygK4G1YS
	 eplSp5HQQQE53Xrc90pEphvJqWBDICzQz3q2sbhSsfyOo1HSz2BoPaCOMcHR1gbcXGE/5
	 DqZ/pBmLiUaa8yTdEaJqBYRR7VPt1YNpKYLafHGlClVj3DM3l+u9BWmmQD/Id33pZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nXm7V+55JTESgfbXuII0g/LeSG6H/Z2OSofXDdA1V+w=;
	b=KyrBUwUAT8BhE+83jMgwLAfosUX1yURqj/XH3Uk4FOg8DJlrkJXlrvjG3UU6txWe88Bt
	 BUoPqVMBUATB1ZOgw7al9bAChj/EmTgFuTyy2eeW0QEMhj4CcRWW85To+Z0irlSE6UGr/
	 oBzT0xVsvPbS7RUMy7vN17QLOR3BW4GptlwdmYBcZwKb2hnDewkAdi56ysdHsqbWAQtJp
	 ds9WO+YP7cbdgAxlwRSejwy+vjV7IJPzV0Of01g8TwUpXGaJL5GBthWSrRoHX9dhF+Clk
	 /XCXwFIo9a1rUCCDhuzeK7eNOdVD/oSizi5fxxPV2jUg9Uy0g8eTclbeqFeJVQDEtPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--digonzal.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VsNEEqLR;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74D606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B74D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--digonzal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VsNEEqLR
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so303416c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795134193; x=1795738993; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXm7V+55JTESgfbXuII0g/LeSG6H/Z2OSofXDdA1V+w=;
        b=VsNEEqLRHi0PxFSZZCEznp61x+SU5P86QkV0VKCXaAlFE9fK/AFSS0urLM8aFUP3g9
         eZEWUteXI2sI+0nKeGlJ0dQuUDvuC7WXRLvAJIV+j6xhqjf5b8v3AAJfxZXe1IEsXA6E
         ECHftDhi48os5EWPjztzVj35JsKVZALr+N5+6r/EwAVzUIEHV+pY+bH3Heqk14JbNxV6
         k1IOYL1BNWX1ZRiArVJzGXWthpcNgIosm/XlaPlWCEHk5g1BxnOBr0X4PIDpyHmW0Omo
         3jefQz4/tQ0pwnrWG2DqDlbete19IIkIwHeS3hVr8RE0A26B6vbc8DOZypf4kARaLGvr
         qgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134193; x=1795738993;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXm7V+55JTESgfbXuII0g/LeSG6H/Z2OSofXDdA1V+w=;
        b=EiYb8PhoHgw81O6/zC1N8QqN+VL6S0MkQVROlYT9mGXG2DBRE9nu7sR0WeyDJalM2o
         E0JhURUaDeN3/Av69fWagXlCbP06VQmcYaYp2Yzc9+/Mk2L1UgpS0X5O72KncBnvE5le
         +GrKG+6Gsl3l9KEypfQKpWjZ3sPga+VWc0AmgHHZcdkm9DTfltQ4B/I5/8NsvLml1nmy
         pzm0/YJzJ84CuT+ry69bAoAOQy49B6ErO759mlRvlor2BpbMXk/9wIsVdT9JrZx9Vu9p
         GLjROxyrMp9lVOvpTOEW7yyhpc+HL2As2cuRYNYIg1FtIDr31vris2EsMWOh2pP9RWM4
         t9Ig==
X-Forwarded-Encrypted: i=1; AL+hErEo71GGuJYkSC9Fl2BOxyE/Pre5dn6zlWNaj6R2FZxWj/6i37gbK+5UeVJuKu3tfA+ue9vcT4Bid+3q2l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LSt0i/y7M8iU6Rx1d1nCC2NbYDocbe1ViU4nJTxedKHo3JgRt
	LCVSGicsZFMgAHwuF/rnh8yD0t4hKxPUb6NQHCff/NIOdWBCCi1uGvzBzgOv/UBMX5yddwZSQy5
	u8UFL3bQwHlsPFA==
X-Received: from dlep8-n1.prod.google.com ([2002:a05:701b:4588:10b0:1b2:5589:f43a])
 (user=digonzal job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr1192470c88.40.1795134193081;
 Thu, 19 Nov 2026 16:23:13 -0800 (PST)
Date: Fri, 20 Nov 2026 00:23:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120002311.394649-1-digonzal@google.com>
Subject: [PATCH v3 0/2] PCI/ATS: Disable ATS when ACS TB is set upstream
From: Danny Gonzalez <digonzal@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, decot@google.com, praan@google.com, 
	sheenamo@google.com, linux-pci@vger.kernel.org, iommu@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danny Gonzalez <digonzal@google.com>
Content-Type: text/plain; charset="UTF-8"

This series disables ATS on endpoints when an upstream bridge has ACS
Translation Blocking (PCI_ACS_TB) enabled, preventing ACS Violations on
translated DMA requests.

Patch 1/2 stops pci_dev_reset_iommu_done() from re-evaluating
pci_ats_supported() and dev_has_iommu() independently from
pci_dev_reset_iommu_prepare(), tracking whether state needs to be
restored via a @restore output flag instead. It can be merged
independently.

Patch 2/2 updates pci_ats_supported() to walk upstream bridges and
return false if any bridge has PCI_ACS_TB set in PCI_ACS_CTRL.

Changes since v2:
 - Add patch 1/2 to track IOMMU reset restore state between
   pci_dev_reset_iommu_prepare() and pci_dev_reset_iommu_done()
 - Move the upstream ACS TB check back into pci_ats_supported(),
   dropping pci_ats_check_acs() and changes to pci-driver.c and pci.h
 - Read PCI_ACS_CTRL directly and check the return value and
   PCI_POSSIBLE_ERROR() so inaccessible bridges are not treated as
   having PCI_ACS_TB set
 - Remove the pci_warn_once() logging and helper function

Changes since v1 (v2, based on Sashiko review):
 - Move the upstream ACS TB check from pci_ats_supported() into
   pci_ats_check_acs() called after pci_enable_acs()
 - Use pci_acs_enabled() instead of reading PCI_ACS_CTRL directly

Danny Gonzalez (2):
  iommu: Track whether pci_dev_reset_iommu_done() needs to restore state
  PCI/ATS: Disable ATS when ACS TB is set upstream

 drivers/iommu/iommu.c  | 14 ++++++++++----
 drivers/pci/ats.c      | 19 +++++++++++++++++++
 drivers/pci/pci-acpi.c |  5 +++--
 drivers/pci/pci.c      | 25 +++++++++++++++----------
 drivers/pci/quirks.c   |  5 +++--
 include/linux/iommu.h  |  9 +++++----
 6 files changed, 55 insertions(+), 22 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

