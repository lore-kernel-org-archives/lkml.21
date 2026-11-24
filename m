Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495375;
	b=k43YoR2bxI2GWH+E9s6Aw9VwSMO7HAMvZTz38cP7OHHyfexmLSW++v0kntuOVxyZsRzL
	 laLmHx9rOAIyM3LQZQhQaMbaAUqBaKldjtqf1dJzIfLR5TWkaC5umP+UiXnOT3rPangCD
	 G4U560oZ9kBFdbzRYhoy0qqOS67jGiLRd4+V++OgDHOZLpxphYVtduIFz4YE57jI3BBND
	 sDl4JCRf1UkktNULWTaK4U3Hi4R5pVFEXFDIEvxkUECfnbWr+k/jv3TrwG+wM1KvIb5H3
	 n2+qYRv7a8HnuFEvcWJgkvkB6bq7mxguEQOxke4JPTNmCZi/wWUzxXovUOxvrruvoMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r6DJ2+NcRhcImmJIzLg7naUccIBP7jEQ9XY1zb0LzSs=;
	b=Cn0C66KJ1zVUg5UCAcz7F2H4fdGjyUC57wc37oAzydukw3BY25/BN+oIYIbxorHXB/xe
	 C6jsTs5/lI55ZjLFOWrhZA+YUcAwTHLQ3ntLzWUUxIB2SsdLAAqdbAu33e+ZQf73tyoVE
	 AjShozXfTzUPOq392WYKsYIC7201ehFvp9U6bkvjB7Jo0btXHGYFaAeFRqdMs8vEdYGkm
	 moPaBWpPZkJTqqOeVP5EqnyC/v6VWoU4q00ja6lp0vEiqZvqcSWSWivZPZAjyaLrJZ8Iw
	 DAQf6OuP8T9u5ee/ohxdihZd6iQvb3b8HN3yA/XNQKsVq7pKdM53MHWgWJbmbrok3lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5zx+L12;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F55606A6B4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F55606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5zx+L12
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so8362563eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495374; x=1796100174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6DJ2+NcRhcImmJIzLg7naUccIBP7jEQ9XY1zb0LzSs=;
        b=c5zx+L1246VuRkA4KKg5GEV/kp/edMm7u2unadwAvSqe+BtGeUuP3Q+FJ2clrqTWVf
         OP22bSKQiyuTLjSSd0tZ91/lB6QhYkxMyDLIL0/hzQw5oq5DiFjfZ/6Ku4g8Pnfy6Wl6
         iL6yZZZtKQaA7fJxR9Ol2Jm2WuP3wryzMT8E2ZDVZTG0WEpwCyEcLEgQC7XNTFb3LLxX
         gATicXb66n/bfIBVxBfxXOgDMJACkrOgaGYVoF4aFvlqNWZjShxTbXB2u9rScDApHvKo
         ahzQsOaeUSFC/I93nixveQLsL8YnsIRnLh1nfkbXHtbfz6MJZMlQ9GnYHpYwIJkQRbK8
         Aa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495374; x=1796100174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6DJ2+NcRhcImmJIzLg7naUccIBP7jEQ9XY1zb0LzSs=;
        b=NrOqBExSDN/SBKcVQGhhzQlinTl412Rupxxfnbmix780rN1ZaDkCoHcvZ/hxG6W6qX
         CSNuMpCh6qRhu7bT6Ql2TwnrtgmAUGF5Wg5xqmCFqIHawGQqnjIrClvLYcSbXcwq2GD6
         ON94zCjPCzYHoDCiivg3eJpSKNF8SnGvVt6VDuNLEZi/RfBr20f/XIllesgkIKCDv8+g
         hfur9GoQxS9wcMm55oK9NciINguIClQ5lMVzaMzQzUj5X1Bu9P4bvWNWTdAbxSC/ej/s
         +A1dSLkjwA9icj6jkm9iNxiLl/jXeurx/Si0YfIM39m27Vgmcxvh4tcXEW3MLjnrqmPE
         Hn1w==
