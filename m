Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.222.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575521;
	b=V3ci/Nw92swRJhc9QUPSDDMoSVFAtOHPjAmED9YAm1Ou3k24ReEz2/2cbglRtuy2Q+nO
	 b2qrA6BEWsAfBi6ubErg2rQJ9iQgehjVwJsnAC1RnboL+xtcUoc3Sz6jThqgP9iDymq8w
	 3/2suFDt9cra+D0TjRipGxZHJTQX/e1ki/BrcNDWof7CGQEeIdfDK8YC7To0ymLfg9vqN
	 XO3dywOSRb6Jie497s4q8cH0D8ENBE19uq472PMvnVhw1jxm9wPV4Qx1zWjQfGDVQxYKc
	 XzSx+gGuEc6CodNlcI2W5UgYekmOgjYQd1CksJZE51rxLv7CgPhiHYGfYV38xxgOxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575521;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Harbor-Fearful:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AuthUser;
	bh=Fk7nJXxJFLmiwoCypaRQUIjeIoYCMrQUBCirL/0Tp8s=;
	b=SwS5OMSqjF1K6SMZu76GsWkJMl1JBLmJDDI84pnPsiR1V+kL5u6bjYe/ScWnns1Wt0f9
	 j7nC0pKHjjR29ZlEdLWBR3M5wedUwl7iJy+aCShtWyd6+3Pwv7FLPkHV2ComdCdQ3eJG1
	 aI7sy1osQfWGD3eQ2RrAL7BufwcwI4PfyyjfwmlINVA8kf5yat1WMSKRhlLo/IhkW+U4r
	 5We0EGILNmIrC13VeY9NkuTlnGFBXtl6bStqcv/NwODE+yQtx+2QiOJb+wH3i8duGvSJg
	 OoW53Z95rz4wqyjGR/yEXAFaWifIPs9dr/lekbBRtIz4CnSgiLbF0aFIRq+EhHBAwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.222.58
Received: from fennec.ash.relay.mailchannels.net (fennec.ash.relay.mailchannels.net [23.83.222.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E8606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1C23238153C;
	Wed, 25 Nov 2026 02:58:33 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.4.162])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1D18238134F;
	Wed, 25 Nov 2026 02:58:31 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Harbor-Fearful: 43dfbfa3666e5809_1795575512989_2441478636
X-MC-Loop-Signature: 1795575512989:85526249
X-MC-Ingress-Time: 1795575512989
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.162 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:32 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DI-0000000BJhc-1Lqj;
	Wed, 25 Nov 2026 02:58:29 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ARM: NOMMU: fix PMSAv7/v8 MPU setup on M-class
Date: Tue, 24 Nov 2026 20:57:52 -0600
Message-ID: <20261125025757.1159931-1-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
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

With CONFIG_ARM_MPU=y, a Cortex-M3 kernel under QEMU (mps2-an385)
panics before its console comes up. Patch 1 fixes that: the M-class
region base register has VALID and REGION in its low bits, so the
R-class probe selects a region that does not exist. After that,
allocate_region() can return one region too many (2),
mpu_setup_region() accepts a number one past the end (3), and
try_split_region() can return a base not aligned to its size (4).
Patch 5 fixes the same off-by-one as patch 3 in pmsa-v8.c.

Patches 2 to 4 also run on R-class.

I know the Cortex-M platforms are going in 7.5. These are for the
stable kernels that still carry them, and for the v8-M core while its
future is discussed.

Not fixed here: on M-class, pmsav7_setup() rewrites regions with the
MPU on, so for a moment a region has its new base and old size, and
QEMU faults when it covers the running code (an385, 0x3f9000 of RAM).
Turning the MPU off around the rewrite works only where the default
memory map matches the kernel's. Vladimir, how would you want this
handled?

Testing: I have no PMSAv7 hardware, so patches 1 to 4 are tested
under QEMU only (mps2-an385, several memory layouts; every prefix
builds with W=1). Patch 5 is tested under QEMU (mps2-an505) and on an
RP2350 board (Cortex-M33). A test on any Cortex-M3/M4/M7 or Cortex-R
board with CONFIG_ARM_MPU=y would help; the line to check is "Using
ARMv7 PMSA Compliant MPU ... Used N of M regions", with N no larger
than M.

This series was written with an AI coding assistant (Claude Opus 5.5,
Anthropic), as each patch says; I reviewed the reasoning and the test
results.

Brad Hawthorne (5):
  ARM: NOMMU: pmsa-v7: Do not probe the region order on M-class
  ARM: NOMMU: pmsa-v7: Do not allocate more RAM regions than the limit
  ARM: NOMMU: pmsa-v7: Fix off-by-one in mpu_setup_region()
  ARM: NOMMU: pmsa-v7: Align a split region's base to its size
  ARM: NOMMU: pmsa-v8: Fix off-by-one in __pmsav8_setup_region()

 arch/arm/mm/pmsa-v7.c | 29 ++++++++++++++++++-----------
 arch/arm/mm/pmsa-v8.c |  2 +-
 2 files changed, 19 insertions(+), 12 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

