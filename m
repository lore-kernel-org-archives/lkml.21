Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713246;
	b=fYncMKkUhTm6RlXBHbuBfcYt58J8Nbg4N26RFEtxYT5HxYG7pTlBDA8fN0D3NmGoQfKk
	 6vIsc3KPU2Un21/RnMpFoHfY9B2w0meSvh9urh8EKvjXbvxnS7y+2VkmH8CPIoJpAlx9U
	 Q61iRfflLTwMsU0pjiaqhgJ2zG3DbOXNd4ezzNBpAl754dTvS5gHfzS50qkUme+cnQJ/R
	 QcK0dUOpzefJ/XKGtdmqQu3Cjpl/bYuhhNWzjpp4dMhqTUOf8CP7LFvu30KQzRv/4Mk7J
	 9fYzMV2beDRyroUTyPnLxfqV3Ptm5aqZ/i6hXKa3W82T/Xkgy6S82Eo4A4mjno0NMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
	b=JWOOtI/tURTEuyunI0R/pUIb657lafHYuya8hcUaHKKb9hcwnvA2gDWoLoDoQ36bFuBh
	 om8QFpgixu4aK/cvXHaFMbEyLstEZhdTqYdRVcz1KlU8H8STJ4TPhkoKFYyR+xMKe00OJ
	 rLcIQrBMDn2JaHqAwV/Bciu5NDc6/Y9C+nGE+xs0ZITWFHHIRrYIkYhUoAurjzB6zjlKU
	 8RV1g/DpqNzPo8TGjjy8uvsrFi41LYp3m+kP2HTqUOx9XWIlz+xL3KAka6IOof9ws/5iN
	 Z3V/szzSBxHfWy4LeaiTmXO5y8dynUv1ZnN2rpSBlbgAidmgEudzaPHeuv7egUSTQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HedOyocz;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HedOyocz
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5123826f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713244; x=1796318044; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=HedOyocz3bUj9Abr8/XiWePoUlAIQnt7wd+6V6mVyb2wM2vQyQmtSw733SpRjIyBQ+
         lQnWjYZm+abaNML6a5hWwo1tDe15MDFyeolv9MmFEfeAxOKAcWFpZ+v6bQiRq0KSSpru
         pZzsS6JqplYKFKBWKpI5+l+w8EJA/CBxc1nxAfK2tSe0S3/RRHgaWF5IpO49a3Qsdxsg
         a9w7ybxewff/ZKSOZAozSD7Cdm9qYkiHjJJjxZk0AzSmxv5CnRVZN1oSMG+zJXADqTfd
         47YYNWqBO1PF0A8EGF76FQJteuj6V9uO7cgbqzJF6iE4GOSjwaFI8TQyaklcqIvyrHhb
         bNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713244; x=1796318044;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=hvSafEHaXim8JB772PpksBhC7HYzNpCd2qVgp3o+FzYjqrkjENtDDIizeaOSesDqsp
         xa22RusV+E9otpkvQ5Ks2D9be/F3e0/hhQLRfRbwwd+wT7YqUEcmr20eIJGyyC8XW6be
         7vBUAjEF+vGZUS6EOTwccvlNSXx0znyKv4E9b+IkoYUYfb1Irn9A/opl+I32c0aLWR6p
         zrb8YqEvR7vaMcihs/DnELeVOi4h66kpmGqjjOIptA3cicvuCqyHj2v6NKS1bF+Ju3AM
         E09kOL8Qb4Nj6q0zCoxOCeJAZFTCbjJCYzaihfym3MxMNoemNb00xwI3fhi50+vT7Mft
         bUAg==
X-Forwarded-Encrypted: i=1; AL+hErEWp3v8TBsnOcMgsnSk/NPD3WGsA3W8QIbwrwuUMUgpiBubgAETmhhcvpxSPMHoxuFQ4FmJOmCcHJSuluo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kj2z6TyeBXK22tsAw6BvPpESMDDQkH2pWOcjTURGYpICJsZVY
	mr/PW2Ah5MgGU23q4qj6fee0SQdah21k4YJE0irTINTl1SNWq0kjC7BP
X-Gm-Gg: AZFdTZfzY3ce2dip8u1Txpph6qd9sqHdVRKFWq8PpyfWCoZR6ZZMTD5VX8eJaHDW9l4
	jsnihxPcUn1VcZrPzKuyX+P4h7WkkW/FV61xx3OXT0CEJriMH81WNr5rKoTO21iF9bXLoWG7Hq7
	6KQFgvRJB1N+ytRVRTHi5n/UY34h3bJevpAqOPVVvVdHzzqoxfVQqy4rouTASnA+Osqx8iztHlZ
	SxWvnnqdBoIq5P4e9E+dt31rxJ7xJtmkcAWT048bSBGwXdy1K6xuITN5ckDCk2slfWY1bhkmARI
	kxyh57e8oUBgZrc0YkDy4mzvg2jFLSyn6crJLQg04WhbNuZzjfWLVGNBiW0U/M/comjUbiFUIfH
	Y+iLbDast+sjaSr7gZRfbcRViJdpp/71SLDsoo05y9axgwHsc4o17EuCq/CQcOd9C0Rpo+D4EH+
	Tfa336sTgT1gWJWmHuhQ8+5TxHH0zwLdXj2L1cdA0Y4mAjubUg5ejnKjn0IAaqDrvLzUo2ewWX6
	7wxWa8qA0FzH+D8N16N9QXCBhhEf7qhoIO9AormMz41fPWnGMQ/d83iJMYSDx9ufXegxTI7Xp9u
	ORWtBpkk0IAklDbA8vjYs8Y9hDc//ijk1EmtksTMgTF+tuHz43+LGV8L+Qvrab3PU2DoIKLjA2k
	9GDKjACPdo11pJqgofMlvWKQrh1Z3H6tJcUZZSqdY5cJC5Cjm3OsDc1z8sBXgZ/8vDMQYsDiBVC
	/l+xzQvO8HVO2JDMas5dVZkNly3PBFqL6eH2XBe2K4OVBOXgFtM1WuF+ET5mrpj3PIHSxAxzI/Y
	dkp5uaSLlHYSaI5pbyITZ9GWkQYVoSX/ATCwipoZE+aX5HEhmtkNAkJIBaooFHk
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr42342899f8f.56.1795713244030;
        Thu, 26 Nov 2026 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39494189f8f.34.2026.11.26.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:14:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: gregkh@linuxfoundation.org, wens@kernel.org, samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Date: Thu, 26 Nov 2026 18:14:02 +0100
Message-ID: <A2PFvd_UTOK2TCyMMfkywg@gmail.com>
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
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

Dne sreda, 7. oktober 2026 ob 16:00:56 Srednjeevropski standardni =C4=8Das =
je Caio Vinicius Ferreira napisal(a):
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
>=20




