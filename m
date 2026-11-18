Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023373;
	b=SkZG8VXS91vKB+Yg7YuoiXSwdARH4JpRSmP/RF0eEDBtCS9DIo7dLRPJdOrqNBq9qix+
	 M5iQ6AJIs8heetBSctctiLi2CCft9Z1dckWd2SLS6Bm3J5jceQUTRDZvjrETPwP9LrabR
	 0arr9Ki/1h4lfHtU1GfrJhzRYXZtcAhbCJUHaMpzX8tyY2eqmgKfBP+sk7zKlIXLxBjjf
	 AJwJuOns6TluIVdGl7bxuP+5SXQMre3Kln2r8DNHQ15Na/q6FlV859kE+tlrBq3dEnoFw
	 6tHq+ZmaEOzE2GFy1inVwLhfqrv7OW32bXDK4bH3pnrIFAqpeFfCVSBVxvyKMEn5qUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023373;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=UFIBjGWnu7kUv1HS0pe9AtlRnGt7OnF4wenQyP+Eucs=;
	b=puE+QezZ04El6rD0BrZJJBLGJklzy5y6bpnBv7b781XdfUhu37mNj32R8K9/tZJF20w7
	 KqBagD8r+wC6vUx91HcgEJi0JVKwIwWP8t+J2P3xWuxvHai9NYWJ03LOTttJMUEmi5aeb
	 vDSIchf7LmE/DqsBJCoujq7vb99Cm+GYTMUkiMy2ecn0lKpu3PWl1AyZB7WVqcCdIRtSs
	 L7fQmoSt/ebN8pR0Fh1sKnO6h4GNUcN+svcyysiZKNiX/u4ZwSVruDCAGEkx/GRdL8QZq
	 +DbOSvjUO/JHQMX6e9KMg6zpMzo3TB+wsAY3I7Jnexd+S76iA9RC6acQeryMoNdXflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RT2tYONm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438CC606CA4B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438CC606CA4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RT2tYONm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A111596;
	Wed, 18 Nov 2026 09:36:08 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DF113F632;
	Wed, 18 Nov 2026 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023371; bh=nEQtFOIdNM+BVYEiFqeLIqurLRXANKzdtjAsgB1fOsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RT2tYONmSgICU7pi0B8KTkzM3YOliLTMjJf3qys7j6z1iAkb1fWI146+KQWeaNs5J
	 hcnMXoGtL87YTj8iEJZsgxB1++m/C/sTM0MaN5K2EvNu1sccXuIeJZYJ0a2KTWrME0
	 Xcqf6oHDdm/pyeaq/M0L0ITbsB+xJFdqL8OnIDPY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:38 +0000
Subject: [PATCH v3 09/14] irqchip/gic-v5: Invalidate ITS device cache
 before freeing ITT
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
Message-Id: <20261118-host_gicv5_fixes-v3-9-13c1859e8aa3@arm.com>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
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

A cached device table entry can still reference the ITT after its
memory is freed via kfree(), even if the DTE has been marked as
invalid. Once the memory has been released, it could be reallocated,
and it would be unfortunate for the hardware to interpret this as a
valid ITT.

Invalidate the device cache and wait for completion before freeing the
ITT during device teardown.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 876437017ccc5..dce5bfd1a78dd 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -556,6 +556,7 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 				       struct gicv5_its_dev *its_dev)
 {
 	__le64 *dte;
+	int ret;
 
 	dte = gicv5_its_devtab_get_dte_ref(its, its_dev->device_id, false);
 
@@ -568,9 +569,10 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	/* Zero everything - make it clear that this is an invalid entry */
 	its_write_table_entry(its, dte, 0);
 
+	ret = gicv5_its_device_cache_inv(its, its_dev);
 	gicv5_its_free_itt(its_dev);
 
-	return gicv5_its_device_cache_inv(its, its_dev);
+	return ret;
 }
 
 /*

-- 
2.34.1

