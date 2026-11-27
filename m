Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807388;
	b=yjtowV7/51umtmq3hZTMPjNdchYGQPccQt3T6t0d7U78pd3C5FpwLrBzof5+QdOBop2m
	 jH0ZQCt5F7JDICUFAi44KyKxog1NwNHDbrT+7nFrphd/ZyI1TK8YPxk0Slk3Cw0IOLvqG
	 GSYqKizCvlBDoh5350owcCbugipM7W3uvYg30nJFo1k27h0cfgUKuFwB1Fe+4ZlrILL+P
	 LJeDB9+2MDQbZkBc1HfmCDGP3R16QZli9De+gSfBlY7+4QItIY6t5MBsg++VnBTxz7lQv
	 b2rFnaLfOKCw10np41s89rsVQLzFUZ/9+BhV1SNkAOtGPs7tCami/C3z4C/ri2TnXgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qN2WiFFf7GKstQhbELLdKxcR32e0/q6k6IEIDbJabnE=;
	b=WNwJlypp2yQ7l5h50k4G/1aqYzGWC0+MMwdGw8vMCXIJL+TcuiS7RT2pVXNT0c5R374x
	 Q82SMu79NuLjjScLjfI8SOpS+nWGPauc7uDlJ5ThTzSfiZbpW4eou51ETfrqiuPhbspej
	 YP9kVXMQTcaWHKjl9kBfyTvfnku1ntaUN3JPtIGSX9gykdOIQ8NNiOvtnDzozAIQyDnao
	 vSsJo3Zq5e6+B3Ms6S3jebExOuQO8oqt2tzg2PFPV2dz2LHL+nC+bk99/gc6u7kV/qZO2
	 upo8BeuUXZY00SFC/PsODWDJOeuQQMANhHTkGQnItejXLGRA4fThKZ9IYvw18yVG77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmyqymzS;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF3606A690
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EBF3606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmyqymzS
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so12569583c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807387; x=1796412187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN2WiFFf7GKstQhbELLdKxcR32e0/q6k6IEIDbJabnE=;
        b=zmyqymzSuEPL5vkjcy6GkIFAr21035AhgdCEd84SuwY7m9ddz5WXNtoGHOsb67iX8Y
         Mpl7BNQwV6j462S8bPqHjje5N/IfhJziwUTHIH0en4NKeONj2MtNvtuOBy/HtJEnqLuJ
         BYuc92m1w2nnC9pFE33p0/zhHd+Pfpy2vDv/Dyu0T2ozF6pGO6bwUr8NbY1CSvSHL2TR
         CWfnfWU8M+eVICcUb3EL2E8I3SZrlgpwOTiTzZJyutTvW9aHMq8q6+9pFcINgUjKJg2o
         QDHQYW1JH9k6XtNpJAJFpnQ3ixV0VOuXaaU3r4PEAiExFSK6MsJqWxN41yDNQ/XMS//0
         sraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807387; x=1796412187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qN2WiFFf7GKstQhbELLdKxcR32e0/q6k6IEIDbJabnE=;
        b=QyW3561c2h6sTyJxGahJFZ3o7TyAjYwtjt0bVWwv9/yl0vEIFgyszQ6wIVxzOhBMlB
         m9Inq2q1OcpKiEYAfSrbNQTKBJA1lKBbMUowzpjpd8mVyaKXudggS4LReL7jscvV+Aw/
         pevzaLa5yvqj7SDoe1SY/5BHFS1dW2WxSNTjnUwZRU88EqdjLF5e4vR5BtIfOMJHNrRQ
         GEYDP9mB39tc6UMlyYwF1iqNYEFkrFO08skflqu/AYI/q363bZHXHvJxQ9cPtIuf4IzZ
         yAJ01t2T3H5omvKwtTTP4GH3nFA3Pwwj/NxtdcqrhMq4hRRW9uMLlXqoAYXkR3IjR3mI
         NBpg==
X-Forwarded-Encrypted: i=1; AL+hErHBx7nl+ItNjbSlp+RRUcmSEFCK3QfCRvlbFZJgTvG55T9T9khaKmf8w0IBOLvNBdtyqRsQHi9ugvA2vdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gve6yMO3o06M+kPjQmMIUOQ+dgFxDTS2xmVqBVDBCXQWiJVc+
	2vuYb7j9Yi62TT8wRSt7g99WoO+S2aoaBunKgDUviqefw+a2UeMMqTQW
X-Gm-Gg: AZFdTZf1LvJ3gLKrzA8DKu1+6Otklda0sCowcPP6P/OW2/TPhbFnBHf5+M/2QEYy4Jk
	EcPwMwRiX34W0GLqqy9wCAGhCv0l4WSAwoZ+8DMVYtInk/M06prv8iBxEyf+ec5xSvMcnjcXil0
	YP0wsyY4/PfNDwR/RgxfRb+IooQRU44PGRMJBQxWOGWieIP/DsVjJ523v2EvaKEAoWDG8E7R4vz
	qkwjXw+nY7alwPSDiAgRVicS0+Et1VJiOIrtIlJn6xU+iFdZtPCp4fiztnshMzwVn8i4+DsVRXO
	jSqesd0Uj0wkh6n3h33baiSxXfe5ZmwfKEhNDMgMzxjk2Pbo93K/8I0v1X12nC4kLxru2lj9fiS
	fx3WZWNw949AZDHjAp3gxMCmK8i2Xj1wKeoAEuH3Hf/kBxmPMq2x/x8fVFVdHAeYUZu1vJAEPv+
	NRn/6Ifiv78HbAzq2VM5e0iaL5rgRszmqVhJ45LgKN0QwWbkyyhDprl79dDXe0Q1spZDorNWhh4
	NgOr10Q1AULjkjwYk7udMmZnGHygOUTrr9VTd7DsaQ5IlgjVKIwng7No8i9E0pWitX7gEbqP9sk
	OPxU3fSz56KGtajYeHb1b8xs+cvFlXCkZ7QhHABIUpNBeG7ctgAUUt4p0VPsHDgUoYDS5AV7lo3
	MWX/3mfW/QKswcYIEFONUBo01maM+AUUT8PwSIa0xbG8Hv5vFf4CjarRx0Fpjig==
X-Received: by 2002:a05:7023:a8b:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b5568ef837mr26223679c88.41.1795807387105;
        Fri, 27 Nov 2026 11:23:07 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:06 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com
Subject: [PATCH net v7 2/7] net: dsa: sja1105: keep pin function on PEROUT disable
Date: Fri, 27 Nov 2026 11:22:57 -0800
Message-ID: <20261127-timecard-driver-v7-2-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
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

Stopping periodic output currently switches the shared PTP_CLK pin
to output even if it is configured for EXTTS. Only select output
mode when starting the generator. Keep the existing stop command.

Developed with coding-assistant support during review and validation.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index da35805152e0..5d69d083f5ec 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -733,10 +733,6 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
 
 	mutex_lock(&ptp_data->lock);
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
-	if (rc)
-		goto out;
-
 	if (on) {
 		struct timespec64 pin_duration_ts = {
 			.tv_sec = perout->period.sec,
@@ -751,6 +747,10 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
 		u32 pin_duration32;
 		u64 now;
 
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
+		if (rc)
+			goto out;
+
 		/* ptppindur: 32 bit register which holds the interval between
 		 * 2 edges on PTP_CLK. So check for truncation which happens
 		 * at periods larger than around 68.7 seconds.
-- 
2.54.0 (Apple Git-157)

