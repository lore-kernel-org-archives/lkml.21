Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670521;
	b=Nw77PGs5W3j5YVs+sIqHfSxD770hl3znCj5MzePyUHPRjUAQ38xAiQDx43OqwRhO01Qd
	 ArFpfcpocarZ4rxXl9lDUD1wfGmUXgz2ohXUsVObPPIyV+hJyCN3YXi/8JOjGBmMtZR26
	 tbt2/ic82pbS4i6964RHqex9/idZu3CcsSIFPzmsdt3Gw+jCMppVVsOFSxNtSEgcMFytP
	 gIm7I20N0eOefuomDKkQ/TNcB3wTqfsCkeirJrVJU7VBWDlU0UC3Qk9p6BIIXBVM5dEIX
	 nwpkwhZPL+qIcabSAgr6L3d2mV0zmSmgvVYq86BDbTmRHV6GgmHxldggAnuEpc6vgyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=onk+iKTNJvSLjSgmayiHFki7AAkKSNYYZ+ceWP4cnXQ=;
	b=hg3x30GidmoLsCPoeKmPlP7/LY+tm6dZ5HbfsoV17qCNYph6H2OTPbhTlA5updDSLovJ
	 t/Rmjeb8w7C56FLNPyC3tA0KxjYtVe0GrMs5pSOPNlmuFxUQyB7SwMA7h56HLLOwNk5TQ
	 E093KiHJM+f20WN0NF8w9HAsTlAT7baOXJ/FpfMjrmqanUFx+EvHI3z7SWVavm/G+V5Z7
	 C60Alus1ydM0Z0pcLLehIj1rb3waRc/x8gaf1qjX6XoyulDbqgpuuBHGqel511IqJEfaM
	 sscYPkwPoJh8oRJd5ulBVbrPPnJk0bW/0zpwqP3WhO4hDLuZLfkom2oMPR/zRhY+scw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f8PbKIi1;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC3606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BC3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f8PbKIi1
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3161882a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670520; x=1796275320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=onk+iKTNJvSLjSgmayiHFki7AAkKSNYYZ+ceWP4cnXQ=;
        b=f8PbKIi1CS5x5lIZiSjkTRACKg5FurJS/mPBBYSYZaIX8dTrczQ7LJ2qu+6LiGIh4p
         Xl/G/MeG05PpIydrx1aIFbqSuMO3ETiogNEdPKAbORlFhoV81bYdgdpjt4BVonHiBPNo
         WoavpEqaog7RTBG5jiqeCynsSXT0+HU7Yh/mWECo5NH88B+WvDpqnf+dHwVDLgUYaK9u
         BPQEz2GeMIS2CuM4jjRK8N6BxA26UbwU6kyO32ON8uhKbKQ7metU9ozuoyMBSzEmhhzU
         zFIfezvZnZW1Ek6PuUhwSY2CFoCE50Zz4XUNvqc3TX+QUYd6PKcV8TZi19oqrICNMLm4
         17lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670520; x=1796275320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onk+iKTNJvSLjSgmayiHFki7AAkKSNYYZ+ceWP4cnXQ=;
        b=rA7MFyBasCgHSpww2PFV9/kVAZ2/pCFB0Km/wODxgXcjjS9NXe6v4nIgZgyA+s6r+g
         a+bmCKJ4redWoL/ShJNJxo/ImQofrClh5CNC3vHkP+RAUcUq/TL7NmjFz1LGEj0B3iMJ
         fnfLaVXhqermM+Q3aD52nxNIzWJnpFc4xqFIhSg6PblLivFjRsXTFFa30s76lJa47/Dg
         MzZ9M03LUEZNcK65u8k19eA9CkuYMtmADHn2/C2+8F5rhMgmUeseXlbKAyBjT03h85OU
         J8ej8tK+ztZ05Z5tGF8n3W/zkmj5oNOBpaYfMByqBdwmJnX24liycSnbheN6AwMgj/Ja
         r/0Q==
