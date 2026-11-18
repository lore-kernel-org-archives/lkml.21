Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023374;
	b=h0hiZ5tl2v9/2NouVw/0RW0L7CdVne2bk9zxPDq1FHibzcOO7NxDG6iZ4dB3Wt5d6iGI
	 Sj8+tGxX+fuEOGe0ucde8VTusNu3ON/2IfUhsYilAqSWv98o5V/M3s/6OgUGUdrGU+Emg
	 wlsKf1pldM6NHlZECiNERBd2a3U6jjXKLpCQ9w1VaQqf6Eeh/d+xtmSIRNu7j8GMVdAAW
	 FDTUAGsUFYYSLyfIrb2g4Ejz9rxehytXeuayjqtcYesP2nXvDLqfd7o14QzbwTO1CCJax
	 aH9QdtcK7ilNBMycejqBGtLtpzEbGxpxHsiABJkVp261s0UHjf7nV70YnJierQW38tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023374;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hMpkPkSw6Qu152COBYbj+Q9fkxDk4eIn3nZiHKYjIWk=;
	b=w3E71od9+UDC0UIdI3ncBjkZMSlXiKfIBfnz511zT+gP7iLUMdMqNR97TcGWOX/4YMhL
	 JVKF+JICCvzHm79pkKtb5nicmp3xp3eiS9q9ukUejs9LgqEdaKJ5DyOc1U7CUUDghxAh8
	 ZYIXCACb9pNugcZmqShqD0aL52HrtgZkx3S+gitKkyUpnaDRiZ02D3PLkiJmCfnHcT55/
	 fv0xqLKcL9lr4VCNDRaEqrYTKeMuFcxqIFqBN8cuz0KclELWUPHSK749BV9+OJGDzo7C6
	 yPi5T9t9iYlgbBoxLBwPLkzsEUEo2dBtRylt32IQrgG86hTwNplEecNkjBWLZ8lC6YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QmBEjjj5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D64F606CA55
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D64F606CA55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QmBEjjj5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2BA169C;
	Wed, 18 Nov 2026 09:36:10 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13C663F632;
	Wed, 18 Nov 2026 09:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023373; bh=aNFVITkAPjXaEmzd17GKQ8dKNCsIk7bD2okTPNk9q4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QmBEjjj5Bz/2U2+dWZZwaOYz/yU1HzSHapkJO6b55tFPHR9N0VX9FB0YasSGzeibX
	 EawkdTSJHM1Vl9wwPIa8C8BDa20p85b71kGwkPZwaVUhHEm9KGPSWIyXmtXWD5vQY0
	 GTKRRCh2nfCvtbjh41MSUTD/1RbIl/4balV/ytaY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:39 +0000
Subject: [PATCH v3 10/14] irqchip/gic-v5: Clean the allocated linear device
 table size
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
Message-Id: <20261118-host_gicv5_fixes-v3-10-13c1859e8aa3@arm.com>
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

When the linear device table exceeds the kmalloc limit, the driver
caps the DeviceID width before allocation but keeps the original size
for cache maintenance. On a noncoherent ITS, this cleans beyond the
allocated table.

Recalculate the size after capping the DeviceID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index dce5bfd1a78dd..e7db4449fe916 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -594,14 +594,14 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
 	 * kmalloc limits so that the system can chug along with a linear
 	 * device table.
 	 */
-	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
-	if (sz > KMALLOC_MAX_SIZE) {
-		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE/sizeof(*devtab));
+	if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE) {
+		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE / sizeof(*devtab));
 
 		pr_warn("Limiting device ID bits from %u to %u\n",
 			device_id_bits, device_id_cap);
 		device_id_bits = device_id_cap;
 	}
+	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
 
 	devtab = kzalloc_objs(*devtab, BIT(device_id_bits));
 	if (!devtab)

-- 
2.34.1

