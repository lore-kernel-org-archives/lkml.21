Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023381;
	b=AmeQArqoXW09LptOd//0muLtW+Eu0hDzoIio0h6F0agXc5D2LJRSVGsShnfY7mN+diSH
	 A1T2e+BbH1k9FXIBfSXTwwLv21trsyrvosKNNNnYuJ51Izz6vjS+dQ/Qcd3uz1QKTfMVe
	 HDdkKOCVMPp4jB7oIbUiqLo0BuYJESjzqz4JtpZQGsDLHW8M6jr2SfcvCW2hp8+FnKuCr
	 YbNpQN8QRIXlpyePycRhjVPA7mQUTctw+gRwMqV66hUizA3kue6edfmdCF0ftBDnTc6E3
	 2y0593GjBoEZTH79Eqjz1AxPC32BbcFfqAdwFol//pVJKOaMw4nzK8oJdMl8qZZq+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023381;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=SIojgL0qdZEK3rWRKnC7Gr1n/UGGa7ViH30zGLR/yNw=;
	b=5NbguBstTBydr+B2c2tfr8Se90GpSKeZMs+o9d3WQo1x2l7Iw+OmGnj/+kPWU17zsC7D
	 MLO4DJ6iw6b6Rz1OSL2VS6a62ocnYeuIPqdj3/bVYUdmfA8AgkfcjVrcqpFozHWxcNngg
	 c5pZ1p8K6Xq8Bg4sYq4lWGRNu+42zKqkYlqhzYi8+dDvxD3X6JZ+jPpdB6ErUmeFdvYHY
	 DdP7pvIL+Getwqu2CvpXDS4G/I7Jkdexju+uaVheCSVp2m5TuTGVZuOOiNd3jtyKj2dvy
	 5xqYWAWf4oq68/Zzfa2hXdyMrQNXyLsWauHlMuok3sr+jOJ/69e3EUofGruZaGyN3rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KKBlCB0+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3769A60A3809
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3769A60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KKBlCB0+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD11B169C;
	Wed, 18 Nov 2026 09:36:16 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2542E3F632;
	Wed, 18 Nov 2026 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023379; bh=yl8YGzfttRTRTEqI/u1UY9m06y+mQPri9hFLIcVsggU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KKBlCB0+Av4uCh8J6HmE/KapHTv+4L3KH1++QMR9pXjVi6TBTrWsFrsB2XKEUyyMG
	 ha0Ad0WPAZl0QhHG+1w84+zCCWRwPsWCAOlvmTWuPG2AaECl2IGFOKsrt2mCTzKE84
	 HRI1UGsI0Bhjdu7mkbdsGQUvDQUH1w+9xiKHYV5Q=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:42 +0000
Subject: [PATCH v3 13/14] irqchip/gic-v5: Clean a level 2 device table
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
Message-Id: <20261118-host_gicv5_fixes-v3-13-13c1859e8aa3@arm.com>
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
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index cfa86aa68bf3c..7fff2db9ae08e 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -415,6 +415,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 	if (!l2devtab)
 		return -ENOMEM;
 
+	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
+
 	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
 
 	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|

-- 
2.34.1

