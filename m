Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720677;
	b=Bb3T4nMFA+TWZYwGeYNYh5CGGrX7prUmK/ocbDefCARifNQYDW+pz4CUUTtgSpJI4UQA
	 uekfE4dURLiku+QPXKUh2+sh4TGJI5rNRTE3TsUgxYbeWUCCt4eu3nAGLBes6t8mBMjLX
	 xZWZ58/g6DUbfR/g71TO4dnQeP+dGCPPS+g2bG0iqD7DoMHTeXeUgiiemGZZNp1VoX1DE
	 zR8bEQoBDRc0MR9cDcBdEmSgmArJ/Fd2cuG9/K73HpdPNt0Sd1Usa89H2roFvV7b/G/AE
	 FNDVM6rAY8vKYipFChrUUaWUN3joj/yGeEiDUyTJgXe7jS7HVFx6i53A2RI9RfWELig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
	b=FO8m8+Uu5lccS/fzY3cm/HQ7ISNqSz3qjwX8AKpSQnKeSM4m0dFvQboaS3j/ktc7xSIf
	 w0vKcdvQT0CWnxbOQEqa3jFmOo6rp1bqH9EA5k8Ew3TWdCzpj1syeYlTlQ6raNiT6kKow
	 ubsZdXCcZIjh/RaKFqZem+3stcHXQxrAa1kH8DLcnG32rJ0A2mcbsg6QmWQgbG4dpuAus
	 Mnx0RLYlSghcN7OQ0kQPaeXFaEaOGDnh1yvNuvBkZo0p2WAMwb2kTlmkbHE/RKTl+di/n
	 gJXTvmJtPtTRioYNm79WhCsG+khCNJeEV+gkotY3Yvvimue8pfq0NCgXRIAUGZ/jrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pe2daaaG;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A69606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pe2daaaG
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f0274f88cso95814866d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795720675; x=1796325475; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
        b=pe2daaaGJp7uEf7xh9RtFYzylRRVXtqhAWVOceByYbXtwrCG+WTSsM8eAur5wzwDFj
         IEsbo/OB10N5fx5dmNSu6UDaQUUBUSVUUeyVr1MV1KUgXOTdkmzxCQbeEVW5Z0CHENAE
         Bapj8N9oqKThBCsT7HVHYi1FYptoJrIQtzkuWGl9wKc+YbvCbuKJIoBrKrvi+fo9TNKI
         HpZmzIPtlhQEm6zEKAuvdOOc0c9SzfKXv1wZAXXPYJLQbaBpJYH6NG2yrBJbv8IuwN19
         /W45G69JE/q9qWjT2qXQPRT5PLlJ7BTd3Xj0mJeQIezHTvSTyiLuXfU/UnvSEJKn0yHo
         e5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720675; x=1796325475;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
        b=lcsJbP0nfQzwCYDCqG5P7Qvy4X/BDsCxGK1MrmE+DjkUdhi1OA8uAo2r6kaO0gJ3VY
         zBQ0Yp9TodCGprIRQzcjo14JvaGMpyK88RnCcAYYIeoX1THShAZAQu5aDlGUJGjQ39cy
         581/T4Zwshx7TAFtlSsNUhHA8aAQqwSDoOkig/P1BuAlU5e6nhxENIBYvNmmzI1wnwlu
         bwknmrNbCfaXQ4e1iMrcgAJxoCjLV1h8EDjkK+jEbK+j1uo6F6ji6AUSMbIAhG7Eh3Qm
         u0y2jNrZRn8cNQWDUXYmSmWsz1SCbhDlK189OnUnvPkaMMez4mxiDXxRb3PA6E4O8zse
         Iauw==
X-Forwarded-Encrypted: i=1; AL+hErEVAXB7pg6XPwWBs2dUAzJvZ8Pf4gJUSOSyyYV4qoO62J/yGnVpVfqK/xn8wblHOIqQek97bznxQjBeLK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZTwfEqx/nWhEg4oY5jIzin9ZgXpwn9GKWUC+OfHP86U+wPECN
	cJtlljNa0JiJplJJSw24O/d+FRjOhKwzlevBTB5UcucFOq6t2UCFEhpP+uke2rlFomE=
X-Gm-Gg: AZFdTZeLTK2ZoS3knGfgpSc4Xz0sSatvpRVTakMRnzSFbZFRvrwXiL3wGv6Lc0tm9JP
	535BevO7Wag22IrRRAgR9fOSpdt9doAj2IBj7sRnKsQCKxa0SbPQyZYZj+eYa+NiowwW+yFcjNk
	fHDK0sVT5rxeoDCkxFElF3Vh9xgyTz68GGF0Ua2Q32Nfm38ye6Gwsq6XTQRS1zyjK7YRAq9boDC
	zIlpf5nWX9DRABtoeG/UJf8Aj1F9Ccx2XrINuxAt8Z49mOaXuh6OIWowB3M6rWVNJA5NzZNvWAt
	C/D0adQSJud1HdX65BWLZA1vUe6ZNyPPapuKRpKBBpsS6wWk0WL1d6DOIw+Z94JUXbYAq2Qsaj7
	dWl+pfjwdS7ddOKC742MXQZ/NkZHzYxTx6lWfUUVpsR+M3AwaEo2DR3bfE9G15rADeI42Vgp7xH
	bnHnqoAh9B5za2BNYoDwuDwMkAZTkjIeM0PsjGAlBSf1E13LmFaD0vpBVmmhX7P7BEv2cr/ftvU
	lBYwqi0jnxShcjxpTMh8zQA9BNXBfprcjtTgBK+x5Oj9f7zC42ZwV/KNmkYQgFhdB3+oCjnUZzD
	hiraggb17gpn8SjS1GeuX3StmMiDb1KXpYWCI1oTPxBBtFhNNgKRmM3aPt+EN6dVlSzdBEI0mHx
	l
X-Received: by 2002:ac8:5f06:0:b0:535:1f03:32aa with SMTP id d75a77b69052e-55d76a78d2emr425610731cf.45.1795720675469;
        Thu, 26 Nov 2026 11:17:55 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895beesm11592841cf.11.2026.11.26.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:17:54 -0800 (PST)
Message-ID: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 26 Nov 2026 14:17:52 -0500
In-Reply-To: <20261023075642.3671805-2-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
	 <20261023075642.3671805-2-fshao@chromium.org>
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
	protocol="application/pgp-signature"; boundary="=-Cs4W2QVf/4yjYY3PWWkw"
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

--=-Cs4W2QVf/4yjYY3PWWkw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fei,

sorry for the delay, so many patches...

Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit=C2=A0=
:
> mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> mapping, the worker finishes the m2m job with the buffer still at the
> head of the ready list. v4l2_m2m_job_finish() then schedules the same
> job again, which fails the same way, so the decoder never makes
> progress.
>=20
> Remove the buffer from the ready list so that the job is not scheduled
> again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> back. Print the error before that, as the buffer must not be touched
> once it is returned.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Signed-off-by: Fei Shao <fshao@chromium.org>
>=20
> ---
>=20
> (no changes since v1)
>=20
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index aa9bdee7a96c..a4cbb7c76998 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>  =09buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
>  =09if (!buf.va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>  =09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!", ctx->id,
>  =09=09=09=09  src_buf->vb2_buf.index);
> +=09=09v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +=09=09v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);

I did some research as all this felt very late and defensive. My conclusion=
 is
that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_dec.=
c).
This will let you remove this defensive check. Buffers that failed to map (=
or
unmappable/protected memory?) will simply not endup in the queue. It will a=
lso
give an immediate feedback to userspace.

Nicolas

>  =09=09return;
>  =09}
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",

--=-Cs4W2QVf/4yjYY3PWWkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiF4AAKCRDZQZRRKWBy
9BhnAP9oifXvKzRb69nGyfhqcckUcFDLX9lh723xc36dI1jn7gD+LWpi2JJDuPSx
muyGT9ledNYAcMj5WUk5fyPOM9A0uQQ=
=GEUe
-----END PGP SIGNATURE-----

--=-Cs4W2QVf/4yjYY3PWWkw--
