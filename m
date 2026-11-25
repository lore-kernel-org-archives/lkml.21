Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617651;
	b=CkBzn0dqs1UB7/vcIechnZhhNQvmbtcoy1tTwX9CWVDE7zFwHJw1e5/8AuG0zSvZ2LlP
	 JB0oHbbCo2JDa1hvqa7zOJw4f05PYiTFwQlKvvrTbX7jQCgp/7ZBDlsxvGeo5LZ7uq7JW
	 ECGJCj9AnCZHB5FvsltxiqmjOcwydgZdJUV2RMalBsbEU50UmcDHscP7X1h0234FuVMBB
	 ijBt2bbRx1vvJObjIZKqh5EPuCVj0JNOSsM7xxDDgrKaqn8uST2g5BL9sV88jtLIdp7LR
	 hY2rx5XseNe5xhsyz6ilOypk5olDkERv/EjZPS44nfJ8zRQPimsajrrhvp5S8oc8ghA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617651;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wjxRhP0ySAfSuh95Vk5MQqcLQLZKnugFHC4ONLScWiY=;
	b=KutZEvypRIrVa5LaDFIItnf7awgocg4kM7z0jXV51Uysnn2g7ZRkYnAy5df5B9WCn6ZA
	 oF+tuSo1jE5BjMo4m7zFeWH9bBazPbwOXsAcXRabcb/808OmAFcfslnmlZxC/HoPigpBb
	 B3CtaWZFwLrXUO+r0/5bT9fVtj0DpSXHeIs45UXHDR2KNWkpcSo3rJrOEdr/l/cI6MAG6
	 BZf1yN7Y71Pjq7HWSI0nfkGx85xY7mSScGO0OA1v+vgWqKa/e9WyTpJkj9unH38L/YmRz
	 Tkr1DH9ZfUX8BFSfpsr7XkRwpo87boLHSECnP5PaD9niuFUSLVpDXt6mdLzc5LHe4Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jDvK+9fr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9911606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9911606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jDvK+9fr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30957339;
	Wed, 25 Nov 2026 06:40:47 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C943F632;
	Wed, 25 Nov 2026 06:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617650; bh=xI6Bx+DRd6qV9BRK2flVYFoGmMyaqfFHrTCnranM448=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jDvK+9frWUPXJmnM1wB97wlAJUun+mipTuVzBC1mJCs96T3NaCeUwG1LaFQDXm5BF
	 Zuwy9JPhUAdROU+/05DwxdZBVKwvozjjx2QQwvBvMP57gtrGSwK2dhAwDMnepmy9v1
	 QI7zDzeRgAQ/mfb+XVIr365O422zPwkg1MniyDmE=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:30 +0000
Subject: [PATCH v4 08/13] irqchip/gic-v5: Invalidate ITS device cache
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
Message-Id: <20261125-host_gicv5_fixes-v4-8-0469743c47d8@arm.com>
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
index 876437017ccc..dce5bfd1a78d 100644
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

