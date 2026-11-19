Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097833;
	b=YtJ8/qGHXZKM0K2oy+q12b0T2xHePOhZlxs1B6PIyeWaivY/wJAb3kqnMaZNJM3//aNk
	 koLJlbPM768MEidHmL62Ms+yPJBk13SHlCVNj0l+PPzDaB92zlLLwzrNTLI3kgcfOJFkI
	 JoO0Wpf7TcgYXJNV38nPvBFLqw4+k2HGAWOimOS0wTIPNsP2IXpi5EBEauyXUO5tWuZdM
	 O1tqJrVqIJlOGe05dI+28QTUKdjiJp+kdG8nLs6+PnLK2kyixmpLsCwV0UlnCLyYeq2Rk
	 y5Fo9375nWS6ef1q1VdKnXZj25pZ8LjfICweHyHDbg/gddb8jhI9j0ueINIJyle5rfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
	b=qU4qzSRZhU6an+Ey5k/5dSjCiwAe6TNhCmVJhjOATN7F1U1zUeCtAQ/Ky7MivCPy9lb5
	 FW8+GVctsLNYyM+yTqf6IeQMf27bUilCSS94dCXVhTpQ4fyMUGumrO+nCzZzMR73FGGJ8
	 9Pr93XZjryiCUYbpXuWcfQIeBe+ah+bZ3T2fNy5GuqCM9qKnig2up+Xj/7qhs+uCkoqsA
	 cLHSCBnfMavFhuNZiNPOOeyQQEOxnCNeprD2ac6a4vFL8mD59jdoNVlZi/ZjWeppqRMVM
	 89FUl85ttM6sMzHDTTmfPWlc+qWpMSWudzOEH1C+Gzi72heNsWG+oySguncXm93F9xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYLCrU1b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FEB606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYLCrU1b
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso22258881fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097831; cv=none;
        d=google.com; s=arc-20260327;
        b=Jazc/bSdkRi6dIkwQ5Qcg257ig61mM8lgNa71Geam/huqSl5EfakENZ4T5q3OhLTAZ
         fQ0KKPLMdLhZVe/8xiNOwGASjraIc/fczIM6HB/YF1DrvGbQbfMoo2MO9yjbN8bTS5Pr
         XxBdvKlPyAuwvTm7YVsz4Oy2eoTiHrYzisN581Ahyvd59bbh80ynG7WVNngm4+MwrNQ7
         z2ytPt76kNFoKpxuZouEcGV7ecpse80ZgrIxB/1ScaDHKtx75qfyw0qCd2H+nPtzHffZ
         zmpV6xlOZ+Lz51tbFDGIrTOgeeTsJ3UviyqfnEDqfDyzTJQcdoTwjf8xjgtcvavArlPd
         zBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
        fh=BLloX9fA2c8s/dZ/Q7eu6+hjkhft1EqO1653OTdGecQ=;
        b=Knf0MBgGCm3c7HWFZi/P1w8YZhasdAVd1+8MLChtdi97HxfewiOuBE2ngJLMYGxN55
         2I6CCbDeeAHMMNKpsnlKEWrjlryfHf+SyEU4HzDX2GeqXNvIL5awDWurKVTkuH5LsQIa
         i320QETWGfJuzpgXSOHOcyDvJRp5eFdnEaE5A0Ju/1jAKeTMj2ZNILk/urn8XWGfobAp
         pj8OFD+T8TKyeAeHbtHE0u1DEC400FxazaRb/IdzenARFORqMmsKBjr3uPIqOxt7K5kA
         aZVKFI/kaw8nA62ysiG/tL2jeZLY8TMUuV2lSpy7nv00zKw0QdN2QKnZY1ZGxzg9New3
         oLIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795097831; x=1795702631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
        b=gYLCrU1b14FtyWF9J9rRGDjfdc0Otf4TgsztKEFyUN8vJ9fEW00iNlVqaoT2i619GN
         PxW3UzyGLeWoFiRpiteOsZMxbyCOnwB0I4Vz7wka/NNZaRvwxaLO+iTNj7edK7aSpb2E
         6dlsAyjI70MyFpVX27aztVirR/jyfNLlLk0ArU3X1/lW/5ew9DP4mA3FM2CFLrkx5a8B
         Q7S3hXRSwI+Kfx8e2500V5OyhAsVHtbBuYy2Lmdx6wFHL1iEJgod36lZbX66g9lksG4J
         PlM0PO+aDLTSGc+5+rIr20nfPTNKiUbTBRQwHd+HMGzbCyYY9lMv1PoV78+PQOtZFcf6
         kgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097831; x=1795702631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
        b=HQLDfyWB18dxwbhg8hcW8vyaur74WfGh78aZRnyU81TbgwQ1TjvIsixhsw2w1hv2J6
         EEN27P2nWiPvB7isAN8x7h+KN0a3g37Xjpo0a3Zcx8xDwUVng7e57Ek5SyQvQ/TYqlY2
         VjyshfazNC6wJ9ekTHhQycHzFivZzoOHL3pgUzEyf4NfU0VjKnEqcuHMRc7wtZJebO2M
         T3nIFMukM58WU3YdMmv/R6axZd2VaVgWS6FKmeRvGCPrqcqf81QUPxE7+DzzQTF09qq7
         xbpj1kk0YVwhSZ/vVBeRrrV2PViRwNAbpLE5iCd1whLK5Ef6wCn20dcFBeTgHwPGY2I2
         zarg==
