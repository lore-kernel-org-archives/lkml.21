Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617642;
	b=IZUy6Rkph98nhIe7O5wZm/NIM17W5XR2JplFlLG91V1a0hQ5f6bN9HOlJeSYWUGnX54l
	 rUGnjd8mBfSYrt6rXdTofFqC7Sf9rYJeZu0bITHkJ3x+1IG+2e/7/MruHGYcIwWMN3NcR
	 0T5VAm3gJNCo0Dh2R+/jxdkGeq6dLVBrAvx08ZTThXroaamMSWa5mGszDPEfytXhUr4sm
	 hxZFidTBN1Gu8j24DTG2XaUz+yC+KFsk7N89Z2AByJ7kuJUDyis7ZEqawbRiiOQ+wmH90
	 ThldaBMRXK/4a9eR3NXOe/F9NVaOSxmP45UqUIK1b/YBWGOJKmQeWstWsRpMVgqZy7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617642;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/GANqmntd68P9lT6D3dbJ7EW1jyae4sFpw8dyIWsye8=;
	b=YJHsffMC7b4gUHea+qORVBKk9lvS4jtTfuRdJBOo26u16mHhSqFbzu9XLKiSoI5QGx9s
	 MLPSUB6mt/9Ga2Pky7Nep905NUqYuP85xN+Zy3cBtQdlIdOfd1Dy+MVfKlmevSGT0SPpf
	 TbhHd/eEnznxhaz7Fuk6T984a7EuesWbkOj9PayIeKpNY9FwHc/FtIJERv9jkWusPQOF6
	 XHzPKClJyHcMPunXqE0eP1FZfI/g5knvZxNXGULHrnm76rQNNjw+ecDNHKDkV+iWGHPwJ
	 bakJXp3Xd6qZblCT12DOak/XxLg3lgYZS5miyjCP4hLeTQz4Z5CGmxg7KUCgxbk7ZkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HoWOOWuL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB608606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB608606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HoWOOWuL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 620211762;
	Wed, 25 Nov 2026 06:40:38 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C690E3F632;
	Wed, 25 Nov 2026 06:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617641; bh=ebzFg5Tw/7vhKH7rfg1W+Qv8NkWZ3cdeJqFbn94l4ps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HoWOOWuLwFTbZIq11Rh5WvDp5C/Mivob5bD7k2iNmJPm6z8QhOqtjfuZq7VLNAQYS
	 mbJF12wtob/lNONxHkB0s+Y48bUTIs38e6QjZZZCHXa9covzg16gjRwjfmYY0Plthl
	 R2B7t0jNIERCjIm7m8Co3rGPzXqFfHJDmNkXJcps=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:25 +0000
Subject: [PATCH v4 03/13] irqchip/gic-v5: Serialise IRS synchronisation
 requests
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
Message-Id: <20261125-host_gicv5_fixes-v4-3-0469743c47d8@arm.com>
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

IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
to be dropped. A caller can then observe the earlier request
completing and assume that its own events have been processed.

The existing host caller is serialised by the LPI irqdomain mutex.
Upcoming KVM callers will not share that serialisation and may run
in atomic context. Serialise the request and completion poll with a
raw spinlock, and use atomic polling.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 4edf787f3f97..ead76560ea08 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -10,6 +10,7 @@
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/spinlock.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -22,6 +23,8 @@
 #define LPI_ID_BITS_LINEAR		12
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
+/* Synchronization requests must not overlap in an IRS Domain. */
+static DEFINE_RAW_SPINLOCK(irs_sync_lock);
 static LIST_HEAD(irs_nodes);
 
 static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
@@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
 		return;
 
 	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
+	guard(raw_spinlock_irqsave)(&irs_sync_lock);
 	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
 
-	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
-			  GICV5_IRS_SYNC_STATUSR_IDLE);
+	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
+				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
 }
 
 int gicv5_irs_register_cpu(int cpuid)

-- 
2.34.1

