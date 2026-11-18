Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023362;
	b=HGgO7tFHvXgwbb+rcxeJg3vM7TZBvofiMf6c4PhbD7CMl8WtCw5H8XD9aW4BYQSoktt4
	 NQKKl19BOkCZIre37VguTDb3SPn/b1otFlb4tXPx9NsGh6Zq5iZvtGVqkQDnmtordpW2V
	 3imPPcrbYlnlMjubZHgrYyuWBqLcZImAEaT7qPgqRqNe7YxexfguRbBl5eQ/Yyk/vYaAx
	 2PB2Dn+Jz0cGxfV1/k59YbNCDp8OmpNJD1vn4CJLDjUCLe1KvhzxAsKkxpUQRNZ0/KY13
	 Mh2f2sMcdj0LXA1Wu0qtlcSVB24uQpCxdU3YbJLVjxOd1NG/uv0SgJmkduO99ZTLmzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023362;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=5fkeFCaDG41DZYF7IvV8UUkr7pM8RaBUzj0UR3hY470=;
	b=FKsDJNlieZah4osB307Ycqpn8tQ9y65NYBEoXt1hdMM0VKqI57OFdzF6TxyPW2mQIqEd
	 uOLJdELx6HD2mCvAwbpu7AEqQJ84IypaA/Ai5kbQheuoTiXVfpbzr/r8Nh/g/A47i8Py/
	 1ZOYk8CAiNii5N3/nR/IOUUxoydbOLeD/2pYAVaRltG0Horq8s6tIHrEsrruaS9J+S6oL
	 Du4eZ4usP25UeXFZ6RrreyCoFFztdanSHDwDd0ebEzxvTB7B2WqsbGpS6ZkzTCTqxzaFm
	 Ti1uBlb+QcQqm3UH1P2nYLmQ1cW5xsUVyR+fxdaIcNviFtvDUcLYhrTVvaMcwmrbdsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F98UCwi9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5B5606CA68
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D5B5606CA68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F98UCwi9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8516D1596;
	Wed, 18 Nov 2026 09:35:58 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37F23F632;
	Wed, 18 Nov 2026 09:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023361; bh=40kNhZdUlRxGoDSPD1exXdec4Ru2AT99R7S68imoT9I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F98UCwi9GcfyhsAfsZmrYLeyUHQ8S69KHl7noWpv8Kw/2DpQ8G87TCrGWROF4i7Xt
	 iYrGehei+uAj2snutjWxOjcB/j7ZEhqc/EXGuU87RZzffKa9CgAtnEF9MI4j2RX3Rz
	 oOHmdZ5NPkBll0aglvD1ODL0e9DsVnfGW5R8XAsk=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:33 +0000
Subject: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
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
Message-Id: <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
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

If the IDLE poll after IRS_MAP_L2_ISTR times out, the mapping
operation has not been cancelled and could arguably still happen at a
later stage. Clearing the L1 entry and freeing the L2 IST can
therefore race with hardware completing the map and accessing the
freed table.

Retain the L1 entry and L2 IST on failure. Reject a subsequent
allocation that finds a nonzero but invalid L1 entry, so it cannot
overwrite the entry while the earlier mapping may still be
pending. Mark the retained table as intentional for kmemleak on both
success and failure.

Fixes: 0f01013258768 ("irqchip/gic-v5: Add GICv5 LPI/IPI support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-irs.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index ead76560ea08f..78deb46baa784 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 	if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
 		return 0;
 
+	/* A previous map timed out; do not overwrite its pending L1 entry. */
+	if (READ_ONCE(l1ist[index]))
+		return -EBUSY;
+
 	l2ist = kzalloc(l2size, GFP_KERNEL);
 	if (!l2ist)
 		return -ENOMEM;
@@ -235,13 +239,11 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 	l2istr = FIELD_PREP(GICV5_IRS_MAP_L2_ISTR_ID, lpi);
 	irs_writel_relaxed(irs_data, l2istr, GICV5_IRS_MAP_L2_ISTR);
 
+	/* The map cannot be cancelled, so retain the table even on timeout. */
+	kmemleak_ignore(l2ist);
 	ret = gicv5_irs_ist_synchronise(irs_data);
-	if (ret) {
-		l1ist[index] = 0;
-		kfree(l2ist);
+	if (ret)
 		return ret;
-	}
-	kmemleak_ignore(l2ist);
 
 	/*
 	 * Make sure we invalidate the cache line pulled before the IRS

-- 
2.34.1

