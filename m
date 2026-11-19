Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795080001;
	b=zhJrCOKG1P7qBfSEcasExpNYwMyYVEkl5kB9ClA3EhWJAAoabGrb3hXQtHA2WSyOXIKQ
	 7v7IuJ/0eQNDFVxMeMSp7MwLkWNxY6hA71VJa9WjztGZOb/NJavMIqQKAnsjr1xRv6e68
	 iEDDYBlvBmuV4Exv+xSfSTmd3qWcwp4cIcSitMDQsK7uW7OgW802Q/H7d6gd8brghaBko
	 oqdmol4mDyHegJ9FHVu3ajo47iNh5o5SBj5Ekibs8njz6qfkBMS2g5ICi2pDE9w4MsB5E
	 rutWIVrwQFlpoe+LNR9NVz/Kb7xkPUskb5AlomcrBfMWo+H+wUicNSLJUhmlsmvk4Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
	b=0jLztKI3nfuJXeiRCU/bnfEOsTAFwDjZOtbAwGhO057Lz7KevwxACI+FGP0uvloBf/Fv
	 OkQzecmhck0TUxaC6XQMx7Icp4nVIHdGS+3TwJyMXgZe3Lza7FzL/ArG4hEytBPRIYgN0
	 FRuc6xl5hDTPu4lxWEkGkFi9KZS02RwvaO3TeNba7x0qngDFU33Kthu5/IQ6TVprL4mAw
	 AXF2Nwwa9E4VR25WncMvAq9dYe+XwlxlWNLFEqsWVROKnSnptrNNAaSwxt6B/G54EfU57
	 0M13Ay8MzGN+kexIwakk9kkR3XwV9PatyK/yy+xpWLNW6DKiiKWGATIGlcmzd8i2Fsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EkOk1PBC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352D606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5352D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EkOk1PBC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so149587266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795080000; cv=none;
        d=google.com; s=arc-20260327;
        b=HJp86VqCELFAeVV9s1Slz+ynb2Ygr1vjyzyc+OX42i3nlHe6c+ceVgkaKzHGDK2w2N
         9WHJ58jru3qff5bXALyzcBo6eqwhe0o/oL87dxla6la+TJVhvx3sUiXmq5+4ww1c/ON/
         KyCcqZNPRdH1Nqj6VuEzfSuPS2f+19AQn2TrjiTuP0jk1pbji/1uvpez1RIFSd6geDf6
         ELiKZVM6T7jLjYj2eGD+5bVBngCgN5VXNcZ56NueWRQce4iRQgXEICPliHZH6VHl8s7l
         PIsb0cVFHkj7AKKbts26a7J0XH8H4eCsS/Y0K0cJHOgAfWZR+nQnJPILjICXlr4HCDiL
         LTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        fh=90IwtbLCJpviSUEqvJxwLrrcNPY6N+JfVrqHr+71auk=;
        b=PB3bqFp93reMZIu7hhpZrI4B4RSoHPQOyROEfTVEOXaLYRZg6gILS/At/eWViIeb6k
         xvH3ekQcRb9yl12qrmv2aOjeNs/rsCPaEYUHZUq316ORqe5U8qU7ZArxgQZcK6jhiX0j
         NPBl6Ze1O4VEzLY+eW2c8Dx7BXoPX5rkJq+sIdHt1K9Q9h4pxrBVbjkSNIAcw1kYkDtJ
         aNg+y7PjUbSjX/+DDEZnWdghuTi4uQYStPdcC5WjWkH+L9woHMstXwj8hYZJk0Efgp2E
         zrgGV09i9Ba0VN9impCae6djQdJihxB+FpfUE8bG7lWChWu7yFtvFTrEFNmxh+IqAtYt
         yhXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795080000; x=1795684800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        b=EkOk1PBCMgiSWI/XNDC6j87bo/JDyXhwWSKT7KNf3tIjZn7tp6QFghruYqBhwrnaHh
         l4wZdzAJmlOIPC8iWaJ7ngwdy1HbOL4Kugu9fvqGhpQht29d9utB/pDKKBVFfYIxjL9F
         sES+ZEY7KLg3uU24NJyfI6VEygksoQOswuWcQMC5xFUMLihcDekPGXI9MN1T30wP1FbJ
         mDRuhnxif+ZSVfXF67RgfNJnpFou3Vy2qNQNa4NGt5Hb+iA7sJFxs2gbE4m3MIphzT3W
         Ul0e5Rdzoacx5eSgIzidb/z7WxKHv9yri14fD+yIxk+ztRXMK0nt2nRw65ZQklBNUFUw
         mc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080000; x=1795684800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        b=S6+frTiJmJV+v6dbRZETG4SuLLptmQggqmSaQmIXzfxdvG9v9N2E3cp7Cvj2qSAIdj
         BOKu4dmxe5Ga5j7MUUhtMWlZLUAWG8Auz7n38P7s/DP81aNQ/UcP/qgCotXIh+0Fw3+6
         8dVV/oj3jb8jPebrchtdJme0aWSK6JqmALQK9THv5zCRClIr8Z7YHrEFVxb1uWbmBrYQ
         2LcNt8SEX9R8dC/RByvD1k2INyQHwf40AkzdJA4HbmjWG6yD0Wvr6PZmXb72gMAAoqZb
         CLP62NMJJ/GX1Q8bi4HohWYx1PBZX5a0UubYFAX8tGv6/Vwft1PuLZArt7LHCJ6XZuso
         RQPg==