X-Forwarded-Encrypted: i=1; AL+hErFJswE5CGWqqgO77H7KcN4Zu7xqLziDVZO+pAv2O4+NKNMS03TbVk+tqlWHYogPlyQxiB6Nq8LNezpN+LA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bvfzr25CbqwZYPjWmAuc/Q8Dn2J6pr6MP9qkP+GOwG0k9Kh2F
	rGqbnuVtzT0Vd21N2pXGYocJjQ1ez/Nt97/vfHLMQLm0vGVAw+KAtmFt
X-Gm-Gg: AZFdTZcUu35Vke8Fo85F2PEud3JEngauumFM6OljaZgvhxX64THmwriF86yUlie9oy6
	stW3npGwSNDX3Q0lcM60cY5FL3G+v1ix8Qh+aJyA/CDlyTslgG90P80L6hBa3rkQ5/cOD0jfcFS
	UbhBRxIeguXahc6/CuPilNGCRLwiTED/hKn8dzrEGfuSSqGcqLR/hN29smWSRehZTGY2b/cMyhl
	dNgyDAWbd8Y7BEce8ZLVRI9DtmsxLop26r+D34D4GlhwYfPXj2i879VFcrXqMbk2nON5sHfjWoS
	MUlh23f78PAq1TNXnEeq2P4CrflAb3ILy1B2BJRndVB6s2bfG9rvTcEoUuuKpteuqmsIJCcbZP3
	OgE2t0tVW8n+C9pqy3E4Rxz5G/cNo4nSNa0O0FAl3hNLp8LKUbFJ1NRLQJ3tx7AWUiEAujZgWVA
	v022hq4YhQSRpNJItTYjZoGYjMpHAnKy5IWUmaAAU0wOYhAvJPbPxaA3LhlhgDx51wB2zhuxL54
	rTwIX8d+wbHvRXBdd+iaR2BJSIqH0m1iOjJnKGGAAEGsIn+QEQZNZmMqmxBP8S6RTUgcXo3Jr/Y
	Ivpqoklle/GwJRJ7qV2cdRo6pKtqYjo2prEfTo+H5A61U4Xw8pAs+RksshpULhJVyIIto+YuiI3
	2C7GAt4GEGiKGiq1Qt7WVvDps341Fk14NmODiy5roWpTlq258XKPHA++4jXQivNDZux+g+FqRXW
	lUVuMzDykxGQbc5wdKTg==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr4234085eec.21.1795495374007;
        Mon, 23 Nov 2026 20:42:54 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm29427540eec.1.2026.11.23.20.42.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:53 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 8/8] ptp: ocp: correct the ART 10 MHz input frequency
Date: Mon, 23 Nov 2026 20:42:51 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-8-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

The ART input selector named 10Mhz has a frequency of 1000000 Hz instead
of 10000000 Hz. ART pins advertise 10 MHz, not 1 MHz. A request for the
advertised value passes the DPLL core's supported-frequency check but
matches no input selector, so frequency_set returns -EINVAL. Reading
the default ART input selector 0x08 reports the unadvertised 1 MHz value.

Use 10000000 Hz for the ART input selector, matching the advertised
frequency and the corresponding ART output entry.

Tests using the actual ART accessors, stubbed registers and DPLL core
frequency validation reproduce both failures and pass with the fix
under ASan/UBSan. No physical ART card was tested.

The issue was reported by the Sashiko review. Codex assisted with the
table correction, actual-accessor regression tests and the changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Link: https://lore.kernel.org/r/179538007070.3135.8275620503580456948@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Renumbered from v4 patch 5; code and commit message unchanged.

Testing: actual ART accessors and DPLL get-before-set validate 10000000 Hz,
reject 1000000 Hz, and check the fixed-pin default. Restoring the old
frequency fails at runtime. No physical ART card was used.

 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 821ecd1a13c8..93923d5a2992 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1385,7 +1385,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 
 static const struct ocp_selector ptp_ocp_art_sma_in[] = {
 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
-	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
+	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
 	{ }
 };
 
