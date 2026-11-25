Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617658;
	b=QUuBHwlNWJf4UU/y2XiELScAYtwAw4+mFF0TpwzyVNGosz0zKkeHe0xnwTt65VMFr+vI
	 E8r5EPtaXy+DKgcVQX3ExHNTW5wwI2tBIGNcKXMJxLD3ENZ5Y6Xs6FxbVc13KXfCrMMvK
	 thsW7oY9rHURpyZdUxtDTysCi8uzhe/MFjAmIInuUQhTxKdnjpAdnnNyaB+QX7wf0F5vU
	 gl9CZwKThERTS0KPWWt0/f2CMQIa/anYD4+FmdGmfHRx/H8lBTw905QtEa1S3IhoZ8Yi4
	 DTnRAe5aN73KcOnDE6dhK01DJ732GdSOEO0msejhWAYHqvymYDyNKwKPPkPbNlh8fzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617658;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=SMSogha4JmnSjGt+CAW8t4lsMFrLPPJEQVNhzcJN1kg=;
	b=5Oe3euovxzjl0NbuOF46CB3xzhIRFrV9in7e5Xf+rei0J/yu3t4Zpx+adLKtVW1bUvkI
	 Jyk+t/SFgzQemXWquriZdk+tqKRvoG2P2972lirvNU+WNmcS7KBSZbmj5jfWHNnhjkaGn
	 ujddoUHkwBjG9teFFEDmPsCcyCjroRVGueCieoi7iHGgbz37Qqpy3chHn49xSe46fnZXn
	 gmAjamB6JxWzpSSnR91L2NjDTwBpKyJKsNdRvsUljNh9P3LfeUsId/OWSh+dWOV8B7qi1
	 qWWXaQotWFhrHsVrJhZo2SzpDE1RUWTzm0cx1QEb+U/KCcwUAWpj37nHCp8HInU71rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QX3F+Vzy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89CB606A68C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89CB606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QX3F+Vzy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251991C00;
	Wed, 25 Nov 2026 06:40:54 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A2C23F632;
	Wed, 25 Nov 2026 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617657; bh=/9AiJma5tBJHN6uAi+hEyWMtZ9lFT3cZO6KP2ELOVJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QX3F+VzyPlP++saPPVMqnI54TDQVGLIF/tn2MUVbQRCR7VkdKYFbYzYlkVesNe9i+
	 0qYiE/8CKOKxEb30t2sDp72+GmhgY/3JXgwqf/RoyMAQSwdkJKvBTThgM2PuIVXUmf
	 h4roxROpQSunNCpxbsFeMxhB2UXRkPUtVYri30To=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:34 +0000
Subject: [PATCH v4 12/13] irqchip/gic-v5: Clean a level 2 device table
 before making it valid
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
Message-Id: <20261125-host_gicv5_fixes-v4-12-0469743c47d8@arm.com>
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

From: Fuad Tabba <fuad.tabba@linux.dev>

gicv5_its_alloc_l2_devtab() allocates a zeroed level 2 device table and
writes the level 1 DTE that points to it with VALID set. Unlike the
other ITS tables, the new table isn't cleaned to the PoC first. On a
non-coherent ITS, the zeroes can still sit in the CPU caches when the
ITS reads the table, so it can take stale memory as a valid level 2 DTE
for a DeviceID that nothing has registered.

Clean the table before the level 1 DTE is written.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 37835d1600fb..959277c74b68 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -433,6 +433,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 	if (!l2devtab)
 		return -ENOMEM;
 
+	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
+
 	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
 
 	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|

-- 
2.34.1

