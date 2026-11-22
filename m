Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385175;
	b=YI8D5yr75SqskY/knVYVXz3UCLd0Qj4LUFklisGCg2HYYBAb9YWD6k+WMswiU2p88wUJ
	 jeQt0MorTsA4eDav5muyTnu0zDQtoaWZs1n0NMz7gAGp1OgJ92QPR9Tw5ceIpWs8gW1Uz
	 zMVOFUkAiT027+o5PTrZ7y3uVoyen13OyKc2wWb+SlnuMmP/91J5jTqkyRVvdJaqImiQ4
	 Qtyf2E5l+ahBMI35GN/YBd3TWdixaOLhz99Y8NjucyO8y4lfE3sU3Rq6iWhtvQx/ZWSa6
	 uY63VFtbBM7z/a+Nho2VuUZh7kcCNYuLRqXonds+/ihXoWqY4oMdsqpn5BsV9ljij2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T5ZgfcjP6PpiW+oPtLSGPRYDPLG9qZ4FCz1XwMujgc4=;
	b=wvndUgEX6id4Dcv5hF9zhyaYhJyIWM1Zi8n8ctxY1XYHDE5WwzyOLMNotupAi7QviNd7
	 XBtq24oz5rVThBcytnKVZsiShQCxiBSYC7Qd3nPTeBSF21+smYliv08NqbvWJ8dEGaFB3
	 b66XxPfNu9pk8S9aYLcTLz0Iqie5n83gaswfpsmqvDGBFG0+w3MeOlKjnfAqgof+jBFVo
	 +6CclS4QBFw/7e3xkz0pgoyDq0Owy4+Al8WQhEIEFN9INLa22R5vjQQfvpcCfKFnlrBLE
	 Rz7C5Zpwy9gyhaKqKXiCx8/YXsGAPD15HxXE1Y5vJW3MPxEyU9Hc9Mg6a+fsVGJOnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LtPUTen;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87632606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87632606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LtPUTen
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a9be758734so1571827f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795385174; x=1795989974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5ZgfcjP6PpiW+oPtLSGPRYDPLG9qZ4FCz1XwMujgc4=;
        b=0LtPUTenhOU5RuJ+DxTVK1oJnrg/VSBukWWBPwQ+UlAg4J6RUi8TzkriEONa3wdcBP
         pbBmeat0uq1MDQJkmpDDE7w2rVbgFhgSGo8SDY9jA+UlqfzlvXDUmxwU9dJLgiXM9s4Z
         WMh1x8wP3ctmgnihihNY4qvfmmvkm2cweNcfJR/AuBq5jt6duHMrpJo+yVH2SMOB9Zv6
         kxtKQN+go7kE4ywB1Ef3LX1sFpnRPrC9ehgyJ8LAguwHllJNX/y0GwUQd70+bMAsM0uY
         Mna8md83DcxDtOKnDzUanki2ARt4zEwKLst2mADVHwnNnCTuqxJU5mXzXQRS129Arrsy
         CUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795385174; x=1795989974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5ZgfcjP6PpiW+oPtLSGPRYDPLG9qZ4FCz1XwMujgc4=;
        b=NimGnpa3CVgGftWzYdU3aE7SO7ir0VSC9a7/oPVPgUYYP12I/sxSmaRSa53AJZcF3V
         hByEAV3ACUJWgDVZV3nlUiQJeoOu8qFkwumChm9jaJRyVdzW4INosNRafOmX/ll3Hl7j
         GormxbjpbaqihDrmjmNKkcE7TxToQq8lGUW+yVsgMT2rSNOEVT9hlRyTmPv+pgiCvinm
         ppqDhRKrgM8uaGSum+re4iPmt66UbZ7ZgeIYCreJsHZnZ6k60vcNJb7WMIj2IhMWW90/
         mWnnWTDP60BrIYbYk45ioRQXOo7UXCiLoXuLFtvftMqgBkLbYKGbI5KAwa0BdsxrtrAk
         MhLw==
X-Forwarded-Encrypted: i=1; AL+hErFPFsnPZQ0ObTtUVUdn1b6srKLoAOTyPB2ZblieQMciNVSZsfht70e579LgZ/ohe8YWSdJAzPjYdDhuoIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E8/AUsqStjUCmx4+q9+A8MvSpIh9CDuOu7tS7IPpIZomotJQ7
	B3WuJHngNdTcZfuUOUjAUP7qCbO87wgv8xqxipLv+6v01PjOM47ShSLG
X-Gm-Gg: AZFdTZeRjeu+dq48nmuSi4EODn7juomQ+jm//Tw9Nvy4ZBK27MckAMQyVjLzg3hsjI4
	v+f+u9W+DjQBPnPvMK+tmaqpxiZakUnWm+uZ+FjDcf420OD0LU+E4jvdcG+bUJP9BF6/gZctJnF
	tYN6Bsh6D0l93K3XYu0PIgAOlzk3FWESnHWFXe1HT6B2rm7mSqumOVplnkRtJn13WCiX0dMPnm6
	W2FNvyYOMyQ39G8kF5dBz8iP+3u9nkunQRjIEyMoM1iy8CJodS1IhxYr8A5DGNaaycT3ycPSPqx
	0b4dOIlhPb9pdhy/3js1jSbW+dMrvnzyffDJ2E65tkAz1a0jj/WeCaQ7C4gcoH10dSxPRysOeJC
	mBjs/kwSpLKd7DkJpCumdtzjNr3jxRcUJ0yQ6XDSI9piXYJU/q3GQvLjPbHquovH48w5+5pqvwy
	lyK2xABqf+lWDuysLELpU1m6aAx7QQvE4V4Ai/08Tw13MKC8LJMMOi33bYIZ8uGOaRoe86IUhs9
	B9hHJB6XguicYU0hOeepLOvACDfUVXr3nitpJneME7t+NMhqBtLPy1L9RdczMO4CnS41j7KHj0g
	BA3ckaFlJBhIzfF63qxcz8r5mEHUtDSh9MCFs5hU5D3U4/JSgYBz6O8X
X-Received: by 2002:a5d:5f88:0:b0:4a9:b6e8:7c6 with SMTP id ffacd0b85a97d-4abab02c3bfmr18963687f8f.8.1795385173636;
        Sun, 22 Nov 2026 14:06:13 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm17962376f8f.10.2026.11.22.14.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:06:13 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: aw88261: fix sign bit check in aw88261_dev_get_vcalk()
Date: Mon, 23 Nov 2026 00:06:03 +0200
Message-ID: <20261122220603.39282-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
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

On Thu, Nov 19, 2026 at 05:30:12PM +0100, Marco Giunta wrote:
> -	if (reg_vcalk & AW88261_EF_VSN_GESLP_SIGN_MASK)
> +	if (reg_vcalk & (~AW88261_EF_VSN_GESLP_SIGN_MASK))

I have been carrying the same one-line change in my tree for the
OnePlus Pad 3 (SM8750, two AW88261) since October, and the speakers
have been in daily use with it since then.

Reviewed-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # OnePlus Pad 3
