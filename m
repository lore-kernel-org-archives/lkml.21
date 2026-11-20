Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795141898;
	b=Dsj9gcxCao14wxW++iN4R359GQcEDkWdzfF1cT+3Knaahd9CdTb43hg5025i/cjm3X/7
	 m3iBR0zdW3iAQO9Ctj7wKuQhFqXp4i83cCeJklm+MoJ1swH+vt4vCfbrpw6qYQrlYLlhC
	 xFHvw0pNQRp/Y8XuIvK3fCkywbO3RA+myGxwlyCXpbDlpu2yOFmdpaMfOFnekP2YFxa5G
	 ja4pmdBZLBD3kzx5I6WeNmUR53tuWmnJShnzhPUIDgCUt4UIj7TBDYi4ZIQXtAc9qpVYM
	 NtTfyAK+XptedYVqfsOldij/SbiG1ewJfCG9QFrwFJulURFRJDlYCUVnNU6mcudm4Zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
	b=h8TjIpbcLB9g91j1U9G2jBIKH00b4OOrFWG7K7E1oGqGMxfhAaRVEmm5NduplCj/Eb1o
	 4QAaLP65UQRvsu9l/h4nP0xcCqcZVX4+TrS8l78gLCQnR4qEbgVPxwQFcoSygjnJbAFN0
	 PHcZbb/VT2/eU9xBUIAUtFXrARHZtuRfE8i3LX4zwl55LNalzDA5uekCBCIa2Hsl2F5UR
	 1+yl4ojSF9Ayf1wxJ0Et7dkfaHq4WnD2+8CRPtxigBom6X6FkZRi84Z9H8kWrLH7koS1p
	 z3y/a6kSHoXAktIDa+dMtGaZgH+BYRRGkXfXqz6RsQiHKZPfkD2xp4apAHgi+fGcjDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qrdy0TPS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D92606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D92606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qrdy0TPS
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ee254f6eefso36615ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795141897; cv=none;
        d=google.com; s=arc-20260327;
        b=r/p6TUetaWTavPbHgS7hfmM22C+g8vrDcEs09Gsi2zPcW9piSJuAVlAiMr7eNmZ8CL
         xXCIsvm5IV5ULiWuAkzD1CxqvcDVFMmncP5NjHIMu04dJ/b4JvGMlcDlL3hGTocop1EJ
         bDLYk/D2CZ6uMJQW0wO5DWZi2Qp2FqXsDxk4gE9TgB3amZLg2X3pVZh9Tmjv8rt6e7Om
         YQJ2WWT5Pa/PXRS8FOGLeUldveZTZi0lmihQRU5KIskzEq05zBIe+Sl3j6awPbrURUR5
         dTc5j/7eIuVrmxHzr1kEyVmscuKU+5lyh9HwZw60Vk0UB0ORUEzr7LQHCfQ2ZbrIR9h8
         19/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
        fh=tVoRIjQ37StCqZNl/ZeaLylT6roKiAXGBp9poKuAvpY=;
        b=OZ97uU9Dk7S9crCuI+/KPzxXLMIrf8jA22yLtZV7bYk5m4bCvcwT5ws+a+xo3oMgLC
         PLQl1+mJ3INIAP38tvJst9lvPxL2E4QZxYr3qoBk7k/WuMkTuGhE9ZnB+hRhOHoTOEtG
         BTudDbFftQT36cdLa3uYWJCuj4GzIjD1fom98vjd6vyPPQcLZR35cHYYoy3VV017iWtE
         SgFTX5ml1MYwpiqTDzdC4RbRCYRL/CmpxKmBa85aLTKzTG/FBWfD8W33HR09HOSnIiys
         GRQkHhjqUmdeHmYujCIPbc9QIbehGDzbCujW4/Mh7/xRjNCADn5gF4Ki1gNAdCa7QUt1
         GACA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795141897; x=1795746697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
        b=Qrdy0TPSy4mDHfih5I/YhyhoJTImoMV3NzQ2MPXAQP6JVC4N4CyBXTEBgzd3GwmVue
         GA95k7Q9i94qr15wNt0nFgTodZEgH12Yevm0ASBd1KA4GAf35lBJbOyhDv0/JpzFhOPF
         4zgLN5sMIYaCS0ou5mc5LFLX+LEr3iFBYtRH0Ohu3nLt0g6xLKImS13Mqsa+hh3cBche
         J13yRgeDzl3nJJWwWFUVuRyA5stg2/AZ7RwZJWPh7qA0xtfNnVYb68j50vnZY9j2BN1M
         KHOf36+hdjcfy2Ba5VA8MKiXOhhiYraVvfX3wQm9Q6vFK0wfuuVaCizKIMWnkoQpzKTE
         iK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795141897; x=1795746697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
        b=C4Gl3LltTbbBr3jJHzKg+xqFI1yRb417VS7KdwJhISPOL6dQ6BzhEJ/DYsTmrMtmQR
         lPYoHG7P/dhlfIxaKUVsm7+ZbKUjJoQbhambEAKhfvrcjAQsZ2AecXQsmaAu/sDO8Wtm
         IMk2zS+oKl8Gb/uxE2imhLOMnEoP3Oh+4eXCHFVG4q2iKVbpyL40YvOhBzfYYI0yvG+m
         B2e9MbR0rEtO0NH5WG7leeNQu67dRMrnqi/lZe3kCFrYudffJxPkFj5JdKzdf91qXUTS
         R84pr5GuZB12RQfw8I65nawaKEc5mc3RU5nDg0vu/0hIgmGzBvrpMdRTUYhY6loOuGXm
         zckg==
