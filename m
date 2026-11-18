Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041437;
	b=N7lyw3VsdLiR2pWKoVDUrfejs7DDYWckb6uVf3gyNWIebmTNXbG2Dgv4EbVqr6JUMMlA
	 eEzs7SNBQeH3sqArBZuHoWnBVgUtLe92eY6Z4KB/iofGlfvZin93fim0guRTVT+cBZVXJ
	 BLSET9QHcyRUEbCjoam0bxC5rBqso5sU6UeX59zrCCRj1cacxMRj9nI5K7ukcuwXWSP5O
	 pBANv1aUzVRwY/ktIOjmN8rNBT5+aENkIoDk21HmfrQUwOy7/hcuwvRkjLLLAipxlBnRy
	 RCMz7DEY0GfkTmMBLJb0RCH1peKGsf9ssmI9fHnFw6T+MrK4sBiV6JxCwi4z8BfC58w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=z7tUVoYWeDGeTao0p+AwzKydfdHA75iYT78ktPbXtuY=;
	b=lnlgbmBMUOsh4g9pxprtCHRooyNBSWssUeWoovTvaWliT+MwYlOaEjaTIvTyFklaZ9Lx
	 IzyfsP1yBpcTMoo+fAw8athdQDOrWJSkYBeVjpFcgvYUjoplxbiZ12rHYnjXiQbJweF3+
	 s7Cn9Q+uKzw2uI9kPZl9bnXrjWaoEi7VG2X8vOmecjwyTKRmVysoHT4IfGe1wvtMfPPJB
	 NQzjrohmJ/CD86W9jy++d1hf30wn97mQoXMZ1Sjys2qR0qCfoliEWtTMBtxzwbaf9kOoU
	 /YUEYzGI8CMN2o2sF0HcSt4cOJYCg8MxrxThbfxAep8S6O8T+vmlSC79H3bLEVseyCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZDPvefI;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B8606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1B8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZDPvefI
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c467e19391so2295878b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041436; x=1795646236; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7tUVoYWeDGeTao0p+AwzKydfdHA75iYT78ktPbXtuY=;
        b=VZDPvefIYa4N3KX0KnZIsiU98TngA7GG4Ap3Wjpq2zvxKy2RlpW2dFbq6lIa0CIbwm
         zt0tSs8LczM47zGYnT3X3H0kQzDaPdf1nBU2GsAXc7RU+bAp7MKQ5K5A9JE010hy2LTx
         woKf+GSXFfvIog4QpiiawrqLaCleYP/4deev0STQVmlZ661lpk4lxX5jlSIZi4dAc7tG
         TtorSkvLm5pQU865FpHqk3PH5Oln+YXWyGamHmN8I7ZUeVMsMz4pgQnGMeo7UldA++Yr
         baFWtxe69TPEdNPglc319sHoTg3ZiF+oqz4scPSRm0sijtOVdHocxhLcUULtIdcAEWZP
         aCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041436; x=1795646236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7tUVoYWeDGeTao0p+AwzKydfdHA75iYT78ktPbXtuY=;
        b=b5E7K7O+Cr7eN+TkM7JV2qim88tE+jh1NQC2cZrOPkrnI0tmq6TGrWtWjsUvChNK6J
         zECOqrAqOMiyEfPetchVVDkH7imiJVT+PRaGb4orKB0blt9a84oQ+GH1cbpxSdPIQnh0
         t1w8eNx9OyxYH6IqkyPkvCLZF4mnYD6Y+e47KjXHdF47ni7cf+A8hBmUKEmuTMRS6Now
         NWr5cblTkIokv1KJEcY90/b9Lf+svfyTGweKdmvMHnw2qvOqax0AWj7EvCzHZ3XfybRD
         F5feym/uCF0VgWYR/r47lD5+o8u3DTjpEd2ANEI4f2qWQU7hVzA8K2ZcVx09ha0tkWH2
         2NeA==
X-Forwarded-Encrypted: i=1; AL+hErHip2UgtZ7y0Lwrx36yGHRYWG2xXmIgjfnO6ReoHe5sunvsAaD/c0+2b7fM+8YuE1vAkGGSPrwtYOtmVYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Rbpo/X9L5bva2Yb6gY+9HmtRMU2vcyvaQgO7xCxGnYHLhIJn
	ffHliGdKzmffRp2lVm5sFxQ0UgF11gy2SYItzgJ5ZIYo6FBLtzeC6dJPdn70zk5yXRydsCRqbuS
	eFsgydShtGXcVVA==
