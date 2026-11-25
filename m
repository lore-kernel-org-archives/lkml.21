Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.218.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575545;
	b=tn4FS+1pqY01z5EUh8a6zcYDFq18MMKbVLbSdGCgdn8EI1JyvbWv1/5DLsh3/mobWFUS
	 qG2T1LzIBfKr5POUox6uA8jKcIhZBaW8Um84btc8+07xo9Xm7kCnta4yDPcnm/6tJ6unL
	 TXwliKGtQ//0Z3OSg2o0RVYRLb5VyoQlrk2IPpbakRbZBGSLQ+qjATArZwY9aXVhus7XZ
	 VjQA8j1uHG7l/yDoZaJdm9Qq+fxUbSnLQIITQN6CyseqNk1UuUmU+TW58KclkaeuCqwzo
	 oqOoEBh7OGb/utIA+ZdpazCPCHR3YkaFvkZTslYtcSlXYOlGUVE4aIBQ8rOyRyqPZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575545;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Shelf-Hysterical:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=vAJIlDWHhJKjOBp1fKBB7WxI11xs4f93y+8hxs8OBfM=;
	b=WbaDHI0o873lw/iPifdYTNWcFlDuOtD7ghk7kaoXw441wf+TFuRpmr0bRZMLRJCBLQRz
	 1Pi6zt4Su05Oq0GQbExHpMcJBe2XcxexxzrB67Blkz+O+7+cnnle5gjonEYjSwSpaSl6Z
	 SvxvqW5IPb67zPFzPKtAzIPc1rrnzPzrr0QaUK4IH5HIY41+sPaR76OOam7QevmTPclzx
	 /Uc5ttkQEn/BswI3XTWEieLAcj3D7yag6MtKUUXeiPO1DPA61nWyK5uqB6f6hVbHAgG5l
	 qN2T7QRhu5uXHzp6Tm7yyVBVgmXwHLLMZAOmzDOKEVkvcF0kmLBFZTzpIB7DFAMjNyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.218.253
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EF9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63EF9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E7677461900;
	Wed, 25 Nov 2026 02:58:58 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-6.trex.outbound.svc.cluster.local [100.103.201.208])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id E68C34606F4;
	Wed, 25 Nov 2026 02:58:53 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Shelf-Hysterical: 4f994290693785d2_1795575538851_2743873970
X-MC-Loop-Signature: 1795575538851:3108965944
X-MC-Ingress-Time: 1795575538851
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.201.208 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:58 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dd-0000000BJhc-46LL;
	Wed, 25 Nov 2026 02:58:51 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ARM: NOMMU: pmsa-v8: Fix off-by-one in __pmsav8_setup_region()
Date: Tue, 24 Nov 2026 20:57:57 -0600
Message-ID: <20261125025757.1159931-6-brad@sim.vu>
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

__pmsav8_setup_region() rejects "number > mpu_max_regions", which lets
number == mpu_max_regions through. Regions are numbered from 0, so
that number names a region the MPU does not have. Reject it.

A Cortex-M33 can be built with 4 regions. Under QEMU (mps2-an505) with
a 4-region MPU, QEMU logs "MPU region out of range 4/4" and the kernel
takes an unhandled exception during the setup. With this patch the
setup warns "MPU region initialization failure! -2" and the kernel
faults later, in memblock_alloc_try_nid(), because RAM that region
would have mapped has none. On an RP2350 board (Cortex-M33, 8 regions)
the boot is unchanged.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests,
the board test and this changelog, and ran them; I reviewed the
reasoning and the test results.

Fixes: 046835b4aa22 ("ARM: 8757/1: NOMMU: Support PMSAv8 MPU")
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/pmsa-v8.c b/arch/arm/mm/pmsa-v8.c
index 28cdc5468406..e5353a030731 100644
--- a/arch/arm/mm/pmsa-v8.c
+++ b/arch/arm/mm/pmsa-v8.c
@@ -140,7 +140,7 @@ static int __init __mpu_max_regions(void)
 
 static int __init __pmsav8_setup_region(unsigned int number, u32 bar, u32 lar)
 {
-	if (number > mpu_max_regions
+	if (number >= mpu_max_regions
 	    || number >= MPU_MAX_REGIONS)
 		return -ENOENT;
 
-- 
2.43.0

