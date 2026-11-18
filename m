Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032326;
	b=4HAy1BNigy7soDRmI4zoma3JAXvyl0fk7BI7jwGnlRLrJZsIk5/3PGYfyhtyUjcB//Na
	 6WSrtKFgoMJoZ/dvMUwVcxPUCWX1HAGaD9UTEXjCRNyI4Yg021eBbToOWpY+RPUmUnTg9
	 qnp8qvcHazyE6bHKxLCoQRMigs4EJdqE4MJFm48413lZjyeet/3JBqBv9Mfx38iAJvjkD
	 F6PxWyMmGSpDaUBldnB7ofJKN9G6r1ESLrid1SpTMBvIJ6Fvn5cWwykAXqyTXqAzUazG2
	 glXbVvFgyVqJRN1v8Kkdmblo3X0o9pj7gVvdleFtuWUceF9Pzx+cir4PEjNr+usLGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qVJbETG2LeDXBALin2vR3rFx5RCB9UcDMxdKkRsHFns=;
	b=STyv8don5gLLF6UUVKl5pqbg4V+TsGUgJYMhMAK71hHhE3H/AdaqjyTaj3eUEy/w3eWz
	 irbZNbwrYE48Qp9IRYhj8/Dgs+RZlwbaxkFxz6Owr8gBOJLKa3VHkITfSvNvsdqONhoMi
	 3xF9dt/xekVoA7dEl0SdTXxGqCOuv3DEWLU7JH5hdD11yQW6SZWDhbA09hnH22z3xMel0
	 mk8RQ2RLkhFZVwARGaKTrRPSW6goJmqHK9ofDBaOL/TGZwc9fjYRkSlmG0nA9kTxsbEGP
	 QJGC/xz/gTz+LXpZBau8kj0yZg4HIHDumh2mC9VmuB7rpW9/ToYB/tLrpE7zcXNSQOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR2eYP1i;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3BA606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR2eYP1i
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so1417553c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032325; x=1795637125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVJbETG2LeDXBALin2vR3rFx5RCB9UcDMxdKkRsHFns=;
        b=wR2eYP1i8w5H1uJjCa/do4iEmhf5A9F7pE1zsyanMoXrcF+1Oc6z5prtSu8iLpLvjn
         FpbVSW2dFYOdeSX0e5RKC1obHqzTE/VMqmlb33F+GzfJJVpHWq8nPoQSZO/96URaVnZB
         1TqlvaXtfZ5e1FlLF8KKcxlzvvty4kgCHRzh6OVV4GwuINjSYb1i4UoOPwsHakt1ySoE
         MvW6d4dbD1MuTiItsezcETjQ+NuxjcEIyw/bnWFDlbjGkbN3c+ctHSGvibRe11HTjpi6
         LNER+4/PCtceCLT91bySKr8nRr4uRf1+SXOTv4ni99ON20vs/uOEjLKUv9yPHHidW6ZF
         CdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032325; x=1795637125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVJbETG2LeDXBALin2vR3rFx5RCB9UcDMxdKkRsHFns=;
        b=ywy/kzt5/4jYgoxROlmVvc55OhGmSWcSdUj5p8dMgvvav2X4nhpJ35PCQ8RGcXUeN4
         neEhdYsxBQCTzYpqpj+NXLR+g2L42HBBWSZiEcnW/xguNU6zj33qV6JaUzecPVdsxv9k
         Xkh3jJ8yLs8Fio1rAe/MfyRZyQuJcoexniAea8syaV/jVsB+A1eFh6lgWyvG2p5GFeQ8
         gt8jtMEJnczT8A1+O8ICJH/BlecfxqrW+Bh2GuKzmlPeSU67g1o+6N0fx64KuxIMKlOk
         JEVWvoXWUOcw+Uv8g78o0FkQIiLHeFpwQtYxYvVMKU3LwPpBmx36mt61mOycFBJkvHT/
         b2xg==
X-Forwarded-Encrypted: i=1; AL+hErFEFa+YtuYo5yAqeftrtUCkh9QVikR8rL5wZgYta0FE5ETYW1sM4THZAFiKnsNmdhc8gqkxisdBJvc7GOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WZ7bqXeC/ruYpJ9N5bzbxP2HlRki7R3EX/tGFi6eIPJkRIY47
	VI95S99bKbqIGEwX+g2t6zZnCIq+gjAJR3I3uonKwf70015328vTwk2Igt3tKLBz
X-Gm-Gg: AYBFou3VkYYFX/hVNfTlIDgxAxFy+FaAueKoFL2PqESTbMIowV3VqIDr1M8nI8lhuwK
	zAH9hLNIoPEDkBK2yv6fAX7+MkK6fBUf/isRb/PWVuqzzeXgqerGN8qLxWby76IhZwXHCMwtjeX
	lAOcfKcejgOtLo26x1Z+xt8G/Fuzql3P4FdakmxmXlgWfPjw23/a9ueY3qwXE1kq0lZ5ESx+fY8
	ybnoidBPcypYNSPQBTfAwl9yaUUX69nWcZuuxrXPJG7ODHMv5KEEUiLP0VZQpCiHYoXKRozr8Cs
	XkLzqVTfGpfOLAsRrIOPvhOCVqn7nSl6D9iXW5J+S2ps5QNmfd+HIg7fmAw42PBbcpvqyB3JD6Y
	pIpxkDg9cTtIxSeu1IRZuMIElccSEZRjMEs7ojI8QAqXjLVuoLoA2q7aiZesvHMGoCZeAy5EOUY
	R85jgmUNEQHvIrVVoC+5uOgOUzzL2/1k/rJe5oa5umQF5YEg7xUDgGDHMLbR07mzGlJIF8G+RYv
	phOM7kWozEn3aCQypH1FnoUaNooBPyCCPmhnFNsRn/RREsRtRANGhdz6lA4aah3JpO0SAOtdfPM
	eBNEd0teXSpHNLZXIBCgtjLOHqYwyel3WeOs8YNdejQ621eE6GJF5HGmzX61h+LvU12TdVQiE1F
	ELl+SndognP5pJykR3xfn/FOIi59O
X-Received: by 2002:a05:701a:8148:10b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b543c2572bmr3674952c88.29.1795032320945;
        Wed, 18 Nov 2026 12:05:20 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm4026688c88.15.2026.11.18.12.05.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:20 -0800 (PST)
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
Subject: [PATCH net 3/4] ptp: ocp: report disabled SMA inputs consistently over DPLL
Date: Wed, 18 Nov 2026 12:05:18 -0800
Message-ID: <20261118-timecard-common-301f823ddd-3-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field. Zero is also the selector
for 10 MHz, so a DPLL read reports 10 MHz while sysfs reports None. The
DPLL core then treats a request to enable 10 MHz as unchanged and skips
the setter, leaving the input disabled.

Substitute SMA_DISABLE for disabled inputs before looking up the
frequency, as the sysfs path already does. The None entry reports zero
Hz and a subsequent 10 MHz request reaches the setter.

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
 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index d449ed8ca2..650047581f 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5920,6 +5920,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

