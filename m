Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585875;
	b=d/j1dGUuKJIpsMJgC0C2rSn+sRnl9b/2i9GpuBOuTppYTb+GnsijQl/onmi8i7qhMbUq
	 T0dwh6sKm7a06vR5lKet//oA+XoGZgYwTfV0weLdnWNrq7q4iO56Ko3k9OheGyS1Oy4tR
	 oMUT0dqXgxg/anvvZAAUee2livtW1t9DH4MBGKpyQte3mH7tkBWzn7Nl/zXlGRmy1QdkZ
	 gw1zoRYnjAjFje9o16swP61ETC4Dj/RkdX/OWYd3el+/GewVhRQH/3Dp+6xSNSB3CRg5k
	 k8N66yWzIx6nyCdoKqussYBwJgMBLwX/2BMHQICbvQ5fZdLxFWlQPZ6HwTZFGvOaGMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
	b=JHAQ07BTPePS39KzoAEbOxL2Pfm3AQH4Yik8cDUJ1i07l2r708gpbjRPX84rWOqmtozq
	 dxBxOozFVM2Kohg92v6zPeTyU70tgZanWq7e88rAiSzIb8qByXJuTj745IPrKGs7Ekr0G
	 qABqkGuBp/fPoFyGGBfWGYa3e3CwL4uO5vdJ7J8M9z+dCWVLuAHXtqdzTTEW6NiAD/70c
	 dJxLs319wzWLuICT+qE2faFZsnPX0rj/6QC+meZLRJtlX8H5mRga8L17jH7PL4dRghHHA
	 4t2J+pbsI2A0ylUCiuO/nTFXHbRTC9g3kkzV9J2dbxt0FjWpAeS/86z7h3KanbNk1+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfb4J9CF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0194606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0194606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfb4J9CF
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2384256eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585874; cv=none;
        d=google.com; s=arc-20260327;
        b=UWxOO/iC29xA3ihmn4yziKnZnBuJxf2rfJGLSR6c/8Oxproi266Kt/1syfMuxGxAyS
         4b3yj3BHZl8rGQ43A8xjvqe00yx4en23rwjBFVkNsajRL6YWYiq5sFwl8zkJ1/1mQ8HT
         LH1krnhNQdWFRclwtKYpdQQx32J5D55qoMXUV7odzkKPxKSExsWMLXWaU9LGdazkDPm4
         Ndsw1xIEslShXwmlb76xYVH5i1JE+/S71Nlm64YbtlrIOqLN1qK70SrQfxBxLOFrDQIm
         jZU9DxzwIS9myu+EWXNS6btKe2A0hMW1x2JW6g0AyN1IkDn4akxqaNLKlVfhdzHzKsFb
         U3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
        fh=cffzbM3+VnBaoLnXfFs+0B726RNBEObpp4I9pP8gB2w=;
        b=IWYwyhV/1SOUS4VWlBGVg/aOT4s+jR7xK3uEGyJHivCYe1eFLgI9RIrn8IcMKj/0A2
         8Ql+njnh2BEwVmzmQNsi6nXT/IQOpq/8BrL6J+8YfAIPZ6A1gKu2I8+KRAuctpUbs7y/
         9rSL1xX6yjOm5vMhKbKj3TA6HmwfhnfLjAmdtOnn6Xfe2+78M4YLcLNQYI9SsUYUcveC
         W5NH1DJmUSmMrayOZYSC4quNttG1+TvHkc2YKvz/W77xRohSJVDiQY2z0Mb/w0hsgTzq
         UaWBcDeBaD0hUW+70znZZfp+ScsmL86O+QIcG/pFP+isDad1MgDBkbZRBymBPVMtemzh
         sj9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795585874; x=1796190674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
        b=sfb4J9CF+5yjZ/x/Iu7BFWCbJgOx5jjpqUiqLSNFSquy1M0qtMmn27RFXaMWciCfMn
         eEjJhWhPQSG7f63esOhYIuCQitedZEjca26PsfPOt0YMtriD5xjj2MZiVf/3ZLx2QFOl
         +Wg52BMCp1fizm2tYTbNHuH6IB3qhIxgD6Sg4JY4mKEL3EH4WPSbrWAntLcKznqcLIaa
         ux57gd/YQObMfbtzn7M4iNGX12h/6aeDyT6qGEjv82ySLL740fsUb6n9NDMZHEWe1CJX
         O9B2LRVmpPCj0g9iF1MJGLwxImwsCwIiQ7YhgJZ+CSqej/saT+XCQTxjkM7MkX6YxelR
         bm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585874; x=1796190674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9T8VWNlC22pM1qjvLbYEaQzBzJ9S1PZJc2NX6XMx7dE=;
        b=v2qDGlzWfHio4bB+Qvk6cVVodv4cNnjORUaB+0TuQkVQURAYouQf+I+hKx2I2Op/hM
         WDpNdk/rW9oeim/ns2XItISXvZx/pZ0MDNJB2u1FVNbzGqsQNBdKXrz5UGLSxQJh+9qR
         Ww8zJlPq8xGv6mlhqdAjiwdLLyOPzo5ia2Q/GQquI93ebJd38juRMCyeeSthyzOsRnn/
         5VWZIartaGhyJia27byLVR7XtOROYD3gr3HX/FUJ9klaULqlndYV/Q2vEitwx0GnALBO
         OUVFaYqu3LMAI1tE7qNTcZ8Sq7AgsyQf8QVqGnD+IWEmJkwyLrnkdHGMEilxCmmgi1//
         Andw==
