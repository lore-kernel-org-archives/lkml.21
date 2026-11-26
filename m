Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713755;
	b=MjCjtNn1Uq1X4jnQ/FVwmf6AreC0ZaSz+GpAae9Kb2fWYaNcUVLU/S+/7Q88lFLnZeJE
	 Zt0z1fBJ9vE7Hmmlc+AKgCQhwZXYWLBRrWKaeyP48PjyurnHECB4Q0xBaEWkbCAaWql4o
	 qH4PAMCcFAovLCIbv/HkUXES7pUR7zwIKEr9xx3HFVuGexuUFcptuwW9LzExPdUY4nDOA
	 7++0Epd/um2lqFxMNLmmxFTVtpL4o1juZDUBfwbw9+BQ82l0qC+wYg0DOKRIX/tX7MO6i
	 dz3GrAKuDm6YM2J/ycPNxuskE3sM7UhaRm78uNvOXHm/mB4kIjAplRMS6yxAvvxlWug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
	b=PW0/NOHaybrKtZcG/gxkGCkCY4tAcktlOIq12h4NsnhhIUu8wDbstS+LdQoz6sqwBmfS
	 6Vlf2XHLpZ4wHTFOZucjny2cY/pRAoehGwLTZQPzWYs9ZMwuVhO2H3gXzZxShX90ZzJM1
	 ED89J/ZCeoAw+GFHpCuZXz1HRDeJmvM57hZqJYiSeTsslU4GdMcLCOkvhzObbiUpb7Z7a
	 LPAoLbVMr+z7kAFxNR9ed7d8qN3zcMbo7WwLrkpk8ygeBkVU45uoHZE3EtZ16QaIaKqej
	 lgJtq5une6Gyq52BWBIXzrS6UPq5XDXIqUW/LIsp0ruv86Rw0VMTX1987c6eLyi67XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFFixd9V;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFFixd9V
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so62279785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713754; x=1796318554; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=rFFixd9VFppWyskf83oFgo4ScA/+0HdVHjm4gjQNPa9yvLe3NJhTufUFggkkPT7cM7
         10tLKvi0MkT/q1cEyRG4rYZPFHOhgv5P6lOBct4QoVGRrxea0JM1Vg5EcAzFzXjwb34X
         ev/iDK1YFv27Fmc3etSuTokLrPXyq0OMc6taqqH2rL493j7VY6WJTXrsnf4Z34bxE16M
         n1XedJSwgz1fs7OeQ8RlKU2G7THvwJt689wgu9gYObUGEPpFX5Aw7sT7g7RLFT9T81Pj
         ea9NLITnMOFnY5M8YUhtO/uVnNRy1T0OTwnX9CV2BENhNBh0vAtWA9jxJVUrLPTPMsvg
         IcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713754; x=1796318554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=QGxuWC16WJQ1ahscZQey4hcehy33aixaYp+z1ChwYmgL/3grpjfTjggxMFj0VBLCZX
         l3KJ90V43ohltb8ZY8PoJdtseskuaeb9bH9Z9szCJcabQLM7AuOrAwPUmwWYeKs+/x5B
         Qgs0a+R23QF44WBYufYVkuDi2n9RWwbh0LXw+HW9Zs3Vb8uz6fV969lPZsfXWbBgIafD
         7FddAYNNwabKmfRGvhU7//U0p59s6cRdIuTU8keS5HAsvim8CVlOBc9mJjHJvxwuHf+A
         NkbQU4+7c14CYMWRf7kDcHmgH7FyQiODUTmKfuhalFD7bDPnQ7mZ32l9OakphV6agJ6v
         UPTQ==
X-Forwarded-Encrypted: i=1; AL+hErHQLFhkVOwcztgonUNtkhwDh5LustpURAqIZrRUGaZ0kukadqVcvNj2f2aipBLZXKxJpwiRtYixyjsHJRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kLIOGZBEZ41gsCaZcn0SdX3yC97Pi90TVsbRYylidYws7zSGd
	5qtdRchLpfzrTDxIJd0A1de5csim/3ZqmD40j1Gh16PN7uNC33ODTymo
X-Gm-Gg: AZFdTZfbTuJf+uMawZwGNKvg5xP9SfEwSq2TQ656xU/9b3goQsZf0Iw9C37oh4lfQ5S
	rTVTwEVoxeMbCKtZt49AQZ5Zml5vlzjDo2B7/PDdLqPlQf+g0PBH1/QNRbxW5qcO8AElqyCKUiA
	XR0V6oscBELILPXqhGRP2maqOldM9rFxzN1LS2wscY/twjRIiYKpwTv6jrLyoUUnwC9gRX4ekMR
	Oj+qxko5mG9pvSf3W2ON2ICWdb047Sh4XXGg5OEp2LKJSXoIuSj9lafrT70W6b+4FYJOnlZkyT8
	sCwCfENKBJjU4/wfiGqAUmfSzfvhB8PZJOJQnkiyh1kshzpt1XA29WB++8gyRyWbM5Za7oTXP9s
	eFRZr1pz8kbydqY/t5zS1k2xD5JD81WJF1NiNySeNhh5+ud0AheRGlaHy9LjeIeY1eZjXdJDhcH
	F9YIOU0brHa2MLZh3G7UifrYKLQzWenhEI3DzPs26SJNiY97vSWpV+Kt0UtVX9GItEtMi60Grvk
	qI7zmN4wCX4BnqWAVLh8HgNPa7gDtNIpFAhilS6Yitc1J9ur1ChTf95hmilI0P0HEtHZFXznsS/
	WAhZjqDzYnDgUj7/k40sad6bT6tBlmq7zUT2XLKXdm4ddf0YIjy78tgGxPzhBH30zOtGxPeBk4x
	pjYZk2wmClAAnTxJCLEmEVqRahg+4sqkzr7nDSIW1m78S1dQp2XC5LlFmiuPCGud944v1sE0tV0
	skZQ89mAUazwMQNprqaT0TxvL3sRO+u/gpAyGXR2vAyYp1h1vP+UOu8pw7E+uyzOJArCQSlABcJ
	3DHuiD6f+nfrxjCrwUQRgpnyqzOvbDkynJNu+ARg7xszIJ/Ll0Tq/I/hsoOSA4=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr450092465e9.25.1795713753675;
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm348317715e9.0.2026.11.26.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 2/2] media: cedrus: report only the picture as capture payload
Date: Thu, 26 Nov 2026 18:22:32 +0100
Message-ID: <KjxG6AExQdOXUtc6OkeVCQ@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:48 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> For 10-bit H.265 the driver appends the low 2 bits of every sample to
> the capture buffer and counts them in sizeimage (extra_cap_size).
> buf_prepare reports the whole sizeimage as bytesused, so userspace that
> copies the payload gets the private plane as part of the picture.
>=20
> Report only the picture; sizeimage stays the allocation size.
>=20
> Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames=
")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 9b2d24e77fdb..b7e0cbe548e6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
>  	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
>  	 * it to buffer length).
>  	 */
> -	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> -		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		unsigned int payload =3D pix_fmt->sizeimage;
> +
> +		if (ctx->current_codec->extra_cap_size)
> +			payload -=3D ctx->current_codec->extra_cap_size(ctx,
> +								     pix_fmt);
> +
> +		vb2_set_plane_payload(vb, 0, payload);
> +	}
> =20
>  	return 0;
>  }
>=20
>=20




