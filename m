Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319180;
	b=ayXa6MKg1xEbKlQ3bvWkgjiCeau9MkVvSneyj/lRrlodRKfMbvmLC09elaYiOCNS/0R7
	 xfxhqrZc17aXkO/xntR/v19U6BXsehyczWpYh+QdotTy8tDguAF6tWZnWL3fPtXK33sAI
	 eEdz3EXr35ue07aduJE6hkRo75FpWc4WmOxvvYSp3hd2vuJvYCwVVGlMo/nyZyyxiQ/aO
	 E86nCHkfMu9F+gI+apK60Bg9piENcXNSYznuc+A3IbXjdSL39bAxnLdzbR+nx3YOoBdFS
	 89wgMJMnve7KPiz2IJzRy8pWf8sppC54aU00MfQm4dZl4fYi+mz4EV7OtYrnFZWlZIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tKtEUH8k14ZbmYMDfgDEWIX6ItrlOwSkxivJg5GmxYo=;
	b=N1H8oDOcVYezT1Ap9E1P6tC1A/fXWFl5RhEXuGRDl7VkWSLakRRqwt+4VTNVng4vurUK
	 E2OEbz7HotAFSlmvvZw45573W1/uL7BC+5NiXXzCUkHZOP9AppYx+gddKjuk5T43Jc7u0
	 9Kyoskfqa9RlfdppR7q9T3MofMyKZzxBQThcnoIx47i2o4AaWjohwq/VAqpQAzcTtMZL5
	 HslYGeiEV/uC03Sy15Ln/i/zigftT9QyhLwVhiO88PgQL3NJ15fRaD2tDWeoDcHYK0WHM
	 QPAp0FY4Vh93WfVGJNotN+x9IgFopE7R9QbY2D1zcZyyOtGqvkVEvd6eVSNDWT/9HeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetheinter.net;
	spf=none smtp.mailfrom=wetheinter.net;
	dkim=pass header.d=wetheinter-net.20260707.gappssmtp.com header.i=@wetheinter-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Oi1kMpoQ;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA1606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EA1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetheinter.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wetheinter.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetheinter-net.20260707.gappssmtp.com header.i=@wetheinter-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Oi1kMpoQ
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9214032a2fdso14426046d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetheinter-net.20260707.gappssmtp.com; s=20260707; t=1795319178; x=1795923978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKtEUH8k14ZbmYMDfgDEWIX6ItrlOwSkxivJg5GmxYo=;
        b=Oi1kMpoQ1fEf6PMpij60BbNJtcae2xpeK0Y2SraIk5XdkD6f8i6HATxDlZc/8xGo46
         4zh/oS+FnY8x608nNazHghj7Cv2j3nJZEYstgiP3Qf9f/vg3Rm9k3Dw5MBpDwq9mZND/
         6LBd3RPMfSsNS0ZJl/vVI5idy8YMQ9fjO/Tgaz/YDRBi2JoFTS9PsbsRZW5YBipTC7zh
         JQ4dIzvGTSHG3VZPjIhUT2rM4+aeXOGbzNVa0l/YDZMg0FOuQWi221TLYGo+Cnz5VtIG
         xVDXlZ8v98ZCIcTi17sam0d6m6CJ6kO4K2qcHrKSQTN0eAW6mBSBFqPUEB6crP1r46Ph
         /KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319178; x=1795923978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKtEUH8k14ZbmYMDfgDEWIX6ItrlOwSkxivJg5GmxYo=;
        b=FZtEVvzVx62GgAFFw2gNBi9glPQJ3HtxHbLsZA8+MLaQXowDVwt8QWBTPi1YHemrDR
         HxjWuYQ2fmD9m4Hjd66uQ6iUx9xpvMUZIiagoIJ03l8JocYHyTcehu6vBbi5m6TG+C3K
         QlzOOOdxGXL0LHpGt1qBvtQ+3wrnsaAIvi62L7GV8F0bit+fWpiZ/Hqv/7CKosHkwjmH
         e7gY9YeK0NfLzsIxb3wsTch1bIIZhAZrlTdvZZh1kiqDdtkDTBuW9lsK1cHC2H0PzKfY
         oQWy0gaLXxFK5PfTK4dPw5ELyxVHLGXYOrNfwsVnHnnxkao+hKwvxKklhGhA3PbE+ks0
         57gg==
