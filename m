Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678382;
	b=EzFFPzpZBJ2leKDV84K4SFtXgkIM9KTWQFke6zoNJ7gm1ht7FN7b8ESFYfHk6XAaaMXH
	 7Wj4p6Ymg8cE3phyXN+dpqAGWDA24+8bA75obcMqtD5qdIO8vR0/ebBZL/sa3aVLpfHIs
	 q5XdEMM8EhdEnR7TbpnULuY03J2vv+1cLxKmPTMVRo0sLYnfdgaOuy7UdyOB+IzSb3KhJ
	 sdOl3W+qPmB+QrEG4X1Q12a8FmBOZSGXOayRPCes/alBphK+2UxRnT+zVGbQ603/rEdfy
	 2XeiCFr4tBShrJPqVQAhgqPCOc+WTLOSHNgy2218JxHKD2ByBtcDm0DDj93GVgzER4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678382;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Gd5OPWaMkDUUnMjrqTNlvKgo/YuPUSfOI1ie5YD+3dQ=;
	b=1lxAjfXDOXQ7WCARtoE1mg19/QF/XLqCZJqOwOdtIWF/K8XPx3XnqMML2aNzTpROEKuK
	 yZsFTmEKstfgF6iG+kF2vcGo1kw6T15BotR4gG+4Vo6Awri3qO63VpdsWxP20v0ur1qdb
	 5IsqBE+KO/EA9iECvbGO4lOXPr7M/30p28WslqGxpYKl0vNR0YCR6ASV7s/xRuHrmewaw
	 QymTE4DTiA8uhigtCclGNVZxl2mzFzj6IquQyrtCgzPPXfSMgj6/4O9dsotQyP8LUypiY
	 I9vYfbu6Yzq9gWvLoNTZFUzhl+mFO003dOuiHV4cR96UbnIgVMCv4qnGHYdUAdyAhuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=xcIIn+Dy;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3105606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3105606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=xcIIn+Dy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795678379; x=1795937579;
	bh=Gd5OPWaMkDUUnMjrqTNlvKgo/YuPUSfOI1ie5YD+3dQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xcIIn+DyvpSiZrHpjcVsm1jQa8TLIEkIzdcQM/f7sy2L/G60qLOmQkzeFVHArEJ8y
	 9ymoX72VDcKjzEPH8eDIpaw+BP+64G4t5/FWeXfZaj+UMsKQ88TPuSEi90M0dPlpTz
	 90H+2Em+rkreoNMXAHLGtJ6ZXTuC75LcPTwG6u1F2eb5d7p/e2+jwU9MayItjzswWJ
	 WlLyq6hBgQ2zrTd4XMdI0nMQc8JuelqbfV8hZ5WFHr11H7NVEXl7PB9hEUeYJisMfc
	 SA+8rh5O3Z0Z1D0Ez2TioIcd9yBOf3cv2f3nnevbgjQdEghECrEP5XOLMT274mX/Pl
	 1EuD/tMuxhD7w==
Date: Thu, 26 Nov 2026 07:32:53 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358 VCDT request bits
Message-ID: <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
In-Reply-To: <20261126031013.27701-3-iasnezhkov@gmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com> <20261126031013.27701-3-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: f2f976825cf3640273303d75940ba7bcaadb679f
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, November 26th, 2026 at 5:11 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> mt6357_auxadc_ch_desc[] sets req_bit to 0 for both ISENSE and VCDT, and
> mt6358_auxadc_ch_desc[] sets req_bit to 0 for VCDT. Bit 0 of
> PMIC_AUXADC_RQST0 triggers BATADC (ADC0) rather than ISENSE (ADC1) or
> VCDT (ADC2), so polling the ready bit of ADC1/ADC2 times out unless the
> channel was triggered externally.
>=20
> Use the actual hardware request bits in PMIC_AUXADC_RQST0: bit 1 for
> MT6357 ISENSE and bit 2 for MT6357/MT6358 VCDT (matching MT6363 VCDT
> and the MediaTek PMIC AUXADC hardware registers).
>=20
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxil=
iary ADC")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

VCDT timeout is gone.

Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6358
Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman
