Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202431;
	b=ACqCh0NfojH/ld+I7IvekhcT4bZbv6WUaTGDVa5PEOOogQbudW4kb/jIX13Hwv5zDBaK
	 2InOse2OhxvHlzlzVsvxMHumYqvhVcYOZ55vOkOvPpV9jZZXp9GtUhWU2REh9cmVa2h/E
	 koP9zSrIwT/YtfgfmFTpa8BsRIk14oOGxSUww4cYUdqSkQxhe4ojBZocuHfpDJhTN9TVm
	 WyrA6trmwkZuf8hcHtEhMSUAVIwWF42NjF+jCjTpT0Oh955JIh+VBtM31Hnzr2eEYij4K
	 FBfzGOEv5KsEQAS4nBLE0BxsJ8//RdQTEtzWaHO0bCVRa+8i2YqZtxRybHraAlzJhaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202431;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CGt74ZOOnFG2eCZ0lYW7ExbTFT5kX6Yx4uY/hjMbYAk=;
	b=Uxc2GAUAcGL2H39T3wh6f8Bo945zVbZJ+hclVzd1t5Ylo9tUJCph1w1Fk6oUoLaq/jId
	 +SaiHihH6NymBRpaJLJkcdyHoMEibYVgTgV30Yl3f8+iiP926Oxi3vSyAVAWGR8NIZOnv
	 apRYdNwvdthdOzPX7lEbLB0jRU6DR4GOUdlPGHqZIJq4jIp7OPQS5E3HD2bwQzCFXFHBw
	 gMujUD38gtc3zfREYwJCJSOanM+oiZ+urKNwNIekaQfhakBIrT64gXoWujpYCQQe82iah
	 4QdqQ8FVtdHsZmbciP3YBzp6OspLdERBpR1CsA9/kqkYHcrXuRY3am7a0YgMgObrO/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kam4PZb2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1A606A6FA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kam4PZb2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D821F000D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202430;
	bh=CGt74ZOOnFG2eCZ0lYW7ExbTFT5kX6Yx4uY/hjMbYAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kam4PZb2H/zjoJMM1oX7yBXjvhxEvkMlrlKPrJcTq1wCLIDmVPKKnUD0TSmD0a3Rz
	 EBzTo4X161eXach7E6kAFRhihoFrWab+P5NrspVJAO+kz5HrgqH56SDIpZoEJaov3Z
	 zg1SD4hyYmLB6OgfVdLyoG+Qb2BRiwvSz8PFFAMws/xuykrIKQByGMQ/cUpFpZGBwO
	 9bxPvwaAxvzm5kK2X4IHTaHcjs/qkPcznbTN93/5+/PQa78NiGweukIfD9F83PT48U
	 BjcaRG88j52Vhr8mCzX7EhQfUfHCgiEOofzcXj7eDmcYG1WlZbDdMhJ5jXoovL9GdX
	 ccEtcOIOjLcFA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c15956ce07so2207574e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF9EeKUE45sw+kMxjEXi9Wj0Gucp9gLwPA89gheAGxo9XVzebel5Sq3309TCcn9PxGbuxHFm+QdJ+o6daQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZmO/octDBYvN29LpD3M9T5c/AX1MFpIke3bJkVU6Xz1EG/mxI
	wQve3p4GHxVuwagMj8SVZPJaoNUpbbvRkAYr5+Ag/NG3XV2NaG/qF3QZiaD7fC4U/+uUjaEXXu+
	m2dqyb2dWs16KSSu7kXV+28gXLf8OzBU=
X-Received: by 2002:a05:6512:a85:b0:5bf:d9c1:58d9 with SMTP id
 2adb3069b0e04-5c1bc8ceb91mr948243e87.23.1795202428902; Fri, 20 Nov 2026
 11:20:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118160938.3057738-1-daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261118160938.3057738-1-daniel.lezcano@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 20:20:16 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jTE3wkhhzq+jaB6hf_mccJs-gnzh_ybHnEG+w9fE3y4Q@mail.gmail.com>
X-Gm-Features: Aa3M54psGHgM91W_CIYt0O2I7mf9MBA_w1sGTV9SUtWNtSiP3ex4DGUgxa42wro
Message-ID: <CAJZ5v0jTE3wkhhzq+jaB6hf_mccJs-gnzh_ybHnEG+w9fE3y4Q@mail.gmail.com>
Subject: Re: [PATCH RESEND] platform profile: Restrict the core prompt to COMPILE_TEST
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Mario Limonciello <superm1@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:10=E2=80=AFPM Daniel Lezcano
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
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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

Applied, thanks!
