Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746510;
	b=X3sAxPwXcgpvBTjkpmYVOa4kgODO5JPOKI/IC7JTMsHK2fV3eh8/KbkV6rqHZ9nL/XbB
	 JAbUwYSp2E/T24cgaRAgvHC/IYqp9gx3CVSyBGOFrTaAZW5aEZGubJk/rRoy0yiMd7pGO
	 mP6rXeogVcX8UV/cyDUutJXbPdAMldUom8XJIZNvnVpWWMubp4kHhcc7AV9bjl6f+LtvJ
	 xwxuwJn4OYEXM2BNbada9bNoCmZ4OABBd4JMKUnHCCa9X2B/L1V10l0KMvter8rd/Xj63
	 LfajMEaVPjkHjnvHY3ll1aVYlRkeyDza8uNuwdnxAlVuUH7U6QOz/J+cLFpBwY6wPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
	b=krC1RlU8riFJ1y2zApjULbAeuLRrwA0wyPJE70VWPnOlYu9kVbat8sUy9xRCmLBxRb7h
	 SJkiCHmkTMyN207UZ3eI+Bou1Oo1vpuapGXYATxRJkAKj/Ww7gXMM+5ICEMyidOM4Bfun
	 nTjsnwNc6CnTmU+U6BLHrtKvC8XpfqzbslxnAqjFKSoNvYetiP/xDxwdpjPM2jjfZ134h
	 ZXBAgXs6nfT8cz2DYIEytHLNA+BnWVELs6SRetCM75Bc/r0pZ9oeL3e9mqvjJFdLZ8WTZ
	 FOraVH4LkeGs6/FL2CKnxHWLPB4TKzgySNdTPMtQ8PcQE+ECX0iiecpTk8bEZ54Ljeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pS999K9y;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0D606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E0D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pS999K9y
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0621eec70so53129495ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746509; x=1796351309; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
        b=pS999K9yHq5iT2/gyzZhzmRUoI2JkVatIcLwBpAuJVPV/cffw3Bn24K38ws3SLbuFt
         PTLF8SQYViSAXHW0vcPctNeMG4JC3Pi1/dfcilj9OMrXqvlXsNQPFsBaIGqwvstJD5g8
         tE6COPglBjVSuoFl5Gnny1MBiBPzgPEbxpuH8er8ygn1O76BOX0k8zewdUCXZIlFtdsf
         m1G/GUihL4jPqJw1YqxLCPAz3f7/7bYHrggsUxlxMMsvjJJDbcn+PMknG3dx7jfUrc6x
         J17WyeCRZv2U58CUbrDwCz1EEN/b+YPfjwc5G3IeNULfYHy5hkLNUCugVg0HVeqxDOMW
         nDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746509; x=1796351309;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
        b=Cr1E7m4PKZqkQxsdc46c1VIJTBi1N9eaPyTOSIntDhRum3TTXCOLUdkGC/Vhcj+9kz
         U+1mzW16mAKlZIQof7Y3P8TCdAXlTSJ5BHK6dgHyXcMi4ZQ5XAZmhVH626Zregme83AY
         LM55VrNiz+WtaNoRPGcFuFFynvWdUmjgRh5NvRtzw1Q0Fjo1QmpUiYqiJbVh/ftWeksY
         2FUrELjcatkyEmAbIbmmamqypMDFQnayagswE4jGbw4N4SOK0hHPUQ3nH56qpsxLHK5i
         eB8s8Y6E7fAvkpd23V1eu5MX36ExaFaKUPkkrXlB92rbqva9bfXHMQH9ka+w87jjlMaH
         R7aw==
X-Forwarded-Encrypted: i=1; AL+hErH2lnTZZ3wbqpQfgSuwW+cJ//8s/nCgKZIZO+YgCjrCYjsF7R5Etx8x40RQK0pvTILxitrpL5D3Z9g6ms8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C4aOlBzfPNuWfQ0kM3V/BAfzxWGgoDH8WfU+vQWVWN2b83znr
	agw3Kvye+70OsJ6juwWA7Xf2nyRBRVpO/jlSUHOUtNlVgxwwqVG+JQNz
X-Gm-Gg: AZFdTZeeSfyrI81zoIWnWlz7rMbMCBPJMQPQj2GN9tXvqSVZevGgp/eDU0qdO6XcOvs
	GFpAmyYOzRfVXR5bxvu4g8YZxilm1QMBIYNvxARdrNZFUJdkroStdBHVJ+ZpVPl6fcDR85JJM68
	yDSwnr+afBl+p30XNm+P4phW5tSLWNYJbveEYO/JSi8c46G6AGK6ckQoDnArocnkTWIkEwGdXFo
	fkv5rj1IbhXb43/zoJ92f9uBqo5mNTC1i5/mWJtTS3iPE8ym+r/Rc6zhdFTHe3kt/YjBDbVppoX
	hNtJQDrFpDbQLJqy3vOvbJ36TVLj1omTd6NI3NuJ77cBc1quQIeFC82zmfM2VVQKA/lESNlBL4i
	CXPapix0Avlx2p9OhOrdq9YA/KITYiphbl5g5aLtD+Wo3niME4ezeKwitystbW3XCXVJY4iktqM
	yRlkIn1aqNHaJzhus7CFxP91NIxrXCvQLYFHyv+Xhnq82qEWAV4+xyxNWHKnMEa6gfeu0JbKgTR
	DMT3k00IKWTf7L+ns632upRVK8rgMAZbtiv/RzmICoVvQGJdTPE0ADZAXGWIocncl/666XRdrRl
	TJ+NPmhMCYE8NUz6ztZhCCyn0luJYJC5Yuw9h7jcbTk+Emrq+q0zVB8cgV5nMliNhSPvq/CL2ko
	=
X-Received: by 2002:a17:902:ea01:b0:2e9:8ef0:cf6c with SMTP id d9443c01a7336-2f03f1ed55dmr230265165ad.26.1795746508987;
        Thu, 26 Nov 2026 18:28:28 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm111030145ad.7.2026.11.26.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:28:28 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: mt6359: fix MT6358 VBAT impedance
 resistance ratio
In-Reply-To: <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-4-iasnezhkov@gmail.com> <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:28:24 +0800
Message-ID: <179574650424.5055.6452827952792020438@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

Thanks for checking on MT6358. On our MT6366 board with the vendor
mt635x_auxadc driver, IMP reads the same raw value as BATADC (26737) and
converts at 3/1, so the divider itself is 3/1 — but comparing mainline
mt6359-auxadc.c against vendor mt635x_auxadc.c shows two differences that
likely explain the timeout you saw:

1. mt6359_auxadc_probe() unconditionally calls mt6359_auxadc_reset()
   (pulsing PMIC_HK_TOP_RST_CON0 0x0f90 with 0x9), whereas the vendor
   driver does not reset AUXADC at probe and relies on bootloader setup.
2. After pulsing HK_TOP_RST_CON0 (0x9 -> 0), the vendor reset table
   (mt6358_rst_setting) also sets AUXADC_RQST0 |= 0x80 and
   AUXADC_RQST1 |= 0x40, which mainline mt6359_auxadc_reset() omits; the
   reset may also clear bootloader-initialized IMP0/IMP1 configuration
   bits while mt6358_start_imp_conv() only sets DCM_CON (0x1260 |= 0x3)
   and IMP1 (0x120a |= BIT(15)).

Since I do not have a mainline MT6358 regmap dump before/after that reset
to verify the root cause directly, I will drop patch 3/3 from v3 and send
only the Tested-by/Reviewed-by RQST0 fix.

Best regards,
Ilia
