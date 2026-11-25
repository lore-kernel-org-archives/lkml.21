Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632626;
	b=20RZqz3EbKFjqzYfMyUtXkkGK6F40jElg7WZc/RbytVwhN/p6HLkuMJ5iz6u8OWLy4B1
	 rbUv9Xh32WbyIYtGJdoj/1/8rbzmZD6YJqo7Bp8h/c1qGyGq7HwmKewG8El+jJpm0pu4x
	 q755JOmuzYJMFOfOwO1ccyyOnLP35d7HpMbAlnAD25U0fXdhSUwQBOBElLyGJ5TO2n8u+
	 a6YAOBZndcl+xcTc2f/lPriqGZ7ZSNnCBp8cg9eUmEtGL8DWJFy7KojV1ptfb7AYeaCvr
	 yTrrrin7IReZ6T/mLUe/GOx18y8W1gfcGOVVMS8PtGMYuTtGia0sSrvr8N4437DJstA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632626;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U0l7WVFvXpjEU0OpudERY8yo7FO9CgUbNGWQ7+crlsQ=;
	b=Mm/nSrCaaCv0TzGiW2ajim5RDMznMZ+xBFMN2Cc2TVM9cLS+BNgs5+VnsMoBWAKSRcb1
	 +PPcLmj9KbsnSk1kqefbKjWVgMVY4HwWUMmszPQi//7gwiEgdaxXplEdDzLGPT0adoubV
	 lbzvCtLXziFwzjDDhdvU+ia7MU+ZXLlGFbISxXmbMNBrlQPdIJedHx4unV+ZYC/FSDSrO
	 sMFs1KUXNi7tnBh7ecii1qYATtdgxXKC5onC/ySn1GlO9rVoae2oDgJRYD1V9lCZtYGjo
	 oLgdP/UNVSSz2QuFDVu0w5p5HZYp3d3nPBjdkxkFy3ku4ScW8XjVu10VGfTve7A313g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKzucNgX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD545606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKzucNgX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841501F000E0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632626;
	bh=U0l7WVFvXpjEU0OpudERY8yo7FO9CgUbNGWQ7+crlsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fKzucNgXaXd8pxmoDRYhybOX+fEH1GF5f16zWQ58OdJkXSw+f0xwRkZGh+h106zTn
	 lsyZdUpz8dqMpKxOiGkEey4VZaFgJARpIWPbueRLHDPMwiCymoeY9B2+ccd6gX0VLH
	 icAZQKiMZtWhtRsNtR1WFh56VfWn71ZHSo8kIwzBxzmY1C/ocC4dPjeHm3EVxLmMhr
	 G6czeuieY9ZIV+q3ms9S+aBWGbsjjs6bz0hgyGnDKUKhDbvg+V22DtOuRL8lLn/uuV
	 vPNjF0gbAxJOMXykbHM2BQUhTOidMTLvDH8SUTZKKaSE+3D9EhYI30WqH/sAwrTX39
	 LzmGbaEDccRWg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccecba199so5988842e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBi81V0JqOjpX+eMS6PjuAAUCYWLmtDvlZn7+jod1xAdLU+Y7QfPSAQFAuxBzRHPnAuv5zUlEp5vMelJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZXOhNR+5nWMNASO0qv/OqFQzx7I/a2IIzBYsYl1mJpiaT8b9i
	Qd7R0p5wY4uMYwy1lmxSpLlvCoQNgkoda5ZvZlKUHDpdw0zZLijTT4DglIW8hWlPdWkFK4YE0UU
	wr5HPstuvjoSmQ+ilyvWxVzAGPbg2Tik=
X-Received: by 2002:a05:6512:1322:b0:5c1:4974:c156 with SMTP id
 2adb3069b0e04-5c1bc802cd2mr6359763e87.40.1795632625298; Wed, 25 Nov 2026
 10:50:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:50:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=V8J8VJ8zYeu5f5zB8mqM1ZoOoodbW-zmP1quNXz=znQ@mail.gmail.com>
X-Gm-Features: Aa3M54pDxjkO5lpUY9qHeq4Q4S0VXapxN7M0DHf5GY2RQ8jSNk-Y0rUOtTnHVUA
Message-ID: <CAD++jL=V8J8VJ8zYeu5f5zB8mqM1ZoOoodbW-zmP1quNXz=znQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> A get of a setting that is on or off, the flags and the pulls, returned
> 0 as a value, so every one of them showed as set on every pin. Return
> -EINVAL when the platform answers 0, which is how pinconf reports a
> setting that is not active.
> The input, output and schmitt enables keep their value: 0 means disabled
> for them, and the pinctrl based GPIO driver reads the output enable to
> tell the direction of a line.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
