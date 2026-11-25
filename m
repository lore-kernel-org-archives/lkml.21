Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629035;
	b=UXtHT37wW8efPMBAjZ0yIb+P1BFGlgU16qvAgvL/KlALBIiKifHxIvcuPP+Ypq2RpzCQ
	 412fmWw4K8aJ55TAzC7JruS2P4ZNyF+Yutv5Qo+XwGrlilQ9Wp78ovRQM9wwpzdU46yue
	 33r0USbwMyvJW2z5TC1i8QvNgRCDNUUxmdxx7pYUceeREoebTDrrX4mbmAxV3biMKlpM2
	 dwceWGHgJ7NUZt1u8YyG7zK6LLJI4Kyn5LWH+QCSD5AU+rHd6uvxFNctPN4a3u/0jlPZi
	 203qfaeyhTGiWy2POSc7+aJ7ylmywVafxzKggHO1Adky28lT8Z23gOksxbf9s5xpEDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
	b=E5eCCtyrGwy6LXw6qEVe8yKT9VMFHKh2t32OJNYENRkxnF7waVpyEwfZccvZkYLGcqPw
	 LyOjqUbkYMumABWUz8SkwXxL5a2uFhAffwH/Iwx3t5FuhMitb0WLoWC/IrSMSw/z/RqBl
	 RU0kxlMm+EQ6oop9Q94yARbpyUof/BJN4m8RFdHd5gTQY+0eMXIlNPH4oe2Ejy9MdUcGp
	 Km5eSbI1jN00SmgN/syImxP/uofhtO99YbFT/WLWtfpt3IzAlNnjwAFQsDT8kiIfFjDr8
	 tWEyGfYlH5zmt006FzdyzzBF1o2V0A63kC+ZVvNGT4/BiAbZj/YRp+wffcovtF7sbog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzrnzIOd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA69E606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA69E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzrnzIOd
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so4432495b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629034; cv=none;
        d=google.com; s=arc-20260327;
        b=oUF6EWGsAVPLigZKVwRhkoIuO4cRKjZGA1q7iX+JID6TyYiTijNJT69mZlFQwliYKy
         wzUR5168Rm/T1CTPZDyCWReOYn4f9NPcW+xgma4waqcWUiP3DkEXJRFlR09UYnDRIuJb
         AV1XfZhb9iSS7yPcseEPnqXc7ctra/sL0CPB8gTImNvixiVGzkRrujsD2QqjWueFUiqT
         G4KWDQd+qUyR3MjAa2KLRL9pd4CTuFz+NFOUrM/43LRK123mAdQ5R67evx9TDxIFiIxC
         bmmnS5I4NOUhHyqBXK0niB2QTEz6fX3muYmLTe0nsSfUxc8Ud0LyZFa8CNuwlH1HH9Ct
         iHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
        fh=9YWSB4rytLvjltYyiJfjpCcVpxdiAhmSr1siG6wJhmQ=;
        b=XSJzg4q5ybvIEwPiLYrt0t0Ij/MpcoDrgBzN2+v3cgbJM5JSzrwhJ5Lk1/NWtusBqZ
         3N+oCnwSDrVXFj5SxRmzf4T6X7e4zGuOLyOYxm7YzWwNdkRfylGJ/PDe4+YQSBulN72W
         FxvEf2WspJIIM/++srnS27q/8mBCwUmYPagGkbXhvySBhqYS73OX2AkeVj3xdxfs+w4q
         FNbBlYCWRzOH1UU4n/33ArvTJ9x/zjonxuwrbJXPPGsGD7lueqtjuyLMbFum21SHMB8B
         PIUHq9wEWYcYBHFC6cZyupHs3wtpoM2Ws+kj0PdQK/72Wr+cTxC0oYTTMnSvRE46wQBm
         vldA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629034; x=1796233834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
        b=RzrnzIOddMSy0/gtb8UILgu3s7kq+AW6xMj8vnNYFlLsUstmpxo2bu+ZL/+t6ZA395
         ZgNjTGGZS8Iis6a1xMG3pPHiF2pS+lzMfEdajHXNHC5vIkDtY1ektkGYxh8fsCEalPl9
         bjMP/hJ7scXuutgpkiha1/sTpcU04wlV7ZKqA0HzLXF7oLzTSRsn+6PhBIY/WfOIKf4E
         iqJq81myqrwEybsZpA0H1mbCincek5Sez0jIQsuMApfR3WrPaLdWWts4UzTTARM+UOKF
         1VJYEVYhGBCh8rM6LzVZGGxsitpbmTDtypVh4HvV2IdxbHox3ImYtRQggVwFMdKbuohZ
         5e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629034; x=1796233834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
        b=y1YjVsmyIOKx3O4AnAeZ1+DUP71dOPA9aE7cBWR5RuT2/iwysIMY/SkNktRIpZ7CE/
         aiPmpXrXaWX/yNxpRBbY46KdwTF710ZFrXwMfHYPNaxamjb92F1cFWlSQKUgW1dzg4Kj
         76KR3EX/XjWPny+F1J5skPHE+SCPih5uAPIS9XF1ZwMxY+tHfMXzDt7dJ8+gZU+62ING
         vUKTtYLXUz1kknC2CAhqzOu2hrLdcwZKEKOR7Ze9o44OD7/AzAKZp8gZpr/CJ7fTDFv9
         L4kIXy8kRwwRkVj7GSLO4kFaL+l4cpk+EStx2jxPew1ZQp0UUKI4FuZRfxut8NpmPXkD
         CIcg==