X-Forwarded-Encrypted: i=1; AL+hErHBzJSpbRbD976WTrBaoYJAPcl87ytQqnYHHB5R8SbPpkvQNzIGoELj9fDFg0ECwFVKL5zpPulVV+JP7VU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h4jFd51pd6KzwO6Y8Ji2+vaae6o2+t2RhllSDXvnIMzN+lgHs
	n6vbrKEV5l5Z44/c++Y+lcSrqxxpw83OCxVslok/3RpDrKh1W/PATtyRU9D9FQ2hqntrqoYCfMO
	peai8/0vTB99vmSyik+fyAt9H25sfrnw=
X-Gm-Gg: AYBFou3xGLgto/oug67zxwzurjh7DzIO9x5F/ZdInQp33M7S9Gc8CVB+OBOHELPw8/y
	CoFf//qFiuab4mgCBP7tiUmhWSn6k+LvfWg0930POqjHBnJh7rHvngrpwGeo2g5xhfBkA9C+Nzg
	kt6ng4iaY2g83TGmyjgbBvtLeJgocF9UyIQwHgszWbTWKU9b0H6mbHYZBwdr62xNm7VCyYM4JVd
	quHfDbnFbOkapilvNwmVL+A25AquvpWycNNRgrVmHzoeAPmJbocbNfzHgTU2Dgst9cd6djtITuO
	IRwbfp/5WveTnWFyuXiOzWHVJkxURCkQDSsQPPb5sPNqIv+AJtCFARSIcW6PRnUH8y62Pv2LlmQ
	NRMCs2hWOyMbhhbB6hG/uhxmJyl4GmxrUTU7FlZs=
X-Received: by 2002:a2e:ac01:0:b0:3ac:dc69:e62a with SMTP id
 38308e7fff4ca-3ae7f8d3febmr335241fa.2.1795097830717; Thu, 19 Nov 2026
 06:17:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118120102.3717000-1-graypanda.inzag@gmail.com> <willemdebruijn.kernel.37588f5cf382f@gmail.com>
