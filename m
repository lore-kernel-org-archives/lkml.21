Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611200;
	b=fYzUbQngMz4CUmHM2Xb1BJWSOWcLrmq5SA5r5LVFgqZ+vZ9xpR8DF74kgeRr28ln1THd
	 3+U1ltUvhmvX4cURq/Q/ezhWPEOz5klolWwI0kLD+J2QGbIiQatgFWHOlsNgowqSqvdJC
	 eTOHhfPbAJ2R9LTk4MCA/hLXvBmBhcQNf7ArTVdNqYypJ2HKWUyNG+/Br7aG8l4h3BTUp
	 OuQjpYCzHAtZOjMKLjBCvukwyHAbO/DgrhwoZ+AoWjMsclZEo8kPyIrVQLVCh5hlRN60i
	 wPHDuPbzkh+au/sVO8hb6vd2YDCp0LZGPdvwyGcFcdyNp4XSc+wEb7xC0EX3w3JHojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=wb5N99RF+uLplURkem29zNIHwOiV4iL5+6TcWsB08Yc=;
	b=zb6fv7OkAIvhwruYvvzBsqg/9xHJuton5/2Ql9xt0428sz3f2CgEXoJr4B+VqMXboaxl
	 d0Gi5kYPkC/2/SyIeYtE8oL+6tFGlFwJxBkCUvmUAS+iIVi5QY3sLwc5SKX/uFNK00jQ5
	 sC0w6bI9LwqN7s1eQOLSSwzC5EHS/we9bjS2sJfREBhEGSDWHImmw/jrhx2IrYk9iimmt
	 LTLaJqBWz0SInymluzcHXEKjLg8cEV2OmaLq+yoLJ51dGIO6qJqUVrYJvGozpIpsialf4
	 jYgcDaVB+7biC27F8K0vzYWq/03evMBOtVD3UsbmNT6/WYV9NNtUtZWQnwjyxY+8B8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QOXEZ5Pu;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D44606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D44606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QOXEZ5Pu
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so36135905e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795611197; x=1796215997; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wb5N99RF+uLplURkem29zNIHwOiV4iL5+6TcWsB08Yc=;
        b=QOXEZ5Pu/EPca6q7kzgJRCmLrmsoVFR/ZRe4q5d58yeOdbJoHTuz9y0u/Nmk0CktwI
         CoxL971qgH9IAeYEJL9OV04KK9hoZrCZxCXphCDmaMaCEIiYAFkXm9z/Jipc+urQTX/j
         Fk8I31Tuids+3mCeGda6Q/7DCnEHSLo9OC+CFzZ1uqDLrPjUm6OialCUSj83o9zL6oVG
         iksZBRXktSiMRqpVyhlcQqbeKVyrA1zYnXNdKX3aSHnLNR56AH4l3EmMwrecUL/g6kYv
         65m48YXn1HMJU4OXkynxAivRZrQT+c7z3fBFxX7gT5o5ijKHn00slucTC0ZtqVCasBEY
         yyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611197; x=1796215997;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb5N99RF+uLplURkem29zNIHwOiV4iL5+6TcWsB08Yc=;
        b=mkZM2nqbTypCjHsvNHBzBSGPIf7h4NjR4Dr1VwDrIlQSh8L9Px4uZiEi0K1Er1nVPu
         gseS1Hz4sKx9utzJby6s2jTT/yGBPDafGHi728bqJq+uT0oyhm/l63zmrSv61UmhRppb
         ej5n5rz8506a+HfFy3oKrzR/s36Ll8BIhhhSjyxE7qXO/P7NpRK9jEHRMtBeUsENR8NB
         X1SPF9aNKsqHMI/xk9wk29nUSKcQxc22RNqEG6S5ACdd31HCmKV0YLZ16q5ayhCmLBOs
         bZcuYtUmPoEVwupW8IMhkLRozXWYTmxBovyCeqHLisZTGHakvLYL8CXiUFeYStBdP2TD
         5bEw==
X-Forwarded-Encrypted: i=1; AL+hErE6fTBaA0zE7LN2a9ofci38sTOOjCwffLS6IADmJL9B20/VjKmcT17JmaH377+PScWC6o+9yzQETxvXpGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oUwlStCzzTyIf1rSbTKjafIUXc6ZQ3azZGLl9K260W/pGPNUQ
	r6QcWcImXqspSKPA7aA0bytcbmdiDPBEGVMBX9aMeIZ+G+JwPvhFw5bawyWDkNNCYohQ
