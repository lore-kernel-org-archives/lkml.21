Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606013;
	b=iSBGd5G4Hw9RnjRTDEc17NWuG3iZQ18S2dNOXj+Fyfj7AZhqdtiPpmC/VAoS3hfVFtRl
	 GLEtMHt4ueInANHTgtB+JhDeq+JxmggbLaNUEy9+4l10h25Ldv3vqHKY6+nJAT2dsd+cJ
	 nF3bWggwlZ1EuH4bKoHUfxpbeYkDAJLTgXXk8+q4DwX3aUIkMVwf49umrUA+GrC+eGyce
	 2LJNsB99raLvCD71cPgceXG/OQp5+C405ya3LaSUac8QGyd5cFYMDiRykUtbSdTVt62pv
	 h+6Ae13QTxckpLEJFJ2JtETDGvVYzpFYX82zp5YKEETs69XtCbdMnRaVmUq//55wQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
	b=TJGnqeho4P+MC/YGS3bMAcy3wmKoC7DD7Btrxw2o7b9uhmCM1l15iMVVqFQAX5tMFghD
	 yB71j4CX+srWakmLlPBj/VQ9LqDH/BAK3TY0eWjQSSLIhg5TOUpfXYwGyh82FTvqAbjHj
	 TUhHC/BYXtY4NbY/ovcSUHehqQP5NM1qB9ki/wiPXDLFZhuuSRVOJBV4jO2iHq+LrWauc
	 eJwKsX3Z6H170M/z5QBHNMHUrzDXBiVa8JRY8eisInERePtUh1jt1Ds56kB/XxmB8rLAE
	 VwQbR4MzSCjR36GByO1FMdOZkXHwORzQzmTMWc8/Cdj2tXp4mxYPMA/tWutCqJvIDQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B29606A689
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B29606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adef977ad9so41785341fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606011; x=1796210811; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=jyGKAlovcwZSdrD0MngFnWQGCgbR1bsNB9jg7IqxSmLK0XzoVhx8RwgXCJFWbH91hG
         dlLvGqU0Ihq4/jX4SM6J0XYFj1elFigqBzomfWLEQ/aFm/f+wJFvfrrja5wACD50Bsee
         ZfrnMhBo9IsKKG35FUjvaF6cSWSoFpkmcd+tLlvjNOn6TqYjwqTb42gMU5RJEaMSosHD
         ClXTTley3jUlB5UwPfbQADiM+1xHBP57dQtvUL4QTDI/vji0BuUmXPtUOHeFgvmoZ2Zp
         vOzd1ZTu/5FSppLJJD57ABv+WATKIGZ5Ex2mJoFfcPj7HAPaNlX8poONISTTeBAxgnY4
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606011; x=1796210811;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=VgMp7UjTqRDEgLjKXJQdIBfdgKV86JERteWzOMCaJErHR9cqCM/7r+x64KR5bQE3if
         rChupEqDceVE109NDkyuET4LEg5pK0DFxdgGmm37zO7fCOD4GGnfbzV61HHlOKbuSVFQ
         0IC5SVgoIgzNrxdDSAAd32jZTNALq9P9r2nzF4Ko7ERVtovvAjGqU1c2L1DYknZLmDaF
         B1FDDhBWh+SmZ6cmBmLaw0QsUIJkWAoFDDYAG3pBjZElnUWV9tkxHmj9NczXPYDefWPd
         Lr7G9RiCgG7we5pMDqpbG9TNS6jH4RCEZYLKHWDbvthjMiYzf/vD+FXCEziw5/TptPNs
         NVTQ==
X-Forwarded-Encrypted: i=1; AL+hErH6szUkoEfHFasmZdqXRT9wq9ZU4BkB5Yw/WG+kQxZCKfN5VQ1nnGLj1KFMkcGBYtjQQ06xTvM4UrAcro8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pg1nNPNjkpiFZ3yRger3/GY5pFeLf0PjystnNe/o6rz1cAkS2
	xBVRa7MULTPIkfvmhx0wZB3dMbdEr5rNKKNg6ZxeOaVvxNcjeKs9YdX8
X-Gm-Gg: AZFdTZfDQkac9eF3O2B7rBVO82Qobs4Zu6fSZNOKN5WyJzSuJ1LyV+C03JbID/t9+7U
	posuoOgybO7JCxgGBIHd6dI29rjw1CNbWtpBaOUTnhfhEyhNUplnvME2nFa7wDMO3naa/YDTylc
	Z2T+rpH/tbUt2hcFTEofUnxWJCjkNkI4LWDAuTiZKWexAjgqksac0d0g0oe9okYQNFxwCvxrlgL
	Q2UyiGXcXPYlqP2rRLdtyhy2Xw8jTPSQbAiN/36leiW40fP+ScD2ISAlye2q30bTOJO+d6k2IZv
	c5Ph18UChaib0wuSe6OQtTU912Kdksp2zcTOWUitT5aQ1V7NmE48imnPfsUC5wY1PY9m0anrvuU
	FvSfp/tQw/EXQ6Ug4Pc8rh2L+o9bNdTZwU1lf9C+1/otD3C0RyOvBPAAJcUmJ0GLv5MU9ATGXBX
	xdNVUI8hywb0+ztxuOfLA0DwGNF1KDE/melbTZbtoyU3VYHrhgkIVe64YEpEwkVynky6VR0Xed1
	NWePjDTsn3FzqDl9NlgReWZA1qYF5PaM6ngTXDpcDtyCyyUxIA5i8TgPJ5Emr2L9JYyObmFaizI
	drlyiQeb1BfXZjVl4dem+rVLpr7kxDCnGtMAfS+CAL/HhvEIJ/5h5zs=
X-Received: by 2002:a05:651c:b28:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3ae7f9a073amr54848531fa.4.1795606011279;
        Wed, 25 Nov 2026 03:26:51 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e3c4sm46556431fa.4.2026.11.25.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset controller
Date: Wed, 25 Nov 2026 14:26:28 +0300
Message-ID: <179560598858.3.3579752078270188660@gmail.com>
In-Reply-To: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
 <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Thanks. I've switched the allocation in cs7542_reset_probe() to
devm_kzalloc_obj(dev, *rst) for the next revision.

Best regards,
Fil
