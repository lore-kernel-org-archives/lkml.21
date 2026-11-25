Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.212.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575529;
	b=3Z2boaOGoqu3t/hWBf9JcW7VOPsPexY7tHOVNZbpweFfVhkfyBaMzh5xJWnU6BPv1rOB
	 J6ppD61ad1tyKARq48/Ir86Iek+9D7nM17TTejNjv24n8e7sYQ+fx+JKMQ9xTZ1rws7gI
	 sfEz8rBhqWRdgwj41qVUJ3qJYoccUMR3NBXGBOByTTY5f0kQOkfVr2iA1kp0O7ffV+w4Z
	 MKNbQDpfb6isVspz0VHEtfK3iUK6iM1dNqGCslWbnAg7qfX3OtuPjKTc7hMZZVKIwZwzx
	 C0RP33YoMTRpbMTKzvKtZv23iyPx2UgleMHnsp09xvFAQcNmnERgWVUrVJh8byJZTRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575529;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Chief-Troubled:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=Cs/bIuj6faZHY2+m+7Lb05sSFQmd4u7K9KRN4ncXS8k=;
	b=gi1yAN/sTkKM26/OSEs1h0ai8Pj8MMutZqegZXSLyj5frfbLl2s2o/Yia5CPz9eLmUY6
	 gIFcoQFs/JpqQVRmQBLrJ17DQONW1RMlm1wo0pmRIeNRV/XBtuGx1by/Uue8NAzDpBPP7
	 bDB7UyqwibG0H5MLRp+D3MnFR+myt7CSNyHHI9bqqaEwUmZUwEIa0zyh5eZw6W/U1yckn
	 awTktTq4wGISv24qT1EqvDlAzktfE/rEc/6l49zTCC3fKx3z+erxMFrClUAS6xtPTLCnY
	 VbpQ/RyiDWXzl/4IMiZzmpNxYADcEuctacxW8KaNPpues72ec1FYggVM+jrAib1qz8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.212.46
Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net [23.83.212.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890FC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B8989801067;
	Wed, 25 Nov 2026 02:58:43 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.4.162])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id DB25C800291;
	Wed, 25 Nov 2026 02:58:42 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Chief-Troubled: 161335d910f9261a_1795575523645_3815192862
X-MC-Loop-Signature: 1795575523645:1737345223
X-MC-Ingress-Time: 1795575523645
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.162 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:43 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DS-0000000BJhc-2TQ7;
	Wed, 25 Nov 2026 02:58:40 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ARM: NOMMU: pmsa-v7: Do not allocate more RAM regions than the limit
Date: Tue, 24 Nov 2026 20:57:54 -0600
Message-ID: <20261125025757.1159931-3-brad@sim.vu>
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

allocate_region() checks "count > limit" only after it has filled
regions[count], so it can return one region more than the limit. The
caller passes the number of MPU regions left for RAM, so the setup
then programs a region the MPU does not have. Under QEMU (mps2-an385,
8 regions) with a memory node of 0x21000000 + 0x9f9000, which needs
more regions than are left, QEMU logs "MPU region out of range 8/8"
and the kernel reports:

  Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 9 of 8 regions

Stop allocating once the limit is reached, so the memory that does not
fit is truncated, as intended.

Tested under QEMU (mps2-an385): the same case now truncates memory and
boots to user space. Not tested on PMSAv7 hardware.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index a20a43867210..f2ad0f3ff480 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -193,7 +193,7 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
 	phys_addr_t diff = size;
 	int attempts = MPU_MAX_REGIONS;
 
-	while (diff) {
+	while (diff && count < limit) {
 		/* Try cover region as is (maybe with help of subregions) */
 		if (try_split_region(base, size, &regions[count])) {
 			count++;
@@ -215,9 +215,6 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
 			size = asize < p2size ? asize + 1 : p2size + 1;
 		}
 
-		if (count > limit)
-			break;
-
 		if (!attempts)
 			break;
 
-- 
2.43.0

