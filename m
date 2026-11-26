Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731592;
	b=lAPH6J9kPptqKjV2RXu1uAIQYDMDf90YEsfM1VjFdONNFIH2HKtcAyUkm3n24T9CICN8
	 N7G45E22LzNdYL9uUBNle7Ll4sWYO/75JuTux3/I8klzE9suBSYWHSZ1CWAAxQX385dX7
	 39k2TOFxH+NwF10+dyUYDbAO+4JiHt1meF1Uxthbyeitg/E/N/cqHtBLzUoakrPi1XxK6
	 523zJhOOF0wdK/C4EIL956CQoHnHzTkyHCRW7FI8+5Yi6CAQ61Wsp9VPQszAcLsDJC5+q
	 wK5oekXWek6fRrPocMgmnlQOM0ydzSD7S1eA2QR0tVAvd2VI4rfGNHbb12FdFk1ANDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
	b=FzK2jJpnIJbF8gLkZI2I8TRat3apb7I3/UvTcRDe/X3OVSn9LnAWEY6dQ3Iv78lmH62g
	 d95mm0HM/cvT3sBGTAdTAAgjjwazCvTQd0/sVLEtsHiSqkfX+nPC6dVF414k7YmWrknGT
	 WXn1wbZgzJoU7+IARsTMB24BNSIcZw0H6b+nAdMh1Ln5ZUTrOJXPzNAfEb/OyEAoCCxFz
	 0dMKLy5N9N5ZM8xGOALvt//CIJkrlI1+E1AAmfCc9NPfB48aVwCJwUN6wqDqXPY8QsgDA
	 fwNUTRrrj2I7q/0Z9SRbi3H5zjItaVgWnB8WaO7PBdAZsJSbKztmY+GpRaNI5WJWP9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PBz421Up;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7298B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PBz421Up
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94958650b09so711883385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731590; x=1796336390; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
        b=PBz421UpukIzl1hcCoOV46JH10EFBKC5FM1pbm4U8BYAeaFTBseoz6Wqt1gLxP7lqf
         +Xe3po5Gst65oNIYI9r42Ny9KBwTExRHbHCJHj2yMJpEdwCaMEtWKHKqbSMovLfNAJo+
         dp0ljJGar8c5Rt8s4EUI48/znO5VlGDTj6JKfI/STe7Sy7Unyvo0MwmXdUD9r2PY1Ef7
         veX5ciX+xhzzGdNF7XL5abjGzGVxcu28jJOKCVGPrLfodIxwfbUlTDRypXzEwGRXhjeW
         3ILYTl+H7sqd4dmgbIkDxuzRySZJW3U6200VnVhGeeWlu5q5mOkpfFCq2DqC/qoiV/2m
         IKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731590; x=1796336390;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
        b=g7U1X3wMIt6PEKRNo56HMQv9KiqwtSYT8w3g6XwrS98zX+5hsvA5XDoIndoIlvhhSq
         P+LbiPx6LNEZRDHYDW7oGYLCXRR9TBoOu9jM64gJJBBIg5Wj7V/7PZDxTm2QD4u8NZQh
         D9ux4mNXCZ7/IsJe9HadJtrXOWbn+DzeXwI8REXms0RimtC1ZPFhNuCQ0LGhsgQxEpvC
         gmrNP6AiWiplwfb0f3/cdbMOOfSr84m3/t/96hmiTNHeOVs7j0GkSNYzmhq/r3BbrAS6
         mw3wRs2dxSAVxxeBI2X3y7lOUdSfjwuIoN2lhfgBtK5jcun0lGzj9z7ldqBcagld7NoK
         pVmg==
X-Forwarded-Encrypted: i=1; AL+hErFFUXof1dFbVXawiw565K+VwNgzN5GN9bNxVR6LccyTQRvSCTKPsfwdfPQTXo/czSG4Snldk8EzeCIPRxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HK2lAradS7C9xAFDP3/PO6AUSqDKdy5hf8yuINY1QlrnB4Bj8
	BAoBZ0oPgXvBqCtfxnHVmgpqipfJPxIzzoRQHX6LdxpZ37c91vip7ANjjUCr0Mq8H8G5d3w7ANg
	rYWk3
