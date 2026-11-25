Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617656;
	b=H5dWEPh+4ugfme39EHgJV3AcgvR5sEX3YhrQf6W1yDYGQmdic3XWMPmK3Pp/ZQ5N0Tcu
	 EnZTFa2e4IWgyOO5R+5GasERy2+sWaieNyHLwrtn1cgN9opoIZEc6h1zenMvysSIW0c4F
	 dKWz2XqXTtn/YlaX4SwzKuVW4x7PGWNGZ5L4z70dLXiZKzW0HVgXQWRnEBin2co9l0GMq
	 ZnHETiYcDVbKHiv2NeEze21qKC5JhNoxWf4cl3QtKbiriCuybowiRw4QzGuQD2QQwLW7Y
	 Bc2ePbzEU/+9PJ1ftFMEkDdKoQLH30k2oiP9gzNp7P0SVQrRFm/TYchFtbBoldV6bJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617656;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=IcKZMhVXkGsLegGjBxXphuzXg6/DwngmLc9AVe2Sr2Q=;
	b=ya8gASNhvpFUn2mO++HdOUOhoXL4C34POboTpeh3Lb5K4RAOXSz5RoBiKY1pqpkw7uTW
	 lKj6VU8enapUwykX/mEdWVDusZ5ek8R0/CkVHKE+nSW20j6yqr85PRoDzXa3xkco21lIQ
	 U9TicFqDmyA32NVj7CsYC63NW11nor+kJm3kysPUJ0SlOJztAlTE0bUKgNLCJBmelTHOL
	 wC9odUx9blQwlj8R4lvbVHbqpXvcNDV/UFtLHG69lIYSQYUHROVqnXpTqYm+xGy6OSKyU
	 QBhtG4HsrNp9co7/YuHf+MCnTq/OYrt7ePRnfetcfjTppB40EnCtDTY3QE0UjzfVByw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mqYMj4HJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDB3606A69B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDB3606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mqYMj4HJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 635651BF7;
	Wed, 25 Nov 2026 06:40:52 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA8423F632;
	Wed, 25 Nov 2026 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617655; bh=gt7ayGUpndc9+xYpRU4sJb5goSevkWB5qx8zGCnfUXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mqYMj4HJOTQaHs49wZnhCfzwZe47nDhaEMEveW6J84VcjpT85Zk7deEnMmSuPK/Np
	 uHaEb9z+vjEeOnpXB8fyIwfhZCnDgN/2XRnDoqUvqGVUUUvJePmyQxXCKz3Z15QbNN
	 DnIIcWZvzDVfXeqBviGz89o1vbDYZF7nkxDc4gGM=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:33 +0000
Subject: [PATCH v4 11/13] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
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
Message-Id: <20261125-host_gicv5_fixes-v4-11-0469743c47d8@arm.com>
References: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
In-Reply-To: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2

Device registration publishes a DTE pointing to the new ITT before
invalidating the ITS device cache. If invalidation times out, clearing
the DTE in memory does not guarantee that the ITS has discarded a
cached reference to the ITT, and hence the hardware could still try
and access the memory. Freeing the ITT on that path can therefore
leave the ITS accessing memory that has been reallocated.

Device teardown has the same problem: it frees the ITT even when the
invalidation issued after clearing the DTE fails to complete in the
specified timeout.

Retain the ITT on either failure path. Continue returning the
invalidation error, and free the ITT during teardown only after
successful completion. This deliberately retains memory on hardware
failure because a timeout does not cancel the operation or establish
that cached references are gone.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index db13011ef6d9..37835d1600fb 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -11,6 +11,7 @@
 #include <linux/iommu.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/kmemleak.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -165,6 +166,23 @@ static void gicv5_its_free_itt(struct gicv5_its_dev *its_dev)
 		gicv5_its_free_itt_two_level(its_dev);
 }
 
+/* The ITS may still reference these allocations after its_dev is freed. */
+static void gicv5_its_itt_not_leak(struct gicv5_its_dev *its_dev)
+{
+	unsigned int i;
+
+	if (!its_dev->itt_cfg.l2itt) {
+		kmemleak_not_leak(its_dev->itt_cfg.linear.itt);
+		return;
+	}
+
+	for (i = 0; i < its_dev->itt_cfg.l2.num_l1_ents; i++)
+		kmemleak_not_leak(its_dev->itt_cfg.l2.l2ptrs[i]);
+
+	kmemleak_not_leak(its_dev->itt_cfg.l2.l2ptrs);
+	kmemleak_not_leak(its_dev->itt_cfg.l2.l1itt);
+}
+
 static int gicv5_its_create_itt_linear(struct gicv5_its_chip_data *its,
 				       struct gicv5_its_dev *its_dev,
 				       unsigned int event_id_bits)
@@ -540,8 +558,9 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
 	if (ret) {
+		/* The ITS may still have a cached reference to the ITT. */
 		its_write_table_entry(its, dte, 0);
-		gicv5_its_free_itt(its_dev);
+		gicv5_its_itt_not_leak(its_dev);
 		return ret;
 	}
 
@@ -570,9 +589,15 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	its_write_table_entry(its, dte, 0);
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
+	if (ret) {
+		gicv5_its_itt_not_leak(its_dev);
+		return ret;
+	}
+
+	/* Only release the ITT once the ITS has discarded its references. */
 	gicv5_its_free_itt(its_dev);
 
-	return ret;
+	return 0;
 }
 
 /*

-- 
2.34.1

