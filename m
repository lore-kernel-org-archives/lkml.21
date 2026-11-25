Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.212.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575555;
	b=J+DAP/7vjvD/hy4lWsg2zQaZgcsbqBMStBtksdA+8m/+Kukqw3WzQ2w6augPchq2zuC+
	 VZ0jgimv2KQruQflZB+m1Lkx6C1D6qrlcP8bt+2OHvP4mv7wsiyrli/vl2MZI1GMX79lE
	 1vva7mPNW4SanexoDcteU12sP0wy2zfwyYtYV2/NXk73wm4NMZ2tmZtqfLeRjFTu37BXX
	 xWZLVkoPl7lqICarM9H0+bBe4uN1qjWtaaDQdfZ7aKGoBsXLPGkoXB9CZvLwvXENYsRnt
	 eUW9na9GSGyK39Gmot5+RdoRQWtjQAmaK1L9yPIl98nKM4XNbHiITfhq9qKEHT1nAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575555;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Tasty-Society:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AuthUser;
	bh=5HgyuRLaiTpwVa9WrWOYRJFZwaeKoa/DfbU5t+YXZ9M=;
	b=Gk4caS7scRUTLqvoOi+ullbL1rfY+EZK1l08xutUGp4X50E5Cb2Q0ouLf+7LZ0WIpvHl
	 qUblji6rk2eMALEkcOKTuqqzy+ICsECBP+jxla8WAvIk5VoDf33XKZVRyv92LibvVdX7B
	 b2Gmxsi7qTroOsGJnfobUFrqqKzzRDgd6J2M7Nt2qqrs1m+Cahd1gw5GYOXXDmMcAYGHb
	 qJ3QyUiAhgeMxRJyyWqGwoaY0sMjF0qt6NuTkOf52Ss2D/sDiWxSaCw/he4ghJndG1bld
	 o7o0mD0+4w+YW60MjXfrlfL1+kd9Q0HIwG+KhzpsMJbWtwVpJCn/v+PqCYSW+tUysUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.212.18
Received: from bisque.elm.relay.mailchannels.net (bisque.elm.relay.mailchannels.net [23.83.212.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B090E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B090E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B717E42106;
	Wed, 25 Nov 2026 02:59:08 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-96-5-164.trex-nlb.outbound.svc.cluster.local [100.96.5.164])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7C298423F1;
	Wed, 25 Nov 2026 02:59:07 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Tasty-Society: 72143cdc78417759_1795575548652_4245223339
X-MC-Loop-Signature: 1795575548652:3151998745
X-MC-Ingress-Time: 1795575548652
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.5.164 (trex/8.0.2);
	Wed, 25 Nov 2026 02:59:08 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:59026 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dr-0000000BJlE-3Kyl;
	Wed, 25 Nov 2026 02:59:04 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linusw@kernel.org,
	arnd@arndb.de,
	envzhu@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: v7m: reset loader-set CONTROL and M33 ACTLR at boot
Date: Tue, 24 Nov 2026 20:58:50 -0600
Message-ID: <20261125025852.1160075-1-brad@sim.vu>
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

Two fixes to __v7m_setup for state a boot loader can leave behind.
Both came up while bringing Linux up on an RP2350 (Cortex-M33), booted
from a Raspberry Pi pico-sdk loader; it is the board I tested the
deprecation series on.

Patch 1 affects any v7-M or v8-M kernel whose loader ran an FP
instruction, and reproduces under QEMU (mps2-an505). Patch 2 affects a
Cortex-M33 kernel built without CONFIG_ARM_MPU whose loader set
ACTLR.EXTEXCLALL, which the pico-sdk does by default; it is tested on
the RP2350, as QEMU does not model ACTLR.

I know the Cortex-M platforms are going in 7.5. These are for the
stable kernels that still carry them, and for the v8-M core while its
future is discussed.

These patches were written with an AI coding assistant (Claude Opus
5.5, Anthropic), as each patch says; I reviewed the reasoning and the
test results.

Brad Hawthorne (2):
  ARM: v7m: clear CONTROL.FPCA before the boot SVC
  ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at boot

 arch/arm/include/asm/v7m.h |  3 +++
 arch/arm/mm/proc-v7m.S     | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

