Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459653;
	b=OH7XcpN7lm/6ertTNe6sb0yl4NyP4AdKvEerVCUJXZo2ESakPp6JTfa7s+aIPDXXBM/Y
	 VZKl2rXr1qvlUBJBmeU3/dis7IeEzCe4EB6Q5uQAf79br/w3DOs5/JaR4c3T/cyA1o7qG
	 MbKbviJM6PMhG0/w1/L9cTi91+mCdNjf1VezDhc/bCMx8s9yhqcPBZlDmu5kmZZN9ebIt
	 FKYoCNmEtu47t/3V4o8UU2r/Aq/AfMObH+cycle6P3OoTlEzWeTb9JU/XnXETrUOOPsaR
	 zEvH3lel5ZUfeaX+aC62QE4a/hRk68x1o1sZ1kc0UpsqZ7mOAAhdGBNBzj1NKEagLbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Oz/ub/KRgJipXG7VD+du6b/6xOBrJo+ZAuG0ng0Hb3Q=;
	b=CXkoHdSfjxVZ1aazwf4gmiEw6BFOvcXoUexItRqsAHP9oDmLANPQiWDOiza9nWlj0fE9
	 Ce1/qBTyi7XYCF3RnB3M9go1VTMZBjl8HAf0AvwijGM9tnVNOmsb/8fdbBxTIXIrtu/3F
	 1LZMZ6Lv64Gsnr7AHVjmM5tpXUREokX/Cbc+qDB+dqgKID3EaY9UvepuLxFA081awXm8P
	 0C05q/vWHjHsBc6duinJe+7qxzlgIB/ri8rIFQWQQIUm1LFev4YWkLVHHTDQzcWufBld/
	 WiP4bRuIdzshqqKUhBcnZqWHWW+brug3+45pl3h/r8meVzoWFAaknHTb78tY1pFX0cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhI2n2TC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FCD606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FCD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhI2n2TC
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db3a48dc6so4112531d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459652; cv=none;
        d=google.com; s=arc-20260327;
        b=EdMSHNbvaHDK+Vh1zlWX8JLle9ELMNBwmJSyBRmcmkSEXUlz6cleiNLJYAdUp7kPq2
         bj0EL3QPmvwxIF+gWi+8b/5jbMfGokwT4bXJ0h21Ht0Qfu9oZ13TcYXC3Jr9xUp1AylH
         oLQp6SskHhJEZs6LoMDk9rAOCM+KkHeMx9Ov7fwNgHsssnBRSKaForXH6LscChowlG1t
         tBT2uTiOGeIriAgSs7WZWs27S+UQ0asWKurqF1/V2iiWaTN80fI2EXaqa03/0OiXgdmY
         N2r8VvjCO7K94cg/1KJOH6rv9iL6JbEivZ4D0DAXrdq4S+v6H9g07Zs/IOL5ZJtnpi5R
         BZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oz/ub/KRgJipXG7VD+du6b/6xOBrJo+ZAuG0ng0Hb3Q=;
        fh=6NvP9AXTj/bVss13S47bYqBqXcYSY13v9D5TGbEW6eY=;
        b=gvIVsT0NHjOENjlG0PtyMS2euCCE43uuianNV5He923uhDlMeeyO4YYTMAx9TlrOad
         pX4dlco0AZNCtFAQjoKjR7RsobEzZELwQ2V/ydyo56fp7Ex/L4NjJh0LPJxzJo1FJE7Q
         GvOKUGk0srosDz7virAe9vd3KzvyTamJ6d4xFBLdDgYjghE+wkHkKDPOW68iT0q8VcrG
         pOI36sZxE8pA5uS0aXVbe5KNoIcR9okhVU7zBrdgRDHMFLDUqz1w+V2Zw819wrnrQ3sQ
         l3myNsxgwYB56hDW6kx/Xyo5Rz8uENyy3qtc+xPlBcKTpOVolsVm2KubCTv5jhwiF9e6
         IoEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459652; x=1796064452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oz/ub/KRgJipXG7VD+du6b/6xOBrJo+ZAuG0ng0Hb3Q=;
        b=MhI2n2TCIsCCvmxvLTktwXpdWXd/lQ5Btt2UxFFlZkRHrZA8gERCED6F+fb1Ts3dZ4
         0IrZpXibYZr9bykB9aGGkpeOJK5kgVi3qxKiIyzianP+YcI5GSJBvc8OF8F3gbwW/yZK
         4t5k/CziaOhDWMbCEWEZwHk6xldlPblFyw22cFVzsNvNCVfczotQ7EXssH9tmg4XSMnm
         cbRnJnBFdQs1zSgnTiDMTKTkHvTzHQvBf4hD5Nqai6RtBH4BoRbGMVuyZIWadwuig5QV
         ezgxGxJZP61dfI2HNk3TaR1+N0/QnP/AOEZ9rtHPRMW8We0YV9aGHkH0iOhdGj1gex+b
         2ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459652; x=1796064452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz/ub/KRgJipXG7VD+du6b/6xOBrJo+ZAuG0ng0Hb3Q=;
        b=DpXmMESs/B07ZTS7C8wr+BVfmfzbAjHF4aRGoZlOFb7akQYka74SVJQENw/bjWAEXT
         klWhoGRujL1B3cmTwp4mSGBml9f4e2QyXUgtn2Cbl6UkQk28W43/156nCr4aZJTPTCpA
         IJQBPTe3W1HLslbKFXbYrGtBYGwmLtx9lRKQY8WtM49tuklnmjvmVF+SQ7KsKeNQA42Z
         pX8FkDtiRMkBPiT9hXtCtXnqzgzCdkd4Bt8lt8M+avIsta1N06P1NdOlN6RwTdg91KPv
         ZEHTGb/LLwqwn+DFN0047UAvjmgAq4mf4D9ZmJNsWrwtA0ft+tCxai9ym/ZtZ7Rl5IDy
         8JLA==
