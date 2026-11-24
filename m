Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556083;
	b=4//ShdyefbKAP1qAe3H9rWCEMfjSd1X7khyEkhcRqooVHgZMDSS3Dhqjbo5vTFOCx6GA
	 cbPXcrkALnu/6A6IyWkyeajpnf+f+S1EBOWtw1/8LkXfwljcjjKtPigrh/1nz+Z2zuEHx
	 f0MofU9ukMqGvKC0ToHzsaleJB8CSKAZOcY+9DaCV6TYlu0fdsT8zbJtfHo53QFxpqiII
	 lv6mCDL3GER6MkonlkUm/i95ddlB/qCMiBun5EezDe9l9xyUKw1v/RudwMXl79fHOXbKY
	 kuauNLktzf/fonhaXviT/VBZsIt6fLuRYeOUmbjPdPXF295VCss/1LcCESQ+MljkQ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
	b=hzTEoYtvRdnBNsZA36YDDTQjRU4/6PvzRISjY4StnSy4zvjMdQDw04+hOH3P1f5PE0hN
	 HlYWJXJgpCOJtPu3U1rdWVMmiamW9Qvhx6caDNttvAaDwdRj2zIpX8m4u/hJjjKpECgnz
	 rVV2VSWESvL9D08FbytJ0H/FyxENE4Y6eUTp/zaV9IAfucGWgX+efTwgtRQAlnxULaudu
	 6baaKK/rxQNvsEQ5RquwKOX00V/nZeqGsXCYeS5P2q0WwCmUuujNl0sLMmsa+eu2LJtS/
	 1szjB3YNjJ4A6F2zPwM25a5zkdsgN+0H3GDZp/3jnaqHLJyUEGb9iTQma1FWszlhgMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOjlOt8j;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10711606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10711606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOjlOt8j
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so43325765e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556081; x=1796160881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
        b=oOjlOt8jNFXVtNx13w4rQVGTgE8/JSWvYa95a33OuG/Nchqm5WrW4BBXjdYKLtJ28W
         A1JDuw5B8eWUeHHiwbhq8WVOcxptXsFPWIrKnEtpfI2ti2yvkUb+PFaP5kIN02mgvUgK
         pCzsS5dJivxyKh7tSL+PEypJyDo2yokfKFWtwnuRVrDmJ1qbocihDhfENZYBh0tghUQz
         WGOS+FkV+FLFGcXzrGsm/echy3MjDe0T+VnHgW7P2gMWx01W6yap/5b9/rWkWuj+VZry
         W1YJoOdCYrkBYxPDFR52nf36PKNMQhFLqAsU8x7OUbr86Y9Yz8zeg91OA7Jm7/r2tlHQ
         /tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556081; x=1796160881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
        b=INyAksPyhFhhBAqrp+1Zxo0wiegcqYu3VSXHQZXZ8JcC4G8HtDOMpFcUdKGrqHi2DF
         qCG2xkCUC5WTvMgGgTfOvDqyT3q98IQb3oyj1jZ4RBM3TvSN8+hxTh2X+cF6r/07cIjx
         cMb/+t79zP4ULqYmffUP9kVI+c0nNH7YVCjiE5dpcHyfaWkIbdEKDIwuUKIO4m1y+rOH
         fboEyn39xk4LamojE9yKcrx/n0q3r7dYbiG2fe5pxy8odeii2zByzOTBecgNnRxYyFYO
         F4RFMT2mXlVIIIZ9fNvW6U/YLvhMEVxHq1i5a8fhZ5MrNynZruLnrMwt8eHbp1KaaTWL
         jeSA==
X-Forwarded-Encrypted: i=1; AL+hErEQEX9ol33cnB5pIK32cQHG91ShF1gdPkoGFg+/ItoiMBccEVLugsHtNoQqRR6lPueGsLVyVxElEvKyTnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sNnU8fcY0AH9Sk0j0dD7VAoTnPcEaECyMKaTZNgM7h3kMAM3e
	+glt8RkvUp7YOiHACw13fcRjgl+XAJrISR4Rlq00LmuzqhPbiLp1eWq2
