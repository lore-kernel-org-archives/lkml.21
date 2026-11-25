Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.218.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575533;
	b=ICz5yeRBxNdAgIkIpy3QY2r6F9Ad/hCJPfSuslGQ/JP/wkUEta+e+pgic3bUI1Y8AcNM
	 CrcskCc/eS9lJITJLxe8ZHbhkR0fJ6U1WJ7hiodX6NkHqqpPMwxVmAZJerquWXkQhgE/g
	 sBsutPuzbRXJnTUf7C1yl43f0Kat0cq5syrcAYgtd0UkKP9IEu/f4Bt2qtmg9rIhYQfJz
	 Ty7VuUoxumIt6XI9bEwpTxBbVF+D5sGL+rbV5KhB2ZQGWXzCEQ5eVp2rBHWGFeT/wOzqG
	 EQ9exB+IeHTuL+Sg7+D7u/LSvm6LpHSObH392nKgKu/ibVKrygih5BAopkgtcIAPk7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575533;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Suffer-Bitter:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=j7/TU3r0M5ErrnkAaeYvU8NA1oSeaB9TmwP0o8jjlrM=;
	b=g3ZqeJLojQEfw/bc7smceqSj5n0fmJ2B8A1io5yzE0/eta+cjGuKuaMGaygxl5lcMH+X
	 aLKRG0vj/7aZOseHG5uv+tRDyqRSkNh3e7QbrIiwb5elP1v033EfuZmz3O184ltq3tAS9
	 QzoEMubRE10dzVa0GSrtu7Q26gHnKBzmJF/r71b3foBnivp6HsJ8Ukj0/W7JAmoFi9TPj
	 sAG8VAEYIxuYen9HEynFf02hVEnM+41UnIeXmdt9c/COV571+GPLn7pZQ4kIt8LlnUPu4
	 V/nU/UkG+YSrgQjrrttW0aTiFMk0wQt8jqw9mfaL5h/hSt0C3S4BEj+U9quf/hEp4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.218.249
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7913B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7913B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A4C85800FEF;
	Wed, 25 Nov 2026 02:58:47 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-blue-0.trex.outbound.svc.cluster.local [100.103.208.39])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id CD4D280095A;
	Wed, 25 Nov 2026 02:58:46 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Suffer-Bitter: 0819c53e3d6c5705_1795575527587_537115737
X-MC-Loop-Signature: 1795575527587:2532055056
X-MC-Ingress-Time: 1795575527587
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.208.39 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:47 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DX-0000000BJhc-0biL;
	Wed, 25 Nov 2026 02:58:44 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ARM: NOMMU: pmsa-v7: Fix off-by-one in mpu_setup_region()
Date: Tue, 24 Nov 2026 20:57:55 -0600
Message-ID: <20261125025757.1159931-4-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu

mpu_setup_region() rejects "number > mpu_max_regions", which lets
number == mpu_max_regions through. Regions are numbered from 0, so
that number names a region the MPU does not have. Reject it too.

Now that allocate_region() respects its limit, no caller passes that
number. Tested under QEMU (mps2-an385): no change in behaviour.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 5ad7dcbe40ae ("ARM: mpu: add MPU probe and initialisation functions in C")
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index f2ad0f3ff480..af0c71135a6e 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -371,7 +371,7 @@ static int __init mpu_setup_region(unsigned int number, phys_addr_t start,
 	u32 size_data;
 
 	/* We kept a region free for probing resolution of MPU regions*/
-	if (number > mpu_max_regions
+	if (number >= mpu_max_regions
 	    || number >= MPU_MAX_REGIONS)
 		return -ENOENT;
 
-- 
2.43.0

