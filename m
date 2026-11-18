Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036962;
	b=ms1cliaI7O/Wd8jyKz6TgvLTLaCn4V8mAMVC5ZW8EOJfxNhdZXXizu78c1xK/R2ImZPd
	 CeCB0/Abi9KbmLqx6Bbdk3PAOfkqF19EswT8Bly/p9/qEbyHLz+bjCZIy5GOCNS+ibipj
	 WwhtFmcDJh+k/7bTxepRwtihUWzq+duJmSuPCuLnOQ0WcUprn6xBlaVj6bJ3gXXw43r+J
	 bUyxJepOgUx5upKGAnCUYyjpp0oYPmzJsU4npT+RYf21dUWLvYL9F4/XvpPwYLjb+KH55
	 4iP4BAXbJTDbwZv4Gh2p9wokAHspZSY0VyCcM8Bi3UuWHGxST3VRpjmagP++o6w9KJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
	b=xgdpa6uwkLSeK+ahParCKVzhfNS4h/OI6hdQNK0wWEvWMAep60yEEea2VC94QvTZ07Vc
	 LNW6shCs7GBKORtysNEqFlI741H8MAzeTDAl+lI/mAAnV/1H4lxies8zI78KnbwNLBJPt
	 Tsk6nlp2HsU9mx3Wb2olQV0xAHyrBV9Uo+/4lRlYndwhdaBR5mi671yM+DluJo9+mOooE
	 zDEeHtVR3fH+pZzZzMuCMPC5Ln7Ka/Kntlwe4lKCcgL/iTLf+LVPwabZsCVo8Qu3Vp+wa
	 jqRRIOlSz5z4qnj3wBTsjA+fkiv6rxPaatjYeXIGtGvlDAknpEb7wkKDv8tqoW3Tl9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TwVBLYr3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD711606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD711606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TwVBLYr3
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so14439091fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036960; cv=none;
        d=google.com; s=arc-20260327;
        b=sjfbDhwmnUAtdeqxuc/+/d3lT+MFLdeDjk0iEeyiL3gx0scjRWAb9xDMppffrsBhwQ
         Fj2G+qdpvw8RUoRHznoLWCt/nfb9drVuX5JMRDN4PTh/c6SudNm6zfwZdhBVvGqd5Wkg
         pvWuoRjBZ8KT+VWyAABsYcN+E22U3fG/JwydI/80ThqQEFqALNxIgUEtN8i7bRTWgBTU
         hgIpJs62XSkLAGMQCLysj2hjw4y9VehE99ma7xu71EPFY6Sunv8m6E21aMoX1bN2F+GR
         ahh/FjesOZ9TAuG3g79txFm/kC6n6BEVNu/UxDgnS7DplIociWHupRQhhRlYm8GODt7l
         4OFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        fh=+Jzgt3/4MrIMAPAS8vBJP30UUj1MDbdeep9Ffl9FUAU=;
        b=dhTzzwFK41LFGs2jNLUKnuwXAptxGbYutHrPOM7fj8592vjBq8MxDE6tb89+gb1BOn
         8nRZOOibasEix1HAT9Klu9r7hSdekLxkRtUhHzLodPA4uv04QvzC6JFW8PAp+gUS0LVJ
         5knn1mr1DhTB3YDTAXCBuyEMHQULJ3i5eq2WTNKvCA6UhprDNE2v6yQuCA/fDuGWoFmy
         Nl/W2piEeQxSw7qOzLVwdQehMdVp+qpips59SYz++oh/cQ46LxoutmZ0MjiLn26ibvpz
         NBrk3Moztc5nW+lbmQmTvIOIfJ4/OMQ6Z9v7SLb304tUyHdDT6bZffKzzZjPGTUIC+ER
         HCFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036960; x=1795641760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=TwVBLYr3foPwQ60U/t+biVaJU2fvwxKBOh14pJ+AhMGdhyO34J3Kx0jMypZkA1PDRc
         cVAQRdH8Bd3arTzs93vypezRQiFTZpIp58OTMnzo/cBwq+dSUTeSt44AjfvPpSTzrV2R
         PtaNbqHoD0ec9Rg72fdFgBlgKgxR3TlmKYkoLaT9L/9gf14TtpidpNZnmp8UMq/APc6m
         XQv9nlkuL0rZqEwAhSUceByiWQGGilCuEzQqyDvD7QLWpDUxJQB3REDMLvYWu0hQ27DG
         nunLHT1rxglRwBU1QTMkudlYKrJ2+Y8Hc9KD5jHTVr6luSspdKN+rvKihnaUM4IQxOCg
         dgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036960; x=1795641760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=lCjhpBmH0IDgOczr/3ewoCkZ5L2uB8Q9BsWoHGf9FdtymioGTwBEYzKLA7RsjkxWen
         aNmmmgL3CqgKhKihS5XO5mnafO9cOoAVuvum0ZqOfAT+AkA+E9UiSOfXZfrV3Gnc1UaI
         GrS2J7y3OKFbgKmi1x9Ds7rnfRSa4dakMUfonPCO2ySURfdUruL9AE8nYZIDU2+hCzEi
         vZAj/PAfr6qbfxS/ixSlc5y4LX1XrKPsZAfzG1vQxi1f1jBKSKzqaR1VFoqk3mD3sZCl
         xhAGnQ3gb6yiQF1eGm9SJrDy990OwE32lOodTuZ5naC0iuIl14aqcodi4IbCFZ4/W71o
         yLzg==
