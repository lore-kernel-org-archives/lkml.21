Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023378;
	b=TRbbDgprUk99u9iSczgzFhTH+AGtj0Q104OR8GEkbHnNvepZFwAGwQEhwwalGs1fow73
	 n19MaDRm5Xw3a8lPGsaWOxaUXxhOL3KtMNM448FuFj0pAFYqL1HMb38Ds6sDxhQRMfiyu
	 QSBlVVjr1uSQmognDMhl6uHYTH3K6Gbzn7n4Ho8HbgJ6bukciuggbLCOzzLKpOy9XqrO5
	 QFvoJ0ZdKkD4UotvHoruOE0Jb0/3JlLcFjACHqBWbemWQmtPvA3OLljQHvzvPSbFi35xK
	 RWCnoU26avFoiR+1d9i6Kvkfvzo/24gaannw/2f0WRI0nlnYiXwhRQi0fRQKUStlqLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023378;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=2IxC+XM4oIYxXWzVaO3Gu7vxMttrpE6a/6RE2B/WJPw=;
	b=zWuLg1x5mkFisW4b2HrvAfcHcPcIzSw9QMriJn7tyePrksczKW77HwKFZOZ4vM+0+poE
	 WwjT8GG2YcCaN7mehuUnVD9u1VFV3addBBWJfdneJthiN+1qM/Ihcl0OXK5XmJrIlaR0U
	 nU6mVqp4DoBx2kCxhIc3LQZaIdOZbFE5nLMlboHhulzRz/oNSvUrHRlXqdIzmnPgI+MGP
	 x1IO9BJpM71l4xfyzjHWrciw3g062xJAONVCEv+wK6Xd3huIAAJTqv3QIlfVOIupWm5Pj
	 OtgnP6TW4fCjfaij+/PqIw1segGqkQsCKvavG7lTBPIdXD0p8vWKKb17GfsO2qlfGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N44mC8Jw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4565360A2633
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4565360A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N44mC8Jw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A2D175A;
	Wed, 18 Nov 2026 09:36:14 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F7973F632;
	Wed, 18 Nov 2026 09:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023377; bh=sLa7wg3rPB1Xeg6t7G2lvSPsg2On2na6nvRV2ihgGeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N44mC8JwmRSbR5Hxgxkgs29edX0a0C8C5lilWNsh7ROyg32FMr782DE4qXjOp0iZL
	 CJxysKb1KY+0jFw4KSwydBLiSlJxK4+EhORa7bJ2ERpuGOug/iXPovUeaxBbfqg3Wq
	 NP/tEvLS/WSrmcn+153qho6pRbtm5EfxUVpOG0I8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:41 +0000
Subject: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
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
Message-Id: <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
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

Device registration publishes a DTE pointing to the new ITT before
invalidating the ITS device cache. If invalidation times out, clearing
the DTE in memory does not guarantee that the ITS has discarded a
cached reference to the ITT, and hence the hardware could still try
and access the memory. Freeing the ITT on that path can therefore
leave the ITS accessing memory that has been reallocated.

Device teardown has the same problem: it frees the ITT even when the
invalidation issued after clearing the DTE fails to complete in the
specified timeout.

Retain the ITT on either failure path. Continue returning the
invalidation error, and free the ITT during teardown only after
successful completion. This deliberately retains memory on hardware
failure because a timeout does not cancel the operation or establish
that cached references are gone.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index db13011ef6d93..cfa86aa68bf3c 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -540,8 +540,8 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
 	if (ret) {
+		/* The ITS may still have a cached reference to the ITT. */
 		its_write_table_entry(its, dte, 0);
-		gicv5_its_free_itt(its_dev);
 		return ret;
 	}
 
@@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	its_write_table_entry(its, dte, 0);
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
-	gicv5_its_free_itt(its_dev);
+	/* Only release the ITT once the ITS has discarded its references. */
+	if (!ret)
+		gicv5_its_free_itt(its_dev);
 
 	return ret;
 }

-- 
2.34.1

