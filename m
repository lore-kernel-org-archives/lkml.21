Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617645;
	b=lyGnFSnEL5y+2jjgo/DABlE+AnxMq56DBCOhdsvepPBhmt5NgeacZqG363UQBoVaS6cN
	 3EHDeOMuigTKuzCSNwoAocTyZhRJtE1bWZ8SaLYGSqedHadhXdj8sU0cp9yUcG3wfKXPB
	 y0/JUNp4/CFfswlDcOSOi4gHsxop47s3RFk9RUa0RDZgC0/YWVEfL5VJTinD3QXAuK2CS
	 r5unXv+5sqVKcHsCTMOIj/rfq55ncVALy63gHu1n1qogFfuWA+CvdabkXCk59mbcu8lKY
	 refsoJ6N81HEkCZ2tXQ9Ok354vyBgOYV8d3kVx8HlQq6FctZCjmMpn6/TQ8TocpRVCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617645;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vGRR0gjDBREPKwcPJXrbF7TYRgFzdDLK7mv0gQtJIbY=;
	b=jJL5tRkBXHgpqgQ+RM/Ly+oIazG+QG87nsbX9LVx5ofkEnz9I07PzhF2oOzs0kjxWAME
	 nRpasNpqA+GfJ0iRx/Mvujg6Q8DAHowX0dYxQEr4aKRCvqHwPW6Cn3nkmKRlZCT8wW4/S
	 J5yHRCaEORnJiH4rdaIxtw9u4uAlSCeCbKqW2UIOcpSIGCQbwQmEGq9jcb9RFntmvpRx4
	 q05EUJVxMYqgnLeffpcWetjclPDwyuc/2tmSEa6sPopUM37MiEvQ4vmeHYP2rqm8QgB4y
	 E02AH9Kc3yslp20gsIhUU5SkeQATkqEdVg9EeBZXV4oQ0iWr73qpu4WPT8PiQLOnetQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n0f5TNRw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F332606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F332606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n0f5TNRw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F070A1BB2;
	Wed, 25 Nov 2026 06:40:41 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62F1D3F632;
	Wed, 25 Nov 2026 06:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617644; bh=IBki9QFGOOOM3QZc3eEmnb9wcy9SmcgamXuabX9N74k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n0f5TNRwGT0HdubNxByUqrml/eeVWSUdKV3t1SM8k+mKjwfS3MEM0QjUXQssOzk3N
	 G8dVtyXFIC3l18zEGpHLjWMoy8ivYbITeSy2gaYR5bL9WlJ3pnBgWDqh5CS2yzHLAa
	 bpVjiqQfqg3C5+K1mlJ96wiL1ivHY41ikjfM6TEI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:27 +0000
Subject: [PATCH v4 05/13] irqchip/gic-v5: Use linear DT and ITT when L2
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
Message-Id: <20261125-host_gicv5_fixes-v4-5-0469743c47d8@arm.com>
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
index 88d18822a1ff..5f9fa80ea6aa 100644
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

