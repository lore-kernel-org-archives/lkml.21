Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024088;
	b=u7kOgBLhDVyg6VR4+af4Uczz4NevZeCI8zlxyqcZu1eoYscLuBonp/nxI6VpCBj3Tzpn
	 kBKei+AzvhmV66bd6bkveHLohrnJQZp2w8AvPGn8Fiojl9BcoUbMG8pKBBqIEF1YbBWUt
	 JEbpooabHnMXWFec6EwF3lybpFxOFhqJVXsx0734Ihu95CE903umtdWDJD+eWxjGuVwI4
	 FZFLVbVuosOcfR4CAF1rhGAlQivy/h2NEL0DjxXN71JXi7ChmgRrqyYGiDKAEOIS2pjen
	 oPbHWLRR/qk8Vus16XPD4ay+X5WbaNwA83uBZze6uDMj+ZVtV1bh1jiyXOoQEgXPREg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024088;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=66NJ1jW/AhT9CM4XoK4Ic0dDVfwzyueai+pMZOAeK9c=;
	b=k4KCAm7cBOR/C87vG32JLbK7HGZcT5b719oiN913YsFJfadaG4DqBhKvZs/1LNqB5Lqw
	 5VUAx7ZG5RAbtBQzlL66tPCsZdhQ61vwChMFq/aLMoUF5TehC8sXmfLMe2v2roPmpEoI3
	 RX9qHLfI7L1KR7SnaGmE5c8ome7jpZi84cfhd6BJFuX7r+beDV2Cp/ua+ZI8CBHNZztpv
	 vNWe9gwPh42OIlC0P00a6r9qxeTZVjzMk/BYGCztRQkGeOqpLpGa6XpngIdDC7EsJP37z
	 diNuQ7+i/2o9u97Ty1UgpCEdT9d1qLO1bjrCOprcVzPHwrG2dQNfM8ua1QBsNPG2uMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvpsbg3G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F657606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvpsbg3G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CEB1F000CE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024087;
	bh=66NJ1jW/AhT9CM4XoK4Ic0dDVfwzyueai+pMZOAeK9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bvpsbg3GiW1pL8DyyHaOkGWHI2MsTtXml1taM+wyqMPv2bBL1taFK32mp9IvdHpQA
	 rUhY9zZIbyCMDTsXV7LZ25mVtzsUMGXWCQREnlzGN+VcR2BhjVZTCfs2QHmxZlLUqc
	 US04f7XiPqKXNUevOCbJjTcCsCE59IEMkLnkihW7t2oD+EV8StcdTNZec5qtcuRE1D
	 3hBR52OUEm+TW1DePcflZ54oBk0mh2g+mpGVcjRBefOm4bc/3reh21Gk8E6LqLiZQX
	 w2BMAl6b9BEyC1cHGtMt7vMUqUPTdwWyz7kt3x8c4Ggz+27RTZGTOsif0mVio4zgXX
	 gLk3giaHtlMOQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1a3374400so910941e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:48:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4X6PR/p3BbJom7CWCbi4ILZkigWK64eV1GBb6MIYmfPe9Ov4sjzsj0CfxAijzUYZVS1W+cWa06PLRdtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AmCOAyTY6H+uQW4Y7wUe4dP49vbQWiV67M85dbXmksclaR77K
	7qsoL40+AcXxNHfP8EOW3YkINZrjBkMxLkGCOrX5ldsUgCXj6tZoYJHmL+AU7WNdjhWQMjRT9Jh
	DOldfOdAcmSZhzEvMrhBcWwQFQQK4AME=
X-Received: by 2002:a05:6512:400e:b0:5c1:4a64:ca14 with SMTP id
 2adb3069b0e04-5c1a9c09cfdmr1191859e87.13.1795024086348; Wed, 18 Nov 2026
 09:48:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118134445.2909283-1-arnd@kernel.org>
In-Reply-To: <20261118134445.2909283-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 18:47:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLnMxxtrtDMm6rYxB1_5jn-FpnrO3Jrb0=SmBmFWFkCTdA@mail.gmail.com>
X-Gm-Features: Aa3M54pa9MgsIMovWMIksxVnRuIk4Bq2FMKGcXAedLzc5oUdkJpdhUzMnswjYZ8
Message-ID: <CAD++jLnMxxtrtDMm6rYxB1_5jn-FpnrO3Jrb0=SmBmFWFkCTdA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: rework sg_miter handling
To: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Nov 18, 2026 at 2:45=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver is the only one that uses sg_miter_next() to get a persistent
> mapping across interrupts, which prevents us from converting the internal
> kmap() to a local mapping using SG_MITER_LOCAL flag.
>
> Linus previously attempted to use atomic mappings here, which failed
> for the same reason. I gave it another try, with a mapping that is only
> active during a single sh_mmcif_mread_block()/sh_mmcif_mwrite_block() cal=
l.
>
> This is mainly a revert of the patch that fixed the command 18 timeout,
> but tries to solve the problem by updating and checking data->bytes_xfere=
d
> to keep track of when the transfer is finished.
>
> Instead of calling sg_miter_stop() on error or completion, this now
> always stops the iterator after the data transfer and restarts it during
> the following interrupt.
>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: 4d4a2c71b862 ("mmc: sh_mmcif: Advance sg_miter before reading bloc=
ks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

FWIW:
Acked-by: Linus Walleij <linusw@kernel.org>

> Hi Wolfram and Linus,
>
> Could you have a look at this? I'm not familiar with this driver,
> so there is a chance I got this completely wrong. If the change
> does make sense, maybe you can try testing it on one of the
> highmem-enabled boards.

I don't have this hardware, but Geert does (he helped me with the
previous patches to this driver), so it'd be great if he
could give it a spin!

Yours,
Linus Walleij