X-Forwarded-Encrypted: i=1; AL+hErEusXWlesr2J91ePefxlTP6Z4iokERhnXIWrnOBjaCzUTl3XttReKcHNtxUN/edyy4qhZXsL+5hXnIas00=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TWoxQ4A87A9HDP2SLGmEjqAiPmBTW6et9FL1mVDWZ0h9PdTjm
	ilvrZmJ2D2An3OsAaoKEwj7WWZNfXsb5RmTBnfR/hZtGzPMN4UMaMhM=
X-Gm-Gg: AZFdTZePOniX3vY9gbz5DVDGe8ezo2vrPzFbH4KlMoZcJQ+1K098shY0+aB1uJd87CZ
	m0EeyYFAa1AgHyfXHDN7p3EpQGXvIsjcGjSjT7WPXPmbef1zXyPo/jD+SBn8gE+F/C9JRCmiLlJ
	LGRh6MPDQ6IigH1xE+yioREBB0F3R4O05n+OrdK2HG8uigcxRIJPe+E5+DKMSlPtTrGI4LK8CNX
	Os/oxhrdRHe/U+IBzJUtgX1moH7wWmLZd5SooLYOE8jxgJ++x9GOOPZENk16wmklKjzXJ6gjX8t
	HDF80B8DSgtdbpT6+CyGbepslL9NYpMW2RC2zvu49TJx7SZc15PvK0gnmnOYuoRoD1W5qjXLaZj
	NV0TV3iDGBNJTSITKsubPi60qs+qtBKzsgvf9829WKNxHovOQ7xoYaBAvRw7yIgKZkga5tzEsd7
	xKP+hroRNZSF1bNibJBiVArIF9R2QAYb2oHXdnuqFzO5VGhtQFggsJ4vEuPfiOhm9mhbD//vcby
	RqiD8Tb6OWFpoa47zLnR1KFbnYfVJbl5bXLNh0pjhmU9u/yonxhDFksHkiOU7G7ifTaC3RSVuZg
	8mRGC4QnogEcu2levSoTVz6adIsztS2ILFf7U7RkbM6xIMQ+pT/8q+IawfL13BIOUqhVy6CMZGk
	qKD9xXETImYbp
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id 98e67ed59e1d1-3b41c942d13mr19705625a91.49.1795670520219;
        Wed, 25 Nov 2026 21:22:00 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm33748176a91.15.2026.11.25.21.21.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:21:59 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: coda: Release firmware if code buffer allocation fails
Date: Thu, 26 Nov 2026 13:21:54 +0800
Message-ID: <rc-b1-20261126-vc-161-779570fc1703@gmail.com>
X-Mailer: git-send-email 2.50.1
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

coda_fw_callback() owns the firmware passed to it by
request_firmware_nowait(). It normally releases the firmware after copying
it into the BIT processor's code buffer. If allocating that buffer fails,
the callback jumps to put_pm and skips release_firmware(), leaking the
firmware and its associated resources.

Release the firmware before jumping to put_pm, which drops the runtime PM
reference taken in coda_probe().

An AI coding assistant helped identify the leak during review of static
analysis results and helped draft the fix and commit message.

Fixes: 186b250a0725 ("[media] media: coda: Add driver for Coda video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64 coda-common.o with GCC 14.2 and W=1,
CONFIG_COMPILE_TEST=y, CONFIG_ARCH_MXC=y and CONFIG_VIDEO_CODA=m.
The baseline and patched object builds both produced 0 warnings.
No hardware or runtime test was performed.
The path needs the coherent DMA allocation of the code buffer to fail in the async firmware callback (OOM or fault injection).

 drivers/media/platform/chips-media/coda/coda-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 3fe33c4..ca8f953 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3004,8 +3004,10 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	/* allocate auxiliary per-device code buffer for the BIT processor */
 	ret = coda_alloc_aux_buf(dev, &dev->codebuf, fw->size, "codebuf",
 				 dev->debugfs_root);
-	if (ret < 0)
+	if (ret < 0) {
+		release_firmware(fw);
 		goto put_pm;
+	}
 
 	coda_copy_firmware(dev, fw->data, fw->size);
 	release_firmware(fw);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
