Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711334;
	b=ivkL7c4+zHrk+/NHjcxlmWhXeYgFCBAQEWQjyb6Bjpmu0BWg0zldWl8Js0qWt97Ye4h9
	 pf9zzplOA1jKBTpITl+yBuaHB8PJp4SaFsZzVaKpSuu4aYwylmJGMB0tVSa6swlvHHfN4
	 eeSP6A8nAwW2fU4/G3XsEgd4kmuTd3UXTqZN+c0gneur2nXLvRU7mJzt0/a/B2Vs/iEdJ
	 jWPOXxJ/0Jxcbgs0hhPHW95zTv+80umd+PgogIudavDYx+XFO/45shDImnG/qs0B7GOMJ
	 eEvwIQPSMuvNituLsjVYviyIYS9BSkNZFyCYJduLJbE0kKoMVt8SHhA5WZu76HwO6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tXzlqriDCchISdhq2S4x7+9hMGbGzDajZ595wmRIilo=;
	b=IWbYjPnZTDDLKWTUfAg+efGxTspx6OvcrJ8ntjQK8QZNaNC2mg6Q3dcKK8TZNJrIikDw
	 w9n9RYDG1oFR4TOo0g8LDdPz8nZyTtO6fxDDEpABVpjYs87uY9AhD+llGhNvIyxPpon8O
	 63jJnMSQdGuDNnNqyfkwi0r+Pw435lI/ocMWz7/LdQdGkEXYFiI9dSFOKV+XdEjz5S1BJ
	 0iLpsuDkeUZoPMMHPzc4VxhHWqhci6S/apd3k1eSr7z9+248mG3YOGbgJjFPm4TfpJxEm
	 UBD5yKZ7cXCKGzUNX3NDgH6h33cPgWQGwCUPnj8CmSynxx3NRtzT+GYDwkcUJHELmmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A0c7Uths;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5F606A688
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A5F606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A0c7Uths
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38644aedba1so10752086eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711333; x=1796316133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXzlqriDCchISdhq2S4x7+9hMGbGzDajZ595wmRIilo=;
        b=A0c7UthsOC0y/rSaEOriAcQVtilu/udmayAq32HbAEviVBvxR+C4kBogoyExh3LyPw
         OND69ody1GWoMla+Q2cAXKemA/dRJOP6wucsz5VGwlz3UNlgBOqcgWxWQelGyPma/T1/
         MOqYdFIkqjUOYlhmr0c7Q+gY43V+i+SEqm3xPiKY1qftt2Fa2Hrnq7RxW3lGCdL/xSmz
         SbbauCLQr087jfUqM58s9VEsxqkfm2yJJvHc0K+YLWqIHo9X806kGEhxAjycVH5bZZpQ
         ysoFteqjAY3ei0lX/ilwdSyUwIMQHYgJ2TNJElTAQIuIdDimakxtsS5EMVCzT1xsz6tH
         uRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711333; x=1796316133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXzlqriDCchISdhq2S4x7+9hMGbGzDajZ595wmRIilo=;
        b=Pf6yxcqpr1u6R1H65CsTlBaB60doQEuPyQbXrDfMZlqQ/S44uBbt76M9UZ34KJVgrO
         PyLDLPIk9GIqUDjPOcp8GufRjTQK6jTs85VvtBkQ6pqLiwM3IodRKtMuDxixqHrH6gL3
         +5yO4tDKQgfCxmN2k9ptCv1fmj1LTK9x6ZWf7MHi2E8jqSjMgKMnQ9r1TeOJElY8NIAT
         SeO+98VlGmfUe+PixVHTTJC1+NG12UC85e+ZjLTmRhAqg/ZR//moqWXJ4krY8x205QWl
         Xe5ptDDgb5dxr+O718a/A5d88Ae4opDerDosTYJ2F8R4NxXe/9O96ZUKZWsQbrZRCOH7
         S9Aw==
X-Forwarded-Encrypted: i=1; AL+hErGFjtX5TbL6mqwC9P1MWcu2j4KHmkDokJqAnPVG/eMJqoRwHbXt8aegiipWCpWtLl6OO+LLGs+UTX5JJ8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wc577JcZxekCLV/5Fuo+IMERkEh2ez8qxRczYKWA+Hlkv7TaA
	uG+X02pBrSg7BJMkIGCTabkc+/I2q+JoxtsdT/RsUxeRc1luhQDs8PD6
X-Gm-Gg: AZFdTZe+H3SwmUOzNG9gIZF7nFhOxePhPTPPBbbpB8mYJX2CLuFRXHe1cXEyEz348qQ
	+AI3ID8M+7XoXvbqDDW29OC0OmDUyF8UPsDPYyQBH+RJ3mtFcDaILwU7Ve0RbHTaeEiMDrT0YrE
	BS3RNHt1pia4TJxUE4o1zd9pwRLVClfm4Bvbbbn+So2EIdWnFF3TBFcwzhBMW7YLP6jmHiRNkKN
	wYrm6exxHS2iCnO4rGwET2lky3YSCxai/FHxbTF5ALOpG2QhlmW1S1t0znWFEB15WJBM5CeLQNj
	Qbaq1Tq6gD45Ccebvy/J3Q6/WeXdwHLWKjHpkPP/2GG2r15aFJFC+Hn844Q7qPG/YhtUiGhn3UR
	rQWBnpowC7pG+gv87ex4Ex2WNwJI/b/F0nkrp83nRR21ciZdtMp034NchkM3HwAxBmU4xWebjEH
	KvFM1+JzDv3GL/zm65sJmZEXU32MUiAYbUD6z+r3ajU/Eh7wdfsWlpK6od3hTqkv4Kq3wYsH382
	9ik46AsGmQhDdHNYbjhLm3dt/1ouEuSzB/yB+SN9sE6BsNYmZ9QfN/kWVzvyvlXqWbs6VKlEbe7
	kKPiWQBytBt774Cgl8WZQ0qiPR1J0j+WSl1SdMxt+NoXhXseOWZ93bo64dGeh5WL9Sn1N9cZiCw
	ylDr7CHO1IQhNPI/E60EogIWUT0vN4asY9HJLBTlbPRyo8R6eUJ8lTRbZnX2THjdNgkmCi9PL35
	6lqZ6Wm8cJTAKiLwDHPA==
X-Received: by 2002:a05:693c:414d:20b0:386:9f89:aa80 with SMTP id 5a478bee46e88-3869f89aee3mr17238179eec.0.1795711332806;
        Thu, 26 Nov 2026 08:42:12 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:12 -0800 (PST)
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
Subject: [PATCH net v6 1/8] net: dsa: sja1105: keep pin function on EXTTS disable
Date: Thu, 26 Nov 2026 08:42:02 -0800
Message-ID: <20261126-timecard-driver-v6-1-ahmadexp@gmail.com>
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

Disabling EXTTS currently selects PTP_PF_EXTTS, changing the shared PTP_CLK pin from periodic output to timestamp input. Only select the EXTTS function while enabling capture; disable continues to clear the state and synchronously stop the timer.

A coding assistant helped analyze the teardown side effect, develop the correction and source-derived regression test, and prepare this changelog. The test exercises the actual function with configuration writes stubbed.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 350f958dcb2a..da35805152e0 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
 	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
 		return -EOPNOTSUPP;
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
-	if (rc)
-		return rc;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
+		if (rc)
+			return rc;
+	}
 
 	priv->ptp_data.extts_enabled = on;
 
-- 
2.54.0 (Apple Git-157)

