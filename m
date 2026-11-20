Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191722;
	b=Mojzw5BgyWMTR1fqOJr3BoeWjpoAbioh1Qhj4fv/a6WOy/4DyP29yJQJTEc8e8clbbf6
	 l9MFvVzGXgYTuKFvfbhOXNHRGGgUUBk55Gk3oaQpWXfhhi7kgvC/1nr5DWRMmqx+e6dF2
	 u11rK7c1sAo1xz5GkmiLiXo5IXUPuP1B4+FXt5hIe/OvoLxArPDUbguScx0D4/4HYeHIh
	 mihULjknQRCPP5twX/RvOdI4X7kp12zSzstMnuRm1wKLyGC5qQ2PNnvA9EbIzW9TNAVWq
	 curlGIe50+yAnfQs6vM6ROYaiMMeIVL30c6X6xWJReEPKc2nYPCO7YTx5+BGTRnMmqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
	b=I6eXCCB3BCqLSFE+Rhd2FFQb/cEkX/wM3Xm87NBdT4ab1svUIAnbg/trf1/r37gtmaMP
	 McwbxJHddxypZUdkRMaoSvZ6mhHqmbBQITP0X6F57K170YVRlffHPsexkzV0Jz0cVZWLV
	 /viF8uYPjKsiVzV8oNZL6jGEdcBslRvDd0e0lQiikm7QT1QCJ9LcLU9U4OfAcgLdvAHkQ
	 GaV0nZ40hUmCdvhdFd4i2BUfPVCyRolvIJTllqKtA6Sn9c6/V9nMmpzZRHJpIo7N7fqwv
	 ACGtZdmnPnT5RDkvp+Q6EquFbgZgygxO1EgycLCHHBo+7TPr/h2lNqGoxR2B1ew38qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aex6oEvR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB2A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aex6oEvR
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so452106a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191721; cv=none;
        d=google.com; s=arc-20260327;
        b=sKhKH3ndFeZuzw2/75wmisBpOyVExXNELOg1a2DK83hGhpY+e+bbWSlKy8ONV7nkbU
         wnPLeBaXpr/cH8tXZnu8ucLDSB1a4eA4wx+XbLA0l50KCCWJhIqWplOeP1yLtR85cm5m
         qIJpfpRW2tCfsZeekOlNzNxTaSew4H9SbIPyHL96CcrO9LzlqqxGTCQX1VU+gzjEqAOu
         dm0PbsqMNKnkXuDCLTG3FglQn/ayl7dC/kgqQgX0vLPdRuHnKW2SrPxYUIM+5evgjpfK
         ELhqQXifp7pJiBq4oHHalT22w09eYrXMtxYTPigbeM+pht4BLZLuxzoEMS3cuZNpc6Hb
         ZeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
        fh=I3TB3V1/dNeJMRgd0ro0+wvFFfAidBb613gEQ/o9zO4=;
        b=L0YHHJvC6pN3L1krH1DXUYUGEmNW6ue9Awzxd3fLN2vYL+mo+1i8PJV7eL5ZoZR81k
         5HodZX+pCnLlNlZRUdEYBbgXkRqWZ3nufQk2Dq0yRIavAX3nw4IAD/G5SlQyE0Rt+GEm
         ob4EVVM12ANnInscHnt+Wn0f6/TxhfXHWrXYFe5dxCGGU9ELgtGgL2fmcWzb6uHsUuKz
         CBvTSJRcU9IkW3IJv5U2Hftaq/3Dpn+JeOPeEw3tMXAr/aswsueNKVKdGMI3yEvsvYtv
         SMMgTC2cSZyf0I9r5Xe1HjqaL3TeSpexEu7/Fl7DKfjP3TTBc9iaG7zgMOC5SU/qPEvh
         cg0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191721; x=1795796521; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
        b=aex6oEvRzAxw4HzRaklw73dDMOY06aOg+9SBepRSyzMcrrmgGcXFavi/R2j0S+xSdb
         VaOrkNXcZ1rldGWC6MzAr/a3PfZtW2JHeT5/HlQvY0pATCCUAgDgHBBowjmaBM6eO7qb
         g4nnq/gFLl3J+TPtqakBH4d+QDQgPaK1wmlhZe75bkCZTIvmCSUwgrLkyCgZEmYb0b5G
         NRuoELiZDNAOwq3YeZbgS8uD5Ns4Cg5b9QqBRD2wggzjUTiwQXBICcUgG6WbpF6BE5sZ
         WljjTpnyaNX55o1TPDx4z8xuJnXRWDtfZnhwIgeKpeIib81zuGRGd5mre5TfUqZob4cG
         I1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191721; x=1795796521;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtzrsiYRAYlK8UNdUBau7Z8+kGG0uMSS1m3uavQxSD0=;
        b=t4/sppCfEuJt9VOJyuiF0596GgCOTXZOS2mUj7pw6EjIoGXQSEHKaUWd6eEyxQlJDI
         rbgNPxYrPGsqrF0akGRVg/aHc8lP3RVdQcWwcbRFmH1yBEXayHeEDogQWyFohzi/14Rd
         qngdtWjZ8TTPYRXSpj5Dmgehx7FP9YxVthTZcTTRNZWFj8SSqRt/2EcEF7jeHgw1YleQ
         LIhea26+w9171CWztR2hoQp3lVgdTodoZR7OzQDr0Yv9UUk7m30QxgvwlDwW32FnBsHL
         BeyA+4uKZAD3duH5R4xk7+1/SEUgHl5Vln+i6wyqGfsLJIYzQkp9pvDqO4/nj/a+1wmW
         F1PA==
