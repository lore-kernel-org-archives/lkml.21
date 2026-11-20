Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185119;
	b=sZu25MQ7BlnkZr/jdAaIxIwhQ18/rpHy3kiHVHFnNjtck5cvi3agwnN5bT5I4sqXJ1FI
	 IrTz/pTq6E++usitcP8vcLDISW6fHOhHHQ9G+48ka4E82KO3hhVFAOGPq/JtoBEbtvzT8
	 My2dGVuCCO/x0a+W9Tukeq9srXBnQlOYSe+kNa1TiwiNm9xp71bvmdDe89kvpR/mkOM90
	 uRU4+M0JFfZESM36BcuOEfirX/OZ2PNVhSFZk8f3tFOQFB5S+Lm61B/N9HoGzpJKQkMkJ
	 ljxevGoBK7R/2eYetU0EiULoBzbyO/Otrw0/TakDj0nEiV4cWtLlEVvAoKkX4DqPi8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185119;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o7rTaAsHFk/tyQjF/KkLQG7BkQRWi0iSLzAHM4JNo3g=;
	b=H+vF+Gm6RJbtbj5XfRrSoCcdiFk0sR82yxnhwyA2ASGokIW5sbTYxExcsUBh3ZxB0wWx
	 p7+Q2jmrawdtSJnNEcNkB88xujl5Uey/pbwhAE6lvKhF110YmJFZtjKLv0a63TQ4UEQZU
	 iEceOeAQzI0tuqJa1U0BpwTbliS2n3TJwCqywDNIPVIircLJWghSsMA4rlzXGIawENIsl
	 N2DMkJfpDyY50RUIlHY+j2LP8jMDJZRB8nIfs7FIv0Z4KuTzeLpJiUSoySTaIoBKSON9M
	 34pi/tLdehPgsh9GLMk23f0xTNSyhdntrUlY5Z1CImJ2+gZZtMpd5Cjm9TEqjXF80SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJutmftZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7061C60A2618
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJutmftZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246301F008B2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185119;
	bh=o7rTaAsHFk/tyQjF/KkLQG7BkQRWi0iSLzAHM4JNo3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JJutmftZH/J1SIO05hmjDLTFCC92pR72ldIBM1PODII2oyoICOs3aE2vSDtI+hoLm
	 sXTbRAiKa5kEQNNBDEVgtVvh+Si0wBo4+5+EEfeThnkXTm0eFW5IGbK/PO3qwaBQ86
	 kJeDQYTjRLsp9iR2u3ktpc7jsVzNP6ghsP79oItpdtlHPfNZybTmL6nb2KbxJRqHql
	 nrgRFYSrPSlkjZS+df2ZJFVWAaI2+iyuN49uKEk6C1ZnGD38/QMRBV2i3+YmvkqZg2
	 IIZcCLM7O7eFcOVZAs61+5hFjNnBRd1GQXpvJOSjdyGw8zEq372hETtrSLQbMQnIdY
	 jPXJEknSOi/pQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bccecba199so896869e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:31:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE280C+flTt3sFcOhrrFNCdfeZQB4xF7fAFQmsF754nfjsAb7+YfCUl5+7AS/e9I2hKsqfN5btb6PRjWBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fOghn9SrvxPRerQHOLucyys6g6mjmXXpLykZaBcKKZKo3y/fK
	uFYOJrRQ/9lYBmLjIYGByTOrlyKRAB1T7wJEJYTyg+uXMHjwVjISip6pNliNAo8s17I1DqOeAML
	x4amHvRhP7COhDzKbH5Uw7Tc3tsqGwXA=
X-Received: by 2002:a05:6512:1153:b0:5ba:3443:aa2e with SMTP id
 2adb3069b0e04-5c1bc7c3484mr1161827e87.21.1795185117367; Fri, 20 Nov 2026
 06:31:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
In-Reply-To: <20261120125722.209609-1-paul.cercueil@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:31:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i4ybwsOKfj_LS_m7EL-AYAhPQJmLNWBm8gdZ5uvfcJug@mail.gmail.com>
X-Gm-Features: Aa3M54o-jgZ0qds3pKp74aFKU-859gv8bMIPLYPPqZ_KY6XXerlWsab212FP_V8
Message-ID: <CAJZ5v0i4ybwsOKfj_LS_m7EL-AYAhPQJmLNWBm8gdZ5uvfcJug@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ACPI: platform: ACPI 6.5 fixed clock support
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:57=E2=80=AFPM Paul Cercueil <paul.cercueil@bootli=
n.com> wrote:
>
> Hi Rafael, Russell,
>
> Here's the v4 of my patchset that adds partial support for ACPI 6.5
> clock resources.
>
> Sashiko complained about the clock names being too long still, as
> ACPI device names can be up to 17 characters and the limit of clock
> names is 16 characters; so I now name them "acpi-clkX".
>
> Note that I expect warnings from Sashiko that I got on my v3 and didn't
> correct, because they are bogus.
>
> On the clkdev patch:
> "When clk_find(dev_id, NULL) is called, does incrementing match here
> give a (dev_id, con_id) entry a higher score than an exact
> (dev_id, NULL) entry?"
>
> My answer is that you call clk_find(dev_id, NULL) when you know you only
> have one clock provided, so you don't need to care about matching
> priorities.

Sashiko has a new comment on the first patch though:

https://sashiko.dev/#/patchset/20261120125722.209609-1-paul.cercueil%40boot=
lin.com

> On the ACPI patch:
> "Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
> instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
> NULL prevents wildcard connection matching in clk_find(), so any
> consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
> fails with -ENOENT."

This time Sashiko complains about something else in this patch AFAICS
(link above).
