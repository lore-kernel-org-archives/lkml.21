Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557493;
	b=Mw8dDVwzkYOr+OaxlJTor2vcq6Q8S2WincF0RPzp4CCshCi22HjoNPKu7Fw0F6ulcluv
	 vAVZgG9JPE/MMjQlHmmVfBo7S+q8ALTR9Lm3pT1kKc4VnT/gbPT6wtxWgGLmH9ytwUBfr
	 oY4OhhQNG68qTnE7OhUN7SVlCLoRtN9NACa+kDIddKpR5CS8eTDloKsq29U4g59XWstBh
	 JPjX4suztMEo9poMeVoi/uXoozupJe9bquDgmfus47MToihU7yLao6P5YqK7w9r5oMH7h
	 7qhQWZdtTXo9jNp8VCEVmJodOsVljgRd2iSIwTanRUOUtSzj/v3jyhpkZGBA/wSe2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=aa7YPfOROhEx6JieLJ3TSEkUZ7Fh13WAPekCnuIIbKA=;
	b=Lbkv6uGDf/+8t7l8XerZlQmFo0bchi9d/yFhrOfI7FdSZ8feZoGA9PseAeVtv9agR9rI
	 iqc6pTSNh0xeQKS3Ipgmu2ejIshFswCbyZ0PuRBT+N5Npbx7hp3BphEpo7f2rENNwJY1J
	 DGcQuBFB5eAPFb/9+2IlTsdq5LNFtGDX/w2o4YrBEkeqWqDG7X+eAXXv2qUyddL/U5Vm+
	 f+g8r9yXVNqS93qRREaP/xity0DBhlb++nxFsqPlY9JSqTmBORXJ2Coa6bZHO79PHl+bq
	 vaS86fyrNsmF2W0KyUAme2+x29srZmUvrK2SImGBVXnEEB8ov7jl6DLbI2UAhRoeoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="l/S5P4hq";
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AFB4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l/S5P4hq
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365f9a04c5so31669911cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557492; x=1796162292; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aa7YPfOROhEx6JieLJ3TSEkUZ7Fh13WAPekCnuIIbKA=;
        b=l/S5P4hqCvL94AjUk5b9ne9H1xJd9oho6SRjlcv96sjrcFsyAc3OuboHG3NRfcyEdB
         OFFkiLRZjiyy/ykt55VenVCHzbpuH431SsYd4RW3mDJJbMCtGzoLNGJzrPzUJ3QNzH+y
         zNQyQSkclGcE8Z4yTWMNkwllmyc75jcpFC1OTK8er/7hlPqylIvaTUlerQ/6Kuuo7c2t
         sI3ZjJSDwa424rWn+zMHw3YOZhQ7tYfEVdk9C6UuejjCcnmNQdDwcHZ2qgMniZ9688uv
         bmQeljcPfVTU2UHO4Q8pCgUDRzWUhSyasb/5/2gGp3atWUG4fTjdFQhad8iUj9pDJPJt
         7XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557492; x=1796162292;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aa7YPfOROhEx6JieLJ3TSEkUZ7Fh13WAPekCnuIIbKA=;
        b=HuukoRClHpe8fviuq7GQpFfES/2Z0G/BwAPgrTcyxoPjngJoFonnvPxLu9PftlLGAn
         2umTpQbxUK/JNOMtyeGxTz1wWp0hifBXaRIotwk2O19YqGIPPVfTqoYy3+wSZ+gv/d1h
         uaHjKTGTBljdTJNburlIE7/C1xFEHxqTLe7iId0hm4t+2jtOhc0XkVOW+yh78T+dF9X5
         5L7MJPtDqrM56nb/qj85mGXtF8sz+NHP/nJhOTiYtrCl1vIInX4q96L74Ln6R91vtYJd
         aIS48evrXyiPNLD09mp0Iwk1j+qH3M2KcMNtUWIRtNl/e7OkZjem1WXA7xaKQkwxCjBP
         qPbw==
X-Forwarded-Encrypted: i=1; AL+hErF5456tNxN6bMdQd32NZK0IyZGHcQIq6bCIyegk8FRD76/57gbbdm71iuHAv+11tm1TewzckVXTS8geU/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9krnSn558S+nfBI5cNlkirv27H/O4UF02x0mhcUx4Lc9bLjdAQ
	V/8mKGZSi16btxS2OurK3a7hv3IiB1t7mJPxPjZFlBTt4nSIeWf3QRYTOuU25DtU/3g=
X-Gm-Gg: AZFdTZcsmQ0rVNl9MZQ/i0Zm0tVaSIZcwpEUXBzAN9ttRQDaZJAYWKzte1SLpBBnnw0
	WBdooaPIfZCQ9nLiU90BTta+gMvHXcwoPXX6v39+1CHBiyzUIeHzIHzE4tuDDIHtG8x371XI8RD
	HGNnHw/P8vBGJRFWpxWkBdq4teGJc+baJDo4bnuQZU28vM6fqWDBgfwv7l3XVqqByWllqOXRy/b
	H4f4keCKoxFgnVa+jZwTy87tbYnDsgwMuV2kJqmWYTOZLmgHyBaFnXns+UBD/RGWxmfmC40ZHVY
	BLC3j7a+26SU6N4C0Ny7D602VJ9IDulggR2oV2KPEV4aexzhQg8RRdS2umuNuXZPhR8FzpiIUgE
	TEpvRB/Lu1h+4kx84MuJjOeCEq0KCGXK7YqQfjsp+3zGwDfruHnc3c/FFxFrQxoC9KD7QMSHMYb
	4/uttszPh1UGQKyUo/o5vFZ/mMMSXdQD5FDBwiyGPxoONdlE5dOrhcAlcB1L7qV9bHgpaw+49tH
	QfNCDRReEtDMWEMikWw4mGMg7mYxYxYZoqs+qT9r133eAJKHB3Yhgl/L1JPz0ejIHuVgU26mgQk
	XpvuEzbr+gWqBCgsORRy34xAIvONRQ/KeyQUEEMaC0onhdWnaTqxaVZMm3PIkztxQ+h0x/fS9dK
	1