X-Forwarded-Encrypted: i=1; AL+hErFDDidmH2K8Kc1feUlHy3wLGiFHO02o1DDnIvFY3mtbVFP0Wgh9fuLeOUOQbwa9xqIhWWla4TtoU0dIXWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VsKWZZZMi154rsdJwIFx2CTkJs9nBs8orpFjstDn5R40P3GPX
	xwa9Jhm+obg7Astfb4suMN/mHtuuODWXS0dtYS8UL7Imot0cyjaWf+mFCyhRozScO52r0ZU1TW4
	D7+sbqZs01PWFivBrSQB1TrJ6JCYkkB8=
X-Gm-Gg: AYBFou3A8VrIZLFZa4zY2jq9bwFF5fwmHK8RivpAr6gBmRh7APTjoscsl/hPKYrJB7R
	OBoPZ3YDsuh7UA8+cLoUmiy7FMTvXe2LzMvx6IbOCk11vhUXOesSKFieXIv/5m7ClSDirQC8F4o
	LyFkCu+7x/ji6r63A5ZzjULexVgTrnYXC2263hgbrfdTGY2UHJYJ6/D99qLERM/nl/yzVxlR0R5
	HXrTBQL3xFfpl9DCNL/aobTAP5kZv5dleQyfgANWJ+z5wILM6nbjnAKljSh/fIdm6pDkuSUEDul
	9+OvxDE41k66kRYSp/FoJsy7s3gOP/gUXkatbQnlUI1QZmOhuPbMJ7o8jh3PNYo+C9YxZ3ETL6i
	SaGpfOAJTmNA3o9jzYnLI8qlCKV2MZKZV87a4M/DDeDIqXxYWxOpV5ehCko7VWCh+CtBfekaYMC
	t4/KDiWtjvQ30FmhjvyqINtph2enpVIfWh3WJlz5wXBxnbm7E2nHPh
X-Received: by 2002:a05:6808:13d3:b0:531:7f68:842e with SMTP id
 5614622812f47-57a06d1a865mr4088651b6e.8.1795191720553; Fri, 20 Nov 2026
 08:22:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112135839.6451-1-dennylin0707@gmail.com>
In-Reply-To: <20261112135839.6451-1-dennylin0707@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Fri, 20 Nov 2026 08:21:49 -0800
X-Gm-Features: Aa3M54rLCY5Ln1-BqmNVhIEKYaX4QPZ4mKm2voTzZa-x93WPoRkSXTUCtcqgWss
Message-ID: <CAGEkeHcvJnuSFhsUkKMFMQNsA=Q4-Zq3G6XmDwtca0VcK7zi0Q@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: account for short copies in ubifs_write_end
To: richard@nod.at
Cc: chengzhihao1@huawei.com, lin.nan@h3c.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Just following up on this patch.

Thanks,
Hungyu
