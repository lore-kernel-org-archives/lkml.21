Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711343;
	b=r5k+WnhKKlIgw8XdP+Q+4tBBVPHkWU/y3mJH5Z+IXcK4AIceTPAWCZo3Nq5ZiIM03gNg
	 xkndP1E4kPSDROgSWB13iQqd0NaW8XKgKQASKGM4FmqeIjFvM0a3HgsBTCs8dsFVmBJWl
	 vbbOD7eKwphBVDL4DL3bGXvfV7v43wSwJpFx2XKMbZXiVcwwsOe0nZT0k1Hr+JWDjpp3u
	 6iAFy9+kVyjMRYV7KBHk8O0IsSIDBFuy9LSzMJHJ/NyEta8QZJbhzYj+Y7SyKlK5r4xuV
	 ZyAp/lNKCpFBiSVgxVUGgTnNxfniQR1u7lfv218bGDU++fAkCpwmZvwt1OcdHogpTNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fmNk+KHn0GoILmDiqUcbB6z2KhRGGNwX4wwEJY+9EIc=;
	b=knq5nIdCSEGqxrbz8Ui2hF3pmX5SzY40H72fCnrxai24HosKQFjzyNZW47cn09IBDdGk
	 1wClywmAptvdRfW3GBBcWBazLiZJ2fL17lnz1ak6WgsoChbZIraIBohBgFKvwlTBuBFYF
	 uTeY+fu4QpbZBrTdl3STdPPflrVEaJkimu/6S3bDPrfxqYmFPCuux82Q6YO/qYNOgxHxE
	 7gIIn3VhzBPPF7t6ogI0FvocZlqLXdNazi4LJEfXxPxNPu7xxcCHA1dUDChBEtgwnuJr+
	 6b/mNsoGsupopsfXCLr70VItaLNDDNqzGR4AziGgF02CpDJXZuktQCtNaYqCIufDlPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2ppBKMv;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050260A5BC3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2050260A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2ppBKMv
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so13933996eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711342; x=1796316142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmNk+KHn0GoILmDiqUcbB6z2KhRGGNwX4wwEJY+9EIc=;
        b=E2ppBKMvKXns7KliJOY9mZ9i0Lckwm5RgeBku6Cg3H0LxdaUG4AC1ayyJWhcPWJRKv
         F8GKBPMlIdOf3C8aFEqMN1vJwit1zLt766/6XLEKutJabSM7YfS5WvdzEKZ/EnqNsv5V
         XEZk4wAElQWFUqGipq1rXG2/PToZQeq+qDs/SawZRRELddNdTSIElrQ//Ks9CaRYg9qw
         KCqEEPgt5QchSyz6YttEReI6ts5KHL+BC3PKtj0AIeefGT5QaN22Yr+3mqfKuodrCy9R
         UuhrjKDegOcoOSCkXIl7PBUQQY2bGDn9+UzvFe0JAy4cw7/mhab3gAeL83vDq4l/1t0K
         JejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711342; x=1796316142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmNk+KHn0GoILmDiqUcbB6z2KhRGGNwX4wwEJY+9EIc=;
        b=bV7cXs6lkB3OpiazWHo/NGu0BPxnpjLkSQoVxM4cs0DCw84w39pLlqNNPYFMlgyp4Z
         wljKD/Uj8vWIDPgmHo8gt/LMb0hK8HjxIncdyJ9PYu/SsChHW8WnNeiCXi5vGHuTpkUU
         CzmOIv0Wb9d4eH1w0kFDLkgqEtpTowIDOg16BcDZOvdMVO/Mxinir5TeGTiIVOQKBfrl
         X91COJb5tUvVFNcES87TO6L2knNLtRm0C3LgYFmAVSMpvoS8/RkEQwq22BPRJjxSmg7c
         uIHD2kDYCaGwQhGq9+x30dpL/mzl3m/ksxkxYPuxKFTcxGEhcT+MaU5S+AXwbghw63+i
         QBjA==
