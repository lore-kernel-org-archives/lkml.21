Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967182;
	b=YsJSguduLbqguuAO1V23RIg3DoAMGRPl/fLVi8yDkpzcONQ5L1/UzEw9gB7r90ClAXBB
	 rczCpHDFfjLWON+deVaPUx2o3YcXu0+z4JbfpGlWaMyrMLdfhAlm6VNazx9V8gd8Dcqfk
	 JPLTtUti2ltbiJHG0ja7L8TIEJ29uX7eUE2bGoYO/2kEocgug7qSYwjoqLptgEozIzJeJ
	 9rx+p4f2fCJI/RTPPProXkFTLb0z6i41PGY60jNzQwbATe1l92Kq5xTWlNwp3di+y/fTb
	 LG5uQHM6837QHvm0uQUrxoEwKtDm5dsuvWAdSX1gRXqD0Wc9HbLjjqzm+wu76GBwemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967182;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZSV2UPAtaoVAnpwZ/BtCXbiGF7M5OXK+ikdh8M9ib90=;
	b=tUnVNQumWTEQxQB+Gm/e1a+AofSarHEHkqBlGp+JK62hNSE1SddLbcutj2eMh4kd0pVU
	 IgWlN4qZ+KVQCCNdOzJRKnIy474XcorNWO0NGvGbxH1/TPsuE2N3PIpYOkriAjFKvkdb0
	 DuIuX9V8CFMoZfiGxNHItfml9d7KJVmvN8ebR55bxtzrYcC5BLv1zufL6P5rYDli2vTDZ
	 Hdmo5db4ZAzjgcs+akb7om6HnFFzVerXiGdwV4olj5cPN5u6WySBq07WzmvZyvxA6+o8v
	 DJ2cEydS1lFbIsiQC1Ixfr7/i/mZnWJMjr2cIKRl5+U8oVJ9aeedhR3FRFK98+B3GzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timdoug.com;
	spf=pass smtp.mailfrom=timdoug.com;
	dkim=pass header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=bfgILWXr;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UCQvYI5m;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B92606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B92606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=bfgILWXr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UCQvYI5m
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D845A1400185
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:59:39 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 17 Nov 2026 20:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794967179; x=1795053579; bh=ZSV2UPAtaoVAnpwZ/BtCX
	biGF7M5OXK+ikdh8M9ib90=; b=bfgILWXrTdFYbJXjgZTZH/7o1iSLO/AePkmnu
	lXD5LLmwXbImofnFF54QOcYKkHeEh1F4qVYQXFEKU+b4ptPLPlAEq80tc51ExQyx
	k2/33LQJNjSQWaIIK5xav+bhCLuJxMohhmqkSJTkQIV2Cp5a10fhfHEkRQFbaPdf
	9dZbyKeuZCZZ2BS8DLfnZVyDt5/kdwL2jlRERsScMKg/mwksmg9j39wE2nkRqBZe
	WJgq7hxsNDrpIg/dy3MCGv3kA/PYMcsylpuLRmUs/XZojyI+GWXJagSFy+iBSDPz
	7zu2H97OwD4HqKAyQv/XAPYlPm7zv1H+/oUB2cAz5C1Eh8kcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794967179; x=1795053579; bh=ZSV2UPAtaoVAnpwZ/BtCXbiGF7M5OXK+ikd
	h8M9ib90=; b=UCQvYI5mBBVo/BlZ4w+XYTQoX8AAYeszT37nEOjaZVzNOjlHBeK
	/o9Re5o4J7SiqyZe1ApxYiQh/coKmLHfRmSO8a5s0dsh9Pcjl8VrbJp9RxkF29N/
	CKXsimdtpm8MDlETFT/Af+OrccU5NHOWLF546hS1DfnJQJwzLUfyc82QX1wTz4bB
	jh7sGwFtSgufNnMQgPDQ65tCNneSBWswKso3cc2GsHcOqoS2lIKjWXkrPh+ni1uj
	uSqn6va9E+QDYeMQs2WmloeOorJ/obseYJD61lzJAK4zInVPgYcW0k82irZMWPfw
	IjT8S3a5a0stQCukzA2Kw427pwVVQ+ZrcTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794967179; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Z59ZcyB1i0YsVNSmo6Bor5ApDbtin0s39K2FkwQ6aQnEFF2
	1hxV9jrTiJm+okSfxXWmjYx5dhmBbWXiotVKyRBnilZoY34Kq7s9AZEKGma7NX4O
	RJuy8Cji6Fj+IM6Z9J0F6+PIRf/cow44aXDtnVrwnR8IrgJb/kvMtagZVDHK6/a6
	fpHODppHFFAoZrkgSXWelFsgh0Uhhi3ON7bqEcTw+fGQXeNzQ7CNWqBvXIsuqzdU
	YDWe5ySCPsDMXxsbitOvSSj9wFVaK27QyTzRcqsjoch63kAKOa4A/5PyY0z8tedQ
	oKXlP6MaqeOpsJtKAmP85Dr9Qa6Z5BOvAJhefKg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ZT4NBP+dZ6kEpTng0nw9OzKrl9rxtmFzgkZR97ggba0=:onF1i3XQsk5QUNA9WnF/o0ScZsWHUpbLtliEd4TzH2k=;
