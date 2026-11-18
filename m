Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794997280;
	b=axYSx4/pmHRyALjIZujr5sQe3b0seN8bx3VYAZYLY2/Gs1YmoVi2ojHbpU9gm1B/KY2Q
	 yv3mLNb0vTJCQ3BdmHd/+771GReNDkGlLMrYtuJETkW5mnvzkQV3mjxoQq9j6u470pP+I
	 NKlvtbofwIiTHK+Zt622OgKRWNcVkgPZFxba1umHQAKvkVdC/9rL403Nh5s95QqC3EGoB
	 UOyaw/IvF98k4+sZYVG6LWLGKm0tHr7QQcBZ58pi3O268pCRg4w5YGA1tZAiwmy3+sQcJ
	 1pNxOS7/SIt9/C1vk2lEw2MTlE0mrgThFJ0KPA2ce7UxQjds2SrRjDnQTKBc2nGmxlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OKlysgVhXlDWHBj34P4jffZweJrtXPbcGRFSOLG7LlE=;
	b=dSE5ioB20I7itf9QRUHAgRmTy7AO+OXlly1dQZBWFZfFujoBH0VQVmblKuvjEirY17RG
	 3FIYs6uOJVPZCprHUoiJsCkUPTNeP+3aW5YB8mWda7rzEQ275BpXqM7vZKPKpk0dOXDi6
	 92XDJ3nU56lRa2hJgjuSE4bWMahT1jACTLxA+q4AeIgyRKGEZM3q5P+/yhQvjgoFgx8oD
	 E5ZmWdQz1p0In3ltmwZI9B65+euAudhTcsrQRg80Bf7lKMZ9B9o6kJKDjP62n0qCZCy45
	 NZ6IFqTxtQVBBMuT3WFvG+G79ySxErcyo5tsi5T4gM/inm2dfpHJD8cGdoE4Se5QThg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X11STAnA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4188C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X11STAnA
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so7788141fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794997278; cv=none;
        d=google.com; s=arc-20260327;
        b=eQ76IANEdvqDRYrKYfFraB6I2mRxh0IApipwCjSy4Jn8JqfLRAp3Ccz9+lxmT3Pwc6
         NbfNSjpVAZ9HM2AB6SdtzQl/3Xu9ZjBSeyMZWOab5QspQUg2z6I8kHHGB6vOb1kFSXhV
         +eBNJt3Isb0lEuQ1hFy7+22+LDnXwxl1KEMlMg2p1BPYqPnFqiRd+HVHLUPHsUTzj/kS
         x4xpICY0y4rIZqiIjjQsY3EsDBmwWVHCmrM9mXcMgSPDQqLeOcY36y2HVbT/If0GZJN0
         JcNpg+knVacEQ7DbnAUn/VqnBYPg4ktyiZOPmfwm4LEdCIUlvOWGZF4VYV5yN7SkvVfX
         V15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKlysgVhXlDWHBj34P4jffZweJrtXPbcGRFSOLG7LlE=;
        fh=sWLvaC9rgEEaris744WHnu9xUW7NJbI6VwnOwZ8jdvI=;
        b=ASNZmXzX7xASp+6T91KIGik2J3KvcmxaGbt2bOYKYH1idXUZ75P+x+dDNvZnsA1OMY
         itGwSWZxv2Ul+EHJUEgXJ776YTkxTe+fZkTAH1Q6J6VQ3XQsNEg/xI+dE6m9mRlTGTxh
         vRTutgfihJsXK3k8ofW/Rwot8r25/wCEg4m1Ck6d1wjm7RLE4c8kQ2HTOZGZoaxfcPGp
         hLIu5a2eOx3tdH5i6gleTNN6QkwpZ9Ct/I7NdR/bUr8Axd7Jg+DOCACxs2z6jpddor28
         rSr7g722T6hS6Mid+af1BY0v+LFdZNlh4XfxDvqK8w1YKyFsalzUzotmnvD3rre4uxKO
         SFCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997278; x=1795602078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKlysgVhXlDWHBj34P4jffZweJrtXPbcGRFSOLG7LlE=;
        b=X11STAnArudM4lWn5HjBEmbQz6YYaKrMjuk40u/0cSoSGLlRY8kbg4iWunqvUeUnmN
         ZR0fCtiY40t59+jVBoNXvROMtIAzHq6gmrWADGblblrIcod+bDXWOuUK/EDHdyBhPVRu
         ss3Oy6LXwE4fT2vD/Zj6NbPqWW2Hmm5as7PXhgk9EN8mFXflFbUmAF+6klv/6sDYznxC
         RKx0zoV6xVvZN1hqp7cvXmpcpWkIlcHjlDo3WE4GUX9NDYFYfrK8INOSqMt/XDQOhJuh
         pzqvpr2zwUJzVot+Q3DnkATXjkVuhFbSpPw0OKWoRrI+idb+F6Q3OIZJhRYnbDCcN1o9
         e4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997278; x=1795602078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKlysgVhXlDWHBj34P4jffZweJrtXPbcGRFSOLG7LlE=;
        b=Ao6Id/iaBV7zgPPzT8MpAq+NOrrtPLs3uFDs2m6VvE6/Rs2FrMRvDSiUgDkE1O0S0A
         a/+IgwkS/oF6v6YjHG4Lb0r2OVzRRLFD7Vbb1u53DMuHbWC8L75QJRhkMsB0EqNjuUfU
         vdnbQnsyKf2ehy3sAhtwPuvotTKQjaS5CFHBodiRcocumWILmVGxOhwGnwfpiBfxq/JB
         g7x1ey3UsAcl/NTsKNtf3G+/Bp968GUT5PupMvHC5xU81bFDD5sVel/InbFM030i6gor
         2fIV+dmVb7StKSNtgo89eSCdC/dbfTIwdUZBfLww4OXIDa90E588c4+pALKXkTio5A+O
         Mf1g==