X-Forwarded-Encrypted: i=1; AL+hErE1dFawO/s3Puuku8M/b6poeE6wgcZsHWVkE/O1SThl+qOsBI/M2I6O7ISqal8rK9ZrFc296bWili4pi5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nIL89T9mwEr2bZgUTxVd1mj4kCYTFSvbxVFL7e4TwVGjhioQz
	m72jZMUplTgjN81TehEkKDlzOgzSOVy44cGaJwX7S+s/XnJ+ME3R/yzmxzfhCHP4AHdgj1Kv34y
	NubttBj+pfdgeI+p0ZFhN02dbGJBfCSM=
X-Gm-Gg: AZFdTZfz7xu+7MIsL4O/VxU9Gj21+UG19wT1uyzJxFvxqPX9V3qXvXfE4JO+/OUn1qU
	Wa0OGWvtIySWJsSHXLfv8TwP3jwi0RNr7t2YMFU3VyVkU6S8XNYXv97Uo0E16Qp8xSnRupMf4mr
	7Ad8dqvBCDqTBpwIcfvS5hrZFea83QYfLy9x4rlqSsijfzY16C6o/TctQG3DvCkiDH6TUKv65kr
	VsgtMVno81RSjHuIgxFCNKDTQOgfz2D728a/Kd8Y+bwR9QkXhRQFayiRL60SAv9U+/DoRPBBdC7
	Q56wnvl/AkmkFI51IMkTZ0W1vPdsPbQmxHMqSFcYHXRfLbiD3VPHpSMCohmBcfcrE6Zrgw/8YL4
	fc1WYLOIdouCm+DdTHB41xARox2oGpQuKiutsNJ0kEC+GGKIkOPJBfXQu3oT4JtgokeVOpGPg2P
	eqfg+EcLpnJeCCG/IHzjG02sdwwS9n0sxGyPxhbcg2bhflOl3YYZ+SmKeW4/C08sQX1JXb
X-Received: by 2002:a05:6a00:3686:b0:8b1:e117:3978 with SMTP id
 d2e1a72fcca58-8c87b4efa61mr19112715b3a.18.1795629034041; Wed, 25 Nov 2026
 09:50:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124022107.32283-1-ljp1205831794@gmail.com>
In-Reply-To: <20261124022107.32283-1-ljp1205831794@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 12:50:21 -0500
X-Gm-Features: Aa3M54rTrVlRJogvLdZlOlBUntzVGX-lKN5GyjMtLtm6uLQGHabDbIb2QZZt7fY
Message-ID: <CADvbK_ekpmyug=RZ4nLUotK7jimxKrw9gUiEyF0zzopM-rzPUw@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: preserve the peer transport during INIT
 error cleanup
To: Lin Jiapeng <ljp1205831794@gmail.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vladislav.yasevich@hp.com, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lin Jiapeng <jiapenglin@tencent.com>, 
	stable@vger.kernel.org, TencentOS Corvus AI <corvus@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:21=E2=80=AFPM Lin Jiapeng <ljp1205831794@gmail.co=
m> wrote:
>
> From: Lin Jiapeng <jiapenglin@tencent.com>
>
> sctp_process_init() removes non-ACTIVE peer transports when INIT processi=
ng
> fails. The transport matching peer_addr may itself be UNCONFIRMED, becaus=
e
> sctp_assoc_add_peer() only promotes an existing UNKNOWN transport to
> ACTIVE.
>
> If no ACTIVE transport remains, the cleanup can remove the last transport=
.
> sctp_assoc_rm_peer() then interprets the empty list head as a transport a=
nd
> passes the invalid replacement to sctp_assoc_set_primary(). KASAN reports=
 a
> null-ptr-deref in sctp_ulpevent_notify_peer_addr_change() through
> sctp_assoc_rm_peer() and sctp_process_init().
>
> Keep the transport matching peer_addr while removing the other non-ACTIVE
> transports. This preserves a valid replacement path without retaining an
> arbitrary UNCONFIRMED address from failed INIT processing. On a live
> COOKIE_WAIT association, T1-init remains armed and can continue using the
> retained transport until association teardown. Successful INIT processing
> is unchanged.
>
> Fixes: add52379dde2 ("sctp: Fix oops when INIT-ACK indicates that peer do=
esn't support AUTH")
> Cc: stable@vger.kernel.org
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Link: https://lore.kernel.org/netdev/20261112092114.12458-1-ljp1205831794=
@gmail.com/
> Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
> ---
> v2:
> - Keep the transport matching peer_addr instead of an arbitrary last
>   transport, as suggested by Xin Long.
> - Update the subject, cleanup comment, and commit message to describe the
>   retained transport's use by a live COOKIE_WAIT association.
>
>  net/sctp/sm_make_chunk.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> index 15c2d87575a8..65594eaaeacd 100644
> --- a/net/sctp/sm_make_chunk.c
> +++ b/net/sctp/sm_make_chunk.c
> @@ -2525,10 +2525,14 @@ int sctp_process_init(struct sctp_association *as=
oc, struct sctp_chunk *chunk,
>         return 1;
>
>  clean_up:
> -       /* Release the transport structures. */
> +       /*
> +        * Release non-ACTIVE transports except the one for peer_addr.
> +        * Keep it so sctp_assoc_rm_peer() always has a replacement path.
> +        */
>         list_for_each_safe(pos, temp, &asoc->peer.transport_addr_list) {
>                 transport =3D list_entry(pos, struct sctp_transport, tran=
sports);
> -               if (transport->state !=3D SCTP_ACTIVE)
> +               if (transport->state !=3D SCTP_ACTIVE &&
> +                   !sctp_cmp_addr_exact(&transport->ipaddr, peer_addr))
>                         sctp_assoc_rm_peer(asoc, transport);
>         }
>
>
> base-commit: 145480b28ca82e9fae789427cc4569e596515a32
> --
> 2.55.0
>
Acked-by: Xin Long <lucien.xin@gmail.com>