X-Forwarded-Encrypted: i=1; AL+hErFIWDvGIjzgvsc+9vdh3hUU5u45BmwNdixsO4eBDbALb9lz//5xOOxe+OEq8D9/Ok56lvHome/YxKFk1qU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gYJ96t+nCDWRAu1F2HNnCSb85j0501TTAvxVUAqqYl4C8c0l5
	VJ80La8nMdG/hOb7diN14k1kzgJuI5B4/MY2GRzu6vLYp7uwn9XznMRc/E7LD4UrSEb9K330EQ3
	dOm6bQyX7+rAQ+3Z3iWASXDAGDoDa+fjIP/m4oBKBH11l4TN+aWBNGDh2IcWSoQ==
X-Gm-Gg: AZFdTZeD4fEalwo+/0V36J3ie93lerc2JAHrPwTJtOSMYLuRFKHiDwDAV0tBJFvyNns
	MFfcpQTvSxgsFEcyBvHZbygUOzZFVWrC8//Ar7xXFMhZLFktGYutoa2TEiXEQB4Dhh9INzfEjug
	Fm16aGZGw8KJ1HOXPiwbZ8AyWcrDxxBwl7Oa4rd7hDLUhAU/DuPguSCtf/Y8rIQlT/fEKTpF5x8
	HcbY8RAHf/basBOEdpy2p5fpztvlZyRGWOPSICdPxlVCv8rINJ15h2EP716Y4UCJu6C7LZiV3Hf
	tuzvqh+AF30blCS1U5435ztvWg4qVaDoDj8WCKcvGpWiSoq3URm2jcsEdLBD4SRkzXsYO2oCcKI
	UB4FNKoTLi9FUFnZSzXCrKLThzwwibBn6nH7oHgvXQZjLiAulEhVtaqLGYeE7Vy2esfkVE6m7K4
	jDjQOp1mpvH5/14NvjxYVqYpxSidf0Wd9+7m2y
X-Received: by 2002:a17:903:1670:b0:2e6:f400:5655 with SMTP id
 d9443c01a7336-2f04203a6b0mr2818995ad.3.1795141896502; Thu, 19 Nov 2026
 18:31:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119044537.57936-1-enderaoelyther@gmail.com>
In-Reply-To: <20261119044537.57936-1-enderaoelyther@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 19 Nov 2026 18:31:25 -0800
X-Gm-Features: AclHuK-CSDmpAuC4dx4YDI9BMHjGGIhpLpaYIttNJzbasYk4gLp2I3z1LhRSds0
Message-ID: <CAEAWyHf4D2P3=AbewjxJkB19K-r1MMWj2p6p30Qnay_RMTYwtA@mail.gmail.com>
Subject: Re: [PATCH net v2] gve: mark the flow rule cache out of sync when a
 rule update fails
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Joshua Washington <joshwash@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Ziwei Xiao <ziweixiao@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Tim Hostetler <thostet@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Matt Olson <maolson@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Zhao Li <enderaoelyther@gmail.com> =
wrote:
>
> gve_adminq_configure_flow_rule() marks the flow rule cache out of sync
> only when the device accepts the command, although a failed add,
> delete or reset can leave the device state unknown.
>
> gve_reset() sends the flow rule reset command from
> gve_teardown_control_plane_resources() and then frees and reallocates
> the cache buffers. If that command fails, the cache keeps its nonzero
> rule count and stays marked in sync, but its entries are now zeroed.
> gve_get_flow_rule_entry() then finds location 0 inside the cached range,
> since every zeroed entry has location 0, and reports an all-zero
> TCP/IPv4 rule that steers to queue 0, whatever the device holds at that
> location. Queries for other locations fall outside the cached range and
> read the rules from the device again.
>
> Mark the cache out of sync whenever a flow rule command is attempted,
> so that the next query reads the rules from the device.
>
> Found by an AI code review agent; not triggered. Compile-tested with W=3D=
1.
>
> Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
> Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>

Thanks for the respin,
Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
> v2:
>   - mark the cache out of sync on every flow rule command instead of
>     clearing it when its buffers are freed (Harshitha Ramamurthy)
>   - describe the problem in more detail; drop Cc: stable
> v1: https://lore.kernel.org/netdev/20261118023429.29330-1-enderaoelyther@=
gmail.com/
>
> No new W=3D1, sparse or smatch warnings.
>
>  drivers/net/ethernet/google/gve/gve_adminq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/e=
thernet/google/gve/gve_adminq.c
> index 2c848f0c23dc..d0e0d9ace3bc 100644
> --- a/drivers/net/ethernet/google/gve/gve_adminq.c
> +++ b/drivers/net/ethernet/google/gve/gve_adminq.c
> @@ -1401,8 +1401,7 @@ gve_adminq_configure_flow_rule(struct gve_priv *pri=
v,
>                         sizeof(struct gve_adminq_configure_flow_rule),
>                         flow_rule_cmd);
>
> -       if (!err)
> -               priv->flow_rules_cache.rules_cache_synced =3D false;
> +       priv->flow_rules_cache.rules_cache_synced =3D false;
>
>         return err;
>  }
>
> base-commit: e203d8a4751d48aa00eda31e3b320ba8e0d47dbf
> --
> 2.56.1
>