In-Reply-To: <willemdebruijn.kernel.37588f5cf382f@gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Thu, 19 Nov 2026 23:16:58 +0900
X-Gm-Features: AclHuK_LIRKFgU_S2fFfC6XZS0j4HJsS0X8_nxwW8loTln1Qz37v8K9q7GCKYcQ
Message-ID: <CAO7ntTQpeuWE4t-e_3d_aFzug=KiUd7dZjXpZgO-Fm=8iY8=jw@mail.gmail.com>
Subject: Re: [PATCH net v2] tap: clamp zero-copy copylen to remaining payload length
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Commit 2506251e81d1 ("tun: Decouple vnet handling", v6.15) introduced
> the premature check, replacing if (hdr_len > len) with if
> (hdr_len > iov_iter_count(from)) and crucially before
> iov_iter_advance(from, sz - sizeof(*hdr))
>
> Commit 6a53fc5a8770 ("tap: Use tun's vnet-related code", v6.15) then
> brought that bug into drivers/net/tap.c

Thanks for the review and tracking down those commits.

Mixing the two examples in my v2 commit message made the timeline
confusing:

- The second case (sz=3D512, hdr_len=3D256 bypassing __tun_vnet_hdr_get())
  is indeed the v6.15 regression from 2506251e81d1 and 6a53fc5a8770.

- The first case (246-byte padded vnet_hdr + 14-byte frame with
  hdr_len=3D0) predates v6.15. Because vhost-net checks the 260-byte
  total descriptor length against VHOST_GOODCOPY_LEN (256) before the
  vnet_hdr is stripped, this short frame still enters the zero-copy
  path. With len=3D14 after subtracting vnet_hdr_sz, hdr_len=3D0 passed
  the old "hdr_len > len" check, and GOODCOPY_LEN (128) was chosen as
  copylen. Keeping Fixes: 97bc3633bec7 on tap (and 0690899b4d45 on
  tun, which has the same unbounded GOODCOPY_LEN issue) ensures
  pre-v6.15 stable trees pick up the fix as well.

> We still should also include this fix (or skip zero-copy when
> copylen >=3D len)

I checked both options. Clamping copylen keeps skb_zcopy_init() intact
even with zero frags and completes cleanly via skb_zcopy_clear(),
whereas falling back to zerocopy =3D false invokes
uarg->callback(NULL, uarg, false) and increments vhost's tx_zcopy_err
counter on valid short frames. So keeping the copylen clamp in both
tap and tun looks cleaner.

> So there is more work to protect all paths. This on its own fixes
> one issue. It should probably be respun to fix the Fixes tag. Let
> me know if you want to take on the other work and send a series.
> This can certainly also stand on its own.

I will take on the full work and send out a v3 series shortly, split
by Fixes target:

  1/4 net: tun_vnet: validate hdr_len after skipping header padding
  2/4 tap: clamp zero-copy copylen to remaining payload length
  3/4 tun: clamp zero-copy copylen to remaining payload length
  4/4 selftests: net: check padded vnet hdr_len in tun and tap

Thanks,
Junyoung