X-Forwarded-Encrypted: i=1; AL+hErGc7G2EBFIj3F62zzmJSzmBYcyynHMMZbmqnCROlEQlJauWqEGoK5Fvw6Qhv9EGje6jDHlWUuVNWh3UXzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zmg4Kx7ib8MBvmsMbGz0Yjg//K9AdB1wxkBf6DCPEAd7cP6CZ
	3FnP5Ji531olL79XliH/6UMg7ASB9rcgZ5fqqhqmUJNH5fcTDqNzLmjw
X-Gm-Gg: AZFdTZcvAMmkY1dopoRvNzZKYhM1NN69UJmhI8aXJ5odQ9/TsV0qN6osEuPd9lSzm/v
	qsNxRLVj6N7QpEzhZZin2N+gdT+hwF8+Av7su1tzFQE34OFTLtf+pyIJYNyxQ7lhK9utmUJ2Vn5
	1p2lFpJAwSx3axqyNwf76ReAiGkXVVlO1GhjwNCDj7NP4UmGML12ycLfznGpH92kHrvp/GrvLLx
	++8fttB3SYyyynghRYTbCT4g4njNC80QIJsi2HxlFiQ4JHhTkHf98wu1wzxR0LX14c2tvGJ50l4
	dKTj03oIeSQ8p6Pit1hHrMmXQzC+2O2C44VbRGJFYkjE7MaGVgx0muMWSNvzky6BtCaHQLaQzGz
	HRFV02V/VJNSNPfTedkAmEdWi628xEfGuPzafWO/dXSXDwP9prMFwPefM2OYCpHMkRmFDlm4opR
	32FROJ9d9I7D3m+YrDg8otQLHqADub3PgzKHodD1bc6OhoOuweCDcdiAEYNgIisU7EfwJOp10/I
	LNREAHwrdJSSzUcjdw53A307o7UggYur0BdZO78eGfnPOwS6P62Lyalkpd548zUEG/odxDwLMtE
	7oVbFZUXHdLxPRO0ZHOjJ7hOxE4p5ENNmJD+KIacbzMZwlrT3L/urzfD9KkhXkLaKDVd40cS2sK
	aX3IxRrx53EPmOXad1en6cSGeoiOC01DrPuTN2PIG7nGj+rd0gDlNcTTnp4+appsi+7kTqsPWww
	==
X-Received: by 2002:a05:693c:69c7:b0:386:b745:ac60 with SMTP id 5a478bee46e88-386b745b019mr10372025eec.18.1795711342204;
        Thu, 26 Nov 2026 08:42:22 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:21 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 8/8] ptp: ocp: defer timestamp shutdown to clock unregister
Date: Thu, 26 Nov 2026 08:42:09 -0800
Message-ID: <20261126-timecard-driver-v6-8-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

ptp_ocp_detach() disables timestamp sources before ptp_clock_unregister() removes the user interfaces. An in-flight request can rearm a source after that early disable.

Rely on the PTP core unregister cleanup to disable timestamp channels after userspace operations have been removed and drained. Keep the shared PPS subscription-map shortcut unchanged. This driver patch depends on the separate PTP core teardown series.

A coding assistant helped trace the detach race, prepare this driver-side change and develop the combined teardown regression test. The test uses the actual callback and cleanup functions with register and IRQ operations stubbed.

Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 040518895176..27cf3ab3327c 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5768,19 +5768,6 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
 	timer_delete_sync(&bp->watchdog);
-	/* Disable interrupts on all timestampers */
-	if (bp->ts0)
-		ptp_ocp_ts_enable(bp->ts0, 0, false);
-	if (bp->ts1)
-		ptp_ocp_ts_enable(bp->ts1, 0, false);
-	if (bp->ts2)
-		ptp_ocp_ts_enable(bp->ts2, 0, false);
-	if (bp->ts3)
-		ptp_ocp_ts_enable(bp->ts3, 0, false);
-	if (bp->ts4)
-		ptp_ocp_ts_enable(bp->ts4, 0, false);
-	if (bp->pps)
-		ptp_ocp_ts_enable(bp->pps, ~0, false);
 	if (bp->ptp)
 		ptp_clock_unregister(bp->ptp);
 	kfree(bp->ptp_info.pin_config);
-- 
2.54.0 (Apple Git-157)

