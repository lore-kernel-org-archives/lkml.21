Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305798;
	b=U8FHZTpxQqQw4LtF7c83oUyGBTP51ReukouV2It4KYAcWlTLU10ND+brg6JR9VX4qE+o
	 E7f735xEIgHvCI4fTLIvU1QqafQu/Gkwzuxq1XvpkpMUu7JXaUwQWzMW+V5G+aQKThUgJ
	 2VF+LCrWGFSynATIXVYFb4TCR+TZ+ZTqoyBtwWyr19mTc5F4qLkIWSi6vMDhMAB3YEfhu
	 keCMdhVPgghuCixgNWJ3u8uA25d8C0X7UshkmLH7x9E4PMKmNpTIyA2NK+NrEOXhDJBGn
	 wNuR0Vf4LoJNCMMI7A709TNK/urGCex9SuWdwA4REHntQJSMM3Q7vk7RH7WubKVXwmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305798;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rYwFnnQpoq8LFGaav+MzPqD+Y6qhmYWK6HkRe9C2QeM=;
	b=NsslcblGfIMqTFmYWLnYJNeK0gmhUA/8Rp4UzocQSMPgRspVE7MkmQPg4ZAlzuWjDT69
	 Mej8dKAvMHFGRRoZskkdIIAlKZVFVZIhKOlVzTHAnqaUGcwJhsKmzXrB+oypBmYp0mUky
	 A8VNs9JoNT9sIiuUm8/qmDWYv7rtQIpfni2qaUuuP9sAmbR17jMr+zvQ6LI9MhnV8yn1c
	 rGdqvQvvIyu7mcc1t29dpoo10d7tQm8tsNPduvkVMjlKTjBidE57afyvCPfk7Ax606tAi
	 FDG8S4Bj1KMz7tiINEY+7qh/zuCwm9yhQ/NfUmPkwyEog8kMQMF/qMogYLFF4rfnxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtJ0Z3R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA24606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtJ0Z3R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB61C1F000EC
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305797;
	bh=rYwFnnQpoq8LFGaav+MzPqD+Y6qhmYWK6HkRe9C2QeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VEtJ0Z3RFtXNNE2efuwBF9CxDfb5B95yqKPcNQxO+t6NQf2t7QVUT+e83OzRKAMas
	 Et0FX6zr/HpTXZ5u0nCFgtAJcbM3xmt+CdbOTavu7JuGUwlLBBCzSXWSBMUHF60mot
	 W1ZNteOFWWRkKFzRoukBOv18VzqXbm1bdBQSQZ+YkPx6etZg5GiT4lxSLMQVjMSGJm
	 N93oZS9RYlL4Rhdrjy/c6vsZybDkDHQd4i/Kc7D6X/edXWGCsEA7YjMzk/e3TGl26A
	 yJFtqNMD3FGLZ8qKwWBx8sP5O3wXEbjRHI9lzpGMrneITPKqXsS1KiLBXvZ7Uf1BQ/
	 74VNAmNGVNzbg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so20767591fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEmz2E8hVqKBC+WYrvtqY8dd2tfglBw7cQKUQqbRsmfBu80F52VLpvSzpBXzd6SI/WQk8X+y5X+jssTzf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uuowOrfTKEmGHhCszK1VWOrSqlCnpkYTX4RuNPECZ51c/d6vU
	9UO0CUKsq4UEyQ+NLH+p3F/vWEAK2wadAG3tAF94nBI8Y0nOZGVY8wJ4xycLeF2Gz1JLHUFpVUX
	ow2Zpep9dGp21eztJZ6qfXxw3kLT4p/k=
X-Received: by 2002:a05:6512:238a:b0:5c1:4bd9:d696 with SMTP id
 2adb3069b0e04-5c1bc6803dfmr2119235e87.8.1795305796393; Sat, 21 Nov 2026
 16:03:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 01:03:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmd=+v0c+zZwLVafR0aFRnt95weQ=_oaOaYdHUbXktvdA@mail.gmail.com>
X-Gm-Features: Aa3M54r3uff-3u27-GWxVyER9ELrI4OraGs3jCVFrFZTcTH5Wtzi-qad91fCkZY
Message-ID: <CAD++jLmd=+v0c+zZwLVafR0aFRnt95weQ=_oaOaYdHUbXktvdA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> * Driver interaction with architectural support: I've opted to treat the =
CLA as
>   a device rather than a CPU extension, so it's implemented as a (mostly)
>   self-contained driver.

What the current proposal does is to create nodes in the base of the device
tree, which makes the device tree parser instantiate those into
platform_device:s,
then each cla_device piggy-backs that platform device.

I don't think this is a good idea, I wouldn't use platform_device for this
since you can just look up the nodes and instantiate the cla_device:s
with a proper struct device inside all of them.

I think it's a better idea to put these inside the CPU nodes themselves,
they are there after all, intuitive right? Init code can loop over the
CPUs and instantiate a cla_device for each CPU directly without
having to detour over an opaque platform_device.

Devices inside CPU nodes will not (I think??) be populated
automatically, so you can add code to loop over the CPU nodes
at device_initcall level or any time during the boot process deemed
helpful. This also saves you from adding devices for CPU cores
that are flagged with status =3D "disabled"; which could happen.

Yours,
Linus Walleij
