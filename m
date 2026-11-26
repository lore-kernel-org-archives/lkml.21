Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698988;
	b=GGGYBiMM9aZ0ZpHZEbYYu9QtSUUgNJOsFIJGLlw6xAhRbpMfnfbLv7tbuNIBtOpIxEVg
	 NoEYB7LbmsYILYReBNdIWtTecE8/Ac/0GqrRwX7KDHYpe/XqqMXCtCx9RbyWBOUCVabQg
	 sDSEbQZUjWjURWeDhV/GMSp4lq6wf9Z1LQFSgsGrWKdHmTnZiChEbhTjXpYHszYPXHuwA
	 nrjSRNbvMU3qFZBEDXMOGJF4Rq6k6/ztQN68n8y7vF96O4h1zBNzOdgzFCM7v8BOLmzRj
	 GIn7uYD3ReGprE5EUBulMl1XuU9dANrgIDcm13/S4Oh7DZAk2eKRe0uPerWONFwyuFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698988;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=;
	b=c1uleaZYI/kN+q22xu7xMC7jhvIvp9KpnRL1V5eRSL5UOrUHBoDn4b3MwGUCs6IqEr0L
	 PeUM+A84BvmxB2iSV6q7UYaA4karCcxMwnSZCCOAewcop//sCOPpcjwTmxsEZkMB4Z9Ui
	 lTqLoIjUzeE0+dXc8bnVA0fBavtqnZl7Okh8arMEhM/V/gYWlv/AxvFQXZPAHso4BnhOW
	 TzuzFawnERNSQzrxyGqBPlM3wMl+UrJUrOyRqDKcbu7KSGB3c1M8gkqUV/nPyxN4PCTIr
	 WdrUonpErTWj0Uf2hfQCxC1aNvtcjnpkvOgayCYjrs8Ll1dQrKs5uwBxkOTQtKRLuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKKE9f5t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D043606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKKE9f5t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E991F000CF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698987;
	bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AKKE9f5tar8k8WvuoypakZvL26D8s0k6EGpd3UqOtdzqxSDYv29gJS4bAfsh9R4W5
	 ErxpPkY7zEBlSd/GLqsPtCqn/dxtk25UEKb+9Af/B7NHye9g/MHeL4M0YHdCjIpiaw
	 eUmOkmo2W8n/1VZCKlbxUR/mjEz0zkvNGSEPcZq3l01ZDA7oMq8s4+bpv9+1cgcald
	 dsSivPuqoQlCXTt9a9VyuCPSyg7Snl6AQhNEpb2HVzOHjCbYScfm7yeUXRRSlZWEsB
	 g8wRDS+RYxz0XsB4nWLuw0LtKeOpLjfTZx6nEviLq+T8SVk2YNJgRTiSuz5MPqzinU
	 mmoJj8s3UJ8kQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso3954509e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGheMEoe/Uhxkd35AEWP5Ku2ALaPdIAYaTyNJo/8Egen4OuLVtN+Ywq3o0HfMuq3AReTSdlVyABrfFX9Ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X/qLabv4jtT2MDheHF64Uc44fU8BNeZcFUnD+1qv75OMoeS3c
	v+kD/cT2CvhRXQpHAJGQSzCGR4cNKhREuA539CM5GpJasNy4vhNnvI9yXSGlD1/5AF0UJNk4xIX
	Or0aOxBbsEtDOhcJqf8O1Vti6OrAOs9I=
X-Received: by 2002:a05:6512:3d1b:b0:5c1:ac75:6604 with SMTP id
 2adb3069b0e04-5c1bc847d12mr5899749e87.19.1795698986523; Thu, 26 Nov 2026
 05:16:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
X-Gm-Features: Aa3M54oPi_3zOy_RBrvdi6FjyccKcrCZDV_Tb3Dpo-BA-Pbh5aQfsxCi44RP1zY
Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:41=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
>
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and=
 SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes!

Yours,
Linus Walleij
