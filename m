Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611061;
	b=QZxEFV4oa29Cecy46GF8jlKFuNNWswuoB+vO2pgmS4/tWpf9Zaq1RJAw2WJmDYN5WQbw
	 sLoBnmZvtzSUx1xCaa3VzVTmb9BxUZScukdd90MT4QO1QgMS/yTz5V42pZyJooU63eC7g
	 q1VcH3FpFxPlADnuHUqIMnjJyuZx/RIgYa+mLzqaUQprdkOg7WQWt/EAcLR+CzTnXbpSt
	 6NXA2r1aQ2f/rkMSjbTX5bViaDPd3+696qPK0RD4luUc9gdGa0KpJbzxFcuXmHN0EJNEW
	 PjGMg4ASyc7+efEGtFyRhyv0Sd+Pg2fPFqt5Vtz9d7KFIFou41FmYTFJoned4EsDhMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611061;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DyEorIb3YQV9W3rofRkOYXMRRHlntcXL31fCsbNM/3A=;
	b=0W1SMxNgAU5wuLRKIkZ2vhp0oWdM+ItLzt7nDBLQE/CkGSERPW/TOcmkBfkK2LRY8RFP
	 k8cbpOQZVroyX0wY//AujCA3kPq5sEXGb/z2stHqlhSDqB9ZdyueaAGaD7PPnTjVPqavj
	 jbws7BWaGAOOvcgkz9oql0LoJBo0QMu3lbbzvFiousJ7Rf9sWHhNjw58XGtEhXQ5N8R74
	 //0Utp24uIHXtp26/1jC6qTiyN0MogtR4aZgjxgfL5Q+jXyimAeJhv/ijEQnDDOGCZqrO
	 QUAsofIs/IiqPgq54ZQ/8AALz1ee7igU9W2bTSFv8ZnBJZptTXLjvdidaxuwvw/HUmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwYZU3mw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C7606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwYZU3mw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17D31F000EF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611060;
	bh=DyEorIb3YQV9W3rofRkOYXMRRHlntcXL31fCsbNM/3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UwYZU3mwA9JsLehwkXz8XAj07Bh9/su0TBbOh70QrX4w76x7+3sHWj97ycEpp1nHc
	 Kqcyrn3I/yVAajGkRe+YP9EUwGQu2aN03YY6gExBjaWOLX5CNsUjKYs2+ekwlN2JWt
	 1n6i1dI81XbKyGIH+qjm1K+Hxn2NlwfJiL8lQ0IX0ONGKT4fBMgRVHMHfAJx6+c+7G
	 ynBLIKXqp8O+hgRKS8hVCFwpQQg6QefloW0iLgeO2xQFNjO0QAU95r1e6kRFLe42Yu
	 sqCR/JSySOep4mPYXx4Pd1qXSj+rFv9dcwjG4b3A96342s7ePdYRLrEooCDv6n/PT1
	 gkWiuT21XXoCg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so5247384e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:51:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3nYTDajcL6qxevfSGJlsPidOLxWCZMzC3B1h1UWXbEp/oL/7+7x6THNPpcWDf4QBvnApMdmm0oGiCIjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7e6lCpcHsfNFt224IP27MBh5LmfJPUHgCEdO5yALtQFpGnNYw
	LMc1lsFgjEtFlTNL40o8jgFMBbIlPhVr5Bqw4igShHY2ISjx5P4oxabPtqj2pJWNn2t55c42zEv
	ts8u0zIFQt8pGX0ziJ8S6Kiam5LraWAw=
X-Received: by 2002:ac2:4c54:0:b0:5c1:4e18:39ca with SMTP id
 2adb3069b0e04-5c1bc7cf9a4mr5279949e87.21.1795611059465; Wed, 25 Nov 2026
 04:50:59 -0800 (PST)
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
 <20261015142552.4128028-16-ryan.roberts@arm.com> <20261015164102.GC13920@nvidia.com>
 <CABCqBse_aZL-EH0us2uA5X10q6E4WP02MoHTYf+M9ezRZr26WQ@mail.gmail.com>
 <20261016144202.GG13920@nvidia.com> <375868af-d0bd-4278-83e6-f8429df130e9@arm.com>
In-Reply-To: <375868af-d0bd-4278-83e6-f8429df130e9@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 13:50:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLkO-xdHHL9SH3JOBkXPE6WMsrX3Tw+N5y501-PpiT3yCQ@mail.gmail.com>
X-Gm-Features: Aa3M54pxVYAbo3CvBXpwpR1y88w6a7Lowveq_8IpxEozPbKGTRZduKVgmRQQdyI
Message-ID: <CAD++jLkO-xdHHL9SH3JOBkXPE6WMsrX3Tw+N5y501-PpiT3yCQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 15/15] misc/arm-cla: Add vfio-mdev user interface
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

a quick question here:

On Tue, Oct 20, 2026 at 12:42=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com=
> wrote:

>  - Split the existing CLA driver into three components:
>     - cla-core: Hardware discovery, domain configuration, struct device
>       registration and CPU hotplug
>     - cla-native driver: Provides the user space accelerator interfaces
>     - cla-vfio driver: Enables domains to be assigned to virtual machines

This design implicitly rules out any in-kernel users. Make this
explicit (in cover-letter or similar).

This could be a problem because historically where there is computation
there is a datapath and now this is constrained to userspace, or even users=
pace
inside a virtual machine.

Sooner or later someone is going to come with a use case where that
datapath is very intense and say something along the line, "what
about I just pass you an in-kernel dmabuf and you do you computation
on that and pass it on to the next stage" such as data captured from
network cards, high speed  serial links, sensor arrays, cameras, etc etc.
This is already done for drivers under drivers/accel, they import and
export dmabufs.

So we need a coherent story here.

Yours,
Linus Walleij
