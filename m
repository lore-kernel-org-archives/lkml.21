Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018472;
	b=Op/p2xRoiL+wM2PB/DtxxlyYur0GFiGVWC5ZOYlGtJBNTWOwyZLqJk5Ay2lhFQ/5vym9
	 gZXq7hFHGYshxFR2gUGMZWgwOnJAo7kefo1TV+WciUl5Ovn1iH4Ysc1509W6afJQpXgVu
	 aqa/k+sRykUFgUiCjVzw2ttfRg0NXTBvYJvVB4++Oc/s58cQmN+U25/xlOym40opbYbKZ
	 CB2C9rr1M13dAoPBPKabD7XqoQ1yd8Iiqndwb+Mhc5PDVdci28DAedyRcxudcGBDo1FO1
	 SaJ8HUl8K3VQER8wXsQlMrQx6nplu72IGFAD5ygKklW6+1WZ9L2KZxMDtIqqc0eBNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
	b=tICGTievugeqEntK7Wp0ASbI/xTFPsMTwjDChDE0NQ4PmbIqZoJBly+1sDqRV1z5yv4m
	 /enC/WKJibJWda7q6VEDPGTSRXnlXUX//mO3CdW+j7XtuWfyqXu8tUkiin/k9t2Yu0Mpn
	 UuVCqXcDF+RiJbMupLKDb5Ax9QyKBd3sV363AVTWmClbgTvb6++moA/KVXTPnZRCD4f6G
	 CtDwLTa4UavueoTYaSAKEKlh7cS8kNI2iNzj2DnUrLHEyG0yDSBbnpRaa+Avx4IePpRA1
	 krWcYXdnpqEI9BBWH1o8AfPmaytyNzjigQrXVTodqWZlNWB29EboeqO7UeLddwKgXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDE1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2779054a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018471; x=1795623271; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=N8cHuzSGx59kCzVaVvnnVDk+m0o/5FzrJte3k8qYPYBAfARJ7jS1mCpj1MFBk/8ZW9
         X+OfTRhuYHACV1grTRV7ntmN2SlvUZzZLFp5CtIoyP9ooDJ5c08mcoBgez6alR64ZtL/
         9XL20VL0fme5aCnLjXWVBXb4+AyWV1RYbTssZAZXTtlL5OdCBWcb3NChgu7RSw0TRJJd
         pS+Wz11rnhsmi4o3ezQuy/xAtokMN7lW+v1CRT0nFs+ZsUlkJWacXB46MHijaOdI4Mi9
         mrskFTmQmTk9qbVPdP1K0DZsXpX+Mi3+phzqlcnyfTe5JHGMeNY53i2/JiYH36bJsvNk
         e2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018471; x=1795623271;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=VM4BRcN7/8HQWTN7ESOThbin3gS2hTTd/GxrkfhNHYSgDy3xNXAtREOj26RHYnpxJY
         nGpfuInk5qPxoLXJBh21+bx2isn9KJMBCbdteUTYfc5CjGY9iD9WrNcAx6aTCDUyKepT
         MueFEbnyJYO2UsJdVBmD2NzAUZidb84zTy18N/TTKoqvlLt3/3PXi+Ujp02FszAVIr1j
         3k1gGUFpvFSz0sHXRs+pqSCEBWfAFc/U0GD6cJtpRTnydmB9o9/N1Q2iXSqC93w0ShRB
         MaVcI3rFsfxrdPNJ+z0BNDw1VoT7IhNS8AWzbs4Hq0/bDjNjII2H2J0PS/Tu0TiXn6Cn
         mvhw==
X-Forwarded-Encrypted: i=1; AL+hErHOFaENPqXYZ+GU6zJqHiXo/Kx30nqJgt9ulGpBaznPLCWSUvUCnYKRU4OfeF1dcjfPDYbkbGbuZfa5Q3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JaZvYAxqyKQs6dDgBNXl8HAnvWQb0sUszkFjdRIIVGgOxpQX7
	MYCB7bBr9GZSBJn6gAXmLCWYkDn0usCTO0bY1Jm9gj1aLPUbPXGnT/fDqLfIK/6xmgY=
X-Gm-Gg: AYBFou3juK5IEc5Q+eVdH0KtZIJYz+Fg4V6cgFZmkoMQH1lawXqUlAZg+6cLNiTvjKW
	fqi+P7ZIdj/RUBSiTU+FS+OicMMVfWZvvv0WVwJyao7XgLY3bV4yqPNCY56QijBW7/tdljH8MbB
	G+Q+C0IJbquxfmU/yqUZ5Tt5eajsuVIfQOjKeEOmDlmjg8VxW3KbyET/+4PFHzi+wxZEduG+HYI
	KR4CtuDVEwQdZw9H1P3TgUP7x8uwZ4VgKmI1YmnIZr/v3v4N3OJgMprk/BVUtfZ4L0QxROuiczQ
	uRn7dDribiHtXRRM1Z9bIds6xyRqBUNyJ18Gb+BsYNJ0KAKmKEZ4tBydU4rhkQNUrGFJ7sOR/4O
	vmvMgydN6g3SR4ReffTdt/PNaGdFvRsIicnwUWXiiuL5bIGyfaHRtsNWykvERhUxkycS3oqA+bv
	K0kw952ldQwZYprHdM9VBRwNG957l7j3IWrCKpPn8Ipdw+6ABO621fsTQcZS3G8byV8HbmrdaD8
	bv42JgrMHKXHPNL2/S9aVXgsBicyJoAFXQN2xjXy+IidnREXByiSHt66s8mlL91qNMsyQeR8Nm8
	xOKy9OsmHiVlGAJLZrX662fAfPiQli/Agt+HnL2KZMEzWhxi1iuQdqquTGn+Y7b950QwvM3Nxw=
	=
X-Received: by 2002:a05:6402:5409:b0:6b6:7231:7ebc with SMTP id 4fb4d7f45d1cf-6b887e50d5emr2734312a12.14.1795018470789;
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef94b0sm1356826a12.5.2026.11.18.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:14:30 +0100
Message-Id: <DMYGXX4GAHRV.2I4NFHBVVJG0V@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:57 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.

Looks sane, I've had plenty issues like this before with other SoCs.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>  					wifi {
>  						compatible =3D "qcom,wcnss-wlan";
> =20
> -						interrupts =3D <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> -							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
> +						interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  						interrupt-names =3D "tx", "rx";
> =20
>  						qcom,smem-states =3D <&apps_smsm 10>, <&apps_smsm 9>;