X-Forwarded-Encrypted: i=1; AL+hErHuOeJx1AlhXfCToeMKhks4kdS2ZGZCIl4m4727coaPZAPEuVGAN/NAYx1Dr05BdjxJpNGyg7BCY07ziwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EbGZGA5fG4+CexY1g30BB91rN8h9jhLc0ijoJqsMk+moXXNTu
	ZfLe7+JqGWU84Ao4LAjrxil/FugNu508aF54xB0c559QLpMwPNpLx1WJXfW29/UmM5GUl4jJCef
	JfxWUNbTORW1nDBz/jpTHSypFCPQm/yg=
X-Gm-Gg: AZFdTZcTAB95WADnWFP41hEw8zp0gVwroLFQ8vRoy52+AWPRtOjxXgaXebPy0KgLVXn
	/a6kQLGTXwUhrKRgJ43OD0WCysy38mHTkx0Sh2mlNslvsA5AUuZJGaHYZ+HaWvgjx9rtZUDQt4h
	1ARY6ulj84upJj7Jy3RqIxjxH6VIvt2qm+CcYZcVuwIXj8IpqdEaNLxqrc7x7kVXVietW1jAjkO
	GqL166chLCBCYx/jJZF4IVbAANxlXx+qwCMotae4n5UxoCeFbHxerDd24D5PZTmpF9hXwmW1z3V
	sIddtFLRwUN/rQx5zo3Gfh69G9W8Tv9yStUJ0fov5OeoxHA6W45p6z2sfMTYj9DsfhaLXvrEJsm
	kagWonp/h1zUNvEAnVlmYLi6Tb6XDNwcesAmpGM3kceloerr69se8xBq3qRuAkz6XJWCi2gXqXv
	heUc7smeF4t/IsFhit74Scpoi87CEjXlZ0PUrNLGYs2+ysyv1TnAP/nRPL5w==
