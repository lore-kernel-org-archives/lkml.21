Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041433;
	b=gnjFv7LGIxgaBJVwof18+xTpl2PDFi0kJ5jsNJE0qnviRbx9LuwMzWwqrxd7LwPMvGcH
	 GxL4iIivF5C7TLRMfg1PJuftIwWpMKvmSzKaSIbBdGsHTvH5KfASxFzKm7xrVZnZwdOXh
	 MiDAqOatVK5CB8xFqwwGNWchqlGANuSmoS3TYVzEet0JVHjQ1xKXkXxFusVxCnKODOi/p
	 c3fnSlius4JKt/ZMWkuehz4BAtIGXJTPDBds4XoC31zLDEz9UDvDX/fDbXvxZHqNeJelA
	 ylbjVX7fW87ZawhROW5ech5Mc5pNg/KuHKOyRRYe1buWuuOeJHxsPwGWtzVcm+ZpBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ad5b7cD20gHMOhZMyF8+WzruE7aQOBAM0dk/O+UacAU=;
	b=DRdx94yT0Scws7VkGty1uQ4ryw6xxHQs6M53j1u3E0otGA/FYTE6rbJsBHhjiJU3Wy0m
	 CHSjdydgmu/v/L2sqMFlNml5PMrcWSwKe0gczhl5eZrr7S72BYQ9G8BLPc6ogDmgRR//w
	 4yexl4jzO64h1AO35rCj964qKPeHBfNl9g5DivbjKR1VuRVYEz0EFljcvvEksnMWNu9uO
	 GlzAU0OgkWfqWRmqgtd4n8x/ccugK9Oh3Y/3epST3UGNMIAcyiJ84CM84K9z9YVt8/QZ8
	 xeszbJa75nQZaf8RjxvpFi/UuXN54Cb/reyz4GWO9suaPVdIwqjiIyJCsxM+aGQG1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aY0tK3x5;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B54606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B54606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aY0tK3x5
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso1722424b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041432; x=1795646232; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad5b7cD20gHMOhZMyF8+WzruE7aQOBAM0dk/O+UacAU=;
        b=aY0tK3x5hpEuOgjK1LbmCTTsGON2EP0ZXn4GcuDj1uyXJgXbNq1e9++IerlF6ogvas
         DCSqYO9s3Hd+dz6sxleeiVXnhYS8iV1/0eenGG0cWLbcjrf4wUrLaw8voieXMmJJyBw+
         KENduTvJdo/y9yWvADIlZAH1zwM8dJYQsggsRW7fmKcKCmeKX6On/Yx7PydI4mYvzwp1
         WNTeKmzk4SzpydEsYMM0AoxotZz/2DVzua4TYkszJoQm3KzsBpTTLmTbSWuopIOqxmqQ
         5reOaAymF/v6FIUB35ElHPkP1Tv9VM7uKnUNnENT/cNIUycTzz+mbLBxfrUdwRbX+G/T
         xoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041432; x=1795646232;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad5b7cD20gHMOhZMyF8+WzruE7aQOBAM0dk/O+UacAU=;
        b=UADuXjaeKbE7HEDbN44uE5Hds9+Q4Ed4XRf7VxcypWWpoENzmgOvSSL2TbtrCBWPSS
         W2ae1kmiL1l0swXomxxCTlkWcE4I59XqwSKHgSeyl0nVVjQokSNmv/9Hn4U09vEwtLz/
         16Jpbb9jQ8ZLY1cbv9qDRQIlnqSxoi38UIqTtxv3WiQg/BljykZ0BRsRpXXctbkE32wa
         liKlklUFqZ+fgsd3ALP7o+I1KH0rROC8z+dqcMsTALVURuqGMOUSpVZWbm+gHtugxQ+J
         VGNIVLKSn16nLuJidBrALFUCmXroiB7WpBrpthWg8r6f5zAFMnqkSGl/DNDUTbmzI1a4
         EDGQ==
X-Forwarded-Encrypted: i=1; AL+hErHqHIJd3QjgFJKylMvmyTaqfW6eqR8Q6Jpf9xhm0yd8seXD4li1XMf/w8L7+de6PG8tMpTPAAK0gS/s0qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nVn3yzE9smK5lzeok5emZd2PrzTfYghJ0f5mvwaUHjzEiXwyx
	2jnk2KDLfDtBI7dQCrpuW3SpRQsf+nM5eWhBY+48VGE/sPZO28ofJSJLMF7a9N1y98zAlG7q3aN
	W+rSMVikG7+iX+g==
X-Received: from ilqe2.prod.google.com ([2002:a92:d742:0:b0:53c:2d10:3af1])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6401:b0:572:8a:59e8 with SMTP id 5614622812f47-5773d72c450mr4859784b6e.55.1795041432243;
 Wed, 18 Nov 2026 14:37:12 -0800 (PST)
Date: Wed, 18 Nov 2026 22:36:55 +0000
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
Message-ID: <20261118223704.3286085-5-dmatlack@google.com>
Subject: [PATCH v11 04/13] PCI: liveupdate: Document driver binding responsibilities
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

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/liveupdate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index b569093bea75..d1b4000c3e78 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -123,6 +123,20 @@
  *
  *  * The device cannot be a Virtual Function (VF).
  *  * The device cannot be behind a PCI-to-PCI bridge.
+ *
+ * Driver Binding
+ * ==============
+ *
+ * In the outgoing kernel, the driver must ensure that it does not unbind from a
+ * device between pci_liveupdate_preserve() and pci_liveupdate_unpreserve().
+ *
+ * In the incoming kernel, the driver must ensure that it does not unbind from a
+ * preserved device between probe() and pci_liveupdate_finish().
+ *
+ * It is the user's responsibility to ensure that incoming preserved devices are
+ * bound to the correct driver. The PCI core does not protect against a device
+ * getting preserved by driver A in the outgoing kernel and then getting bound
+ * to driver B in the incoming kernel.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.56.1.703.gf848ed807c-goog

