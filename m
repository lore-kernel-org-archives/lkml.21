Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999082;
	b=E2gEqLfDp6X8k2NIl4cchlnJ10QurVpT0KWxOh6gss7FOppQzUYmSAR6Fxax+RyQ78dr
	 GuKcARNLo1pztqIBeAfgurHKmcV2DoZfGILZph5XTip7heHh+wTatpE94eK03JwfLcHDZ
	 iCYpZP+inRkOQbf17Mvky+JGhVuW5oVdt54LSfi63GzHJ6RW6syof4henaSg0tCtm0PEF
	 ZVKUiFjWlOMCBDFyTcdaX2MemmodwjSv/VZR//chSyyiZjHxv2JaPQW6OuvUUo++fnvjO
	 VIBTC88GVfD7OICH29aIctmKlztm+Fn1BywSLZefL3ndjtTsdv3GH4uBNtjQe7qcRfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
	b=28m1roQqSDwca1Tq01+NNGbIXraSLtmm5Q7KuSIM4orDIqaqraBusGPBcFKzrO6xxjzJ
	 sEnfjNKX0xumRPwtSWNWh74mPBI2k8RCKlIh45/x5mUciUPXpirYZLRSUbKwI6HSvVNGW
	 IBOuhvd4NCpVteW7S+VLwbg7/qm/Fwfvwr8uJqHdgsW25ceqDLnMK/uSEeOdy/9wh/lVb
	 G+Gu1W15+pIgpdPMsgY1+2y8pJOc1K4q88cqYBr8I5YqtDS32bqBMKpEjeTqB0JHL0p4i
	 cvw/XQk8e9eEzEvUJiTS/FWu2a29U7G3l0GVUYopJUqz9+oKkpwWThjfGA0q/WrlUEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA7A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso2270178a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999080; cv=none;
        d=google.com; s=arc-20260327;
        b=gKOv6haThkVuQB+97qvevxhcm+tGiN+93kjDMjh191EI4zyw8nNTZFC2eEe9fxS9xa
         WiDU1sOP2gZyfKJOHlce/wqE2Y7JKoEdb9Dbqhbjb9nLO4c3SCvsgm80Fq9hrqhoP7/U
         EIB7aPLk8ZE7OaUnokbP/14TVWKPUVXUx7YF0dUvCPnnkn3EXTf9ZwtVxVN/obRd9z0I
         drPasvi+Aah+E2TSnhLBli7hOsUZBRSqBJGd+568wjl0tlBGOgiLL3Mh6bPbFbdINgQP
         BvTdYpV4yUuKLWs1RJomYAvulwC21gd4W1i3QGR55fzy+pW+Erw8bYsFok7ipZ/RIj43
         VM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        fh=CzyKT146JHbpcWuvOpA+gJJDxUNq482aukslTQ0BFxo=;
        b=FEn71vY1z1VyQ8TgZUXw8P7JHJtyEmW1ULygY27qAk9o196pIvxK+0RBzAXqa1qrCT
         6ybpHRcqI0J2hEsvmzEBCPMO/FFp1kZ1Uiss4Xf7ssVUPdnhFbxWpkNa36Mmwi+7OOP9
         A33jmMneKLFPaNTB3BsCJHYvPujQ9cV+708lDQ1JvyzV8kR17YRuwuwgYsHF2SHfsaMm
         NEljKKZSQjBfgzXZKc9iGelF0MdAMMJAZWKVvnNprJ79PeICJ+gjeN0L2E6XM7NBybXx
         +XuUkHel2jYxsGUFIvSg34bl/P6QkI5vZmf+53v9x/wQPYL55ZN64GZVFqSk9AfM06s5
         nsmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794999080; x=1795603880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=uzGy7acL7JuuRoYHzLCV05CAVl256ema53eZwWGcIfsJ4ScGO3EcF4VCAxcAkoruNC
         wU6VGwNFXzYXBni75pukdRy1iA4xaO096szSWrf2aN6iDVGhs59LzMJwxxYbPhru7CJu
         9fzolDtFEd+ybxINOVJ/7oI48WxDFqdb8pw3SPTKyU0zBdypMFGcuGEo7kojCBQ0+OWV
         z4lftMdE3Tinu0jTJWiy8vAgPZEr1elRKk4fKNxpPDTdNow67v/0gQR/jezZDRDQSc18
         PEeioPSLmy14kn0e16zukPCiTWmvXsqU3wfSZHBU36kOatBY6iBDfcEgUVdwwHSQ7Ucw
         N04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999080; x=1795603880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=f/rf/ZUhI4JcPibmU7Dk3hIi/CEheXpYoGNA6gKLS/SFaVAiUgsdUF34cOyMTPTaGS
         tbg+s58kXOJabZOofpdGaSR3d3i6nDTIInOgxywxcUQZZ6DANdRXX4LSS4BduUUUQnER
         e8+7b480134i8BYrE4gdwuw6NfPieIT3IQ4zKBRf33ndFrSBHouebYoa07xzO4VKQrJ5
         52HZNIdr2LgcYEE28IUCBBpIEM2iLCMabW9vhLlmeBIVK4Rq0t5WX/nSE8kf9nQ5fP+j
         x9Wk2OTBiyYNwvRltZcnhiU1WoZ9HgrvQM24ylKVsfhtln6uMxYoczKz6h3Zpy7KtnZ6
         g9mw==
