Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567254;
	b=j/8V122qxb16s1UeuOrQNfnMNz3W3fFJ+aPcKOC9W6q1s1m0KNK/Ew7HvCS98CLucIrq
	 K1vQDQy+5fQT+te6vshS2u0f0Yb3diUOcoVWoNB87xBHz/tC0YQwM/iMr/gBuPm8qNIox
	 EUXN8dEKyPdvrhp/YFDx06deIN9XfrY8XulAUkKgMLHPJe7RD3bfgAmVBMVQYD9aDzXe8
	 Pr5stHqtKDai+wA9uvBGB9TA26NyW2cHW9M4Ky7DfD8cVxGqpf1iRJMxq0LDmAn//EUGU
	 CqxEjYWp+GCmIcUueeSblut9LUFIFagHQ6Wmcp6+uKkQS2NY1R6BA5ge6RPFvG3ntIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
	b=I9xRlZStNtND+SvNyHvLnRMYu1Phuq9MYATh2xNurS/Y9m+P2Nn91FRcwG3w8AXkxTWe
	 ypCjZ/AvYx1O+BB7tvz2XCrQttWsBrgGh1osoiJrkqcDUW2ufcm7gW3P3meNZO49durE1
	 kFMcKj8ta9BDTQLrxIv1gMYMovIjBBXLetKakn/6LWlsn5iZ/W43PEYksmoh22F1ouhFV
	 bHNlDkjpt1TMlHUgGvM3NW1+gNsXCzYYw3AGAZbyhT7pl/FwT2uifC/YAmbMtRPTD3yTP
	 XHmwfBcp7ic47Vcl45CmAuRwTuSc96vqjV/18lqYwM0Z/WfyEB0eFtRGIosW1dBYvuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fl+IC7n4;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fl+IC7n4
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so4828751a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795567252; x=1796172052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
        b=Fl+IC7n4Lg+tHoC7DTUjt0jrYC0+1zzjwqyzS3Vc5NBmJm1Yybg2p/jKGY3df7E4o4
         Zgmj/2Lg47W3ukXi9lotvOl0J4jxLui8xFzdXW3dv2f0hTVKWaqMvAMJuoIYDKdTrjmf
         7f0HSR6sgcuk091PZ1AfIgrZrZQ1OakCrUDOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567252; x=1796172052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
        b=uCxcGHO+BYT29V2kfTpOkWweKjnJPhgNg4fGW6jsEQx933bZtgdk0lerEGQ+v5obuZ
         BGjEIDc+IHGFXBtPgkkuUu+Hey/PPzfr79Zb8UK4L5ML7/vjalRzGtHQeZHH8InznmSu
         S/0/YPjGTOApLdFzfZtDrKSRcogUFGvWrpVpoJ0Cqyhl7U2aUEnqZfn5BaaAbCFTewQO
         dvcSbr7AlGs3bs7Xj++1mZ5iVuu7Quv27d2p2waIEaxr+8phN3k0Hn3p2JVQ6yTPXM8U
         yT7WKHscJ0Df7dlTz86L5PmSInXeKHBQ3h8mbmLRkdaB9VQW7dyiEJU9Dud5AdmmJRvC
         lcvw==
X-Forwarded-Encrypted: i=1; AL+hErGeRLOx3LGpEEW1vEyImfwmmulUa+FgCguPpYdwocdDEpsN60avor2F2FHayi8B53T6nTeL2wByS3oW+9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vth5YvpvgJAmE+KT3uXLniW4VwniRU45/IGdpPlCtc2mEW/Cg
	oElvHZSh8AgxBWE9T8y9yi6a5VMnqG+7yrzkx9csaAlV+MQei1aZtroF5k5SGo9zPYnqF4B5LhZ
	io+MzKQrW
