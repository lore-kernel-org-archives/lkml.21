Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460464;
	b=X7x+qV0dC/V+0tid1zckg+HRpSEitLsGTFez966HFvvRP0bdUpFkcmEDIn2R0zgi5s6T
	 v5HatCeGTd4d6A1shGW5CW1FborzPxJ12TfJfmTQ+6XXk+fgDmL1ZH3wq3fdklEKEkSKr
	 ZhaA7pllDIkd3aqsYKj/yaRPpcPTQHk5jC//PVnce73rW83Bo3hS+pWfheIR9cQ1891Et
	 d8SDFSxrtqQbfCdx5SeT4pSlrzkqx8jOLWUoLG63NoAyTugsKhg0t3RTHaYyE0uvW9vBi
	 MUf6jALzk07l20wjdtwhD7fF/kGseea4trU8dxOiulSrznEz91iBavEK5izVE1DsFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2BPu+oA30t3CvvayfJGBtOo4KEcsTgY7xbV9OZz0KkY=;
	b=mRFsDFDfy3WCs0RByKcYOhynjhbV9gYH19OnOmAE+FjWoGWVf2R4eV2zoum67jROijUb
	 S0Q6Zt5q2RQlRc3YOI9KLyN27qre8EbHxYGA/dYYUQvngS5nCj/SJTGukJf122njxRUxE
	 aoEon1UpOb69yhVA1C8hYuF2kR/DDreR4PrjnqQ8pDJctVbBciVjDiU+SYGxptCTr1dy5
	 dgLFwzHWG5Y2O8mCIZ6Fqm7IMNtHu5mKQsXRUGBtf/wFBh30dyNmLctaVnPvIhwV00w/T
	 Hzw0BdyuK2N66ebijXnNNGyPpBhBEgGtZQEBQp/qY9r1M3dJ5VQcsn3ZZXsU4dLUnvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QBpK2rhD;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA2A606A6A1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA2A606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QBpK2rhD
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5384e381fbbso3291722b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460462; x=1796065262; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BPu+oA30t3CvvayfJGBtOo4KEcsTgY7xbV9OZz0KkY=;
        b=QBpK2rhDGjEbFHIAJ42V0Z1LiLLjjsa9NmxE3buiC/2iLVQrjNqPP2Rh8WtqP8iJc4
         gEGlXKHbjI5iWtX5/d10dOKVcP2AtBUnTW0Auz831fryJ3dIOjknhPmJj5jIw7bo9u4K
         JeWDfOC3J0i4IznbxV6rKa5Op1+znSBCpzijPS7r3yBLBXXw9eJkDLbs1pcP+LbETn+2
         Ns4tBfQPI7Wxltgz5AtXpm0r5V4RFSJwub7mMjN9QtqQvb0cl00EWnFS9p2vSiyPgObR
         yi3pDR08iIhrqR57sZTIvWMwVU+AriRLBJJZRwNTevMSPSsxAwqIgk32a0/CWnXMU5dI
         8FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460462; x=1796065262;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BPu+oA30t3CvvayfJGBtOo4KEcsTgY7xbV9OZz0KkY=;
        b=Fv0/k+gBuXgq7M4aOTa5iACrZ4/MbFDrlCABiU/ioyPeR/ZvRvuY3eWWTPHx1pscOh
         xvZ5iX88IQGPZHxpPLyoQf6xkr4z0m8Op3avHipFDcNxdRz0vQw0EUvmX7U3Qm7Q3vq0
         XN2TQ/1dC5s6QTRGZ8o94s5fxJM8DDG2eg4fXMbdOXkc7U71vSwvy9+5S4TsMYN1oaGz
         /jqmeuB1NeEd7vnrgEXLma7bErqrqnAAqrpkqQJawMn7vop0CcC8xvTHODQBZbsXbKk6
         9A/EaSW4UigFF6b4RB9shAupXNJLQGTg3a09Wi+sWC0YMATogc+r1DhUfS0JVyqSYJni
         +pGg==
X-Forwarded-Encrypted: i=1; AL+hErH0FJa3u91A5E98MDQb5GA/cPJoeP28h30Xge5tYWCsO2RJXmQKMIF4tfBAwsxIcohv45Po7YaOYgtweR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sozLfkrC5Ey4i8TZQqq/HYhB6Gb4cemQTyZa8ThbfFMfr4ocl
	VQNKc8aKn4SLuekclylKh0t38G7cRHkcdqmRSIXeYHF8Wk7+zovR0bSqK3QlcCcd0IraQ2808vR
	kJNGUsOiCWCxo2A==
X-Received: from iobhj14.prod.google.com ([2002:a05:6602:1d8e:b0:9c7:4d20:1320])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3514:b0:571:a186:d6b9 with SMTP id 5614622812f47-57a0a30a106mr14736384b6e.13.1795460462155;
 Mon, 23 Nov 2026 11:01:02 -0800 (PST)
Date: Mon, 23 Nov 2026 19:00:45 +0000
In-Reply-To: <20261118223704.3286085-12-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-12-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123190045.2166865-4-dmatlack@google.com>
Subject: [PATCH] amend! PCI: liveupdate: Freeze preservation status during shutdown
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alex Williamson <alex.williamson@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
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

PCI: liveupdate: Freeze preservation status during shutdown

Freeze a device's outgoing preservation status (preserved or not
preserved) during shutdown for kexec. This enables the PCI core and
drivers to safely make decisions based on the device's preservation
status during shutdown.

The PCI core freezes every device in pci_device_shutdown(), not just
preserved ones, so that no device can be preserved or unpreserved after
its shutdown starts.

Only freeze devices during kexec. Other shutdowns do not depend on the
preservation status, and they do not serialize Live Update sessions
first, so a session can still be torn down after its devices are shut
down. Refusing to unpreserve those devices would make pci_flb_unpreserve()
panic because they were never released.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/20261118223704.3286085-12-dmatlack@google.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---

Notes:
    This amend! also replaces the commit message when squashed with
    git rebase --autosquash, to explain why devices are only frozen during
    kexec. The message already includes your Link: and Signed-off-by:
    trailers from lu-pci-preservation.

 drivers/pci/liveupdate.c | 2 +-
 drivers/pci/pci-driver.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 08451452fa54..76e939ea52eb 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -127,7 +127,7 @@
  *    Control Services (ACS).
  *
  * In addition, a device cannot be preserved or unpreserved once the PCI core
- * has started shutting it down (pci_device_shutdown()).
+ * has started shutting it down for kexec (pci_device_shutdown()).
  *
  * Driver Binding
  * ==============
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 08b768b9e905..2748ca22e9cf 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -560,7 +560,8 @@ static void pci_device_shutdown(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
-	pci_liveupdate_freeze(pci_dev);
+	if (kexec_in_progress)
+		pci_liveupdate_freeze(pci_dev);
 	pm_runtime_resume(dev);
 
 	if (drv && drv->shutdown)

base-commit: fd54e32f7903199e8acb2762dd2debfffe4501c4
prerequisite-patch-id: ac616bdf67b652da754c7b00a368613d345ae384
prerequisite-patch-id: 9c324eb4a47b659efcf7c0c8bb14acfcbf5d615c
prerequisite-patch-id: a1ec7135c2c0c8f90b12743df9e4620ab2ee2f2a
-- 
2.56.1.809.ga0b61035b5-goog

