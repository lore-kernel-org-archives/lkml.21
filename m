Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041438;
	b=fXtYh50IqBf+ML0ytzFnhlwV+bKSTgzsd8DC3SV82mVGjCgWbNLjloAa7Xdgza0HkNmV
	 Jx02zpHZ6ijuZxPoymFaOzup7xjO0lgz2vUF4CdVAdUSXi8jOpSVzf/Ely2FtAhzx9PKm
	 c5bdFdM2kGYypStWbVj0AmkXOb/UHrW6/cSU3Zg8PNozBwnuoAPN/QwGlqA6P5WysyRXY
	 IjjrJHC0cCf4Ik10Z7xE/DICd5BCiULzJKZeH1MtGlUK8m+jlzYezB0x9Iz6XJwS2JDYm
	 ZY/41eZ5euBmr3vrcoGJMVsGuS4xCYV3+Zj9s64nSnTX3ur79R5QC05YvjdgweWKyhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wAMMri541KJubVOMQzqlC8m9FrHJPC8q4xU1ogcuUXg=;
	b=C3rwMlS2JhgUzRmxiBLkA4IPM3r9NUvD3FGhQz3OSQAZNdywpsliziix3gVXAODFya3/
	 CnDqx8fDOCARzHeC9PI92erttQgAzCslkvetRTvl0dsbr6YUXpQwY4spWQKoCgqOBNaf5
	 mAB/Gs5vanQ5ANjXHEsN/X3yjlNKnlDQXrsPxUBSqrkD3LjSkES0B3nSs+g7witt+tXf9
	 +Va8+do9a1JQQZ70iHf1/iHLL1WPd8kc/3F36DGr7lLmlhL1kEXQ3cOamtWQK5j1bXSxe
	 LJ/WBhxV5q+yawQ9c3sd/lk5zajfL8Wrz/w2sEfQ4wsXLhSjmYnRBjIbJK/pyvFeF1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ELbgy/il";
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8A60A5BC5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E8A60A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ELbgy/il
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso1903282b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041437; x=1795646237; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAMMri541KJubVOMQzqlC8m9FrHJPC8q4xU1ogcuUXg=;
        b=ELbgy/ila2om0Fq4ChOVVL3qFfHzHZv7ppY6ScMqlWVDlHSUZHOgKu/CoPouFm6s4L
         cT/F42KRRCqekFkFOgcC48ctbXNmi1Cz3mWoJsLVkVNO24EtWb+itX6H1Qkppcal3P6x
         B9RJv69Xi2ZT3eJdkYmo0AcVxZzS16Md2oH1CJbZ3FVTiYVKsl5uy/TEBAeBhSVrxy9i
         ygDrC3QMIjeywOfkvp3N19oQe1Wd3lmrKHU8ZhWz4MtHUly3vB1C/ptXr2TG4NAfHwkK
         uVBh4nr39fjKimiQ+1OTA92UHpcwe0d7OE+93bm8mVUwgchRB6L/7Nve3MCeHW9TvOXL
         IvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041437; x=1795646237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAMMri541KJubVOMQzqlC8m9FrHJPC8q4xU1ogcuUXg=;
        b=Cs465aTlJVYPwySjGD0rCggpp+xAQNaMe8WQTTCtOMoM4sf3NlGmm3CRJkReXHTM9c
         kv0wdoBf8UTUTo4qQSuzBV7YDnR+twiwiwfUqZyArpYo/DZwQ7LPlzsK1+OykgvBr4li
         joS0HPD1lDnrBPdLPSyTuTr4jjUoWov7dI6rq+mY1P5sTF5WqIrp1QcCpUZSzzTlJRfo
         NG9wgj14SLMywXBLdta3w2gLhGbbMRs/HN9TlbnR3OAV9HSf2T4YmMLIqdaAinWcD+fH
         Fi+mguMHLV+7rMN/Wv2M0PJ4mpqnWv4681dLEbltYqL4+SGoULC4P6eNwwY+3FWsNz8w
         kx6A==
X-Forwarded-Encrypted: i=1; AL+hErG4aDqGLUpuHQzvVz9hDdphC2DMq7ciM/vWYO2SNfSnb6SWsYICMb5pVTBGcZKfhy6REn7tIW42gxa34TU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VOz9uIrdIk9YB/fMZrfAJAUv5RBqqKskcOA2RL8buAbhHIXLS
	j+B77ZnvFGf0wMtwiNbVH5IQ6OjsWxY3IGHlOpS65WTxuB+nTnBiA2qp4iRpiox8d1gKYh7Grmb
	jK6eLuMSB1uRjvg==
X-Received: from japs5.prod.google.com ([2002:a02:cc85:0:b0:5fe:dbaf:f909])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1524:b0:4c3:6c2:4f29 with SMTP id 5614622812f47-57741d176e1mr4378785b6e.16.1795041437234;
 Wed, 18 Nov 2026 14:37:17 -0800 (PST)