X-Received: by 2002:a05:690e:440c:b0:67d:994d:3923 with SMTP id
 956f58d0204a3-67df44251d6mr2512259d50.70.1795459652387; Mon, 23 Nov 2026
 10:47:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123113724.35381-1-e.orehov@ideco.ru>
In-Reply-To: <20261123113724.35381-1-e.orehov@ideco.ru>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 23 Nov 2026 13:47:19 -0500
X-Gm-Features: Aa3M54qSJVO5SPOzXonVwB6Z2Ni_CZoGzBv_8yrEDt3wp6MaU3FTeXqJ9I5Vl3A
Message-ID: <CAEjxPJ5SnP_LO6EieAkSuN18TGguov0KCA9EcufhMikgLYc17w@mail.gmail.com>
Subject: Re: [PATCH] selinux: initialize sport/dport in __ad_net_init()
To: Eduard Orehov <e.orehov@ideco.ru>
Cc: Paul Moore <paul@paul-moore.com>, Ondrej Mosnacek <omosnacek@gmail.com>, selinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:38=E2=80=AFAM Eduard Orehov <e.orehov@ideco.ru> w=
rote:
>
> Since commit dd51fcd42fd6 ("selinux: introduce and use lsm_ad_net_init*()
> helpers") the struct lsm_network_audit used by the SELinux network hooks
> is no longer zeroed; __ad_net_init() sets only netif, sk and family.
> The addresses are always filled in by selinux_parse_skb(), but sport
> and dport are set by selinux_parse_skb_ipv4()/selinux_parse_skb_ipv6()
> only for TCP, UDP and SCTP. For any other protocol (e.g. a raw
> socket with IPPROTO_IGMP, UDP-Lite) and for non-first fragments they
> are left uninitialized.
>
> When such a packet hits an AVC denial (e.g. with NetLabel or secmark
> peer labeling enabled), dump_common_audit_data() passes the garbage
> ports to print_ipv4_addr()/print_ipv6_addr(), which leaks up to four
> bytes of kernel stack into the audit log as "src=3D" / "dest=3D" and is
> reported by KMSAN:
>
>   BUG: KMSAN: uninit-value in common_lsm_audit+0x2196/0x2ff0
>    print_ipv6_addr security/lsm_audit.c:178 [inline]
>    dump_common_audit_data security/lsm_audit.c:373 [inline]
>    common_lsm_audit+0x2196/0x2ff0 security/lsm_audit.c:458
>    slow_avc_audit+0x17f/0x1d0 security/selinux/avc.c:773
>    avc_has_perm+0x2d6/0x360 security/selinux/avc.c:1191
>    selinux_inet_sys_rcv_skb+0x116/0x280 security/selinux/hooks.c:5326
>    selinux_socket_sock_rcv_skb+0xaae/0x1270 security/selinux/hooks.c:5408
>    security_sock_rcv_skb+0x79/0x120 security/security.c:4853
>    sk_filter_trim_cap+0x18b/0xa60 net/core/filter.c:151
>    sock_queue_rcv_skb_reason+0x46/0x1a0 net/core/sock.c:522
>    rawv6_rcv+0x1b17/0x1c20 net/ipv6/raw.c:371
>    ...
>   Local variable net created at:
>    selinux_socket_sock_rcv_skb+0x118/0x1270 security/selinux/hooks.c
>
> Initialize sport and dport in __ad_net_init(). Zeroing only these two
> fields keeps the cost low, which was the point of dd51fcd42fd6.
>
> Found by Ideco on behalf of Linux Verification Center
> (linuxtesting.org) with Syzkaller.
>
> Fixes: dd51fcd42fd6 ("selinux: introduce and use lsm_ad_net_init*() helpe=
rs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eduard Orehov <e.orehov@ideco.ru>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