X-Forwarded-Encrypted: i=1; AL+hErEbtqTMJO3wZhUjMwK34cY75OjImZu2SMCt+FJeQ2CFLbRUJqrm3f2SYlLEiATwr9mBWiaGC8har7t/eH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z4aF3uaj2s8pqDNDH7T7nb+Rcz4zu9z1pFWWb0xaic0fiIHPO
	ZSyLfW2DLCWSXfru+QBpk5RSlyuXVMga0U+zlboMbNG3kFbviRm4I6Uf66go4kzqXUl0gQDBSUV
	L7mT2TkEF7hlgf85zqHgV19Ei9eXeq3M=
X-Gm-Gg: AYBFou0W6khd/uiQxLeEuB9Zz9tD7PiI6v9vEJMzBYQInhwAbx3CIlPiaPF/ybOseTb
	WFIDDhpGD14OMZnPUsXmIfznwTMLJ6GDRqVTIdqNAK8cNhLxBJeN6vKJnxFZPj32b80TrdWVrzM
	sd23hQmUghz+zba7sHfKkcSJo44A6BRTuv5ki3/tBNrzfwPyg+U3Hrj/jnzW4k2lrGHoZKI5JFY
	+Wz3e6OeujUMNp4WQDoq1gGPv8SEoc84jBDDA/nDDSM7jTpVK/WsALyoGUvMwPn/6th92w/+3u2
	dAf7UnxRa1O+SOpNXd10FaJzwa4qkm2MJZsb2mBlEhW+1oU2XtUyOKZHeStDJm3h3kkfYNtYeht
	rRF6CApqp8G1BZjHDTBGSUoC0cSHDGPCmDUBRdg==
X-Received: by 2002:a05:6512:3d08:b0:5c0:471:e462 with SMTP id
 2adb3069b0e04-5c1a9b66497mr656788e87.4.1794997278082; Wed, 18 Nov 2026
 02:21:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113164903.785381-1-graypanda.inzag@gmail.com> <179493503300.3136.4070504744747730772@kernel.org>
In-Reply-To: <179493503300.3136.4070504744747730772@kernel.org>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Wed, 18 Nov 2026 19:21:05 +0900
X-Gm-Features: AclHuK-8A49ekN06DelaI7wTycoXs5z8M24DfEr9ZeGl99WxlDp-NH1QomMTSXg
Message-ID: <CAO7ntTSz6miMECPn8e2goAvYTYwUUpSGx_ozNHWbAfQ_t-rajA@mail.gmail.com>
Subject: Re: [PATCH net] tap: clamp zero-copy copylen to remaining payload length
To: netdev-bot+sashiko@kernel.org
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the noise =E2=80=94 I accidentally sent out an unfinished loc=
al
draft that still had an unreplaced placeholder in the Fixes tag and
was missing a Co-developed-by trailer.

Thanks as well for pointing out the oversized hdr_len path via
__tun_vnet_hdr_get(). I will send a corrected v2 shortly with the
proper trailers and an updated commit message/comment covering both
paths, and will check tun_get_user() separately.

pw-bot: cr

