Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991804;
	b=DCvtHiv26wQ79wp43S08x/4ElOjgX+II6qWRu0izZk0P8N2Mr1SmkLzfAoE/+zTw3DBO
	 tyrdqlLpscGNrh0i7lKwXMuHs5ZWUOZtxO5ltyzAzvb+mVrxyNXvEKsf66OC2LM2tU+uw
	 xfNz382olPhSn15pR040woLAelxSH7Fl8gCkGGvC8OuIZUKGdOfgaMskJSJ4HeSzR9npU
	 RC4r5VZSGI2ec485rHL0isCQdkq/booOksBLr2ZzMAc1MW9pWp3VWZRvza+IIPbUkBlfb
	 ZZwvxAy7/l1ioVfR2n0zssoCaDCs1K3REnr8ibUkZsW3Zicu6OYeS2c8uKBeTv1wuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991804;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AX5c5wMD7OnLAFm+CC9DuYrUK3y63Z1EbaUVg/peetY=;
	b=c0cakDN34S2EU8hbzjIzJwzbXd3N0Y9ZNomY8UGImR0XKbxhy9epOnVwd9RAYS30ZL7u
	 lsmMO9pEO+0yuydTKclF71bNaz5DCZyvIDW85yKwki1KRct0OjM20kWuKQcxzoGGtMQCQ
	 rjvtpa12engHP9StZtENxdZLHBMwFP2gEBUgsQUxQU9tDuI/IDbCFuMlwfE5fvpCW/3YQ
	 y1slbZuLRxV1bD2JxKZUpmeOuJFU6GlCGXh0byIKQ1Z3LOmvWgrRVHwVWDCZ37xg+dz5P
	 6bylNlkb/2vtOF/H96XIQEXwobasriqbb1RtuMDpHjRk5PqUmRLce99jcdTJDLodrSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee4v89F0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC9606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee4v89F0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07ED1F000C6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991803;
	bh=AX5c5wMD7OnLAFm+CC9DuYrUK3y63Z1EbaUVg/peetY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ee4v89F0/CYplUMWd4mrYQPEdS2rCUppTQI5k96tUb9WMelFCwGQDfb/Mw/KoeUV3
	 RkDnzTN3HaE8jGkRWtAPSX79rXHA5FMcyP8vIZ90QnSeyImP8YTbiW8ZhRXGA7sWI1
	 B/ahlM+rNT5H1z/EaUtqvb35lgOcR1eA3JudQKqzAmAwzEovWbO1XZSLKXgB3fKLyW
	 l6OgLvVqAE1n5Q4SG0LBfT9E2yF//MyBS9c70vxspBqmws0woymojLJbm3tTfCT7eS
	 Rlp+/jTBGbeosHqJ0cOnVRFVBu8YxiZ7kVN063iFfWyvK7XZtPfZg8ofXR7mATe99q
	 kANbBaZvMJaOQ==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-499f20c7054so401505fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:50:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFXC7pHT9qqEUpXQBYk5pn0IJZBYJ8ev5acb6kZe8Lt20JEXb3VG2JKYzXDIaG7RKPJUz/wEQvDW11D/1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iFFvqKbfqYPd45atonlw7Sox93g3DdlsQO1wdmCV7X8vqLttt
	Y8PkF1ncngcWHGuSZWVOAZ40VoCE3mAGaIncDb9UzxumqSoZGHDrW477i6m8YKKrRv9Q+x5/Ccu
	iE3LlVTsrFxPdszSMK5K/RYOXJu3IYew=
X-Received: by 2002:a05:6870:d40b:b0:49e:4ed0:11ca with SMTP id
 586e51a60fabf-4b7613c4a21mr1363707fac.53.1794991803234; Wed, 18 Nov 2026
 00:50:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
In-Reply-To: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 09:49:51 +0100
X-Gmail-Original-Message-ID: <CAL4WiirYP1mDaZmyjfqoRJWJLd8PnfW3GFey7tnqYtNNqSn-kw@mail.gmail.com>
X-Gm-Features: AclHuK_EKf6E2OR6VbHx-j3ZE8wpfUYjecPiFVwvcoA1MyS4rmOtt0l72ONjZtQ
Message-ID: <CAL4WiirYP1mDaZmyjfqoRJWJLd8PnfW3GFey7tnqYtNNqSn-kw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: openvswitch: avoid hashing the network
 namespace pointer
To: Zhengchuan Liang <zcliangcn@gmail.com>
Cc: Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	Ilya Maximets <i.maximets@ovn.org>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Pravin B Shelar <pshelar@nicira.com>, Jesse Gross <jesse@nicira.com>, netdev@vger.kernel.org, 
	dev@openvswitch.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 09:40, Zhengchuan Liang <zcliangcn@gmail.com> a=
 =C3=A9crit :
>
> The Open vSwitch vport name table uses the network namespace pointer as
> the Jenkins hash seed. When an Open vSwitch vport already exists in the
> attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
> look up attacker-chosen missing names and time whether those lookups
> traverse an occupied bucket. Ranking the resulting collision pattern
> across possible KASLR slides recovers the init_net pointer and thus the
> kernel text base.
>
> Use the namespace cookie instead. It is a stable, unique, non-address
> identifier that is deliberately exposed to userspace. setup_net() assigns
> it before per-net initializers run, and it remains unchanged for the
> namespace lifetime. Fold both halves into the seed so vports in different
> namespaces retain namespace-dependent bucket placement.
>
> Found by AI-assisted code review and reproduced on an unmodified kernel
> without fault injection. After privileged setup created the resident
> vport, the timing measurements ran as an unprivileged user with no
> effective capabilities. With this change, the pointer-derived prediction
> fails. Existing and missing vport lookups behave as expected. Identically
> named vports in separate network namespaces remain independent.
>
> Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
> Cc: stable@vger.kernel.org

Same remark as for your dev_name_hash() patch: local KASLR attacks are
not a serious concern, a "Cc: stable" tag does not belong in a
net-next patch.

> Assisted-by: LLM
> Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
> ---
>  net/openvswitch/vport.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
> index 083f7a8d9d4e..6689c8370ec1 100644
> --- a/net/openvswitch/vport.c
> +++ b/net/openvswitch/vport.c
> @@ -53,7 +53,10 @@ void ovs_vport_exit(void)
>
>  static struct hlist_head *hash_bucket(const struct net *net, const char =
*name)
>  {
> -       unsigned int hash =3D jhash(name, strlen(name), (unsigned long) n=
et);
> +       u32 seed =3D jhash_2words(lower_32_bits(net->net_cookie),
> +                               upper_32_bits(net->net_cookie), 0);

Nit: hash_64(net->net_cookie, 32) would be simpler.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
