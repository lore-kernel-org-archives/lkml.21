Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048686;
	b=lWp69wZ27YG0OzZn6PeAvISclXWkE18khXXvcDJHEbtfc2b8iNSC2TN0jA4NTYPRr5GS
	 99AqtjbBEfgYLCMmqtqkdtSA70/SI4d42PMjak3TJL5r/RvolAsP3kDjpSrbCbyqWkqYz
	 OS0TH5yXuAeNMISRtbATGEgyhsp9NbSUl4IBSG9MF5UOZESjKiE3Oc674F2jFuAx2HQwV
	 DvyGPQfayG14a2I/Mpc+C2JEDgwe6wPcH5DUiG8epytWV3+MbeSqNQQT632V+sFl0iILS
	 tXfTqG2mRgniWp1mobF4dzQA/XRZc/VB0U8l4aZOblrR5qJq0V83lUEBiNmFc/ahRsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048686;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PtNQN5iYY+jY31+2PAsZJiMk/VcCexNZzkbg/hmJWTs=;
	b=Yy4LbmotmSTjRZKzeaT4mLzCkTa3L1XopVeWG15mibSPwP7TGij9sG3Y4Uz/LNvNeCTu
	 UHyv+6TXSDuob19WIOZ1XHKlQg3fhx+w9EfVmynPc+06JH7/MSHbxVUQjjwnKTgVLdE3/
	 n2E68bPvR4ysGbqH6+T+pNQ/hthO8AODV6xkZtCYBxWaKQi32bgFuHuyN0ehHnBisC8IH
	 VMv59zQ25rEaGKedbkYfqOXN89SaOu2iAS1XqBh7hJFLDDWdNPWUSKIZki52iG/d38jxK
	 Fan5l8j2/eMWlbBMkKr3C17W62TOekG40rmoGkeO3pWkFZMNvZJASgIa5to2wgLLhNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJWSzLfr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F914606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJWSzLfr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D8E1F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048686;
	bh=PtNQN5iYY+jY31+2PAsZJiMk/VcCexNZzkbg/hmJWTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JJWSzLfrLWZLBh+bEY0S4ycyK9l/DjHDUguV84PKMcPNyaeevfvpGwjeP5NMi9c71
	 iO1zRMc4UNpYSZkasBAbCngTGqNTi6rJFXgWvtRq2s8zFweQezKoGi+adSu3FXCJ6O
	 Jz2zEwZ5MpvW8GBWHGmgpbcp4rFbHt5FGxPTYixIUfmHWnFt1Au65Knobt94LrSEPq
	 OBpFWYzlhRjvHuF0u8FwPAw53oZZ7YBYF9tAksGmXgb9jk+TO5LUqz1kmmCgQoezRx
	 OtPAjoCfGE1+4hu1Qk1FjFpPlcPfQFYdasd9AECJnfzFloDA6WQMdZa2IRDCpktwWn
	 yQv6f181rk53Q==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5118deebcfso184679366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFH/NnOjHBEwnsRtR25KjGnfD63YkU51yS+iYgTeplucTC7ZorwaY6fgDNdKOef7N6FxqCD5pxPLfvF89M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n80aL4wxhppL5fZoDU2pNAeubpdAoWAYONM4O52HvwqpPSnBR
	BVOqatiDjZbRpnVkzilA6WniHl0OlBdLcuK6hdbGaPhvcth8O2VIjF5rGBN3fZ0eMhdd8pL7Xqa
	9ZyrtpUHCQWHG33U9EaZWr9SvTTBDCKU=
X-Received: by 2002:a17:907:2d0a:b0:c42:4750:8d49 with SMTP id
 a640c23a62f3a-c510e19f1d9mr421000666b.25.1795048684847; Wed, 18 Nov 2026
 16:38:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118173454.76416-1-icb@fastmail.org>
In-Reply-To: <20261118173454.76416-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 09:37:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-KFizCjxU=qm65Aw+3NYoMWGHZhuaJ_7G5w_+4jFp5MA@mail.gmail.com>
X-Gm-Features: AclHuK8obTmEl6pbQBPLiW6u_HRdn8tgal2Bb23iPchjtvXRpFt8tnpt1hRJ6bo
Message-ID: <CAKYAXd-KFizCjxU=qm65Aw+3NYoMWGHZhuaJ_7G5w_+4jFp5MA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: allocate the security descriptor reply at its
 padded size
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	manizada@pm.me, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:35=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> smb2_get_info_sec() allocates the security descriptor reply with the
> size that smb_acl_sec_desc_scratch_len() estimates. A compound response
> pads the reply to 8 bytes inside that buffer, so after build_sec_desc()
> the query fails with -EFBIG when the padded length does not fit. The
> estimate is not padded, so a descriptor that fits the estimate can
> still fail. A query with AdditionalInformation 0 always fails with
> -EFBIG. Its reply is the 20-byte header, the estimate is 20 bytes, and
> the padded length is 24. The client gets an error instead of the
> header.
>
> Round the allocation up to 8 bytes, as READ does for its data buffer.
>
> Fixes: fda9522ed6af ("ksmbd: fix OOB write in QUERY_INFO for compound req=
uests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