X-ME-Sender: <xms:iwb9avdF0ygW8J-XIGC96vcrcX6deNnmF1rvJN9VCUHkJbd7LowQKw>
    <xme:iwb9agoCGzNM2lwjk-J7JXor9s88O81Ek311LbQm_JMEEOS_HyLo1P2YSHZTUfwHc
    DBbqhh6rygFxPLaTcIFySACIR08f4uSmtioeLH2R07C-jVmXkxXDA>
X-ME-Received: <xmr:iwb9asDtdxsok4Y4CyRNgW19f0PKFdF6oVMBY8ShJKt4apGSP8oYQd059GdV>
X-ME-Proxy-Cause: dmFkZTEyqy1RfkBWV1OkqVtKccxbuSkVy3qNQElWzhM9d8A63OOyz0GU41AxauMglzV6j1
    xuVozbgBF30Rk+IhNslkk3V9Qgh8bOtfnahyq5Kk8hc8mJoWRq3OEeDrcuqOY2+ET7LEMm
    KOOv1SVCt4+/isiI7qK8vrZrHDAxo2qE9usdd7NGdywKscxsW3q72e/5EK01ACmfPhA8SX
    zUSC0zcCMTBarhg85y22i6cPJJHzMgtU+nB6qbrBFHqzdQe6bH7n35a/QPurGKhDMdotIz
    rjL0Qj3awm4VXmSM/Gh216qMquIFEbZBz0TXH3rU1Rq7Q7P3wwDla0B221F0Ocoek7j2se
    mQnZaerVEUuwhwWrQtL5s2kD4I0Bh9MgPGulSIqyDK7Nry1wMbpvaPlUYSgbNz7SxaQYUI
    mTOF0pyIZpr3fDbHFsV0l9IhLkjhp2F2xLR1m8cGDvWxW8f5WAP+sBNWfxOntnFMQo8Yfb
    33WmlOWikeW4Hh2v2a2Boohn7n6QC5Vwwt9wlpNkzR1OC82osgeGQyso8z+o+4qVTOaSH2
    Tskby3UNgMXX/iRZNAzPVFzIbf0u6NWDuYWzHs/5YMJ/wH5QKtMGrpsLx+YNFOetFa4/9n
    vliFW2pWeqcUBo5bOyjTTpLMPQEowvRKUv1riGv6BpNMjq6Qly8fhsj98dzQ
X-ME-Proxy: <xmx:iwb9alah1zlVOc_VmCwGwIe-ucAdHxiiskYojLZcQW27MdBnYtSUog>
    <xmx:iwb9an6IHU4w7U16Ura1XA48N1fU_tpRaSBn9KPR9xuGv2vQqzmBdA>
    <xmx:iwb9auZ7_Wjz7r5kmuaW0RPNUORK_sXvWOp4kLDjPSiWfx31gWE6Sg>
    <xmx:iwb9aughXFI7z7MYAu4CCMXLv3JXiuZNJnreqQiDLmbMa6CnsyXHVg>
    <xmx:iwb9avBuYyQrVub7lQlRIWV9FOXxblxudrBm088Kx_ToKW4OZe9zg3lN>
Feedback-ID: i12bc4175:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 20:59:39 -0500 (EST)
From: Tim Douglas <me@timdoug.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: valkyriefb: keep the framebuffer mapping size fixed
Date: Tue, 17 Nov 2026 20:58:59 -0500
Message-ID: <20261118015859.83794-1-me@timdoug.com>
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

When /dev/fb0 is mapped before a depth change, as with Xorg's fbdev
driver, the mapping may be too short for the new mode. At 640x480,
a full frame at 16 bpp is 600 KiB, so drawing it through the
original 300 KiB mapping from 8 bpp can fault.

Set smem_len to the usable video RAM by subtracting the 4 KiB offset
already applied to smem_start, then keep that size across mode
changes.

On a Performa 6200CD using a kernel with local platform support,
a write past the mapping caused a fault during an Xorg test at
16 bpp. With the corrected mapping size in the test kernel, twm
and xterm were displayed successfully in Xorg at 640x480 and 16 bpp.

In a test on a Quadra 630 in MAME with Linux v7.4-rc3, /dev/fb0 was
mapped at 8 bpp and the depth was changed to 16 bpp with the original
mapping still in place. A SIGSEGV was reported during the 16 bpp draw
before the fix, and all 480 lines were drawn afterward.

AI assistance was used to investigate the mapping size and draft
the fix.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tim Douglas <me@timdoug.com>
---
 drivers/video/fbdev/valkyriefb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index ec3cf4589..e067c89c9 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -510,7 +510,7 @@ static void valkyrie_init_fix(struct fb_fix_screeninfo *fix, struct fb_info_valk
 	fix->mmio_len = sizeof(struct valkyrie_regs);
 	fix->type = FB_TYPE_PACKED_PIXELS;
 	fix->smem_start = p->frame_buffer_phys + 0x1000;
-	fix->smem_len = p->total_vram;
+	fix->smem_len = p->total_vram - 0x1000;
 
 	fix->type_aux = 0;
 	fix->ywrapstep = 0;
@@ -523,7 +523,6 @@ static void valkyrie_init_fix(struct fb_fix_screeninfo *fix, struct fb_info_valk
 static void valkyrie_par_to_fix(struct fb_par_valkyrie *par,
 	struct fb_fix_screeninfo *fix)
 {
-	fix->smem_len = valkyrie_vram_reqd(par->vmode, par->cmode);
 	fix->visual = (par->cmode == CMODE_8) ?
 		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_DIRECTCOLOR;
 	fix->line_length = par->vxres << par->cmode;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.5