Date: Wed, 18 Nov 2026 22:36:59 +0000
In-Reply-To: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118223704.3286085-9-dmatlack@google.com>
Subject: [PATCH v11 08/13] PCI: Save and restore the ACS Control register and
 Egress Control Vector
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Alex Williamson <alex.williamson@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Save the ACS Control register and the ACS Egress Control Vector in
pci_save_state() and write them back in pci_restore_state(), instead of
recomputing the ACS controls from scratch with pci_enable_acs().

This makes ACS symmetric with the rest of a device's saved state. Today
pci_save_state() ignores ACS entirely and pci_restore_state() re-enables
the ACS controls from the kernel's current ACS policy. As a result, a
device can come out of a reset with different ACS controls than it went
in with, e.g. any controls programmed outside of pci_enable_acs() are
silently dropped.

This also lets a later patch adopt the ACS controls established by a
previous kernel across a Live Update rather than assigning new ones
through pci_enable_acs().

Save and restore the Egress Control Vector as well to keep it in sync
with the Egress Control Enable bit in the ACS Control register, which is
now restored from saved state. The kernel never enables Egress Controls
or programs the vector, but the firmware could have and they need to be
kept in sync to avoid changing how P2P traffic is routed.

The Egress Control Vector Size is a HwInit field of the ACS Capability
register (PCIe r7.1, sec 7.7.12.2), so read it directly from the device
to size the save buffer in pci_allocate_cap_save_buffers(), similar to
how the VC capability relies on its HwInit fields.

pci_enable_acs() runs when a driver binds to a device
(pci_dma_configure()), i.e. after pci_bus_add_device() has already saved
the device's state. Refresh the saved ACS state there as well, otherwise
a subsequent reset would revert ACS back to the configuration left
behind by firmware.

Devices that rely on device-specific quirks to enable an ACS equivalent
keep that configuration outside of the ACS Control register, so don't
allocate an ACS save buffer for them. Keep configuring ACS from scratch
on restore for any device that has no saved ACS state.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Alex Williamson <alex.williamson@nvidia.com>
---
 drivers/pci/pci.c    | 152 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci.h    |   5 ++
 drivers/pci/quirks.c |   7 ++
 3 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..fc4307a2327d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1021,6 +1021,145 @@ static void pci_std_enable_acs(struct pci_dev *dev, struct pci_acs *caps)
 		caps->ctrl |= (dev->acs_capabilities & PCI_ACS_TB);
 }
 
