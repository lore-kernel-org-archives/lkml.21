Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108265;
	b=5FvfZnvb0EIKoN32gXYs7WS1+kmUBm9txDiQgemRAgySt+yNsNz7jXE6ymP7pYl8dy9G
	 d3QMPDTE1LMLDK9jQx8FV6mJbn9VVMOEj0aGWzxYZsKvQ/H7dAe1vmWH6jdC4To/hjEhy
	 Hlm6LibUtGWGlsV1jyT+LIhkJstmRejI/uPqW1zm54hpbmMm41Bw05FLtbCFuPwALl+xO
	 mOjsE3YkOwqm9kaDbYmYoqXPkfXyXUmFFH1QdUgEqbDt6qosvqyYh+Z+15F3KxUf5vtGn
	 Nk8DWL3QzT2SFPzB1e4vfQrBJmEeaXtKWadDmzv3925wlxcNufSY76f1KzEhGyuqr3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
	b=Pa4AoKQQ9sylcDrv2L8tFNscXLBMYElupBbLoat8tTQoPC55Khkh+G4qjDhNHZgowH7a
	 JEhGfXyQUs6tfpuOFLdD/pRtgKLaw5iHLYbAK4V0Zdowa3/0oxpm6NAsZCJLXlhdxXtip
	 F+FASpaGPTCdNGUPA2kcWMQYWVcBsNv/YdTdVrzdgSnP/f/gRLj29EL0FQV01Q6c/7nzi
	 WQJKainhQ14PmK3h4YtQS4j5bv/4982SAaw0wRkVGFD8+9E6UH/32SasxJv6Ww/uKm0Ce
	 74Kn46SgB8CysPJY4gHOo1IlvxAzH+JzQXyP3o64cPnpToYquAY0J8hiXoM4igA95xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=npTwEEYm;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9C606B401
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A9C606B401
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=npTwEEYm
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso5094455c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108264; x=1795713064; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
        b=npTwEEYmuMn60XQb4gaI9CalvzEF5EIf5MlGVrAWfihsuX2fZPaUbfrk0Yb7Yt4BWh
         5xXuSyTJlImdynUZbaxSZ/UtTsif+wOBDgH2O6JhcjrIxIqr1VstxvD0H1CTcgF441xI
         wUOOZdpqzaC2w8SJB7MsGvFMM5nNjcyruFkQWcuOMb5CRDpN4WqfnmQU5CpXXrHDi235
         V/xtYMwWtTHV5BdXm3KjIrqPe5K7+FVcUgjQBSySiUzxu5QsN4TQ+zr94k7+UO3EVUnz
         hfa2boqcjJxXzkwcf31j+KpM7y7fyk4IH/pFh+zfCNFt2NMkZilWi+YYWRHAN2F60Idk
         O0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108264; x=1795713064;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
        b=jPVCqFMsozcwn1qRfvLB1dDRMS/rUJWuumVmi4ZsdrThwLwU8NSzv9MTZo4NVOROyg
         dWpGVMj+GWYDfMq1zOuDteepAUS+mDyXCQgPvvzdeQJo6uRcSs2FqknfjZVB/96oDtXb
         N2swldYobVNUrutgOAcS7vKzkcnS0B73tFz1D3Lx6UWGNFOOFm8l+efXONbJcFmJ+cpO
         4SXXo64ZdJse5TGZpEoArSo9+6ev312mWcXdIRr5a26qKiyy93UAZFargfGHM9YsAywh
         FgXpgh9S6eZECgWywicnXUDX9YOu0Zhw28O/QvwHJbUrFveE7mYF4EWfAcxy+LkTzf6t
         EvdQ==
X-Forwarded-Encrypted: i=1; AL+hErEOMe3WT3YHwHkSFfP/qhBsmDw54MSfB8Qv5rPN8kMMQwM3sYlQpuH/rFZllFMeSO8lQn5HKEJetHJKzQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z862veA3xSd4t1DchhVsOVm74y8IHDGZ71SsfYyEA8He2qSIuhG
	0B9kKK4YBpRGx/fRhAZObMJS3brOp+nDcCQ2S1NStxu7ggcojTJyYKpgeJ/2eVwHJvNJyYYxLpA
	Trf+MF5iXzQ==
X-Received: from dlag26.prod.google.com ([2002:a05:701b:251a:b0:1b2:450f:bfdf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea56:20b0:149:1feb:6d9d
 with SMTP id a92af1059eb24-1b55689e6femr295208c88.19.1795108263241; Thu, 19
 Nov 2026 09:11:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:59 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171059.1537658-1-irogers@google.com>
Subject: [PATCH] ASoC: codecs: aw88395: Validate 4-byte alignment and init ret
 in reg update
From: Ian Rogers <irogers@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In aw_dev_update_reg_container(), each register entry consists of two
16-bit values (4 bytes). Because 'data_len = len >> 1' shifts off bit
0 before checking 'data_len & 0x1', byte lengths with (len & 0x3) == 1
bypass validation: len == 1 yields data_len == 0, executing zero loop
iterations and returning an uninitialized ret, while larger odd
lengths silently ignore the trailing byte.

Reject any length with (len & 0x3) != 0 and initialize ret to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building
sound/soc/codecs/aw88395/aw88395_device.o with LLVM=1 W=1 (-Werror)
and -Wconditional-uninitialized, and with a standalone C reproducer;
not runtime-tested on AW88395 hardware.

Fixes: 06d2fe9cb423 ("ASoC: codecs: Aw88395 function for ALSA Audio Driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/aw88395/aw88395_device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 3ae418c8b34e..2dd0b3b7de0d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -1004,16 +1004,16 @@ static int aw_dev_update_reg_container(struct aw_device *aw_dev,
 	u16 read_vol;
 	u16 reg_val;
 	u8 reg_addr;
-	int i, ret;
-
-	reg_data = (int16_t *)data;
-	data_len = len >> 1;
+	int i, ret = 0;
 
-	if (data_len & 0x1) {
-		dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
+	if (len & 0x3) {
+		dev_err(aw_dev->dev, "data len:%u unsupported\n", len);
 		return -EINVAL;
 	}
 
+	reg_data = (int16_t *)data;
+	data_len = len >> 1;
+
 	for (i = 0; i < data_len; i += 2) {
 		reg_addr = reg_data[i];
 		reg_val = reg_data[i + 1];
-- 
2.56.1.708.g77570a6a1d-goog

