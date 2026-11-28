Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880697;
	b=yTTvb1fbwFbiB5DMZlOUX38jaUASgiaJxNz3QiSrp76gplbO75BKWuXJsNbPY4skRTLw
	 Zuj9Pc2x6MCB8V9Ni3MSbxItMR3lE57AatgAMrCdqFF3078RtN/LJLc3xtJTAtnrbvVDX
	 zdU1a0RCA+KcVDSoAxZGE2Q2UsDFJ2Ggsn33xtMAVTWP7WNvHedeEa9DzQc/zFC4i6ZSy
	 1MfPnyC+R4dqAGl9ZzeblUeHYaAEv2s1xh+CdZ7xZPMRDu48rMWLlgFMYwKqpjy8FNMoT
	 //QwCUUhgVECcb2pky4hgzz/VCdb8dbYFwcw8O7ORPjdgB/p0LxWH83QSwZD1Tm/hAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880697;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kp2ZTwcMM1Kh/rV8q9PBPM4cc/LcfD48pgFHJxatsEM=;
	b=SXtsPMAIl7JhXULge/KXeqXyRxmmdUsEXj58zemYJhIUYCW/j53cNZnvGF7qIMRHu1dm
	 A7uExENXi1zfIB0iRDVyLffvUQEQuiLmamWTyNvBRiHEY0yBSPLloPgPrVQLHWVvPJ5QW
	 u6bHIyJMRiVWsjJwdHCTdR5TnQ4iudeIcRaS/68tvid3JMJNh5fmwhYWGCIzyvBiU3OYM
	 DDJxl7VENR9DAP52UndmV5sSwOBveF/kJFpyQtyoVjRfNIxxFGkhI4zjFC8abj7bIw8jP
	 yRAnL0J0K53uFTB9L5pN2H52iVoqZluspRXR9J26fcegpZC81DaIjDvnwurbten8qkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJOKmsCC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174C606A31F;
	Sat, 28 Nov 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJOKmsCC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6A91F000C1;
	Sat, 28 Nov 2026 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795880697;
	bh=Kp2ZTwcMM1Kh/rV8q9PBPM4cc/LcfD48pgFHJxatsEM=;
	h=From:To:Cc:Subject:Date;
	b=CJOKmsCCiQYs3g5yS/0GRjTvOAZx7fsDd9oN480Ua1eNMHx28DRxj66yq7X1jqwb7
	 yscnQHpM51CjgxTBAw+xelce3gvRAon2a7z1m++h5jjY6/KQaYkqAmDG1P4zKp9oBw
	 2wtpJyF9vooSZtUTERBFSS/1bI/ft4kCKBpiU2DozGg0NFSAwBATl4YRL9Te0u1luM
	 V3i8hNpsh1kEFSi9EufVQRNcMY5OZQ4/gveRMlquqVfomPijRI23Jo3gQpmCRpqSPe
	 OPytfK2b7kOiZ1ChjEOQIk+dWAoIzzT0TUgrtPigv+qRvgEOFcFyY/e35GpoSQbYWW
	 I7CDpTeU/sjlQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP22: Retry the third timer calibration sample on zero
Date: Sat, 28 Nov 2026 16:44:52 +0100
Message-ID: <20261128154452.28694-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

The third calibration sample can be 0 and is then averaged in, which
sets the Count rate to two thirds of its real value. Loop until it
is non-zero, as for the first two.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip22/ip22-time.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip22/ip22-time.c b/arch/mips/sgi-ip22/ip22-time.c
index 045aa89f28d8..e911bc03f1dd 100644
--- a/arch/mips/sgi-ip22/ip22-time.c
+++ b/arch/mips/sgi-ip22/ip22-time.c
@@ -93,7 +93,9 @@ __init void plat_time_init(void)
 
 	if (r4k_ticks[0] != r4k_ticks[1]) {
 		printk("warning: timer counts differ, retrying... ");
-		r4k_ticks[2] = dosample();
+		do {
+			r4k_ticks[2] = dosample();
+		} while (!r4k_ticks[2]);
 		if (r4k_ticks[2] == r4k_ticks[0]
 		    || r4k_ticks[2] == r4k_ticks[1])
 			r4k_tick = r4k_ticks[2];

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

