Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965161;
	b=0crs9VEXCYZRC6j6aT9iCkOv9FxSRVc/gwfvjoz55qUkcgLiycGOuohkyNEgTxVHIVL+
	 cbK5mzBhg8r82+QPOvOGtnyEbufmN2+2s2x+zV0/xKEyYYz1pGuD0C8NNT685qQhm/jgD
	 iPVumjoPRfSlTyBTBCIcZeB2tNC5qJa2cWk1jjqhLs9Q7m5gX3+/MzWeVGQvk93tD4tCL
	 EX44vw13oIuXrtnKqmsmMrQhTWo7yJXMiXF1v0FOpRU5b9O6hQeBvd0uR9DP0cVRElbxl
	 2Qhxd1feX2a3vv7CAsLHq2P8yN9Pgh7nW1SAm/n0IUFZTvMO5tREdpFbXnGqvRocR4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965161;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V1hKfhmnnJW04pZBP599zW5HZ4qCTwkqtrvykmPMZq0=;
	b=DiuNOCiUwMdn6MZLpExMQrgmzN6slw6D0WUWVufnQLMCoCv2i1hEjiZDwTd0tNC+jJpE
	 sMIKL0p8no+zYtYfKXNOxIqn4DDSR8d6AJI0LZvVw8CsIa1n2hl95vn2eJEpTG+z1XqEA
	 sHqD5KqpnRMjxreKJWW67ZwBHNs/KvWw3HzOTai3beNNIdNlSnfRMGXQ8Ha2pHAd9RXjy
	 XKFuU5du9cUXSGI9Td8Qad71fLqf7K+oS4q3kEp/2E8AgM85ohMDkdkGlNZnFZQ+yF9U0
	 h0e0UlXrzoPCswJizb6H1NQ1EoJJCzsJg78YApGFv9r8ArIUgntCr6Ik146WeAL3OYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timdoug.com;
	spf=pass smtp.mailfrom=timdoug.com;
	dkim=pass header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=RU747gsO;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bfFWz0bD;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022FC606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022FC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=RU747gsO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bfFWz0bD
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E9695EC08B4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:25:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 17 Nov 2026 20:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794965159; x=1795051559; bh=V1hKfhmnnJW04pZBP599z
	W5HZ4qCTwkqtrvykmPMZq0=; b=RU747gsOaY1rrQrmPOd0GyiVb/9frpE21rXCs
	u6g1vgBE6nynj7vLEG/8Eh0pl0yDeL1IXmtlGTm77J+7KDYNnf7xi62aAWrFSsrn
	fXY8KBVgGY6fqvdq3mIie0OvwYlpH07VhiNAxX7ACmtrHej8qJx2I3RjRxgDalqY
	kJBMj9dWyZj4jZPS8GpZRJRyABJ8n3XDHJV5OKHrcHyMcAv2EaT47CAqBccmhcPN
	aujZYHNE/JHseFpFhD9OJ7eDqzqCK/oEyskb0beEXm4lo5up55diQWAq9MVWtnpA
	wfmeE3OsP5omr8avILfqO3S1wKRpC51EtdoHlLarTTAV1Skug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794965159; x=1795051559; bh=V1hKfhmnnJW04pZBP599zW5HZ4qCTwkqtrv
	ykmPMZq0=; b=bfFWz0bDRtF/Q7U1AOAPOk5KWx5k846vmk18Sb4+v98iJqezZwa
	FeOln7z2PoKbFzsptLojTxmElUPl8AYgx/kfhzkVCn4GMVacLzW3FSM++XfX8m7r
	Yt4LUVPq6X9hbyF+mTtxmpPy0bBO5pcJXqrb0WJrBcqLwyvbI/OFufuvzvyqiYJb
	lZRmtVf6GHj9hM21qMRiEsRueHcqQNwyF40Ec1vfXrzcvMCHQE3Ic7kAEKaDCtyg
	XxPRy+H2qWv5H0F4g2jODefIHKFi2hUq4NrnB6uu/pQs6J3H47oYdrO2voriEQkM
	EB2Sk/RWsM3QDix7XjbNrgS9GkxYKXOg2LQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794965159; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:MAy3bZVX+oGUjTYXw4vFI8y142Yf/EDd7FAejjeIuV+D3Hv
	L393VTcs2nlEDiFeq1gXQVeTXRfufOd1j9c9cMeECphY+M1Vked09aypJ4HuaQwR
	hbRXJWgjhH4E/r8d0ZNg12VNfvDHhsp4nR69zrCQmR2jleFt/IJNRbwfI/7Pv5Bo
	OZA0OgssoPTpaHhj+44avSii1WIu82FceAwulWA8bWWjVc2IS26nrBiWOjUDI1GV
	llKXyo5sJbIEVe4MYCP55mwLyPPwW3WyzZGYYtE87yUK4y/uha56pYVhikwmDlk3
	hqvrZ/OQAu51yWwxJbnkdd+TkYG8R2HWvTbDK/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:bFVWRwZ60VfMatr1Orbc8eKiAyY7rTsF9KUbBWBNOEQ=:CPje0uR992FUBO4z3Opk1Q8PCdb1C3Ri59egfWzKny4=;
