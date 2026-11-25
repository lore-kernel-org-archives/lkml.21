Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631641;
	b=TGfzq3wuFytNpKdOv2aQTRTMGI2IJeXuzCjGaDF+L1tJpZCkQj38ShnmkBESnuVDS82+
	 ZMju0GtCbTTgF6Qx/+UiZdF7PSlEvEVsr38fdJTSPOlqwt9EwuoB4m8mf3YXFzyJHHvqo
	 4dBx1LIGk++Bzq2becE2fGtGuib0jaJaUQOUgCNJww3myh7KfCN7Fzk6kaBm1hVjqGuwK
	 IGGTuqmVM7eA96FNF6EmL3MAWKEMOLsEYmJiaQtI/Ga9XbU+Xn0pHPAm+JOpplVsRBWFU
	 d7LwZ2TPdMTZENn3zk/Bpm8QUegGGtN2Y1wgWcjraYBFMJZrLB+OTH8DZZdSSXYrzMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631641;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MZOn7cbyBZCKner9Io0gV9Z7rV2XG5FimTAg+eegkQw=;
	b=psmcHm0MRtcno+Y6NnZCWnSpQa13ORyQdv2fZlmiZejKAVdPOyOLlydkwOXWesOT3wxA
	 NtXgven1Dr6D9HyaJMh2+dYIVd8X6Y7ab7nsw4k4rXnSQYsGI7eV8Cm8PtVZjfdUFhEom
	 kgJ1HX/HnymDAECldn9AYexvWvvJ0LZkvx4Knpt3ERMHOAWKka1HeYei3WwElEliJZQPT
	 xdE8xqlGXgyST9l78BdLsipxP0E3mdwMQkZVS9ASTYPV+PSAuApCG1qalSYmifxhjasK3
	 DyXsw3QfSW/jLy/qB2TF5ZQHDZ9+GOX9I6jlkHKnmihBJZ8iK9uS4C18sENvNX2/imw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMR604Vd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F0606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMR604Vd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379891F000CA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631641;
	bh=MZOn7cbyBZCKner9Io0gV9Z7rV2XG5FimTAg+eegkQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gMR604VdeK3XkdaruPCZrrWntH8ZkluWTq1UEz1VzQEDYndulZ2K0orM1LCEeXm8R
	 Sdg6hQ97QvJsBIZUClF2b9BGXd0m/GCR3m5rsYPmmE/mX+1BK1nyneigOjCdPf4h3+
	 OfVymgM031W1ZopRBlTAWmOC9mwIa9Yq1KpzvcUBHkqfy5yItIg4lFiW4TpakH27Vi
	 zArSLBcTb20Mq2UFvT/fkmC0LZ78HTaLbT97cgiu3i/L3cWOfLiR5ej3uUXEQifyIO
	 qKx+/wwLkj/3jIENXBKu4oVAdMTqfLume0cMIFm+9BsDAGFPgXwXO5QVjz4irZq6r5
	 7H3CawIi5TT9Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso5100474e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrNB62Bx9jFOCADtOWnEucX6AYPlf0kIH5EFoU94kmsRHn0zMo7yZEE96Vtoov4omCw/HLpS3WBJoT79g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tU10DpJ+FrwK17T50NMHZLlu47F5FFMWbSkzcCB2hH03Sh/gZ
	WDa3xvwFubyy/bXCrnJ7pgwAMJaQ9ubm9rrh/CgMXQXpAmwg1QSqhrLO5usXpW5X3dEDIOjLuNv
	pbxzZgsxADoUk3QToGq1HiPrkbuXi5HM=
X-Received: by 2002:a05:6512:3d23:b0:5bf:f76f:b5ff with SMTP id
 2adb3069b0e04-5c1bc8c950emr6241358e87.52.1795631639987; Wed, 25 Nov 2026
 10:33:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-2-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-2-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:33:46 +0100
X-Gmail-Original-Message-ID: <CAD++jL=yx_=j3Km32AqKmQ+JqKadcCEOBMBs3R3dVvhS9A2DPg@mail.gmail.com>
X-Gm-Features: Aa3M54qJrAjbkPP_s3DSmoGNUsm5bkx7wv6GpF9Uaxblh2WXq34zjRLrGUaH3NM
Message-ID: <CAD++jL=yx_=j3Km32AqKmQ+JqKadcCEOBMBs3R3dVvhS9A2DPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] pinctrl: tegra186: Fix out-of-bounds register bank
 index for AON drive groups
To: Lee Jones <lee@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Aaron Kling <webgeek1234@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> The Tegra186 AON pinmux controller has only a single register bank
> (nbanks =3D 1, indexed at 0), and all PINGROUP entries in
> tegra186_aon_groups accordingly specify bank 0.  However, all 51 AON
> drive_* macro definitions pass drv_bank =3D 1 as the final argument to
> DRV_PINGROUP_ENTRY_Y, causing any drive configuration read or write on
> an AON drive group to index pmx->regs[1] out-of-bounds.
>
> Update the AON drive_* macro definitions to use register bank 0.
>
> Fixes: 542baf77f092 ("pinctrl: tegra: Add Tegra186 pinmux driver")
> Closes: https://sashiko.dev/#/bug/linux-a9a7165c-c5eb-463a-b7b1-24a30416b=
33b
> Cc: stable@vger.kernel.org
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij
