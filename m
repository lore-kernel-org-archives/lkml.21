Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017538;
	b=y+2aRWf740L9bQrZK7qLUx3ZJeHubn4bGe8QckKC0kw5HF0pszrwqT9nWWDnJ2hutkVJ
	 uIFOQb3Df5Xd5Xc5wyfS7vQeIPUOWdqA/XMIXPRczJSoY2HsegLSVjkLIwaCKrZiODLUT
	 /VG+hsSAIFffPPXskgvM/yp6T7bpMtb4mbF4wTV+yPWLwZak+Oxd+oB/FFEnZBXiiQUDn
	 ZzB686BHLCkf63XHMlNhMqfsjTMoP/uMxbplWncnzE7V78GrIjE06vAwFybRlERbzWwFc
	 dvuU/pbyE6D0aUVZifm302+OWWjUJBnoe2lzIR7eUWIm9EJLY7o2L82+5Ycm7gcVAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017538;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BjVtTxWTWbWk3c3Tvkvew/x9Ogn90CkPtXLG/jSIFYk=;
	b=Kwvm69YdNffrPVGj5A/GqKCMTHvWbL9WRi9LYytiziEkYPaafyr8Y986j0imTzUXby+X
	 ALmV1Wle62Poi2OS/6XsFDnDlSti4nRYO4WjzlwwY/deo6UqkK347VSVWmPHeCgzTi8tu
	 nJFoa4wmt5VHHawBflTLFdt8m4qfAoCVU+4OxtHZx4h5QM82LADIZQ/GNexaIcUrxAUfd
	 mulS1Co67bIZVDAFKDZBpikgDAsrWslV141jdui9rCHC413r9vsX8/6FwmDZDzw8NpZaL
	 BoA/rHa9IEaTSF1alLWlozILaT27/bAmOFOSWwO1C2AxKRN5NQtYJB1XOl+x8VixSCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z51MeUZQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDBB606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z51MeUZQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B7B1F000CB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017537;
	bh=BjVtTxWTWbWk3c3Tvkvew/x9Ogn90CkPtXLG/jSIFYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z51MeUZQ0ty809N3W7KygYjwoUW2Uv40b2Z2ryIAefwwGuFTaYS0+GicCvT1vS7AI
	 jx4GW+kzyfmXNkCfX0ymE+QnvyuFpskNz0AuVkSfPNJOJ8QsrCJpoaJBPXrJ4IohEQ
	 MgHWULBYpFFUDmUgagdtwijR8E9xhNYBuyUOlZQh+yacZx7OCDzzb4cO3HArPmuR2I
	 MmOkwZHhmcLe18vHWcteQpR+ZS4/YpOm8x9Ou6xi+cCAwZZBDL6LX9XRXt4BHGptGV
	 vTtGB3WmvVpamsR6DLguZzuH6+bldhjwM30tTXRCJfcn+yQWCFYUAl7JOumF0e256w
	 qluXcqijGGeaA==
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac01ff101so414604e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:58:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH/ANN9fEeK2rXsQkUDC4K/L6CNEWw6uiJSYqmglcuEdsC9p7jA3Y9FYKS5xoKlqqpOwsXlSkZ0h/yGTp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ye3d70tYPL3esPqv2ecznBTMZAyqSGoATbuOTkmWQWhD/iqGM
	2sGBRHvwW8OChPqlVWC6DreB3pWLfJA9fbmrhLV5GWhpRIWnJvRx0GsPQmcoGm+tr9tIgdVtqo6
	kTS+vVn0qdCqutHCqwoELR1XiMC2bL8g=
X-Received: by 2002:a05:6122:3402:b0:5ea:c9ab:bd86 with SMTP id
 71dfb90a1353d-5ee64769413mr1300988e0c.21.1795017536941; Wed, 18 Nov 2026
 07:58:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 18 Nov 2026 16:58:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i7iCMm2oGXdVc-KuNR4sPxELhZH+p2jP00MhHNS8XOWw@mail.gmail.com>
X-Gm-Features: AclHuK-mgte0qKb39qkRaJk8YlcbbF-Kjv8Uvh0O-fTaRyL1Vtt2XllbFjRWpyc
Message-ID: <CAJZ5v0i7iCMm2oGXdVc-KuNR4sPxELhZH+p2jP00MhHNS8XOWw@mail.gmail.com>
Subject: Re: [PATCH] platform profile: Restrict the core prompt to COMPILE_TEST
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:03=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> All platform profile providers select PLATFORM_PROFILE, so users do not
> need to enable the core explicitly.
>
> Only show its prompt when COMPILE_TEST is enabled. This avoids exposing
> the option in normal configurations while allowing the architecture-indep=
endent
> core to be build-tested without a provider.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/platform/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 7270f24a3b6e..1cf87904afc3 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config PLATFORM_PROFILE
> -       tristate "Platform profile support"
> +       tristate "Platform profile support" if COMPILE_TEST
>         help
>           Provide a common sysfs interface for selecting platform power,
>           performance and cooling profiles. Platform-specific provider dr=
ivers
> --

No CC to linux-acpi.
