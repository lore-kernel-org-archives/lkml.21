Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190637;
	b=k0xD2rcslmMqm32g+P9V48hRq5KYuWu7Zo+D2/lnjCaOMUmKPXsxWyGxcKInc/xJZ+ht
	 LB2TTywxASWqKxeTQBpDtsGNdqPSfeJxo4BKGlWQp+mIsH8AxxQF6fMsOt5MJcwXxrSwV
	 64B28RKhCIOPyogsjT3rCjYalnIguqHAuWpWOKJf3IfXQAk6uWHOwZlvWa5rnbq4mi2IL
	 SGa1VpDAb28Nmvw/QfTP4u7ah8LsIYVT64DzpWp45KaaWx7JF2S13ZhN8b0S7WevEKyMh
	 Fh34Fetwlmw5yqVrZJSuzlNd+r/gF6IisiiSWZ4osk5xbmO7K9ngIFuoFMYocLaMfGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
	b=gQCx5a9LZN3eSKY8IxHcOlHkKq9PX0CSP/2yRylBJNv9rGdWJb3AA885wGas0Mc8Xz2D
	 pRHtzZPCzhl8P4uV2rG7qYlyVAS37hOYd+JZC+jERzJ25WMpNeEBzWwVoaTDZxdLKs2n3
	 mcRLkhyRHW7rMuRIwzf/iQOXOhwR4Uh0pe4ylUPZHW7zqgnzaCZ1fOpoucksGgffbe7Ds
	 FBuGCQRDF/v6nnZ4qBnKmQ/m3WvCqbo/o0Tj/ApWA0Gs2u5xbW4wlLfEbxSkvBHcy/kN5
	 Mm0Pp7YDZJ4HUYoGtLisQyiwAx/6xkIqrbfREdgwXl81/NeawuXBsEWKM0KrB6ZR2jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hrq3427c;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2D606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE2D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hrq3427c
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1979649a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795190636; x=1795795436; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=Hrq3427cOfucxEjOLLtbn2V4Cn1I00ecESZQvbznHtS+Ajucudltlbk5Kck6unjyzP
         OmK8MbnL7Mf7FADR5bFMEwielqji3tE/hegkZl1JBYBqibn9fMx/M/kWY0bt6bCvutKF
         aBQMtnl8cZdm7a7ZsFjCMIBIT1A8QH/yolEFsIptwyyjBiF11Qfuv8TYl0ESY/4y3Z+T
         SMZbAQ50cOmBtYaZBCkC1hhEYLjpZTkyDu80tlezaOgXID8A4rFu8+EU7yDlqYusjYqU
         JlKmHzP49QAQaxUb3+eRiyMnJ5lAq7crkIfXr5wGkh2+st4AwCOhOmjwHuob3zb4wrc9
         qpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190636; x=1795795436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=gj2mPZEyLR6oEhuY1EORQqHYrWLnU5XUTDz8p17Z88CkGih8VSdtG7+rbS1N9+yiZp
         GA1aaXVWurOGEz5289LfNz52uPXGBdM75UHSuu6z+Hmc1mehMCAnQyHDoUhsIdFsgwO4
         f/p5uUmUjMJlS2PQqF0crIjImeqq8oy8TxN69xN0db79UWhu5fhVgv/0vYA6kglraXPq
         QWEhb4cWQOm9GdUQni9hsSbE6lir99Bhla3Kih8MrprPHLBKpQRPn6le200pWWrkxHJf
         Dqc5yh0cF7y5jTMgNUfx/HUXsM6v5RJE0P79cYkRAKpQnim9KMXmTGKHuC7QKVhDYdc7
         BJFg==
X-Forwarded-Encrypted: i=1; AL+hErG2IGATusURY5g2CKh4NvwbWrY1MfYKqxaap26SZn7h1R9GyPy/SfTbKW3RwZK0DhvilsKe4nXO6YO802E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x90XkVNIZtH9RzTSJWYeC1f28rEmgczXJ9FW5r2lyVDnj9RMv
	1h7MI21STQkaVTujR4edqPMsY3mq9GFJFIZ40eL8WQp1EYBjLsbeP9RtTiGDugrrxh4=
X-Gm-Gg: AZFdTZeJxMMX6t8j7FQUnM43aiRe8/WHCVhwHrmIE0Wg39kdtZEftvlVImR1cCVi0Mm
	d3A2Kq9ivQPRfMsGqxGRxXW/MtEgryF/wFaYOyKrog9MAE/eY69D5rYemox+Mz80igRJcan/gWh
	wjgEoLoJeYJi4SvA3NNlEhybOP6hz6vlNxk/PfW88HNEYOp5OCiAlubo+f0WCVtZEe/iZEFjXaV
	17lT7M+cZeRBH6yQft25K0tPFGfly8rpIQOPmwy6BI0bjOj4kJEZWJTd9+ZokvG82QMWjPwWV2y
	6gNXsKsl4Qo/ytHpC3TnBr+/TB1i1RibieOGoBo7DB6SOT2EbEPvWb1Sl1kmDHbaXWsYm6DoKt+
	5+Wvg7V07igL+LvnMRouXl742vt0z1sUAsOlHx6qxbFCTFquNbFHDGy6fmI7jzIR05zOteHhU52
	9oNhP3VnrwTSMp7oQFSPzUBYU8nITs3LSMNwcTzMppoLFCAt7ZXTNu42nZtYsj5/XaAtBTEofBm
	IREbjvEwnzuJENl9O9AP16z+0n4YbBuURynzewGO+v7E4ND2V9yKVwbmSwgfT0NkRrd/0ks25w9
	YPnIh5fGKtFR2TDIilswsPQENHPFJpBn
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr2249223a91.33.1795190636291;
        Fri, 20 Nov 2026 08:03:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm4809307a91.15.2026.11.20.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:03:55 -0800 (PST)
Date: Fri, 20 Nov 2026 10:03:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Enable DSP device for i.MX8ULP
Message-ID: <awBvaca7Az__X5Te@p14s>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>

On Wed, Nov 11, 2026 at 11:18:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
> by the debug interface; add documentation for the optional debug reset
> controls and update the driver to use both the soft reset and debug reset
> controller APIs (the soft reset is already documented).
> 
> Add a HiFi4 DSP node and enable the DSP on i.MX8ULP.
> 
> Changes in v3
> - Split the previous patch 1/4 into two patches
> - Update the commit message to explain why the reset properties are
>   required for i.MX8ULP
> - Update the commit message of patch 3/5 to clarify the switch from
>   direct register access to the reset controller API
> 
> Changes in v2:
> - Update commit messages for all patches
> - Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
>   as suggested by Sashiko
> - Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
>   patch 3/4, as suggested by Sashiko
> - Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
>   as suggested by Sashiko
> 
> Shengjiu Wang (5):
>   dt-bindings: dsp: fsl,dsp: document debug reset control
>   dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
>   remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
>   arm64: dts: imx8ulp: add HiFi4 DSP node
>   arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
>

I have applied the first 3 patches of this set.  The remaining two will have to
be picked-up by Frank or Sascha.

Thanks,
Mathieu
 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
>  drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
>  4 files changed, 82 insertions(+), 55 deletions(-)
> 
> -- 
> 2.34.1
> 
