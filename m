Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856003;
	b=s22fWe80ud0fbsI1ozk0xUF7GM3YEnigvEqzoOs3zAm+VbUeOUlf1B16gbAsbZejQ+si
	 1y8WJZzpuXMV0g2S2EIkFZEjyKctOKb6IxakxHSl7bUFi1wzSXtrpKx1jF/+IUcVTNlhr
	 mEzHIZzORN79PZtWZZlDTdZGxqNv9cGsuyL3ZFIALtufoIuBXHEkwaeykvQTyHM+0FLEX
	 J7w4mB/xrSvlmbZcRFIEQv8YQaXc+nDtdDCK0GoLCrdviyjd2GS9iB5ZL7lCcZiLV1rDO
	 Ddlkn5xCUQx8s+0EJKiaHQfKp8ol+CDOGrgsTZ7EMLIreJnRow/4sDjQs2sh1C30DfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pYdZRMDlVtYaaI0y/9/AHPDxXWjl0VbWZbrTCTv4mq8=;
	b=QRBY6i8CYW0HV6rRN/BfoQeUcteYx7UZ1hd6cYpyiK3qevbClY5AJqWQTgyD2rSIcLwA
	 ICQDq1uQFeBcAoBNSKcAB441IK14gqhsTurJg+DUAaUtyGafWoxPsHjR6O2BkM2MQAhcs
	 tsEkJGT0xu/ADY3Q/PakHAfyEnQR0lQ8JS336CARgfOEk0XfCPPXz00JIAHo8d6HPPsGl
	 PJdXs5l+W97rHTTEfdx2E/dE3vD6O+9HYK9eInVo9hA5eiOUYUP0SxW+Nc5x9CeHdfSWV
	 YkZkxJhXzZMYbcFs5KvJAny6IW0ubB2G+MTGwaCPpwQ7W23+FbTqQEfQ0bVUNrsq4Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B9QaEyJ/";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29A606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A29A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9QaEyJ/
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38699cf08dfso11449678eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856001; x=1796460801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYdZRMDlVtYaaI0y/9/AHPDxXWjl0VbWZbrTCTv4mq8=;
        b=B9QaEyJ/UNb0DLh6SFOodGgCVwFujZmItQv3OuKj/r59L9+h/AV7FWGRsP1nzGh6J4
         tkb+akswE33jEFf++tlxEGFHj/FCa1C0wy4HLoqLOT05myiodKKbNrL4dQ4amOIbNr8t
         abID9wL9UdWtP2x6Jb35Hu89JDNb6kN4xz1lrFJLR5dCBZm2iIBFZEze+d+y/O4GlMdA
         pxhkDR6qxQ+jnGv983cyZ2q+YQhXLcOc7p2hxLlU2xdLZzKgMb7rHFhq5bRApLw1Ex/W
         thqYQRz5CtQK2iK1Zrc8ae0jaJzUV/FhZG4490A2MVbOC9a4yeKTz4AyE5q3tx4R/Ig+
         KVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856001; x=1796460801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYdZRMDlVtYaaI0y/9/AHPDxXWjl0VbWZbrTCTv4mq8=;
        b=LKfeAO42EQV1BPi0IVMb1M+gv0aNWsP7VM2T2T7xRoK2SxEOpDyrpyODZHpknlI+Na
         7xEXPSK30f7tIFj7V29tpEMRbhXYdY69pM/LD4HFq3uIzjVUGQewYbgirRyUeEQE6Ms6
         z7PI/shHXEV+jIBTYB1kP5eqNbUEuJL5a4vS49DU3guR6hLP0yD4DaYMXxIbcjO7uK/D
         ZA7sRgBTMGnwr8ywDU7zPKQXHEnplYXYMANZ3tMN6y+YyKpZlUdxl2/ecIt47WiXAPcG
         /wPAKqVKbbTGjPeijvcTqOL9AtN4MZRJLacd0WHgbmzOekNm5hKm7L8FiOruHtQ3jLMA
         rOTg==
X-Gm-Message-State: APuU4Z9/HlsoudQb0RhY2MU1ObP03sCr7kEK9jSgHZv4zsliV7UR4y5w
	4qHrdStbUYgz2XxBScTWDroiqb7asFdtyH4P1KrAI5DyjxwI2KfbdV5L
X-Gm-Gg: AZFdTZdcQNT4mRylyXBbkhzgFSc+bR6/jm76HRjVUHkpeBCM7FAB4Azj6BcEJRnkv0S
	2n8nOeiGTl/tqTXyPfXEsCQ4wS1GqBZ7vU3GeVhrMyrsldn+CF9pxbCUrjh/GVjlPS1CGGuU/SG
	H4ZFlnsVqX0h/jEU9tfMFY3qhOq8cl+mn6aGKq+1r79SB7bPs2TSopaMbSd5JbH9vQyyFg4PUTk
	DVgKE3vKcvo2yG36OWOyh3RdRWmaT6S1ld7NiPE5ukndLOgLQDFKBZotHokJGOIO+b7Vj4fxwgz
	6OkMj0hbiz38Kf8FvwqGPy+g8qVV9fnw7dorM0FLWpDXEDv0+xeSWoTdRXTautT93n0Hjh8w3iA
	cj76S0QeCyk5lKHmYNHutMZtgWOfI93xSWCGSCVR3emgWmflrtTX4LphnXidvbbHKBL4Fb2Yej0
	LzoRhEwiDK6pw05pFB49K3Aje+XZ5LWmhx2gQAC/vqaY54BDCfHcJdmDRCHJrKydDfMAXOiGeQk
	yGHC6R2Fw09Bh829gAQbfTm0ehaiKI76dg3X6ekNmHy3jgDeszE9hab2L7bzGdeQ2J3U3yd+gDT
	HQAMnnJ4zH+mROp0SlFBa611nenkJZh9pxJUMiHB1bCS1p4AS8qh
X-Received: by 2002:a05:693c:4001:b0:370:d6e4:e8aa with SMTP id 5a478bee46e88-38570b34fecmr28389543eec.41.1795856001579;
        Sat, 28 Nov 2026 00:53:21 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm99952622eec.11.2026.11.28.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:53:21 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] ALSA: aoa: Fix codec unregister handling
Date: Sat, 28 Nov 2026 08:52:35 +0000
Message-ID: <20261128085235.2984-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
References: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
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

Fix aoa_codec_unregister() to use the codec's own fabric pointer
when removing a codec.

Previously, the function checked the global fabric pointer instead
of codec->fabric. This could call the fabric's remove_codec()
callback for a codec that was never attached to the fabric.

The function also called module_put() unconditionally, even when
attach_codec_to_fabric() had not acquired a module reference.
This could cause an incorrect module reference count.

Use aoa_fabric_unlink_codec() to detach an attached codec. This
helper calls exit(), remove_codec(), and module_put() and clears
codec->fabric. These operations are now performed only when the
codec is actually attached to a fabric.

This also prevents releasing the module reference a second time
when codec initialization fails and the attach path has already
cleaned up.

Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Reuse aoa_fabric_unlink_codec() to detach the codec instead of
   duplicating the cleanup code.
 - Call the helper only when codec->fabric is set.
 - Add Fixes trailer.

 sound/aoa/core/core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/aoa/core/core.c b/sound/aoa/core/core.c
index 99b032a4081f..09eeadba4277 100644
--- a/sound/aoa/core/core.c
+++ b/sound/aoa/core/core.c
@@ -72,12 +72,9 @@ EXPORT_SYMBOL_GPL(aoa_codec_register);
 void aoa_codec_unregister(struct aoa_codec *codec)
 {
 	list_del(&codec->list);
-	if (codec->fabric && codec->exit)
-		codec->exit(codec);
-	if (fabric && fabric->remove_codec)
-		fabric->remove_codec(codec);
-	codec->fabric = NULL;
-	module_put(codec->owner);
+
+	if (codec->fabric)
+		aoa_fabric_unlink_codec(codec);
 }
 EXPORT_SYMBOL_GPL(aoa_codec_unregister);
 
-- 
2.55.0