X-Gm-Gg: AZFdTZdDF1yLB13fS0DGvKzHGV2Mk5miNcjRiHxRkwxKQsiy3XG2clr0i4ou1DBZlSU
	jKzKAnx3A1nvQU0OCpIPIa3+DCRan+DIR6SsCBnPiuFY2bSfDihKurJghL2vv49EKV/nzeUF2Zh
	tz1uM8D3hCQi/pS51xIIaO6zjsObAspW0AIBn7gyVHAPMdgWv5DQzntKumCP6gXNSi7E+aTs+F2
	QzhBxlNWWq4pRlS11w4OeNSySiG4s3VQp83U1/Bcg+VMkJygSNPzXGFBTeSMLfQpPNyf6T1DDDT
	cwF0+Bj5hxWMPaNF5cUeN/d9KjMkVR5l2LVa1sy8j2yhA8/mZHhih9Y2sG29CKzK8RDESKX+LdS
	rQ53785K6TNqMarDRTJsb5MdEve+/e6WoTzFE7bYeU/ky0Igxn58VVlR3QRImWtVdPL2K9u6QcF
	1xp5+5j9tO2UayUo8/EkxAigOWaScSSzoLsA8Q2jH4EeKbciEF3xzwtY9e23SZVN8Yi2fj+VzXf
	3ZWQsdg9IceWyZwMqfixP+IBz/aTGAnsxe6tINvGWj2jdZVArTG05Lq9t/YGhisLNd1FRUnxzLR
	YY6PDUXA3OgXbuEmbo0Zw3NbikCYtI6AXw5w6PEvlzZtbjIzqT3fX9U=
X-Received: by 2002:a05:620a:3188:b0:947:3673:f902 with SMTP id af79cd13be357-949ba9e9297mr3983731285a.55.1795731590418;
        Thu, 26 Nov 2026 14:19:50 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a09477acfsm454257385a.32.2026.11.26.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:19:49 -0800 (PST)
Message-ID: <c2ac221b70cc33e550f550ab21c1a5a5967d4676.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Free encoder controls when
 setup fails
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 26 Nov 2026 17:19:48 -0500
In-Reply-To: <20261103083533.1176842-1-vulab@iscas.ac.cn>
References: <20261103083533.1176842-1-vulab@iscas.ac.cn>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-v7c+rvNTZeeZDaQiPqM0"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-v7c+rvNTZeeZDaQiPqM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 08:35 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> mtk_vcodec_enc_ctrls_setup() can fail after creating some controls. On
> that error, fops_vcodec_open() jumps past the control handler cleanup and
> frees the context, leaking the handler's controls and allocation.
>=20
> Use the same control handler cleanup as the later m2m context creation
> failure, and remove the now-unused label. No m2m context is released on
> this path because its initialization has not been attempted yet.
>=20
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video E=
ncoder Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c      | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index 4e4541b2fc8e..dd47feea6acd 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -140,7 +140,7 @@ static int fops_vcodec_open(struct file *file)
>  =09ret =3D mtk_vcodec_enc_ctrls_setup(ctx);
>  =09if (ret) {
>  =09=09mtk_v4l2_venc_err(ctx, "Failed to setup controls() (%d)", ret);
> -=09=09goto err_ctrls_setup;
> +=09=09goto err_m2m_ctx_init;
>  =09}
>  =09ctx->m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev_enc, ctx,
>  =09=09=09=09=09 &mtk_vcodec_enc_queue_init);
> @@ -191,7 +191,6 @@ static int fops_vcodec_open(struct file *file)
>  =09v4l2_m2m_ctx_release(ctx->m2m_ctx);
>  err_m2m_ctx_init:
>  =09v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> -err_ctrls_setup:

Fix mtk_vcodec_enc_ctrls_setup() instead.

Nicolas

>  =09v4l2_fh_del(&ctx->fh, file);
>  =09v4l2_fh_exit(&ctx->fh);
>  =09kfree(ctx);

--=-v7c+rvNTZeeZDaQiPqM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiwhAAKCRDZQZRRKWBy
9OypAQDmjeaO3tv2K1mt6YGlWFssP0QrnOt96UUjRwEVvDQy0AD+NPHYtKJ2HV/T
EhM1Fwjl1AFFmsIQcqTGIoFBfxMBkgw=
=EM4e
-----END PGP SIGNATURE-----

--=-v7c+rvNTZeeZDaQiPqM0--
