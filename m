Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711335;
	b=Hhiu4UCczjgF5mbBtKNz65N1PhQtAJFCtLNctqBj5gLpPlYdG3ZHBdghnqfwQoqk0/ef
	 sYsWXt3aW5N1wNHPoO44Mhpyv3xn6doSRg5pBpJ61UV/0waPSwKZtKuFvaxJH661/YbmF
	 WKXupRn5LSejUQVcAGrwMf0RRdinIZx/xxvw1Yg7cpf9V/Ndd2d0p42OjNL3dz3T4k3vE
	 tFeSAu50QQAXNjFPa84BCee4sI8loknXT0dvn1jYZRNWEp/7yDEn64YZiIm08XxYJngBB
	 peCJsBusyEU1owILtFDM/JIZ20jclXx4QbmTZWvP9e7EeV85mVGOCU2nQsvs3FlkC4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UH6NUK5W/adpCYEnEKBzbCqV7trtdM3o9fkzVbPB1Cc=;
	b=fZU4hq08XeBtE3ddBJwbUPI5kT9kHfbD7vPjPU7QcB9Xy661+lXV6/hdnq5Mz6kddhlD
	 TugfTbuYNoLNiq6jn0lHmebFNTNEnG5X2ofoAgtAWNJMhhZ3nMoDK+i6u3Firh5Z+UFqx
	 5rO+4hZKk31XPj0g2YtvE31AdUSD4NaWGUR/wa4WBtWYCTQZV1yG/WSunFyAeN3gCiR+y
	 jBLZvjWrQi+Bxij5P9r8ykgUiNUpBY65aEANJnW+nL8QUXb+y43eFiQ3as16YqFffyI9w
	 IWHP7UQhRsbre+UNU/WfSYj1IxCYtpZSvjcWsYsLCavUEm6RLXXG9Ntk57F9gRegb+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cv8Tq0Jb;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AD606A6AC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19AD606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cv8Tq0Jb
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386cf1041cdso3689532eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711334; x=1796316134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH6NUK5W/adpCYEnEKBzbCqV7trtdM3o9fkzVbPB1Cc=;
        b=Cv8Tq0Jb+YV+BFZ/5fihID/rYp948VPT5RsHTv9i2K3gMEsB7eQFEEUL/T9hCyetKY
         OSWrBs7yrUO7IPYMpuGHcba7lLIno9ixLnDNNknBx+HnatkO1e/3D71sGhKZM0SlXFKe
         QEZpmwQw0MFXReKEJdtAHH7aEQndRQUG2snY9zCnWyYkKflKdyWSdFM1Z6DFxR+gAIWS
         IfCLPOY0s1D9FdmZIAdsQxAlRITU8rTB1RRpbdIecE4U89Ja3s3/vtiwIs3psz6YI9uD
         uqnsJffsfLo7ythuV2jAjuBflbY1WYVLWU5yRMtih0fgJsoP3RMCs5NXzL1AAX0wwMwt
         ubyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711334; x=1796316134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH6NUK5W/adpCYEnEKBzbCqV7trtdM3o9fkzVbPB1Cc=;
        b=Q0rcCwpXaMUhWje45ryM4iOwfNOkETQUEIhYnNKfAAqlW2oq0g6CfCjbrpqLoGv1+G
         fIna+9pdbXBosPPpsbZl1cItqRTbQ8hWuFo2MBj+NK20YR6W+1exMgw99XOdXEeDFlpv
         OEPiROTd+VAX0VpDgsQO1xD7b3I485zvkiUicAPCwRsycIHHAGMZNkjF8gc8KKJ6G97E
         VrmJ33K/y9qUbfdY/8a0f4+0NyiTETqu8wfjI1LL8CGCoWqlZnr8ZpUS8T7ME+WHt31M
         uH+s780Hyg17fOwMsTn5lqT3YCvtWbDTvL3Ez1nYaV3wneefVCcm2ckjMK2hwiEz1i50
         RQ5A==
X-Forwarded-Encrypted: i=1; AL+hErEi3aN6qxMNPz6jailkysZvFAo+pNNsFdgxWSDHtf9JURo8SEM15GJow5y8KpBs34b4fQnxuB5WfHNkTrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z85UXQQ0QSJ8hRMjtiSZAf8ZLUI/5tntpaf8wVbYyEzvZXawCIT
	yHouFR+TTuDRiqod5uCwkGxXdCIT1VHdU38Dd27hLCLcOkB5moetfumE
X-Gm-Gg: AZFdTZcpI4hZzB8NdIeWs1kVS3M1o7QamXnu3IZ1frS441rFourkkIezy8iMoCedqCl
	Lbfz16WA0LzFoaLOWpvFY6mngzGO3LRfllyNc40ZlnsSdJRgvwEe+k/NMO/68qlv3OuXaAnxwL0
	WZem3wCXBnELRpXZUXhROcpmVSptyKD0ilPQzi5qdOEnLA4EBgbgenrIGVaj4a6qSMMI6sFKCXA
	k+mXz//B0pTjNB6YzZa3irVUF5PT1VrisDhUbXKsKJEREQTN+ZITt9xn6MQhNQWDAiu5KpDhdHs
	RG0C4pwPjdAICZ+CU4thHOB9l/ZvP3KBL3OlCdFfcqTlRAAL1OV/bfjPdVLd8s/pSk8K9mJkczj
	bEH+Rnakl9RWheMiE8gzCnF7Emrx4QJiZSckegYy1zmEodzPqawcnergFqmlRN0pPgOgPLBAwyk
	Mptv1DtczL6j/9q42ow5QopaB9sQUniRMvjfUtiaeOJLZCzTtIvD4EUufEFZXivH6ORIq9ioEhU
	176qZEuIKf955a1xnPc5uJ1q+JSf1UWdD7VVSHyDC7yX32TqBMUrsQgQp0f+am0Klz1WgfrN8jE
	9Iwd4BH+oeH1meEs5+okXjSh7U28hLWO5GTQQ2E4cY6NDWJv75JVVVrG8fEPo+dMgNQsMWDKgIJ
	L1Ox8mLf9+dorfQrNGWwj8Ek4sYfAN7zWbZrQ1QXCJlBAIhnMH8SXozBpFWNgkRS3e8XQtaggrg
	==
X-Received: by 2002:a05:693c:8947:20b0:386:9ef2:8e01 with SMTP id 5a478bee46e88-3869ef28fe2mr14893864eec.0.1795711334007;
        Thu, 26 Nov 2026 08:42:14 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:13 -0800 (PST)
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
Subject: [PATCH net v6 2/8] net: dsa: sja1105: keep pin function on PEROUT disable
Date: Thu, 26 Nov 2026 08:42:03 -0800
Message-ID: <20261126-timecard-driver-v6-2-ahmadexp@gmail.com>
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

Disabling periodic output currently selects PTP_PF_PEROUT even when the shared PTP_CLK pin is configured for external timestamping. Only select the PEROUT function when enabling the output; disable should stop the generator without reprogramming the pin.

A coding assistant helped identify this related pin-direction side effect, develop the correction and regression test, and prepare this changelog. The source-derived test checks the actual callback behavior with configuration writes stubbed.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index da35805152e0..7c07f76caccf 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -733,9 +733,11 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
 
 	mutex_lock(&ptp_data->lock);
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
-	if (rc)
-		goto out;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
+		if (rc)
+			goto out;
+	}
 
 	if (on) {
 		struct timespec64 pin_duration_ts = {
-- 
2.54.0 (Apple Git-157)