X-Forwarded-Encrypted: i=1; AL+hErG4LityESaKaqC/7LUTawmAPovjmQenosM9LIoPZTRQFMNacJyoT+bNvrmnHWZPuXgnH3ox97BORyXe68c=@vger.kernel.org
X-Gm-Message-State: APuU4Z895vst17ILyCsRvNQvdB2P26FNiWI+7e/qUQ2+dz6mdtctM00o
	fvh+CKZqb4wh/T7HVWUN1/uksPgCuCztP1fSIN4fzF5pV1z6gbj4bYCSxo55O23czew6pb9219z
	YMKVhnRARoKUs4qPZKziJVRXSy4WspI0=
X-Gm-Gg: AYBFou2E+Ng94LezDFzZcoyiNt76JnnFllm3F9lLyF/YOsOykfxXB+NEReF+UTQPqlp
	nH+ZsfwhSITxh7tgBx/WY4St5cTbf6XLquycaG41GEIhQzKgfUU+7BLQB7VnPVimm/Fx9R/hnAC
	OKNsW4oxuU8nIK5LfR4NSabuT2vrsIsI13Hx3yycyinY7Ic7fVhL5tq7bwu1Nf9IGl+rQvLV7TN
	Q3YynM3GI9bcG7spZaCHuwPxoqP8t3OUuTXQADwJNGo+q3fSNjosn1ztthANX2PlJFNRQjFYCGH
	XEM2KdwYFpfCYLRMqlF3VtNxwCquZSNm9hTIoVqkXrwURPw37eKDk3JJiQPpQjWIpxFi4FizyzW
	nBDNNIoZzgOhJMbXT3ZZs4ZRGlte+q/dccRXdLfVYyDaw76weVIEm/r1xbjb2aXS3xhbEB2qTSL
	KD6+gJxVjLtF0tfsc7vNWUi5+f
X-Received: by 2002:a05:651c:e18:b0:3ac:e304:65 with SMTP id
 38308e7fff4ca-3ae67323879mr13145831fa.29.1795036959773; Wed, 18 Nov 2026
 13:22:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116111802.2442456-1-lukma@nabladev.com> <20261116111802.2442456-3-lukma@nabladev.com>
In-Reply-To: <20261116111802.2442456-3-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Nov 2026 18:22:28 -0300
X-Gm-Features: AclHuK-Y6IDFt9qpjrJDNGTsfQL4BjSsgswFvwywajIkisS3KGgYyNt_017jMzc
Message-ID: <CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: Add device tree definition
 for Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Nov 16, 2026 at 8:18=E2=80=AFAM Lukasz Majewski <lukma@nabladev.com=
> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.

You missed addressing Frank's earlier suggestion.

Please use the imperative mood: "Add support for CBASE..."