X-ME-Sender: <xms:p_78ai-uCSyR0PYgY6btYczQBTyfRsJKrKWRk18_M9GZbC95qu7pew>
    <xme:p_78auKxhxYgAR9Q_HEBSnkM-dOf7_vQl3QyNRucICrrpK9aZqYWF4aia0UWIPCkv
    pd5NkPuEpyPrV9aXDZkBtlJAPMmJ0I0VC17JdD0uV9xNY-KyZc-nA>
X-ME-Received: <xmr:p_78arjc2gF5Rx63a-heuL4ozbJ2bD9mEI_LtoT4VMfHtwDnp3t2PnZb0L3d>
X-ME-Proxy-Cause: dmFkZTEKT77cM9davhckAK3Z4/jhSI5D2dnaIj5jXAkpPjrx7VpnkZCtRyAVHRQWnuum13
    8Qd400MJoky3xnskuDztTavCwCQpMN+udMGKjW7kb0s4GyqTer5K5ph8rtNevsEdY0JzKB
    CkyF3OzC9HKM7vgXPxvshuTLiZMSqTm7fWfTrQGuN+tEDvv5E2lR1IL2XNElMevqEsAvad
    f4QIP9cm3+nMVC5nBzD3KW44Pd337lwAeocRejOB73SHHyjG3gX+4EvK8UEvz074W6pz2f
    7EDTUZqUJca36lO/dZlJqSG0uFvdyzuS4qpXEwiXlbpWEqJH+UaPHdWWArj9SwJ5JYvTMA
    iP9XaDn/k09JapVlQCnSZAz7aA+niD4wcpCn9Y4MRaMC4Jmm5P6E48jDswaSGcMf5JXuZA
    gDUzbYz2Z45Z1RTKXXsTx78+fChEbxAe4zWHwY0tj9RsRvO3eSGqFh567mBhDqKXfhkx4F
    W+TRXtLgEdq7XdW6ael9Qw/CUCPvXRkehsZhZOuKPpeOzwDsR1Sdsv8PhK98u8EXKjopHM
    xni9wzRIffiLksHVA4n0K/K04NMV3Scxg8WllTQ3r4Ioa9E4DKVRm5ZoBXTpmNc5ZY9+2G
    GEpfGEzREdzrr+ZVkq35O6AUTFscaw7y3gAl38JA+8F1al9ImYOs+K9DaT4A
X-ME-Proxy: <xmx:p_78au4wSpHdisGSzZ650E-ncOn3l0RQXAqedLtzbjQfbTfvvoVcVg>
    <xmx:p_78ajY8B6eCchKd7O_OscDCg-es4hqK00MzreyqHfmrRQGS7GT5Kg>
    <xmx:p_78aj5Rlnmsj3hTehm50__N-yCZ9wvFOEVeI_YaEeV8axl1b-MwQA>
    <xmx:p_78amAIPLCLhZeEZX2q9KYrpn0g9GVgllI6Qq_BIJBBs-9-YvBWxQ>
    <xmx:p_78ag-YIM58ipz3EXcYhZmYs2__Op45CrpY5in0gwZyWlCxdDiD25TO>
Feedback-ID: i12bc4175:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 20:25:59 -0500 (EST)
From: Tim Douglas <me@timdoug.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: macmodes: compare the pixel clock of each candidate mode
Date: Tue, 17 Nov 2026 20:25:57 -0500
Message-ID: <20261118012557.79419-1-me@timdoug.com>
X-Mailer: git-send-email 2.54.0
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

In the second pass through the mode table in mac_var_to_vmode(),
the requested pixel clock period was compared with the first mode's
period at every step. The last mode at that resolution was therefore
returned even when its period was too short. Compare against the
current candidate's period.

Tested on a Performa 6200CD using a kernel with local platform
support. With video=valkyriefb:vmode:10 (800x600 at 60 Hz), the
measured refresh rate was about 72 Hz before the fix and 60 Hz
afterward. At 640x480, 67 Hz was also selected for a 60 Hz request
before the fix.

AI assistance was used to investigate the mode-table walk and draft
the fix.

Signed-off-by: Tim Douglas <me@timdoug.com>
---
 drivers/video/fbdev/macmodes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/macmodes.c b/drivers/video/fbdev/macmodes.c
index b16a9d9be..7ea40fd34 100644
--- a/drivers/video/fbdev/macmodes.c
+++ b/drivers/video/fbdev/macmodes.c
@@ -342,7 +342,7 @@ int mac_var_to_vmode(const struct fb_var_screeninfo *var, int *vmode,
 
 	    if (mode->xres != clk_mode->xres || mode->yres != clk_mode->yres)
 		break;
-	    if (var->pixclock > mode->pixclock)
+	    if (var->pixclock > clk_mode->pixclock)
 	        break;
 	    if (mode->vmode != clk_mode->vmode)
 		continue;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.5

