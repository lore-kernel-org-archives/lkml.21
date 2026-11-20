Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186691;
	b=VJn+UAbFwcoU1Q7u1wCK64HlFa/6xi+kZK6tiPEP0LDprNs0kRUCzeAH1vD3zZ2aAR9r
	 Rlxk+ofrhpaZNr/n/b3pvxSeQX3GiBsvC1ANURr/jQADMLQoJ3C8pJYxLmatXQOl+FOGI
	 RZdBiHG2cfwHtywVF2S+6p94Ni0ov+kdhFJ9cZb7d7M+hHG5CwvloZMzhkJH3r9h8l8sK
	 kkOIRrVTToay1t1L54kYgGtJTe8uCcW87iCkroQ7sONkUzyEl7ZYzpAMn19CasBqdoONh
	 +H45q/6KZNnrwyK/HcTNJx6xsBI6dp3F+Dl2SRzwCUiwRRuxr6f1R9vPnSlyErlnxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186691;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=cbzB2LZxRa8KlJ7L448ZxVbc856NNpuuZnTJ2XHUAX4=;
	b=ju1oPqCPly/5nNj6lPWfdJEWe91t0gs7n5Gdt4/bEDRBAqBzCDPFSJ3F7z00y7opwjoh
	 P28NWuJ5MwYh7ZwHUOohXX60kiXYoAzMVOnYuj8vV3e3SCECptKXm5D7kyCu2du7YX4Gy
	 Q84G5beH22j10BXPyQZHvh5F7FYbyChCyBuVe5ooYFkPsb5SeXrrTtPkhFfEHMM/rNYqc
	 Do3D5Vs1foo1l0G2yN4zaJ190zVSIMxVgtvwUSbKEmxG1jJHDDo5AtRXUS4A8PiORFc8e
	 LkS7ZFbIWSVlX2SODB31i7JcFayKfIrX4a0SrMEEm9H5q68CzvuDnTCQbiNwsRurlXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JOY1pNTN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C61606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JOY1pNTN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC6D1F000C6;
	Fri, 20 Nov 2026 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186691;
	bh=cbzB2LZxRa8KlJ7L448ZxVbc856NNpuuZnTJ2XHUAX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JOY1pNTNYwmYbCn3T95tQ1G6rg9Gqsu7GBll229Z0x7uwIvgIg76x58M6muj85Ngt
	 beYZGov1027RIvCDqmVUWnuKkhLrCwDksk5fAt3i9eOFjs2EFbV6YlPg5dSKDf6NwP
	 qPG7uHd6ALc7WmJRZdZn7d0LhGYX3in+tgnVh7ok0I7Ix6zEsQr3DLkTTTCkFuuyJx
	 GKA0XuhFp4Jrpjtp5v1A7v48025yGIQJJr7FwvHKMVVO9vRM+8NEO4+evfkz9KlpfB
	 dhwei6jhtHftIQ+PxyO+CJStJhm9WBSVfdrtvML506cWfX7U/GCDKnqMrqqqnEHlRm
	 WA2dvOj5xlfWg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:29 -0600
Subject: [PATCH v5 05/19] accel: ethosu: Fix NHCWB16 bounds calculation
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
Message-Id: <20261120-ethosu-fixes-v5-5-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

The Ethos-U NPU inherently processes NHCWB16 data in 16-channel bricks.
The NHCWB16 address calculation uses the final channel of the last
accessed brick. If the channel depth modulo 16 is less than 15, the
hardware will still read or write the full 16-element brick.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260905010523.866411F00A3D@smtp.kernel.org/
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v3:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 24f88696c18b..67c7cbbd39b8 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -415,9 +415,10 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	case 1: //nhcwb16:
 		element_size = BIT((fm->precision >> (ofm ? 1 : 2)) & 0x3);
 
+		/* NHCWB16 accesses the complete final channel brick. */
 		if (check_mul_overflow(c / 16, (u64)fm->stride_c, &offset) ||
 		    check_add_overflow(addr, offset, &addr) ||
-		    check_mul_overflow(16 * x + (c & 0xf), element_size, &offset) ||
+		    check_mul_overflow(16 * x + 15, element_size, &offset) ||
 		    check_add_overflow(addr, offset, &addr))
 			return U64_MAX;
 		break;

-- 
2.53.0