X-Received: from ilkj10.prod.google.com ([2002:a05:6e02:eea:b0:549:aa38:c185])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:221d:b0:4f9:bc36:fc5d with SMTP id 5614622812f47-5773dc44bc0mr5135544b6e.35.1795041436008;
 Wed, 18 Nov 2026 14:37:16 -0800 (PST)
Date: Wed, 18 Nov 2026 22:36:58 +0000
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
Message-ID: <20261118223704.3286085-8-dmatlack@google.com>
Subject: [PATCH v11 07/13] PCI: Refactor matching logic for pci_dev_acs_ops
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

Refactor the logic to match devices to pci_dev_acs_ops by factoring out
the device matching loop into its own routine, pci_dev_acs_ops_get().
Move the per-quirk device checks into a new .match callback so that
pci_dev_acs_ops_get() can return the single matching entry.

This eliminates duplicate code between pci_dev_specific_enable_acs() and
pci_dev_specific_disable_acs_redir(), and will also be used in a
subsequent commit to check if a device requires device-specific
enable_acs() during a Live Update.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 51 ++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..0978be9c17db 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5530,9 +5530,6 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
  */
 static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
 {
-	if (!pci_quirk_intel_pch_acs_match(dev))
-		return -ENOTTY;
-
 	if (pci_quirk_enable_intel_lpc_acs(dev)) {
 		pci_warn(dev, "Failed to enable Intel PCH ACS quirk\n");
 		return 0;
@@ -5552,9 +5549,6 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5582,9 +5576,6 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 	int pos;
 	u32 cap, ctrl;
 
-	if (!pci_quirk_intel_spt_pch_acs_match(dev))
-		return -ENOTTY;
-
 	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
@@ -5604,56 +5595,56 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 static const struct pci_dev_acs_ops {
 	u16 vendor;
 	u16 device;
+	bool (*match)(struct pci_dev *dev);
 	int (*enable_acs)(struct pci_dev *dev);
 	int (*disable_acs_redir)(struct pci_dev *dev);
 } pci_dev_acs_ops[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_pch_acs,
 	},
 	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
+	    .match = pci_quirk_intel_spt_pch_acs_match,
 	    .enable_acs = pci_quirk_enable_intel_spt_pch_acs,
 	    .disable_acs_redir = pci_quirk_disable_intel_spt_pch_acs_redir,
 	},
 };
 
-int pci_dev_specific_enable_acs(struct pci_dev *dev)
+static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
 {
 	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
 		p = &pci_dev_acs_ops[i];
 		if ((p->vendor == dev->vendor ||
 		     p->vendor == (u16)PCI_ANY_ID) &&
 		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->enable_acs) {
-			ret = p->enable_acs(dev);
-			if (ret >= 0)
-				return ret;
+		     p->device == (u16)PCI_ANY_ID)) {
+			if (!p->match || p->match(dev))
+				return p;
 		}
 	}
 
+	return NULL;
+}
+
+int pci_dev_specific_enable_acs(struct pci_dev *dev)
+{
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
+
+	if (p && p->enable_acs)
+		return p->enable_acs(dev);
+
 	return -ENOTTY;
 }
 
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev)
 {
-	const struct pci_dev_acs_ops *p;
-	int i, ret;
+	const struct pci_dev_acs_ops *p = pci_dev_acs_ops_get(dev);
 
-	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
-		p = &pci_dev_acs_ops[i];
-		if ((p->vendor == dev->vendor ||
-		     p->vendor == (u16)PCI_ANY_ID) &&
-		    (p->device == dev->device ||
-		     p->device == (u16)PCI_ANY_ID) &&
-		    p->disable_acs_redir) {
-			ret = p->disable_acs_redir(dev);
-			if (ret >= 0)
-				return ret;
-		}
-	}
+	if (p && p->disable_acs_redir)
+		return p->disable_acs_redir(dev);
 
 	return -ENOTTY;
 }
-- 
2.56.1.703.gf848ed807c-goog