X-Gm-Gg: AZFdTZd315VnxCEA6IEPvmy69JvyHli09ASP+u0UeH5C+CjsPa04QGtqUvK7yDh5z5+
	WC69BTPHJDYqCsAXjOWcHpcQNi8lUziqAHlV4DDtdgRrz1xZXNPpAV6AMMf7rC3PVtxu2JMXwVb
	thEk7C6IJ+u9lXAe9ZqoTbQbTic4Ap6STL0wuhRNzTn88px25JhnCPAfW8x6k/EzPgvMb8IeXm3
	0v7IZpWLQTVkJtdzm2RVYvT/Ry3v5AALqe8C+rGyOOkU9AZDr1tzGV9tngKDATYkohNHwBHGPyQ
	E63JI2KdECYxiD1sGcfenHmkKr6VfKXo0MRicjEqhMnsZg0F02RC3t+9NubcNGtkjYM1NHldbdb
	tx9C9U+OgzSDYrGyewuWNGmDjDdbm+nrORZWAcln/AzWI/uEeGaDTG9ioRAJz5VU+iZdNrU+O4Q
	Sby9x0i5dEDaotkIJREss3ybxipLKa1/0J1kzBm38WRzFGedbUHn0BV8thsUrGZbE/2RvdJXkmp
	iXtL1tFxUV2pEXhTIXbdKSCVLjwDJzLmyP5MJGkGtmZPPXjMZBbWN8fGv+b1qTMidIKvbHlNHSz
	M/WUwOPvA7MHHV4wil3+M14IE0h4Lg==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr328897525e9.19.1795556081300;
        Tue, 24 Nov 2026 13:34:41 -0800 (PST)
Received: from fra-x8664 ([151.83.244.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm403974515e9.2.2026.11.24.13.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:34:40 -0800 (PST)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ilia Mirkin <imirkin@alum.mit.edu>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] drm/nouveau/devinit/gf100-: fix POST being skipped on GPUs without display
Date: Tue, 24 Nov 2026 22:34:30 +0100
Message-ID: <20261124213430.9525-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Commit 2139cb633d48 ("drm/nouveau/devinit/gf100-: try to avoid
double-running vbios scripts") skips devinit if VGA CRTC register 0x00
or 0x1a is non-zero, unless the display engine is disabled.  It detects
the latter from the return value of nvkm_devinit_disable(), which is
always 0: the strapped-off engines are removed with
nvkm_subdev_disable() instead.  So the VGA registers are always read.

On a GM108 (GeForce 940MX: no display engine, not POSTed by the
firmware) those reads fault and return 0x13.  devinit is skipped, the
GPU is used uninitialised and the machine panics at boot:

  nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 00000000001a1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 04 [UNBOUND_INST_BLOCK] on channel -1
  mce: CPUs not responding to MCE broadcast (may include false positives): 1,3
  Kernel panic - not syncing: Timeout: Not all CPUs entered broadcast exception handler

Check device->disp instead, once nvkm_devinit_disable() has removed the
disabled engines, like nv50_devinit_preinit() does.

Fixes: 2139cb633d48 ("drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---

Notes:
    v7.3.4 boots on this machine; v7.3.5, which has the stable backport
    (992f7f5f34f8), panics.  Tested on v7.3.5: with this patch the GM108 is
    POSTed again at probe and on runtime resume.  Not tested on a board
    that has a display engine.
    
    Read at preinit on this board: 0x2240c = 0x00000000, CR00 = CR1A = 0x13,
    0x021c04 = 0x00000001 (display strapped off).
    
    The regression was analysed and the patch drafted with an AI coding
    assistant (Claude Code); I tested it on the hardware above.

 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
index 186e09ea0c..b256404c24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -107,12 +107,12 @@ gf100_devinit_preinit(struct nvkm_devinit *base)
 	 * VBIOS multiple times may have detrimental effects.
 	 */
 	if (base->post) {
-		u64 disable = nvkm_devinit_disable(base);
+		nvkm_devinit_disable(base);
 		/* magic to detect whether or not x86 vbios code has
 		 * executed the devinit scripts to initialise the
 		 * board. only works if there's a display engine.
 		 */
-		if (!(disable & (1ULL << NVKM_ENGINE_DISP))) {
+		if (device->disp) {
 			if (nvkm_rdvgac(device, 0, 0x00) ||
 			    nvkm_rdvgac(device, 0, 0x1a)) {
 				base->post = false;

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.1