On Wed, Nov 18, 2026 at 2:03=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The Fixes: trailer in the commit message is an unfilled
>   template: `Fixes: <12=EC=9E=90=EB=A6=AC_=EC=BB=A4=EB=B0=8B_=ED=95=B4=EC=
=8B=9C> ("<=EC=9B=90=EB=B3=B8_=EC=BB=A4=EB=B0=8B_=EC=A0=9C=EB=AA=A9>")`.
> - [Low] The commit message and the new comment ("A padded vnet header can
>   leave fewer payload bytes than GOODCOPY_LEN.") describe only the=E2=80=
=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but tun_get_user()
>   in drivers/net/tun.c has the same unbounded zero-copy copylen.
>
> --
>
> tap: clamp zero-copy copylen to remaining payload length
>
> This commit clamps copylen in the zero-copy TX branch of tap_get_user()
> to the remaining payload length. Without the clamp, a padded vnet header
> can leave fewer frame bytes than GOODCOPY_LEN, and the uninitialized
> part of the skb linear head is then transmitted.
>
> > Fixes: <12=EC=9E=90=EB=A6=AC_=EC=BB=A4=EB=B0=8B_=ED=95=B4=EC=8B=9C> ("<=
=EC=9B=90=EB=B3=B8_=EC=BB=A4=EB=B0=8B_=EC=A0=9C=EB=AA=A9>")
>
> [Severity: Medium]
> This trailer looks like an unfilled template. The placeholders translate
> to "<12-digit commit hash>" and "<original commit title>".
>
> The trailer sits above the --- separator, so git am keeps it in the
> applied commit, and stable tooling can't use it to select the fix for
> backporting.
>
> Could this cite the commit that introduced the zero-copy copylen sizing
> in tap_get_user()? That would be either the macvtap zerocopy support or
> the later copylen clamp rework.
>
> > diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> > index 2f19fb07bb2d4..b1f8776a5ca57 100644
> > --- a/drivers/net/tap.c
> > +++ b/drivers/net/tap.c
> > @@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, vo=
id *msg_control,
> >               struct iov_iter i;
> >
> >               copylen =3D clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good=
_linear);
> > +             /* A padded vnet header can leave fewer payload bytes tha=
n GOODCOPY_LEN. */
> > +             copylen =3D min_t(unsigned long, copylen, len);
>
> [Severity: Low]
> The comment and the commit message only describe the case where
> hdr_len =3D=3D 0 falls back to GOODCOPY_LEN. Doesn't this min_t() also cl=
ose
> a second trigger?
>
> __tun_vnet_hdr_get() checks hdr_len against the iterator count before it
> skips the header padding:
>
> drivers/net/tun_vnet.h:__tun_vnet_hdr_get() {
>     ...
>         if (hdr_len > iov_iter_count(from))
>                 return -EINVAL;
>
>         iov_iter_advance(from, sz - parsed_size);
>     ...
> }
>
> That means a guest-supplied hdr_len is bounded by payload plus padding,
> not by len. Before this patch, with a large TUNSETVNETHDRSZ,
> clamp(hdr_len, ETH_HLEN, good_linear) could reach good_linear while len
> is only 14. The leak would then be much larger than the 114 bytes
> described.
>
> Should the changelog and the comment mention this path, so the size of
> the disclosure isn't understated?
>
> [Severity: High]
> This is a pre-existing issue and wasn't introduced by this patch, but
> does tun_get_user() in drivers/net/tun.c have the same unbounded
> copylen?
>
> drivers/net/tun.c:tun_get_user() {
>     ...
>                 copylen =3D min(hdr_len ? hdr_len : GOODCOPY_LEN, good_li=
near);
>                 linear =3D copylen;
>     ...
> }
>
> Nothing bounds copylen to len there. When zerocopy is set,
> tun_can_build_skb() returns false, and tun_alloc_skb() calls
> skb_put(skb, linear) with linear =3D=3D copylen. zerocopy_sg_from_iter()
> then copies only min(skb_headlen(skb), iov_iter_count(from)) bytes into
> the head.
>
> Both triggers seem to apply to tun:
>
>   - the 246-byte vnet header plus 14-byte frame from the commit message
>     (tun_vnet_ioctl() only enforces a lower bound on the header size)
>   - an oversized guest hdr_len, as described above
>
> tun_chr_open() sets SOCK_ZEROCOPY unconditionally. With
> vhost_net.experimental_zcopytx=3D1, the more common tun backend would
> therefore still put uninitialized host heap bytes on the wire.
>
> The notes below the --- cite the analogous tun.c report. Is a matching
> fix for tun_get_user() planned?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261113164903.785381-1-graypanda.inzag%40gmail.com
