Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629370;
	b=fwxx6qMRCVWZUPj1xU1p6gPBqNBKVFc4lxP0Szs7V0BWRPrypsGuSk90ixm1HBR79Qam
	 BK7wMXiv1SGxD2mgnfZNAXNJJu8hYYv2IL0+kLcXErfo+vvVnONZlbX3ojOo7+sz/LCDK
	 8yLrfIokzRtI2wPcLWSYzzlFk7l5YdyJCRvJxpgRfvdtNUldJACjHqcM7YvU48ck/6HuT
	 j7ENXD0Qq0sbc8TmL9XknhiEw/tBYOUhSa2RQkgtVGUaX1fr7OSBM51LeBIQOwHdYYSb8
	 vPkVoIzAZ5GqX0cRiOrUvFoAB8vO669V2zxnJf2/qUuSgD0CbgvWcNMTqlWghD1QUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629370;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f6MAiA1tU1RJJu+ItJqpHXoF/3Y5pGSsfxpH8J2NIlI=;
	b=n909ifCcHmhC9CxfuGedx9a+yIcQEFaHpvEawyaJX+dr2/0b95kGPz9BHK9cpdKytYwh
	 P7WQHPZglwmeT07BH0Sf8vGw1JFEXyixnsyqkDtzrfi7EOGFB9amXR1E/Y4GEg63h7a3U
	 0pPb+exrUsUnCgNQezFO5bRGDvxbf4vCNR/Z0lqJoNUM3YtZzsWiOHOFR8lq11fr8+37s
	 YuTKeRCCmaNSQMw+jlxE57Ecm0O/FfW1Wmcdk88+luOlXAL2SEqm/dmPfe6713JBiO5Cr
	 nEfqJZcPuU/1VXmmx7clEA7s/pEjQYQ+Jrt8U71grYCgB3FaQpKYEu4qKEEVg9+vVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdCA8uVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3058D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdCA8uVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83A21F000D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629369;
	bh=f6MAiA1tU1RJJu+ItJqpHXoF/3Y5pGSsfxpH8J2NIlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EdCA8uVXpEv9BZg3IARiIxS2TGFdf/0pU6w2bbaZ6J2fa1WOjohRG6rSSL+NbzURY
	 pdrhlQHSTEz3ZFWI9kjxMLLehB0/0j5j1TugO1Uwfu2JGk7OPfbNP4+S3WgHpCluwY
	 LCYODLBLao6LPxMuye8LTlcHxke7A+p6m0l9BZgfnlOzrjZSaa+Bo1dQymqXVi+Itf
	 Q7Ylz5XdKdid0JDfDQFHtSPPdp7JxpCzPEOv3q6MG6VJKIhjZYeWuQBkjkW1UejyHp
	 2gg+2LNbbtazFtb1iZwAR5Rbx+D/cwN94WBt/mW41H9y7fFpAf2X8kXLrpxjo/iVHF
	 j2IelscQh2hww==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so47748501fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEYfQpC35Vp9jhqaapcbAGjnV9uwhlWo/THHDGyDMcDYFjsdWLblqcEpZSy3Jul0bbC1OFr4ZTsYgpqLBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NUvrvtlbfsYiPSUg20ZM85U9fZVW+QkB0B5BhtzvfT63S87l7
	jUb+EWCUAr+vko7xX+vwPF3ch+2hpgEOSSXnf3YZXuyCXUHFwAIssOq4IsILqD/BhvT0xWxDG3n
	U5bQ0JcNrPujPv0kih05mrlYjFF1EfPg=
X-Received: by 2002:a05:6512:31cd:b0:5c0:b5c:4052 with SMTP id
 2adb3069b0e04-5c1bc6819c4mr5241312e87.2.1795629368690; Wed, 25 Nov 2026
 09:56:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-rk805-pinctrl-alias-v1-1-e0c6cdd5b823@iav.lv>
In-Reply-To: <20261111-rk805-pinctrl-alias-v1-1-e0c6cdd5b823@iav.lv>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 18:55:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLn=+O55bh46owFdqb_TvQ+9KYfpLp6afsrO07v1JNd9Fw@mail.gmail.com>
X-Gm-Features: Aa3M54qcfqetMqqeazuNtJAXHuKFVrLAs7ZwHievoGEVbmIindCmaMEjBUdUnhw
Message-ID: <CAD++jLn=+O55bh46owFdqb_TvQ+9KYfpLp6afsrO07v1JNd9Fw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rk805: Add the platform module alias
To: iav@iav.lv
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 3:05=E2=80=AFAM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:

> From: Igor Velkov <iav@iav.lv>
>
> The rk8xx MFD core registers the pin controller of the RK805, RK806 and
> RK816 as a platform device named "rk805-pinctrl", but the driver has
> neither a MODULE_ALIAS nor a platform_device_id table. Built as a module
> it is never loaded on its own, and everything that uses the PMIC GPIOs
> waits for it: on the Pine64 ROCK64 the gpio-leds device with both
> LEDs stays in deferred probe.
>
> The other rk8xx cell drivers (rk805-pwrkey, rk808-regulator, rtc-rk808,
> clk-rk808) carry such an alias. Add one here as well.
>
> Fixes: ea479996c79b ("pinctrl: Add pinctrl driver for the RK805 PMIC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on a Pine64 ROCK64 (RK805) with v7.3.4 and CONFIG_PINCTRL_RK805=3D=
m:
> without the alias the module is not loaded and both LEDs stay in
> deferred probe over three boots; with it the module loads at boot, both
> LEDs register and the deferred list is empty.

No reaction from the maintainers so patch applied!

Yours,
Linus Walleij
