Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.209.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575538;
	b=INM8MG0GsyIZ2ZvZS/S2yNhLcO1Ll4sVlCugv3agcpzXCYJ9GhkpHjYIiNN012WHmfP/
	 Sz9kjObQStRvIU3SQUmKesDUkaOWC4xo0m2QAXYEJJ9aHz5o7MszVaDTMVPn05Lo1E4Vi
	 ivINKq65h267m0Coj2NRI2K6G2YADxos6cFB2vsp1S6wLSQtif4LNMWe0JIKCvg4rD2pG
	 H/mloxkbGvYj6pVDoHmA08E/q6GVcii2jblaZdEMqV5SRtj9oZ9YUtcokPfluHP4tT2SE
	 1U03vts+AFjiP+hsi4OZYGSUt4OiZgMnsfdGCKqT/1j0DpSaCTJXjlSQ3WT6tsmfvTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575538;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Chemical-Print:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=sD/x8pLtICCIXulyBkBw9O/tAVZvYw5qRUU4uo3qJbk=;
	b=bxyjd0Y8BLdgK26fMtKLzRj+92hBUmOHGG8w/+h7kzTn3Wr8JfPj787gcW3p3X1TDM8p
	 S3qFMFOlxRYkS7pvDNcdaHHQ+Rd362H1ebNAHpGpWuvb+rK8N1UfRS2kM92P9gQuqpSR2
	 iYTPaJk0HN2J2eG9Yc/d0dy4MF9zmXULjz+3DS6DdC1QBJvzPFIevTRiCcERk6eCiNpsH
	 JQVsYcd32lqqNifKxvZTi1Ek35YGZe5+ehxNMDHgJpQR49KQos5GvALTSACK64W+/9qc1
	 wx4IKD0vAPTV2Qzg1IQZrvYE8YvpDXJlnWCR1/kMT2ctaMsLsCg4SKK66LlzQ9bfXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.209.80
Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98646606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98646606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 79E96940E05;
	Wed, 25 Nov 2026 02:58:51 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-103-201-208.trex-nlb.outbound.svc.cluster.local [100.103.201.208])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 89EE794166F;
	Wed, 25 Nov 2026 02:58:50 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Chemical-Print: 0936585d1c6aa1ec_1795575531402_1462623305
X-MC-Loop-Signature: 1795575531402:1731359401
X-MC-Ingress-Time: 1795575531402
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.201.208 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:51 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Da-0000000BJhc-3Y5O;
	Wed, 25 Nov 2026 02:58:48 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ARM: NOMMU: pmsa-v7: Align a split region's base to its size
Date: Tue, 24 Nov 2026 20:57:56 -0600
Message-ID: <20261125025757.1159931-5-brad@sim.vu>
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

try_split_region() masks the base with size - 1, which aligns it only
when size is a power of two, then rounds the region size up without
aligning the base again. An MPU region's base must be aligned to its
size. For memory at 0x21400000 + 0xa00000, the kernel asks for a 16MB
region at 0x21400000. QEMU ignores such a region. Hardware that
ignores the low bits would map 0x21000000-0x219fffff and leave
0x21a00000-0x21dfffff, which the kernel uses, unmapped.

Start from the size rounded down to a power of two, align the base to
it, and double it until the aligned region covers the request.

Tested under QEMU (mps2-an385) with that memory layout: QEMU no longer
reports a misaligned region, and the kernel boots to user space. Not
tested on PMSAv7 hardware.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index af0c71135a6e..bd776ea90934 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -146,13 +146,19 @@ static inline unsigned long irbar_read(void) {return 0;}
 static bool __init try_split_region(phys_addr_t base, phys_addr_t size, struct region *region)
 {
 	unsigned long  subreg, bslots, sslots;
-	phys_addr_t abase = base & ~(size - 1);
-	phys_addr_t asize = base + size - abase;
-	phys_addr_t p2size = 1 << __fls(asize);
-	phys_addr_t bdiff, sdiff;
-
-	if (p2size != asize)
+	phys_addr_t p2size = 1 << __fls(size);
+	phys_addr_t abase, asize, bdiff, sdiff;
+
+	/* The base must be aligned to the region size */
+	for (;;) {
+		abase = base & ~(p2size - 1);
+		asize = base + size - abase;
+		if (asize <= p2size)
+			break;
 		p2size *= 2;
+		if (!p2size)
+			return false;	/* would need a 4GB region */
+	}
 
 	bdiff = base - abase;
 	sdiff = p2size - asize;
-- 
2.43.0