X-Received: by 2002:ac8:5e53:0:b0:536:699d:9a22 with SMTP id d75a77b69052e-55d76aa8754mr292073611cf.57.1795557492035;
        Tue, 24 Nov 2026 13:58:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f2186sm148298976d6.29.2026.11.24.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:58:11 -0800 (PST)
Message-ID: <79df445f3906ef7147137d991e0fd14f7815d22c.camel@ndufresne.ca>
Subject: Re: [PATCH v3 03/17] media: v4l2: Add Apple interchange pixel
 formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 16:58:10 -0500
In-Reply-To: <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-0opacj9JZF7JzicRk9mL"
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

--=-0opacj9JZF7JzicRk9mL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Apple Interchange is a compressed and tiled format modifier.
>=20
> Its intended use is for sharing buffers between hardware blocks (GPU,
> display controller, video codecs) on Apple platforms.
>=20
> Add it to the v4l2_format_info table to help with calculating sizes.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 6 ++++++
>  include/uapi/linux/videodev2.h        | 8 ++++++++
>  3 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 43ef12d073a3..896c07d93032 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -336,6 +336,13 @@ const struct v4l2_format_info *v4l2_format_info(u32 =
format)
>  =09=09{ .format =3D V4L2_PIX_FMT_GREY,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  =09=09{ .format =3D V4L2_PIX_FMT_Y12,     .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =20
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX12, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX16, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX24, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX03, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX23, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX43, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +
>  =09=09/* Tiled YUV formats */
>  =09=09{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  =09=09{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp=
_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 1f2519ffeb2b..e40e2ebac241 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1561,6 +1561,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *=
fmt)
>  =09=09case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr =3D "PiSP 8b GBGB/RGRG mo=
de2 compr"; break;
>  =09=09case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr =3D "PiSP 8b BGBG/GRGR mo=
de2 compr"; break;
>  =09=09case V4L2_PIX_FMT_PISP_COMP2_MONO: descr =3D "PiSP 8b monochrome m=
ode2 compr"; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX12:=09descr =3D "Apple Interchange NV12"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX16:=09descr =3D "Apple Interchange NV16"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX24:=09descr =3D "Apple Interchange NV24"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX03:=09descr =3D "Apple Interchange P030"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX23:=09descr =3D "Apple Interchange P230"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX43:=09descr =3D "Apple Interchange P430"=
; break;
>  =09=09default:
>  =09=09=09if (fmt->description[0])
>  =09=09=09=09return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5472e433ed06..f218f4fb26a4 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -842,6 +842,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_PISP_COMP2_BGGR=09v4l2_fourcc('P', 'C', '2', 'B') /=
* PiSP 8-bit mode 2 compressed BGGR bayer */
>  #define V4L2_PIX_FMT_PISP_COMP2_MONO=09v4l2_fourcc('P', 'C', '2', 'M') /=
* PiSP 8-bit mode 2 compressed monochrome */
> =20
> +/* Apple Interchange, compressed and tiled formats */
> +#define V4L2_PIX_FMT_APPLE_AX12=09v4l2_fourcc('A', 'X', '1', '2') /* App=
le Interchange NV12 */
> +#define V4L2_PIX_FMT_APPLE_AX16=09v4l2_fourcc('A', 'X', '1', '6') /* App=
le Interchange NV16 */
> +#define V4L2_PIX_FMT_APPLE_AX24=09v4l2_fourcc('A', 'X', '2', '4') /* App=
le Interchange NV24 */
> +#define V4L2_PIX_FMT_APPLE_AX03=09v4l2_fourcc('A', 'X', '0', '3') /* App=
le Interchange P030 */
> +#define V4L2_PIX_FMT_APPLE_AX23=09v4l2_fourcc('A', 'X', '2', '3') /* App=
le Interchange P230 */
> +#define V4L2_PIX_FMT_APPLE_AX43=09v4l2_fourcc('A', 'X', '4', '3') /* App=
le Interchange P430 */

These needs to be in Documentation/userspace-api/media/v4l/pixfmt-reserved.=
rst

Nicolas

> +
>  /* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixel=
s */
>  #define V4L2_PIX_FMT_RAW_CRU10=09v4l2_fourcc('C', 'R', '1', '0')
>  #define V4L2_PIX_FMT_RAW_CRU12=09v4l2_fourcc('C', 'R', '1', '2')

--=-0opacj9JZF7JzicRk9mL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYIcgAKCRDZQZRRKWBy
9LYlAP9eNt64YAYVi+3tdmO2eVOgxAxX3MBInpvFBV83Km5LlQEAva1+LKSeuhBa
0jv5NXY7twZmCiEmTXSCAQrzfD7RsA8=
=Z59I
-----END PGP SIGNATURE-----

--=-0opacj9JZF7JzicRk9mL--
