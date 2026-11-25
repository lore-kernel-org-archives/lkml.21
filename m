Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620236;
	b=vGeStyd6oNVisdDcuIxmJ+r963dsCkl8SSzefiTipARr6ogwOBz6f8cgHLu33p4QeK6h
	 5k9kdSTgCNqLq7M8co4ftoHtNNgQoIKYqZFrSXS5fbK3V64sj13RsjYoa/egX2Fj+NFuL
	 pmZv/6Ot2W4ruj4KzsfDQcbFi/Tp6LZ52asYLaXUaOLdetNauu/PEWguGGZWygdwbvahq
	 aCmnPrpry/ORM0QxMLjyFviRL49FULTHaBibPVYzx9NHQ7I3QZAyS2W3zsh8vZchLjxyk
	 KyBJaTUHZfhElC6HahCvTVtwuemJjn14ZE6iFds8tmQZjnMTrwNDFwFq8sUEC5Ds2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
	b=23uTWgmB0qFKaCnRHLuTXdHtb4WPhas27a76ksg6pHL7Hot3GVFtuRYoGNYce92f6PMr
	 383C1XVYvZvqtRX4teHZuNPI+6Hgm60Zur5qbrYtMR/fQU/XjDq0LjgOhpiKCEWHBomnU
	 JRw0675i/LSZVYQ6YHqd4quHr47jEIJYhhWI1a61C1c7NXvTBeJDKkXejbui/jnlwO0r1
	 Z3hV5PDaYTg/AjMxSFnp+AtgrTPRvZT+YCgvmguk6xFWB/8IyVEq74rzDBhjibyBXyEyM
	 MCqMlWYAsj9hFasxnOHlKmkPJSBEXE6rZXQI8fF/mJCL1BAEfMDV8UYX9T74bpc61lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HV59Go/c";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D120606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D120606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HV59Go/c
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb67b3a18aso5640135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620234; x=1796225034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=HV59Go/cpYxcL5WAtD+1Xny/BMhy0t9/kE+xSUBeIAXT2ybiCQLIyTQ4h3HkOSA2iq
         gNyH9I8G/McXyIPTXuzl14x+pjVZ87BluZhtNOeTcSGH4nzsaFp3M6hxc1PnlWFzuXK3
         QNdVzw/Aejc2xEcOcciscKn5TAVulJgU5L99QIYaUJPpzsS92Cd0hVkaEzdBtnIwti4U
         pxmm7IGW1a67oLYNGiSKwli/TzIA8SRprYd/iw9Ry8YwYmozZZAGEDyTU/xj6VEZn/be
         2S4/cgN4xMsLbNse50VLvxG0hag43J4BvpXXIFgacs9GnWPvyHuoy1fRcnJxLdGbM6vr
         erGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620234; x=1796225034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=PGhuoc2QVDA7809bC7L11cvrTEyYE0moHRLwootSwsJhDwLBmG1AJJC/Fj4H5yeP5J
         k2SgElB0qZAMY7vRzEb4PDhdSbG/6h0SSVmV7Z++AxU0rWO/D5So6zewHUKOO1yJilqI
         bpw5lDi7KPu2s0c5nc97tepoa2hnI9f6XCVxxFcUh6RwLPH8M6j/dOtviH/cMvXfgeAp
         ISR8vVtJ3ajluUQekEN5pjHcYGaRWWpAHcffYwkjwQLjJxnHqBTqF46AYBN3wdxfU8j1
         wT72Zmtt9ljYTjU3m4rO/Hxr7go9Yfvptn2ycshbHmaNociBOQln167VJM8NKBWuFdyN
         xgcA==
X-Forwarded-Encrypted: i=1; AL+hErGN2w0kw7eMj4A7QOe7qbNkCfIfXMP9/xj0itJYTnzxT6UdIK9DmW7AUoSJeBOfijUuNWyvPHOV0Wv0FQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IJkIZKc+/Vxl8oZ69m07fAeIXhde7VhwIvmhBikNBc9HCrfEx
	uejciF0rKopbDhaYklSFWHGMS5beitKw2HBp8If4mqEAlXezAbWZCbXd
X-Gm-Gg: AZFdTZeeU1AwWwh29uFUD5gQOHztjkw08nuSMMy9Y+sPen44MEj29jYvNw3GIwdoabD
	tq7hluK0MXgsulsNerSQ6Il1VG9toeuHvNEC0ZPvIfXP2Dt2adP5zL3rchiPbKo4MVz2TPp0qBj
	s9XwTw5WvpWZ5xQncsC96K/w45jwzUk+WJd9DEEmCZPLuRXyx6RLhWTEbtCkIOTklV9EeUHPyhp
	08YMm84tki+eXWDs/QMWA46TzXZaJsnY4WKBCtMJEnUTaArdr9ESESbcMOGvuAHa/WYBPBWpJJe
	AKMV5eKtQVuR2CF/me/AIp97iNFF6hUI6n0gxT+WuvrBX/mR7F7nZBERjnO2lU0b+2hazFshRUx
	A7nT8DmIXE/mQ9xSLaI6T5Q2c+3nCXdZ9k9Nvgy9zWKS8C/shtUfJBFNmw1Qlb0ZRy0lsXu/X+C
	4/MRJF3aWhbVBs7kqRKioF8j6sPlU7RgFQPBHFSKg7gpQV/ELse3rKraCbn993I04ntK31Fh2e1
	Y3ELoubyW/HCppSHHCiL/psKWcSx9az2oha89nbWWoq73dLkf0jn4NyMxeTCQ3f18aH3acTCOkP
	2owNLxKXe31XsutQS2KX
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr344398855e9.0.1795620233772;
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm316515815e9.2.2026.11.25.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Date: Wed, 25 Nov 2026 17:23:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 7/8] PCI: cadence: Use phy bulk data api to simplifiy
 the logic
Message-ID: <awb9XRze_e8xt9tA@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:38PM +0800, Inochi Amaoto wrote:
> According the document of cadence PCI controller, it use multiple
> phys for multi-lane setup, so replace the loop of phy operation
> with phy bulk apis.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Minor nitpick in commit title: s/simplifiy/simplify/

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