X-Forwarded-Encrypted: i=1; AL+hErH1c4CAeJpQzC2bF1U79/VV2w5Kjwlj7Ckf/0h4jfYIx1rS6s81kIivZShxMwov9elwIWtUBIKZn7UX5Nk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eVo/CtfCqTiev/rak0BDcrd99OhPP2w0WaxECRls3EwL6bKGt
	iceZhq1OxIpNFWMNYw6HL0ViDdY3p9VvRfSM0ePex7YnjMUfZZOv4/FnmfLxINL/lh6NZ78csXj
	Uc1iLgO6DoybiPv2CN/IrYGyy6A7B5xoU1veUcLMfzA==
X-Gm-Gg: AYBFou19+Fa1CplxFulNnoze2eoR7MZyX70rlAs7mo86XFWRKLkeGQUNx/O/savJ4c3
	HAciLJXbYyWSl0334r8geDo37w1HPYAKxKvqJ3auEtuiJr8W1H6bqWJDQAX5XM7IdYmAvS4QNXW
	wUbt3fj60mVR77aVp1s78WqcRo9ZuhxwiCsFqmfnJr9eru2BiCgUTSx74K4NrQobIhIQTwcijRl
	8qKsMOUOShEi1pjHLkoNXtYBG8+cZgyvPdvtXnHXampKKUzkKrXqdsGuAdPiULKQnIGno2orKSs
	H0gyonZ4+bqkvGRAK+vwIfDSCGkrBg+waD6fHlQBOlGvdOxtEr6zpjm6qEWsJMrobPird+QUvhY
	ISlLwJMCImDDn5yqi/jXXQUm2APy3tB9UkWYP+LHGSyoU3/u/9uIzxyYnGzKLwAEozxuGaE4=
X-Received: by 2002:a05:6402:a513:20b0:6b7:a647:d6ec with SMTP id
 4fb4d7f45d1cf-6b887f0d11amr1156171a12.5.1794999079857; Wed, 18 Nov 2026
 02:51:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Nov 2026 10:51:07 +0000
X-Gm-Features: AclHuK-Y9_U7OVUZSj7mMfHViEYJaBBmRFeKE5RJI3gsS9G5CebJQE_OwkvnRns
Message-ID: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy Note8
To: =?UTF-8?B?VHLhuqduIFRydW5nIE5ow6Ju?= <nhan.094.vn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tr=E1=BA=A7n,

On Wed, 18 Nov 2026 at 08:43, Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gma=
il.com> wrote:
>
> Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
> from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
> 8895 SoC and a 1440x2960 Super AMOLED display.
>
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
>
> Signed-off-by: Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gmail.com>
> ---

[..]

> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x3c800000>,
> +                     <0x0 0xc0000000 0x40000000>,
> +                     <0x8 0x80000000 0x80000000>,
> +                     <0x9 0x00000000 0x80000000>;
> +       };

Does the Samsung bootloader not pass a correctly populated memory node
for the device? Or is this required because UniLoader doesn't pass
along the memory node it received from the previous stage bootloader?

Peter.
