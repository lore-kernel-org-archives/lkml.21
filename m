Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795832891;
	b=BNtPpUT7nsLGUTdCnr9Pj/6F/vMrFX6j8KKpz03Pzh7x78mgtIg8fZUHghyZlNvdoqdU
	 co4QAizSeKQN9X1ReRlK8T8ohF+KuCnCwTtf5KTPEuN1htQHkrh4q/lSr6kseEDyf9arT
	 ju+f94hap11Uv4tGkibBUTURT1nH/AHTauVufa7hPGrZNGWpThfBSLK8rZG92WSXcvvfr
	 r44QfvZaF2tDxjN/wPQt2EwLQqpyHxnZave55eH4zJJHkGPnSnrFU+h5zG+mgrDn/T/IB
	 tW+LY69fe4MDZq/zI4WKqS1uIsEh6RjEDKupkE2GLkWQ+HGZb7KvciPEcj66VBxaqZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832891;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=c1c/DesJfIYeB0WsoQ8tXGiEzQczhVXU/PKcW1gWX3k=;
	b=3QYSFVuNEb47QOzdE0xC2vxEa554LbztTck/kTnwSP1xA2wB3EG3ohQYhycUfK7dYM7P
	 P+L5wCOCrX9Cyl+sDkC1U7gtjOGvBDcv7ebWHoh61Skgx3H3dLSoOqv9M7vvCegplXjtC
	 DOyzqjF8BDOU3SY7NXPvuVC8jDGf6R2xj/B4ZdPYnH9c1Bh1+taJzaXAcyo7obEXO515B
	 shF/EdBnkdp4gK0MTqA926Z4Tl2IRMRkDyep+0K0ah6he7m6VPYpV2wQDAie22ZaP2Jyn
	 J9LgdJtqJWaRRg1Bvg7tl/Po2CXiuTjMl8SKx9BwrN6W59GP8zEtBkbvesZN2g6J4xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGYoA9hh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C0606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGYoA9hh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD3E1F0089B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795832890;
	bh=c1c/DesJfIYeB0WsoQ8tXGiEzQczhVXU/PKcW1gWX3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EGYoA9hhCjowWdIAbP7tXR7N3fUr4v+CF3Lg6C9dczDRQRvDBJPnfyBjAFIjKVrsV
	 CvKjxO/JZ7+LVw6Uw4nIOhDQmh5MvUeItBXvDiazTiMrR3JQP+nx6IC1InwcJz1huz
	 wc9HKHi52k+wq7HYllG+tw7VXo6seoVEiADiScI5QeSClu3fv1Xjz1ZMg7vHYmZZ83
	 TDk2ScXKL1/yx4hdSRM4onuQypX0OFAJdu8NcNq12oTs59Op1m0lwro+YH6mbWluI9
	 B3gbNd85MSLuuqMc8osMx4SOni8rdcr+LQ3Oy3PlxhHVXcB3OAea2c2NqcNaDocezD
	 UuTkyFHvXdkmA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5188e4980fso536250866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:28:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHoVgByHVaOR5Z1q2i60Ppb3Rh3rr4pU78ffj+p0SWzxNmsy8rwijoCxINCq/xC4+pG2auFojBzB/QekZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UMGDE/L6ARrOmnheyiM6j8mmYtyCXXIJxd03CNnsc/e2Zu4EI
	y7TGWzSnLxWgXW74v7slhtqbcXHxqB2O85LAQL3gxG45eyMClPxNTQL/BcK02i1r4UZGX08lNZ2
	4eUxU8YeWMfPfKJ3mDZ1yb5W/4wwDos8=
X-Received: by 2002:a17:907:3e88:b0:c26:1648:a06b with SMTP id
 a640c23a62f3a-c513aae0416mr2230275866b.38.1795832889217; Fri, 27 Nov 2026
 18:28:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261128013952.1691873-1-icb@fastmail.org>
In-Reply-To: <20261128013952.1691873-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Nov 2026 11:27:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-qC2UZbsOUEWvt3mhViwOyvHEqHt9hLK5+aiiuMC-4iQ@mail.gmail.com>
X-Gm-Features: Aa3M54ooocUz19P9sN5SRm16xxX0RdiCpiepjGD7Php6t0kAfJjqhfTnDb74ptk
Message-ID: <CAKYAXd-qC2UZbsOUEWvt3mhViwOyvHEqHt9hLK5+aiiuMC-4iQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: return the cause of a failed link
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -8967,8 +8965,6 @@ static int smb2_create_link(struct ksmbd_work *work,
>                         goto out;
>         }
>         rc = ksmbd_vfs_link(work, target_name, link_name);
> -       if (rc)
> -               rc = -EINVAL;
When smb2_create_link() passes through errors from the backing
filesystem, smb2_set_info() needs to map them to the appropriate
NTSTATUS values for FileLinkInformation. For example, vfs_link()
returns -EPERM when the filesystem has no ->link operation, as on
exFAT. With this patch, ksmbd returns STATUS_ACCESS_DENIED. The
expected status is STATUS_NOT_SUPPORTED. Also, -EMLINK should map to
STATUS_TOO_MANY_LINKS. We should check the NTSTATUS mappings for the
other errors this patch propagates as well...

Thanks.
>  out:
>
>         if (!IS_ERR(link_name))
>
> base-commit: 4543a3349127baa8395397b7f4aa930d9a4f8dd5
> --
> 2.47.3
>
