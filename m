Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032329;
	b=39eAICBo02cpszQmFyXrWJABHossR7pLtySgCBux4MMlgH0oH1wdfcQVppeBVAhxkEvk
	 YuXV+DvT8/JPr+QuZXjHnPrH8CbAleh0bpwvrunzF2YQfioqDN1ukt2hnR6of9olOHzqg
	 xZTarUZUW6yW886520noSyfvEy4Trl2beaC3l9aC5dj8vBghqKwgNUjuSYDmvQFE5D9YW
	 UnOtJJPxVwyUk2Zs2ZkEQ5AYIQ9/jr1sZQn0NGNjoc5DGTSu6y034iMMWqzbTIPaeMBQU
	 HHyJhLpVP8yxVg8FsZgkjutYd8GVW+GwOc5G1Eju3rHVwUpCp8eVuL/zMdy6U2S/ahg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vyE5jE78QejGeUNpk2fN0Lh2UcG+wGDugPW4CrDMAXI=;
	b=tKuUFMgPp+3U/EehZdzZHd8Cw7mwa+SNOPfySkyiJRNLYVuzfFt9yl77j8F9YcbpqJaf
	 X0FVl8Jwoi8Ct1+rZBvlnvq2WuyOdDMStZ2Y52QGHR1o188GtWbwVaxgcuxv3MKxWLLg4
	 1N9QFXOlO2O+1Qxje6NNCXUFYmBHppRbxrEK2ecADveI3KH1pgJ4Ivz+GFr4DTlWdnZt9
	 s1CI2EwRE1ziSNiGXZcfRsumgmK2J7xMGaJUcHuhG+BQGRzjc3ZBip6bx9hG8IgRGz+/5
	 gq97x8piArCvJ32kdJh1hMxP7S90M6/I6IFENeYlcFLEMvm7XVl9SZwJGMtN2ncwY7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POupRKWv;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED160A2621
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBED160A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POupRKWv
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso1554622c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032328; x=1795637128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyE5jE78QejGeUNpk2fN0Lh2UcG+wGDugPW4CrDMAXI=;
        b=POupRKWviGCLd+1OxweZTOkVriYNvVXgWS1eCPXRZB8HWLI70OkR+lFqcWAukrX8JC
         +O0IJ6Xpvr0/RoKtToAllK6ojWOK2WfdMf11fvYZq9YpmpyZraIHlTNjQ8Sq+t3JwaTM
         G8khywboxxuZXCy99u7yPpMJ2qrJ8N/sdTWsWHgzqXxhhUO30KtlDVHeQRbVvbNNJVgN
         TIYu7XP75cvXzYRoGyIVQ+P3IL6L4kCl77agjtO8g6klYhNYQLqU53p8FgW4iBFFq7LD
         dhgHhvlQTtbXUzjySEqeET16omvb482REfNkq9chkJCWFlQKfbdpBx49sCqn6cNPIVnR
         ZNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032328; x=1795637128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyE5jE78QejGeUNpk2fN0Lh2UcG+wGDugPW4CrDMAXI=;
        b=FIxO8CXPQRqi+2Zd+uQ4BVjO29UOVAiUjOmM/Q+YWqZVu3vXEBU5VmeOOR7quEZb1Z
         faQJkJjRo3VSXt7uy2a65TeRUMByXXSY9iBkiLM/u+Ku7ODZE8Fw9q8lGjLZfHXrT96V
         W2VSLpweGjJwoDBw6iynmDzsFxBFH5/EFT+CvxnYsfGzs2eWFWQlC8dektrrsDnZknRd
         hV5GtfTMyulqegYiuaFgFh+dC3ShAEpzaAkiucix161linG9l+ney09Y5s+65Ihjmhvb
         z6ECEIsBqII9wSJQ5CC7AUNX1K+ABydN8tLNvWO5B7tf2FnxM5jKO0bUIjbF4XymfcIT
         +f/w==
X-Forwarded-Encrypted: i=1; AL+hErFiZKaxzxbw7rqxj0U2xf4OhaRU7cJp4U5NGeDsUwYXvDrGTARvCBrqDxr+shwQ2SpW8eoum6vbM1wmt4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bp9eifgbseGZDc/lgqv7GKb7Kxdf71Ob4FFMdjPDQwhc+bnqt
	CpQjQrhFGw2rvuOz/0kwYFIQ8wKbcdo6wF0eEI7VA4p6ACdVMatPlVmJ
X-Gm-Gg: AYBFou0DEBiVRKA6GrZlmzuWTeB8qtz0/qYaWGA+R1s7UvSC3jZ3SpTg+E8D1bNI789
	cSfu4j09oRx2NowjJp4gBxsOFLDWtInSMHozsTzRTQnqNSrXXUNC+bw4K4ZkrXsX3dpbyXM4kdb
	d7G81Sjs/+vpAZ/QnozMQ/+KVL81U5ZB+XSafwIqKlBF/OYf3wty2sZWZau60qQgwXpxEdG829h
	hMO3Nr7uT3bV0qaLIaajuveoiJJ3qGwF3qd8uTtz19xMUhrCaXFgDGvJgZ43BPnF1syJkdG+2Bg
	SeQPmoyen+MZIwOxaEqAWxi9fAEk8oM45VEo/DDwIHsKKb/oGxUGGBJ5hmr3AX7JWpngLLRTibh
	uApCmF3RR9o2d3ZoSItNGEKxKE8F+twj5RM1qy8bQdNK5/j0gfCk0PAiPGqyAgrTrkBmrzpAnlB
	THZoO5lmK+N9PW0u8cobJJMBqirVtINgD/jIwv9E9eF0baGYl9AtL2CaKbeskQQQ9q0mKHPvd5J
	Ytm01fkB7+7PI33BT0yUaugEHe1Awacv7etOmhBIs9E6Fudb3jOejNshER4Z0hcfRY4S4Ag+lPt
	/Q2nEYKqWrkv9af9S97WHcbSZBKhLYtDQRteRNribOshOA0TMi7DvEBsbRQgeVjDL3No/WgoVmH
	tCQpcDeLMQ+A1eMIRuEhEAQRebqB0
X-Received: by 2002:a05:701b:4348:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b543b09960mr3155007c88.6.1795032327530;
        Wed, 18 Nov 2026 12:05:27 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm8843535c88.0.2026.11.18.12.05.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:26 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 4/4] ptp: ocp: correct the DCF output frequency
Date: Wed, 18 Nov 2026 12:05:24 -0800
Message-ID: <20261118-timecard-common-301f823ddd-4-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

Reported by the netdev Sashiko AI review and confirmed by code
inspection. Source-derived C regression tests pass with ASan/UBSan;
restoring the faulty selector, mask, disabled-state or DCF value makes
the corresponding regression fail. Tests use stubbed MMIO, not hardware.
The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 650047581f..aa950cae68 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1376,7 +1376,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
-- 
2.54.0 (Apple Git-157)