X-Gm-Gg: AZFdTZfTYdHB0duwmQ5TW2SnOrW/8VBlmaJ3oy3boEqnw+e24wT/so8TSDkOoKMO+M4
	sLMAflj0Y/qscV5qq5tR75PZ8kx74h5Rn3+IYE7DW7TgUoXsvycOqWMERf+pWB7IZ82rB9u0nGA
	rWkyRKpa2EzlFoyP+Rgu/H08x3Ka8ENYOHWF5Am+abeMTLE0EmbsU+AbW5Dfc9oGDbrCZG0qjSY
	B1oayqSmlDXTjmWmtfSnu77iVRwaXgx+Ov6SnLVxZcQtQJt13AH0xYZp95fD8VXk8Vg9juQpyNZ
	aTUIKfTGm2ZKHvBEtcWXYT+wkwMEumiU8RtIT7QmfoZm9+vU58mACct0SFfsXdGOaCZqrkIAHJp
	V2aMX+Bi7EMPIb+fxHaUCtzos6OOpvIJMVPcCEAJailM3UPbv5/vXd+5ttlJ6I9diEt3KjTf61x
	IQTyULDylyjUwiiPpjyBmo+bBIzOVx3CI+PS6bHtrA+A1Fy8JCe6jbxRZbbDV6euS3Bl8eGp8pV
	AoSAUiMFFc/ff49AC5PLO0+I5nq27s2/xlLrDonBCo0stcfFC6m+0qOTpGgUw+qcHBTN002jNC0
	gYNNbFFaD2Pqa81H9ACCNfl76rtAOF70RQZ89oIsyRegEfj17k+GMDTVN+kFvuzLnQ2utb+++S/
	8q213p3atFKgZLAFf5g8KksnJ95gAOmOj4AM8boTmUk9JjAkywmvbCLNBdjEurqOdC7VRomDgWH
	0=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr356853675e9.16.1795611196651;
        Wed, 25 Nov 2026 04:53:16 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:c235:97b:8b16:8928? (p200300cf572c2800c235097b8b168928.dip0.t-ipconnect.de. [2003:cf:572c:2800:c235:97b:8b16:8928])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm736573735e9.13.2026.11.25.04.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:53:16 -0800 (PST)
Message-ID: <45510e886330ade6013838f94cd84c688b263aa8.camel@amutable.com>
Subject: Re: [PATCH v2 08/13] ipe: handle errors from resolving the real
 inode
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, Amir Goldstein
 <amir73il@gmail.com>, 	linux-fsdevel@vger.kernel.org
Cc: Chris Down <chris@chrisdown.name>, Miklos Szeredi <mszeredi@redhat.com>,
 	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, 	linux-trace-kernel@vger.kernel.org,
 linux-integrity@vger.kernel.org, 	linux-security-module@vger.kernel.org,
 linux-mm@kvack.org, Fan Wu	 <wufan@kernel.org>
Date: Wed, 25 Nov 2026 13:53:15 +0100
In-Reply-To: <20261116-work-ovl-d_real-v2-8-90564c4ae347@kernel.org>
References: <20261116-work-ovl-d_real-v2-0-90564c4ae347@kernel.org>
	 <20261116-work-ovl-d_real-v2-8-90564c4ae347@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 10:44 +0100, Christian Brauner wrote:
> d_real() is about to be able to fail for D_REAL_DATA. So switch
> ipe_build_eval_ctx() from d_real_inode() to d_real_data_inode() and
> deal
> with the error.
>=20
> Currently, if overlayfs fails to resolve the data of a file it hands
> back the overlayfs inode and IPE evaluates the policy against that.
> The
> overlayfs inode has neither a block device nor any fs-verity state so
> none of the properties of the file hosting the data are visible.
>=20
> Instead, leave the block device and inode state of the evaluation
> context unset if the data can't be resolved so the file is evaluated
> without any dm-verity or fs-verity state. IOW, IPE reaches the same
> verdict as today but without looking at the overlayfs inode.
>=20
> This is a no-op until d_real() can actually fail.
>=20
> Suggested-by: Fan Wu <wufan@kernel.org>
> Link:
> https://lore.kernel.org/all/4e9a39ac-9ad5-49d8-b0c4-09e665504609@kernel.o=
rg
> Acked-by: Fan Wu <wufan@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0security/ipe/eval.c | 13 ++++++++++---
> =C2=A01 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/security/ipe/eval.c b/security/ipe/eval.c
> index 4a7be96c84f03..a2366eb9a47b3 100644
> --- a/security/ipe/eval.c
> +++ b/security/ipe/eval.c
> @@ -102,9 +102,16 @@ void ipe_build_eval_ctx(struct ipe_eval_ctx
> *ctx,
> =C2=A0
> =C2=A0	if (file) {
> =C2=A0		build_ipe_sb_ctx(ctx, file);
> -		ino =3D d_real_inode(file->f_path.dentry);
> -		build_ipe_bdev_ctx(ctx, ino);
> -		build_ipe_inode_ctx(ctx, ino);
> +		/*
> +		 * If the real data inode cannot be resolved, leave
> the bdev
> +		 * and inode fields unset so the file is evaluated
> without
> +		 * dm-verity/fs-verity state.
> +		 */
> +		ino =3D d_real_data_inode(file->f_path.dentry);
> +		if (!IS_ERR(ino)) {
> +			build_ipe_bdev_ctx(ctx, ino);
> +			build_ipe_inode_ctx(ctx, ino);
> +		}
> =C2=A0	}
> =C2=A0}
> =C2=A0