X-Forwarded-Encrypted: i=1; AL+hErHQzgJDpmUHJiEpT0yeUI8HJr/CsPdvnKgNgUZq5p0FtE6fmqingDw4rkGooFVupyQI0eCoGy6txVBJPLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VQ1TI27irW9Ec9ToPJflsFAN/CUL/4A4fNDCLJzNnNtAaFvxV
	ETWLmYZXwxLDCDU+dsv2j18bt3s9ThsNiGyw3uG/14F/jkCnia0Kx7jEh7OK3jLJJ6uf4jTuy4b
	tp+gRJkHQdBFWEJr+3n0Rv865zGKJ1HO5PMpB0Acn7Q==
X-Gm-Gg: AYBFou1COgNcaUaK1lESvNxlz8rhQ0kV6Vt5xTYy1bSj33N+1VIL89Bblfx7qQ4bAnq
	TW8VHd+sQXnaN5Rt1ZPUD8OvFxEnzm2ugMQ/c2NSCDU/YYqQAiu53V2p4bJ7wmfgBO3uL8ooYmE
	xtA1k8AZ7dtuxF0PHpGI155SqWGq1E4s+UF3kk+EYYBSZEzioaNGli0E7pRoGEFpmxNZYl+C9Hk
	gZXa7IFYBj8d9/F7drJow8vDg8XD3npEbo1yWtgrKuTkhBX2+eKsA2FwM1BoaUoqQeGDVO8J7Dj
	sd24+Jef30y1lejfj9kdlBel9oGpHP1AXShLGuvoiw5ysOt8gjCFXf6tv4JRkDezNe59sc/9pvl
	C+gdv2UZfvt3RVNE5UjJ8R5e2HaSMFbnYAWJnhDvpyXNne/Pv41F2hDyE6lDxQix+UgIo7Q==
X-Received: by 2002:a17:907:9692:b0:c40:9b35:ad91 with SMTP id
 a640c23a62f3a-c51318163ecmr59215466b.13.1795079999707; Thu, 19 Nov 2026
 01:19:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118184729.2302130-1-m-malladi@ti.com> <20261118184729.2302130-3-m-malladi@ti.com>
In-Reply-To: <20261118184729.2302130-3-m-malladi@ti.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 19 Nov 2026 10:19:48 +0100
X-Gm-Features: AclHuK8e8ffnAD8pzuAiTxnaJvnDKX5k-oyRRYloR7_BmjnaSSX9Hh_xNi7mzEk
Message-ID: <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
To: Meghana Malladi <m-malladi@ti.com>
Cc: kees+treewide@kernel.org, laixiangwu@cmss.chinamobile.com, 
	philippe.schenker@impulsing.ch, haokexin@gmail.com, devnexen@gmail.com, 
	horms@kernel.org, jacob.e.keller@intel.com, sdf@fomichev.me, 
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net, 
	ast@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, 
	davem@davemloft.net, andrew+netdev@lunn.ch, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 18, 2026 at 7:50=E2=80=AFPM Meghana Malladi <m-malladi@ti.com> =
wrote:
> [...]
> +       mutex_lock(&emac->rxnfc.rxnfc_lock);
> +
> +       /* Check max rules */
> +       if (emac->rxnfc.rxnfc_rule_count >=3D ICSSG_RXNFC_MAX_RULES) {
> +               ret =3D -ENOSPC;
> +               goto unlock;
> +       }
>  [...]
> +
> +unlock:
> +       mutex_unlock(&emac->rxnfc.rxnfc_lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(icssg_rxnfc_rule_add);

nit: instead of mutex_lock() you can use guard() [1]:

    guard(mutex)(&emac->rxnfc.rxnfc_lock)

and remove all the "goto unlock", returning directly. This handles the
automatic cleanup.

Same for other places where you're using mutex_lock() / mutex_unlock().

- [1] https://docs.kernel.org/core-api/cleanup.html

--=20

Marco Crivellari

SUSE Labs