+/*
+ * Layout of the ACS save buffer. @ecv holds the ACS Egress Control Vector, if
+ * implemented, and is sized by pci_allocate_acs_save_buffer().
+ */
+struct pci_acs_saved_state {
+	u16 ctrl;
+	u32 ecv[];
+};
+
+/*
+ * Return the number of DWORDs in the ACS Egress Control Vector, or 0 if the
+ * device does not implement P2P Egress Control. The Egress Control Vector
+ * Size is HwInit, so it is read directly from the ACS Capability register.
+ */
+static unsigned int pci_acs_ecv_dwords(struct pci_dev *dev, int pos)
+{
+	unsigned int bits;
+	u16 cap;
+	u8 size;
+
+	pci_read_config_word(dev, pos + PCI_ACS_CAP, &cap);
+	if (!(cap & PCI_ACS_EC))
+		return 0;
+
+	/* An Egress Control Vector Size of 0 means 256 bits */
+	pci_read_config_byte(dev, pos + PCI_ACS_EGRESS_BITS, &size);
+	bits = size ?: 256;
+
+	return DIV_ROUND_UP(bits, 32);
+}
+
+/*
+ * Return the number of Egress Control Vector DWORDs held in @save_state, as
+ * sized by pci_allocate_acs_save_buffer().
+ */
+static unsigned int
+pci_acs_saved_ecv_dwords(struct pci_cap_saved_state *save_state)
+{
+	return (save_state->cap.size -
+		offsetof(struct pci_acs_saved_state, ecv)) / sizeof(u32);
+}
+
+static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
+{
+	size_t size;
+	int pos;
+
+	/*
+	 * Devices that rely on device-specific quirks to enable an ACS
+	 * equivalent keep that configuration outside of the ACS Control
+	 * register, so they are configured from scratch on restore.
+	 */
+	if (pci_need_dev_specific_enable_acs(dev))
+		return;
+
+	/* dev->acs_cap is not set yet, pci_acs_init() runs later */
+	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+	if (!pos)
+		return;
+
+	size = struct_size_t(struct pci_acs_saved_state, ecv,
+			     pci_acs_ecv_dwords(dev, pos));
+	if (pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ACS, size))
+		pci_err(dev, "unable to allocate suspend buffer for ACS\n");
+}
+
+/**
+ * pci_save_acs_state - save the ACS Control register and Egress Control Vector
+ * @dev: the PCI device
+ *
+ * Record the ACS configuration currently programmed in hardware so that
+ * pci_restore_acs_state() can reapply it after a reset.
+ */
+static void pci_save_acs_state(struct pci_dev *dev)
+{
+	struct pci_cap_saved_state *save_state;
+	struct pci_acs_saved_state *acs;
+	unsigned int i, dwords;
+	int ecv_pos;
+
+	if (!dev->acs_cap)
+		return;
+
+	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS);
+	if (!save_state)
+		return;
+
+	acs = (struct pci_acs_saved_state *)save_state->cap.data;
+
+	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &acs->ctrl);
+
+	ecv_pos = dev->acs_cap + PCI_ACS_EGRESS_CTL_V;
+	dwords = pci_acs_saved_ecv_dwords(save_state);
+	for (i = 0; i < dwords; i++)
+		pci_read_config_dword(dev, ecv_pos + i * sizeof(u32),
+				      &acs->ecv[i]);
+}
+
+/**
+ * pci_restore_acs_state - restore the ACS Control register and Egress Control
+ *			   Vector
+ * @dev: the PCI device
+ */
+static void pci_restore_acs_state(struct pci_dev *dev)
+{
+	struct pci_cap_saved_state *save_state = NULL;
+	struct pci_acs_saved_state *acs;
+	unsigned int i, dwords;
+	int ecv_pos;
+
+	if (dev->acs_cap)
+		save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS);
+
+	/*
+	 * Configure ACS from scratch for devices that have no saved ACS state,
+	 * e.g. devices that rely on device-specific quirks to enable an ACS
+	 * equivalent (see pci_allocate_acs_save_buffer()).
+	 */
+	if (!save_state) {
+		pci_enable_acs(dev);
+		return;
+	}
+
+	acs = (struct pci_acs_saved_state *)save_state->cap.data;
+
+	/*
+	 * Restore the Egress Control Vector before the ACS Control register.
+	 * The vector resets to zero, so enabling P2P Egress Control first
+	 * would briefly apply the reset vector instead of the saved one.
+	 */
+	ecv_pos = dev->acs_cap + PCI_ACS_EGRESS_CTL_V;
+	dwords = pci_acs_saved_ecv_dwords(save_state);
+	for (i = 0; i < dwords; i++)
+		pci_write_config_dword(dev, ecv_pos + i * sizeof(u32),
+				       acs->ecv[i]);
+
+	pci_write_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, acs->ctrl);
+}
+
 /**
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
@@ -1057,6 +1196,15 @@ void pci_enable_acs(struct pci_dev *dev)
 	__pci_config_acs(dev, &caps, config_acs_param, 0, 0);
 
 	pci_write_config_word(dev, pos + PCI_ACS_CTRL, caps.ctrl);
+
+	/*
+	 * pci_enable_acs() runs when a driver binds to the device, i.e. after
+	 * pci_bus_add_device() has already saved the device's state. Refresh
+	 * the saved ACS state so that a subsequent reset restores the
+	 * configuration programmed here rather than the one left behind by
+	 * firmware.
+	 */
+	pci_save_acs_state(dev);
 }
 
 /**
@@ -1825,6 +1973,7 @@ int pci_save_state(struct pci_dev *dev)
 	pci_save_aer_state(dev);
 	pci_save_ptm_state(dev);
 	pci_save_tph_state(dev);
+	pci_save_acs_state(dev);
 	return pci_save_vc_state(dev);
 }
 EXPORT_SYMBOL(pci_save_state);
@@ -1902,7 +2051,7 @@ void pci_restore_state(struct pci_dev *dev)
 	pci_restore_msi_state(dev);
 
 	/* Restore ACS and IOV configuration state */
-	pci_enable_acs(dev);
+	pci_restore_acs_state(dev);
 	pci_restore_iov_state(dev);
 
 	dev->state_saved = false;
@@ -3565,6 +3714,7 @@ void pci_allocate_cap_save_buffers(struct pci_dev *dev)
 	if (error)
 		pci_err(dev, "unable to allocate suspend buffer for LTR\n");
 
+	pci_allocate_acs_save_buffer(dev);
 	pci_allocate_vc_save_buffers(dev);
 }
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 77efa4c5c960..8fc4b18738bf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1101,6 +1101,7 @@ void pci_acs_init(struct pci_dev *dev);
 void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
+bool pci_need_dev_specific_enable_acs(struct pci_dev *dev);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev);
 void pci_disable_broken_acs_cap(struct pci_dev *pdev);
@@ -1111,6 +1112,10 @@ static inline int pci_dev_specific_acs_enabled(struct pci_dev *dev,
 {
 	return -ENOTTY;
 }
+static inline bool pci_need_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	return false;
+}
 static inline int pci_dev_specific_enable_acs(struct pci_dev *dev)
 {
 	return -ENOTTY;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 0978be9c17db..7572b358b50f 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5629,6 +5629,13 @@ static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
 	return NULL;
 }
 
+bool pci_need_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
+
+	return p && p->enable_acs;
+}
+
 int pci_dev_specific_enable_acs(struct pci_dev *dev)
 {
 	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
-- 
2.56.1.703.gf848ed807c-goog

