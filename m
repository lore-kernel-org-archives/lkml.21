Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.212.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575525;
	b=OFlen+vFm0tngzd/GP5kDnwrbnhXj0v05SdAmhjI6iXLyWSOPPSe3ah1NVlezlnCvXyi
	 J1I+T+xfz99Eg8kM+9V8Xo9pzW4xmLEFrXH3wQEVkU3Qpf2AJM5J+dwx2JmDBGUhhS15L
	 u5plYaCoo2qLfkmcIHN3kXUXnrNMtwR1S4GDwj5HNgnGvTfi2lSuuRi0kPv+3T/RyewGQ
	 5KG6vxIKHHGknIrcmw45Irj07jOhrLgjVk4Goe6g3ZYXbgANEFF4nSoByk4QXUnSBx/6K
	 PUCC95aNV5l8Gii3lSe4egZmsOt92qGy8CrSXuqdA4EJAi3z4T+1HvCZxvVuW6cVhQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575525;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Absorbed-Continue:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=sFfToTjxrXhqjWFslrVSSBXXpw/HKn3njfc1bOFFNxc=;
	b=Stn11eWH/DRiZrtKUskyLuIjbmmtfi+2K46Zl0Zwf0+yTVKQEobUGqQv4Mis511WvVyd
	 O8vQ/4Gl1IEuycwBuK1OgKq4u+mSSI6LhuoEgFboIAetNPwDxPf8+omAIq9rXJxFEa1eY
	 D/RBYVy9JsNwZ+PrnYTUws6Zpzo9+TqDzEQRjoS9DZp9USC4mL5IjT/GmWbss4m1xFOQO
	 A1++DW9pbOXAvDDZCIE7qqnsBR+bong54PdcNtFDu7H/rmAc0zK1VDA4B76uCVcutAacm
	 jhifM03v49qSTYsTYmH48/WclUbEOA36lPoyLi6U7SVon9mKTNAdmTqPBbMGsUW6ZsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.212.46
Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net [23.83.212.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EF8604164A;
	Wed, 25 Nov 2026 02:58:37 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.4.162])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1F4A34233B;
	Wed, 25 Nov 2026 02:58:36 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Absorbed-Continue: 2c15b09b2671a9ef_1795575517884_2219833327
X-MC-Loop-Signature: 1795575517883:3984899341
X-MC-Ingress-Time: 1795575517883
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.162 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:37 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DM-0000000BJhc-37wp;
	Wed, 25 Nov 2026 02:58:34 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] ARM: NOMMU: pmsa-v7: Do not probe the region order on M-class
Date: Tue, 24 Nov 2026 20:57:53 -0600
Message-ID: <20261125025757.1159931-2-brad@sim.vu>
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

__mpu_min_region_order() finds the minimum region size by writing
0xFFFFFFFC to the region base register and reading it back. That
works on R-class, where the low bits are reserved. On M-class,
MPU_RBAR bits [4:0] are VALID and REGION, so the write selects region
12, which an MPU with fewer than 13 regions does not have. QEMU
(mps2-an385, 8 regions) logs "MPU region out of range 12/8", the
read-back is 0, every RAM region fails, and the kernel panics:

  Kernel panic - not syncing: MPU region initialization failure! -12

Region 12 is outside the permitted values on hardware too. If the write
lands, the read-back returns the current region number in bits [3:0]
(MPU_RBAR, Cortex-M3 Devices Generic User Guide), so the probe returns
order 2 instead of 5. Nothing checks against that, so the bug can go
unseen there.

On M-class the minimum region size is fixed at 32 bytes, so return
that order without probing.

Tested under QEMU (mps2-an385): the kernel now sets up the MPU and
reaches user space. Not tested on PMSAv7 hardware.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 9fcb01a9f54c ("ARM: 8711/1: V7M: Add support for MPU to M-class")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index 59d916ccdf25..a20a43867210 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -341,6 +341,10 @@ static int __init __mpu_min_region_order(void)
 {
 	u32 drbar_result, irbar_result;
 
+	/* On M-class, writing MPU_RBAR selects a region; the minimum is 32 bytes */
+	if (IS_ENABLED(CONFIG_CPU_V7M))
+		return 5;
+
 	/* We've kept a region free for this probing */
 	rgnr_write(PMSAv7_PROBE_REGION);
 	isb();
-- 
2.43.0