X-Gm-Gg: AZFdTZeQBAar+ollSK2qTcutSDHN3nvZwH02kETcZcFIDiiVg6OOCLMbDFdVBQArt68
	Tg6Y8ys0dP1ANdQ7VQ3ol4vmHLuWEsqRyFfR7mh/VGwFhh+TUe/8Lbh3Ko0Il8U7RfW9/N0eJUF
	8RsomQtYStj7y9E+r6SHWTluBgERLfVA5jSm3a7UFc3g0lpc3M428d/uC3qgO6/lrpsWa1Lbcr0
	d5TjglsICdgv5yhwxvAFyBgCvX7BuWcjuhYDr9fKKtHV1yU5CNp566P1ElX40kMMV4Gp1DcD0VN
	Pq92fPWV0CqOsEDn+LGQY3vyrcIKuHMsrwWcyaiwwkZx1TbHKXrwmBCr4ysIioYLs9chUf9NHCo
	Z9ALVJRKmuylcsNzBvobSSTFFqk6QUGJq788LBlPyPX2NTJv/et9UCiZygp3Q73o1V1JpxaHB1E
	mNdG11Cr7wLdMGI9rRJXhvQmHY9VnndR4GCRPF7jY/tKTK2Vy94mt7DVvUsbdVkMkTDuEn2M0PJ
	d00OpS4NuluiTVsFULSK/SjmBUWLcNVZef7dDu04Vyw/cUjxpWPY/iuJOuHCPu2i5p8FwQ29jv4
	V/+QPBzgWlK40qVOAcmzwuTwX46irIdTdSQS/tk6MXLVUjISkLne/9rCePGQm/HtN47f
X-Received: by 2002:a17:906:c114:b0:c4d:288b:5a09 with SMTP id a640c23a62f3a-c5131a335f9mr1403273966b.30.1795567252124;
        Tue, 24 Nov 2026 16:40:52 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6780esm586283866b.17.2026.11.24.16.40.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:40:51 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1154044366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:40:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF0wH2Z21iPMSxYjzUAnKtKI96EowUjzMWxN2Ndy2rpYoaDPmax8FQaoPesGhH3M+GckV0bWdmQzHBIrIY=@vger.kernel.org
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id
 5b1f17b1804b1-4bb861576bemr256892195e9.11.1795566796722; Tue, 24 Nov 2026
 16:33:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Nov 2026 16:33:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WG=29qgrTHARxHRpwNNedqQAg9qGRV1upDObekVLazbg@mail.gmail.com>
X-Gm-Features: Aa3M54r4HJHXbXXsTl81DElUvLOJMM_DwqBh6af4oogcdFGi5xYSj3tXIA83QFQ
Message-ID: <CAD=FV=WG=29qgrTHARxHRpwNNedqQAg9qGRV1upDObekVLazbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> From: Vamshi Gajjela <vamshigajjela@google.com>
>
> Document the device tree bindings for the SmartDV Technologies MIPI SPMI
> master controller integrated in Google Tensor SoCs starting with the G5
> generation (codename: laguna, canonically written as "lga").
>
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spm=
i.yaml
>
> diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml =
b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> new file mode 100644
> index 000000000000..60d1e1769cf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/google,lga-spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor G5 (Laguna) SmartDV SPMI Controller
> +
> +maintainers:
> +  - Vamshi Gajjela <vamshigajjela@google.com>
> +
> +description:
> +  SmartDV Technologies MIPI System Power Management Interface (SPMI) mas=
ter
> +  controller integrated in Google Tensor SoCs starting with the G5 gener=
ation
> +  (laguna / lga), supporting MIPI SPMI Specification versions 1.0 and 2.=
0.
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets

Could you remove the "-resets" from required? It looks like for at
least one of the IP blocks on LGA the reset isn't exposed to the main
Application Processor. I wouldn't expect this to be controversial, and
probalby Krzysztof wouldn't even mind you carrying his "Reviewed-by"
tag with that change (though he could reply and clarify if he doesn't
agree). ;-)

-Doug
