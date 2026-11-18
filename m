Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023369;
	b=C5GZHWjV9TAa8UqlHVqZK64lyx8xkSxiVjXwJqSGhhXl18V/lUISvGGUKsTnjyWaqZps
	 09lHFcTRQt37MYwWfufLmXK1ux6xrgrRGNiC9UBL57xFFa9K2p9dV5Ws3ioSDQCDeWQrn
	 Bw2rGlhLVdBMjCicizivdpusef+No+K86eqJbCrDz/Cgv8HGzKCvd6cY2IzPpJUbbQL68
	 CZTYKCsHyhJd1YfJGLxaTWAIz6AH50pSD81iHh6UhaA9ttKAuV3Sn5SoRKhbKM9TfM+Fq
	 uhrqF452hwjC6LJwiTtEcaR+M5fIlt+G3VQcKqwk/mbEZsD9LZvZmldsn9BBkYh/e2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023369;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=OygdrmFY09KvJCoOLe6f0ni4hy8AuKmct+wdRcMH4GY=;
	b=2gTdbXbrVvqEeBMUDRr/68W+cEbo+ZD9dk+1a2xftGSCk0VVLNklH1S08YgJfeMRVeiE
	 xwryqbrTdVHHHAstAjQxit+tdi6x5/JEom7el9mkvgEIUwg1b0q4fG4xVGAfZlXKFdiQc
	 SNYs2pXei0zDuHDDvzq//cykZmwU3baxnae4qwojSIlTf6y3UuaUeMJoJ77mWmiegMMdZ
	 nFIsXlkhn7V7E07S3zwsdgOtsoQGjKNwX7jIFeC30WHDUJMajyGNVOko72xM3HaYD3kMg
	 gVZNQUI2FFKr51S75o/FMNJFayvpEoTH5WgxD8cQ91vR559IxXKVE6f8MhtbCM5dX+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DOhzPM0y;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB1E606CA5F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB1E606CA5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DOhzPM0y
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9C921655;
	Wed, 18 Nov 2026 09:36:04 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 022913F632;
	Wed, 18 Nov 2026 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023367; bh=upgto9NrOT43Megv54sEqbwgn9RKS4Z2UQH6+PLVkvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DOhzPM0ybgoMSi6cHvxYUpGm9ZqevR9GJS9Er7CPwy0gKh0Qt0Q9IKuBwXGM59TPr
	 733yPvUUG53upfW003994Rk/5xSFE0VY2vWc86/KyF6eeHOeX5Vp0vHX4H2YljJvtQ
	 nH+9weJI37W/i612puXE6F3wHERYbU0ErQ4F/qRI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:36 +0000
Subject: [PATCH v3 07/14] irqchip/gic-v5: Honour ACPI ITS noncoherent flag
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
Message-Id: <20261118-host_gicv5_fixes-v3-7-13c1859e8aa3@arm.com>
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

The ACPI ITS probe passes its noncoherent flag to
gicv5_its_init_bases(), but the common initializer checks a DT
property instead. For an ACPI ITS, this always selects coherent cache
settings and skips the cache maintenance required for its tables.

Use the noncoherent argument, which both firmware paths already
supply.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 5f9fa80ea6aa6..9e8077dada5ef 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1135,7 +1135,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 			goto out_free_node;
 	}
 
-	if (of_property_read_bool(np, "dma-noncoherent")) {
+	if (noncoherent) {
 		/*
 		 * A non-coherent ITS implies that some cache levels cannot be
 		 * used coherently by the cores and GIC. Our only option is to mark

-- 
2.34.1