X-Forwarded-Encrypted: i=1; AL+hErH8DiTCzd08CI3pLG3c2tpA9iOOerHMvktDuRgsbAW2/iuW81h7Y0vD7UGKLCeE5uF/wNN7XM+4Byvd8Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZYwb2YaIE6SIj1HFZUy50SMObUmqCy07kIYEhRxo9vMZbdMvF
	zQbbEwsYPmCOWyzaMTsELKipuIwp5wkkAOGpy5blyFszF2MGjVfldHOp7TEuN7fL1Bk=
X-Gm-Gg: AZFdTZeVzpoUnEmBjpFo8cx/5fdWrL0e4j+hxGeonywKrdrqcWCVh/Au9h35qgn9s3o
	msn5rwayy4lEoyh8Ktm/IteeLr2kde713POSWFdkp+/o51CW4JEs+hcW/WHLPiByOuswF96Cs29
	JA4E2HKcL4QhewFaGqM8OToAbBpZLAT26Ap/VlaK3ClHX5/dW6dUh4H7LLIjeEtTS7W+CxagoZg
	eo4rvDGv0UUzU/dGQjEF8Njq9iDMXnxslvjpiC5oMTykznTf7CkKRod0KGqfq4SJiKNOcMRZVQ6
	Sx6EfpyqhqzAvP5Q7DXbQWIp0RQETdamkuOtchP2Rc1B7ckqvAl/r9sajL5T7+CJkt6AdoEpCms
	02wwiXFGf6FEO8FulVBM/EyOSM6qcUJNM5PtD1K9+eL2Rcr6rCuqX3RhsLRa5pwdcJrwsz5188F
	+njDmdFfMZ6bEnjudyXVCTXYG/Z74Hrk/CT9ZaD0FKuk6VqIb9/qDVWaKxxxbcC0XE8hJBpWybE
	ts9yJA7bq4SBZRdHAI3zdJd2PU1Zo/13kA4HvHIgoFMKvCh3aKWFr9lp/dvvdHJ4fYtz52QXOD6
	csj4heH/BivfMaZsZ3/JYCkkBEsV/3hy94e/idEg0fwuzs05gKdLw5TjGfMAn3/hVbKoKxIScB2
	zYVhMzwUBSXG8nhhcHZpELIyFG0uuC56nGA5rLAgEy9X+X9I7eir3uyXwHFmlbPvk4RgqqsfpzY
	aNSndo
X-Received: by 2002:a05:6214:20aa:b0:91f:3c0c:50a6 with SMTP id 6a1803df08f44-9213497c813mr142116756d6.6.1795319178500;
        Sat, 21 Nov 2026 19:46:18 -0800 (PST)
Received: from jxn-msi (67-225-49-153.sktn.static.sasknet.sk.ca. [67.225.49.153])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm68210376d6.34.2026.11.21.19.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:46:18 -0800 (PST)
From: "James X. Nelson" <james@wetheinter.net>
X-Google-Original-From: "James X. Nelson" <James@WeTheInter.net>
To: Vijendar.Mukunda@amd.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX A8WGKG
Date: Sat, 21 Nov 2026 21:46:11 -0600
Message-ID: <20261122034611.26008-1-James@WeTheInter.net>
X-Mailer: git-send-email 2.53.0
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

On the MSI Crosshair A18 HX A8WGKG (MS-184L), the ACP6x PCI
function binds and the DMIC platform devices are created, but the
machine driver does not register the capture card through the
firmware detection path.

Add an exact DMI match so the existing ACP6x machine driver exposes
the internal microphone on this model, without affecting other MSI
models.

Tested on an A8WGKG, board MS-184L, BIOS E184LAMS.10B with Ubuntu OEM
7.3.0-1004-oem. The patched module logged "Enabling ACP DMIC support
via DMI", and ALSA enumerated the DMIC capture device. After
WirePlumber reprobed the audio card, speech from the built-in
microphone was captured in Google Meet.

ChatGPT/Codex helped diagnose the driver binding failure and draft
the quirk and this changelog. The submitter performed the live
microphone test.

Link: https://bugs.launchpad.net/bugs/2175499
Signed-off-by: James X. Nelson <James@WeTheInter.net>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1be8504..bfe69ca 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -556,6 +556,14 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D7WFKG"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-184L"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Crosshair A18 HX A8WGKG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.53.0