X-Forwarded-Encrypted: i=1; AL+hErE3V/r7bJ4UnNNHr9MxHBqKWxMiOTYR/9ZVlTJigBQo1gCbwtlpu2DdfcZIrzNvLdunl5f8jmCr4T9E2Iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PfzHq0MD7/e9RmjSdDIarGzTsCumlCQ1SB9EcK50SkPAIn66J
	PHfuL/mNZw2Ii7pNgE5NhHhUWQwUXqoLiTopXSMNMBGTLbIL/9BtO7J6TvThlSLHxXia7FANWqo
	wTG1zWAyHS8Cd5RCF4VmcVnab0Lq6G+M=
X-Gm-Gg: AZFdTZfb7rM2LICPkJK0yODlWubcAGC15CkXKR41w+ZnGmsHeu+kNodh5hvYQLYuCzP
	utC7/mfwzsk/ThdojWwPiOL1SFd11moOSPEaqmLqk19+3ejX1uExg8KJNqwJ9xkbIt2pI1ZnyrU
	1Gs5N0jN5P2UCZJUypdqgk13GukYfInerQkBsuQlrqz4OsRK84RPjH7c3qEopTQ3JD3hgaE2L/s
	2OJwM4vDc505LPZkFNTsTjkvLwKur+bP2P/AiVcTiyKNhop0aHGZML1w8AWx6INZCVPzfKOfcm8
	GLmCKqfEFYx8KsvhUvNuf02lQRa1iPZth9XJZfd7bFSdZVckmNqy630Pv7sJbMdWdS1v9RCRZvp
	j1keKiERyu9oAMoaptMTcmI901AbI/A4AX0VecBQ=
X-Received: by 2002:a05:7301:140b:b0:386:ca0e:430a with SMTP id
 5a478bee46e88-386ca0e44c5mr2612452eec.24.1795585873408; Tue, 24 Nov 2026
 21:51:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
 <e6d7aa66-3df1-476d-a8cb-359827cd8243@ovn.org>
In-Reply-To: <e6d7aa66-3df1-476d-a8cb-359827cd8243@ovn.org>
From: Zhengchuan Liang <zcliangcn@gmail.com>
Date: Tue, 24 Nov 2026 21:51:02 -0800
X-Gm-Features: Aa3M54pDG29o7dVlFlqPFuvbM77f8i9ZHjtQ98m_VMlQguub6jqHv5TZuSqbqlU
Message-ID: <CAOny8pvHhv2UVYSv++pukE+0+G5+JNirQiGGVS3=O0Rrvw22BQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: openvswitch: avoid hashing the network
 namespace pointer
To: Ilya Maximets <i.maximets@ovn.org>
Cc: Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 7:46=E2=80=AFPM Ilya Maximets <i.maximets@ovn.org> =
wrote:
>
> On 11/19/26 10:20 PM, Zhengchuan Liang wrote:
> > The Open vSwitch vport name table uses the network namespace pointer as
> > the Jenkins hash seed. When an Open vSwitch vport already exists in the
> > attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests c=
an
> > look up attacker-chosen missing names and time whether those lookups
> > traverse an occupied bucket. Ranking the resulting collision pattern
> > across possible KASLR slides recovers the init_net pointer and thus the
> > kernel text base.
> >
> > Use the namespace cookie instead. It is a stable, unique, non-address
> > identifier that is deliberately exposed to userspace. setup_net() assig=
ns
> > it before per-net initializers run, and it remains unchanged for the
> > namespace lifetime. Hash the cookie down to a 32-bit seed so vports in
> > different namespaces retain namespace-dependent bucket placement.
> >
> > Found by AI-assisted code review and reproduced on an unmodified kernel
> > without fault injection. After privileged setup created the resident
> > vport, the timing measurements ran as an unprivileged user with no
> > effective capabilities. With this change, the pointer-derived predictio=
n
> > fails. Existing and missing vport lookups behave as expected. Identical=
ly
> > named vports in separate network namespaces remain independent.
> >
> > Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces."=
)
> > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
> >
> > ---
> > Changes in v2:
> > - Use hash_64() rather than jhash_2words() to derive the 32-bit seed.
> > - Use u32 for the local hash value.
> > - Drop Cc: stable because this net-next change is not a stable candidat=
e.
> > - Drop the deprecated Assisted-by trailer.
> >
> > v1: https://lore.kernel.org/netdev/4e124b37fc972925a825881c50f95eb6b3c2=
e231.1794989369.git.zcliangcn@gmail.com/
> > ---
> >  net/openvswitch/vport.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
> > index 083f7a8d9d4e..04e4df103b26 100644
> > --- a/net/openvswitch/vport.c
> > +++ b/net/openvswitch/vport.c
> > @@ -4,6 +4,7 @@
> >   */
> >
> >  #include <linux/etherdevice.h>
> > +#include <linux/hash.h>
> >  #include <linux/if.h>
> >  #include <linux/if_vlan.h>
> >  #include <linux/jhash.h>
> > @@ -53,7 +54,8 @@ void ovs_vport_exit(void)
> >
> >  static struct hlist_head *hash_bucket(const struct net *net, const cha=
r *name)
> >  {
> > -     unsigned int hash =3D jhash(name, strlen(name), (unsigned long) n=
et);
> > +     u32 hash =3D jhash(name, strlen(name), hash_64(net->net_cookie, 3=
2));
> > +
> Sashiko had a nice comment about using net_hash_mix() as a seed, which
> seems to be a good idea as it fits the use case pretty well.
>
> Best regards, Ilya Maximets.

That would allow an attacker to recover the 32-bit net_hash_mix, which
is reused by other networking hash tables.

Best, Zhengchuan