On Thu, Nov 19, 2026 at 1:37=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Junyoung Jang wrote:
> > tap_get_user() derives the linear copy length for zero-copy TX from
> > hdr_len or GOODCOPY_LEN without bounding it to the payload remaining
> > after the virtio header. tap_alloc_skb() exposes that length in the skb=
,
> > but zerocopy_sg_from_iter() copies only the available payload bytes.
> > The unfilled tail is transmitted on the underlying link and can expose
> > stale kernel heap contents.
> >
> > For example, a 246-byte padded virtio header and a 14-byte Ethernet
> > frame leave only 14 payload bytes, but a zero hdr_len makes copylen 128=
.
> > With a 512-byte virtio header, a guest-supplied hdr_len of 256 also
> > passes __tun_vnet_hdr_get(): it checks hdr_len before skipping the
> > padding. That makes copylen 256 for the same 14-byte frame.
> > Larger padded headers can raise copylen as far as good_linear.
> >
> > Clamp copylen to the remaining payload length before allocating the
> > skb. The minimum Ethernet frame size has already been checked.
> >
> > Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
>
> Thanks for the fix.
>
> This appears to apply to both tun and tap. But to have been introduced
> later
>
> Both macvtap/tap and tun originally subtraced len -=3D vnet_hdr_sz first,
> and rejected hdr_len > len with -EINVAL. We should reinstate that for
> both.
>
> Commit 2506251e81d1 ("tun: Decouple vnet handling", v6.15) introduced
> the premature check, replacing if (hdr_len > len) with if
> (hdr_len > iov_iter_count(from)) and crucially before
> iov_iter_advance(from, sz - sizeof(*hdr))
>
> Commit 6a53fc5a8770 ("tap: Use tun's vnet-related code", v6.15) then
> brought that bug into drivers/net/tap.c
>
> We still should also include this fix (or skip zero-copy when
> copylen >=3D len)
>
> So there is more work to protect all paths. This on its own fixes
> one issue. It should probably be respun to fix the Fixes tag. Let
> me know if you want to take on the other work and send a series.
> This can certainly also stand on its own.
>
> Side-note: it is also somewhat surprising that we have allowed such
> massively padded vnet_hdrs all this time. But that is perhaps too late
> too fix. Certainly for net and stable.
>
> > Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> > ---
> > Changes in v2:
> > - Replace the Fixes placeholder and add the co-developer trailers.
> > - Document and reproduce the guest hdr_len > GOODCOPY_LEN path.
> > - Shorten the code comment and keep the C reproducer separate.
> > - Link to v1: https://lore.kernel.org/netdev/20261113164903.785381-1-gr=
aypanda.inzag@gmail.com/
> >
> > Tested on Linux 7.4.0-rc2 (067c5c24cef2) in x86-64 QEMU/KVM with
> > two vCPUs, CONFIG_MACVTAP=3Dy, CONFIG_VHOST_NET=3Dy, and CONFIG_VETH=3D=
y.
> > The guest used vhost_net.experimental_zcopytx=3D1 and init_on_alloc=3D0=
.
> > Each case ran in a fresh VM with TUNSETVNETLE enabled.
> >
> > Before this patch, with a 14-byte Ethernet payload:
> >
> >   [POC] case=3DA
> >   [POC] case_a_hdr0 received_len=3D128 expected_user_frame=3D14
> >   [POC] case_a_hdr0 tail_bytes=3D114 tail_nonzero=3D98
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D128 control=3D14
> >   POC_EXIT=3D0
> >
> >   [POC] case=3DB
> >   [POC] case_b_hdr256 received_len=3D256 expected_user_frame=3D14
> >   [POC] case_b_hdr256 tail_bytes=3D242 tail_nonzero=3D82
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D256 control=3D14
> >   POC_EXIT=3D0
> >
> > With this patch applied, using the same inputs:
> >
> >   [POC] case=3DA
> >   [POC] case_a_hdr0 received_len=3D14 expected_user_frame=3D14
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D14 control=3D14
> >   POC_EXIT=3D0
> >
> >   [POC] case=3DB
> >   [POC] case_b_hdr256 received_len=3D14 expected_user_frame=3D14
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D14 control=3D14
> >   POC_EXIT=3D0
> >
> > Disclosure: An in-house LLM-based analysis tool developed by the author=
s
> > assisted in surfacing this bug candidate and drafting the initial notes=
.
> > All root-cause analysis, patch code, and QEMU/KVM reproducer results
> > were manually reviewed and independently verified by the authors.
> >
> >  drivers/net/tap.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> > index 2f19fb07bb2d..f25c58d6e986 100644
> > --- a/drivers/net/tap.c
> > +++ b/drivers/net/tap.c
> > @@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, vo=
id *msg_control,
> >               struct iov_iter i;
> >
> >               copylen =3D clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good=
_linear);
> > +             /* The remaining payload may be shorter than copylen. */
> > +             copylen =3D min_t(unsigned long, copylen, len);
> >               linear =3D copylen;
> >               i =3D *from;
> >               iov_iter_advance(&i, copylen);
> >
> > base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
>
>
