Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023366;
	b=JYSlP5tn6TD+QI9eaEttDm6g2aReWpimilTwT86DknRuI9aG+E/MFH1atsHeRnnbMYNO
	 vZVswrDF2rT1rkzCUONxxjRojBnoOsKn3rhP87PX6rRIAkNQZdap4N2zOFU15p3JwE+9/
	 vpPhwfBH3TTPkiZjDRVlnWdYhM3+E7mPpsrjsY+h3pzm8H/MDDeKzCRYOHwhrx0/9Sug6
	 RwFGEq4Wtts0BFybYdKecrAbVoRLNAbSpF7DYdHQER6tUO8BQQlHHyZRVHjZoGT0sdQXL
	 QGfpspuZzM+aQT/Ia25Sf0qjq5w0JaCptzYEp/CwyN6KFxxSc3xx4NStOt/r+n5wtNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023366;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=A1VaN9f4/cFlIZSIsTrldSLLSX9OOvLT3l5z1334C9w=;
	b=LB84WDUKPvSjeD+zGxLUutZJzwui2Ycs46m8SJxjmbPqTMHB4TAl2SpfQ0uAzWVoe8wq
	 CpyDbVo4oI32Ou0+1+IqvieSAGUMADN6Vgtu+3W+GiJVpEYnDdh8MPfxIYQv4fesCODjy
	 CLrt4zV3FyDKfidc7t3BgnGshfPY0aiQ+9+07gIeujPs5JXqmaj6NXJOfvzpphFbNWjmn
	 14UIa2zRaT2f8lh0JZM44kWZJK3kuMPAj+B8OQmYantGk7f1BFjhCC6h8JI6riF/gihaF
	 nzN7NVfWA39po8ofsQHNyfAugTfWEEObUxsxzR1yuBckbyx1cWk1l06IW0ZB6qdQhOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sMNffbLR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B38E606CA4E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B38E606CA4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sMNffbLR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B49E01596;
	Wed, 18 Nov 2026 09:36:02 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05FA3F632;
	Wed, 18 Nov 2026 09:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023365; bh=BuNOgO1EEXKwVKFzMtnNwyCYEHFBovB7uYbCR1sxkBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sMNffbLRTUKECvI0NN89nalLbpY2RigCDGsY2BjSx6tGS5laI6xUzVZI0IU7lygqH
	 QPRsgFFd5fYy5WW3lKH7gLX7hTLxkXvV2uIqHj7VJ1JX1rfLEIN65wE0/0UxqdU1UN
	 6TXxyqhJQIdbf8OxvE72icOm2jQxMYP+VVpdN1PI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:35 +0000
Subject: [PATCH v3 06/14] irqchip/gic-v5: Use linear DT and ITT when L2
 covers all IDs
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
Message-Id: <20261118-host_gicv5_fixes-v3-6-13c1859e8aa3@arm.com>
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

The DT and ITT level selector incorrectly chooses a two-level table
when the selected L2 table has exactly enough entries to cover the
full ID space. There are no L1 index bits in this case. ITT allocation
correctly rejects the layout and device registration fails; the DT
path instead allocates an unnecessary one-entry L1 table.

Select a linear DT or ITT when the L2 width equals the ID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 88d18822a1ff4..5f9fa80ea6aa6 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -337,7 +337,7 @@ static bool gicv5_its_l2sz_two_level(bool devtab, u32 its_idr1, u8 id_bits, u8 *
 
 	l2_bits = gicv5_its_l2sz_to_l2_bits(l2_sz);
 
-	if (l2_bits > id_bits)
+	if (l2_bits >= id_bits)
 		return false;
 
 	*sz = l2_sz;

-- 
2.34.1

