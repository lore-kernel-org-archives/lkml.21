Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713696;
	b=iZupJkYmcFRjrQDobvuiMvbP/R3Oj2LrIimX2YNmrZwrfjGrGnglqnNTUgHzHNtO86QS
	 Sf1SUNDJw0iS0ZRbm+QJWCcnONW3yoqEs1GyaUqwRxvhTMDELhsH/8llFDCqvoWgF5B/J
	 P9ID2ePAfXB4fvhdriHLk4ip0I2el9R17F8/Iz+XkaLM0+ImZui8wH3KGrMBY2u7qg+vU
	 lnMsircLe4xuiPtrx7FcxKW+0BVMDoW8T22Vojky7FgGYt5V4WCnzmxKsok9Wdlo/WtmJ
	 iiGRg5Trt/1mLYWx6DiDLzNoTBle6VTsIqWFNIGXGp3vQnOZ8lOIzHAdlb5YF0K1sMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
	b=cgNT8q9BW03UbThcNQaoz1xsbmkbrLP6ADM852355/EugAA+Avyok0ooLe8LJq4eV7Om
	 LBuYmPDeeQM2LzyORYpWHqWrZurYgzvqfklkcDZ1XhveXSNYZncBwuCLM+CmwOKaesT1x
	 lCsbhyOllYGG1ALxqAs5QpMz0oM4+3u6OUwLRnlEgy4Lt9YYaihV0yXdvRw+aEnqbcaJM
	 gJybNH6mIJL5cDfe4fokuvqFPwesavbuTAwdVpg6b2F1B1DqLBPBfoxqDLYwkLDGIPUrw
	 jlTOuiR7JP469XDpRxiRh3+730h7SgWWGxIjruQweMuGBQadi4jc8Y+LYp82FYbGtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d716s3kv;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404AA606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404AA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d716s3kv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so59123715e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713694; x=1796318494; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=d716s3kv5+aHT6iAIa8FLXxqKpN/DGQ7HvCP3psWGK7z27rKg1aBxSxcOavNj9JK+y
         je97Q9flPGjeUHtWdqK0HyJWoHbbNHI4wkqxVghBuvveCGQKZ2zkpfUBTJabQZb+uDJf
         +6ggmEGi6Y63bl73WWuJB3nS+H8cz+LV+vcnWoaD/lp7mdE87FF0vegMhKcnMDFXgsfA
         D+dk9/vSQfl2HZva7zbqTBVjBImcHhih7gYOtvMDM9UxrjS0jDX8L2/mQNIM7Ewsmd7F
         A+yPGBsfcEvgA51v+S1i50hoEKYWkMi2OPkPLO7kZYNvUmojm/kbRvaA9TcMZnVHGcep
         o/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713694; x=1796318494;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=W972eYVjXPdx0daDoswDHx+0zIFZXbnSFh/xHBX3v1r1G8JFSegiass5St2c0OsS2D
         kDq0nbUOQxdmStj18eUlxyHLbRiEQMvxoYL1QZSDkieKsA4WGVlY8MDSUwSkAKIc4ej8
         VSqwN9deQNoLhEzBsV3NK6KuHzEePzH7R4kb+d0xpVMDhabrVb6qwnS6PT1GeEX1xYvt
         tO/jPyLd1Y9eJbrkw6YtsRzvh4V96a/8HVfQaSjy9pCBuavZTAhux1/c3QmPxgaUxpFu
         mSXOE3GE5Ukb640p5fqdMVc4gkK22b6u+jzX9zkZw4WdyPx19Cpy/9rxwno+9IbelBR5
         oBSA==
X-Forwarded-Encrypted: i=1; AL+hErEf3wIs8MtH/CfvyXut9X0+iY6al6kBHkRiTtnJX4iL1wA+L+A6B36Q1SVrPI063ps2L+3DiXc3rrNMi5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y1805ZfUM/Pun1nz5r9ccjPMuH4vIkbFLb6w0qBHncJltFQRV
	O4nU8tMXLXtqJu+aheE4Le2mdyA/O4ZQZ5KyOsX8wFmaeILKlSnv6rbo
X-Gm-Gg: AZFdTZcMVbbo+kh7vSDtS3QCaHSS9J+cNoGutXExJ7dV/JWu44jnV0+fBFBqfwtmugo
	UnwdLbBpYilW4e54slxWC5S8dzIURcCotvVuOX2jQSDcZbe15QBuxflpen+QGxSMjizCXUG65cr
	dDt10VhFD2zaw9S3v/HXNcqRDaL4N9aUZlK7WKxJGHLtX5IbzWN6x5VwLMDX56Xfqpk0Ud0AP7z
	yzEFdd0FEjgIPveHPiLvjPO9zRtLk1JqiPFy9mNPpodq/i+Ou0MLMpURat0+MUPYGB5+RKKETvd
	5kwHtA1k7fShKWUqRtRWEsxnswa3pFi4XQXkSfnKh1LcRDZpKS3qnvaN7ptwGcE/OBXsZ4ZgXIo
	7CiRdKmTqtvq/MZMvF6YdIM7Fz39tusUh4Lz+zCWjYL5/q/0sI1HzB0I6TlkIn3bs/3iSgv612e
	C4evcHG7f9fQi7n9b1zi9E00klLKXddLe2DqVfsauUqqGsCLADWQgwJF/9SMPrhAd97gJgB4QSM
	EXdtVfkCVgZS8NAIc1fCoShMW9vQ2a1fgFd6K9QVg2bu0UKO1F8oF1ziFSENtmQ2ENcNJrKzzJa
	QpIxbC6Q9BszvSaOUpylglgYlXh8rpo3eLvXfPh3oOUj0JW1xeA4M5b53AiDbkye7Mwy93K/6uR
	ntAYHbkzPkeyMwTKXenSeVnxS3mhgi9CS1RxVpkn9Xfjs5LUHEH37UQTnwmApbcU2fb06O9inWb
	yPyD321ReVQRBDw1qWyeGA5fDoi9UDmVMnc5+2mEOcWbeHNX7CWbIJ4d9XCBYoTpdpwCAbX0o+k
	PoAAXCVZnGVd4OGKriQcJ4qnRKlyB1mD8EswKHaGf9UcowYTxAycH2De4BC6NY=
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr403969765e9.16.1795713694512;
        Thu, 26 Nov 2026 09:21:34 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm373445195e9.4.2026.11.26.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:21:33 -0800 (PST)
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
 Re: [PATCH 1/2] media: cedrus: fail buffer allocations that do not fit with
 -ENOMEM
Date: Thu, 26 Nov 2026 18:21:32 +0100
Message-ID: <euqQyxcYQfOA1pYfEtNPBw@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
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

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:47 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> vb2-dma-contig allocates with GFP_KERNEL, so a buffer pool that does
> not fit in memory invokes the OOM killer. Set __GFP_RETRY_MAYFAIL on
> both queues: the request returns fewer buffers or -ENOMEM instead.

This is correct only for IOMMU allocation. CMA fails directly.

Please update commit message.

Best regards,
Jernej

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..9b2d24e77fdb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	src_vq->dev =3D ctx->dev->dev;
>  	src_vq->supports_requests =3D true;
>  	src_vq->requires_requests =3D true;
> +	src_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock =3D &ctx->dev->dev_mutex;
>  	dst_vq->dev =3D ctx->dev->dev;
> +	dst_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	return vb2_queue_init(dst_vq);
>  }
>=20
>=20




