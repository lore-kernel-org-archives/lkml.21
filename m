Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795518489;
	b=REPr3NdnatUGpEo51zitXiTUw7+Sa5XSLkI01lUWL9H5jr9k3q61pkHZGVAmzR0PEBvQ
	 N2L3F2eHsX6zjr5rF2Vz/cJoS2U/gQFRbf9BEa4vIWUQ66TOwyYUJXfZVQbeGwxjnAv/1
	 Wh+yyOEgY5Fa4JcimaJsst7GkQZ8r8zM846ycEblThf7Z7Mk4MNeWZwMh9ZlaMFzJrT28
	 dcLlsKTwZac38ndIAiM2zEFK4GU77izbNVb4opKb0gqkqTea/Ic71IcGZ6YkvGzhfwxai
	 MB6pVg7BvZ8jK+V5h9LaxjYiIj+f9wtmiPSaMW4rDWcTHTpHd89jsBLQV23bgo0Xr8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CSG8ulEk4ASRkphCd8GtzCLacYX5T3eijsggHwB+VQw=;
	b=qeLfs4S2xxqJ2OxtPo3ifi6uexgEh0scqjGAG2um+GzuDk1BP4FuqONncVPo3sdanqwQ
	 Nqoc4Dmd88rkzNCWmbHrgYgEnneIyx9LbOX46O1jIYim9XBi85ww3+qWlDOv1EH2zBJay
	 6h+nkDgsyQLNOr7aGEybeDEU8iJEsnkdK+B8p3rbYtVbvfBps7B3VNGiNAnmnzR6h0oQu
	 dZ7SLj7S3nMNK+soq1oYhRGt3skroXhzfxjDXrR3QS/Bh4ivh/0OmTWoAeNHNrxzCmYf7
	 pQkIVdyM4KZ5LHydZr6G3kc+hGAuq4YEHA68sxLRjsvgzOsPKILGn2F5EWxc8RaPnbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gh8+vZKK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9333606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9333606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gh8+vZKK
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so5466042c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795518488; cv=none;
        d=google.com; s=arc-20260327;
        b=VZKqpQ9v6oRfJLVYQHqBrWvCNlTFjRkoX5MvuCGdyLW1xo4pogzuzK5uZU+aS6GjQv
         whcu6FceCmuOc2cE/FQYrsJ6uvEdhl5raOSTyrdBLFX+i9DFGDzbacLpm2iFnyZ+NXeW
         susTjyJDvb7lDQNb3ZVsBxZOdQQZUDOvf61vDG3ckfyzeQKL7PgLVA4ko23RRzQJRyYI
         U607dqEXLkSkIH2i+1MNtEUtkeSKr3oaC9Cfu/wbVkWOzUY/ZlHRP9asTQkaqKO30IIv
         sAamSyCICml8Oa+GhjR7Csf5btF+OUl8/yF4gA39vUmbG6Hufhff7qUZgQBYnpc8TqPY
         G5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSG8ulEk4ASRkphCd8GtzCLacYX5T3eijsggHwB+VQw=;
        fh=8stc+k494P55eJrUV/efUQejosd8yWqDq6coibKvPHE=;
        b=QsFcA2sKnnFOBR0EIyZDgU3I8uKWhoWjTn9y2rjpEuwoSZ9ZkCQn5EhLxC75QfI8qQ
         ASmO2VrLhkPSi6vFviunrAOuHrS31zpbAnThp14/Thai7CbPYzA7ept4pLmYpXbc3f3t
         datT/jNGck2UCB2kjHKBhPSFHte14MyGuTVcAlZZhexe20SXAi/PKSNWuojab4BIFL64
         6sMrDTqtrPgmT4obOJxAWDCs5lvCvVFBqLr060HjBs4RmfEJ/fatlWuJUaKwFDfxlRl/
         cX0aJ2t8xhMZihE+zMTPsQ3XKdMY7sns+rUHzkjlhOOKJMvX2KBlRiW4kS14FC09o0fi
         vR8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518488; x=1796123288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSG8ulEk4ASRkphCd8GtzCLacYX5T3eijsggHwB+VQw=;
        b=Gh8+vZKK209fK9gkJYckunVrXdTd5nYLvA1Lpo9qvL2NFIfM/JAQyXYQIxxhBEoUfz
         sCXcBNx86VAxPYkC2lgFy5i1+6ol7da0DaW9cIMfQeBILMJWAUOnH4mDdgGGGzUtruB2
         8Z1g7U3SEJC/AAnHfiiR1Z5sOhfp5iUgX4Ij/AEfbsNONHQip2OtdU/VmCfp/9R82bRz
         JQ278CC6aaGVVlPD5csL4ngHb8MUUfXEC3v9jwFxop0QhXyR9V+BRAtjc9l6em1qB4aa
         7jF5ElSyq9fPTx6acputZUbgay/zMuiFaZolWCQpbtIBZfnBvVRhHUPmV29fyGZUIedA
         A3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518488; x=1796123288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSG8ulEk4ASRkphCd8GtzCLacYX5T3eijsggHwB+VQw=;
        b=OFu8nMkB+p39D+0+TvTiMl5FkvvOcWXnvj1Y8ND8HR9R+w+LWsIJnY6sZ7w4tNCeyW
         8l7MOuNrhfEimQenbbdSmsHxdiEmPs8lKDu0WQnGFt21g+iq7V4EuuhKX4oAqV7SooJz
         9CoYEBpXj+yw5trwT9iggoxF4Otli2yWOLmnc02aEb6DIGYhOHsWF0pTqZDrhciHdEhA
         j+8aMuZw4ZyyfVr4xkxla9Z/ieqRjtIU25iCxw4ClWaJrNbP6kGcW0NEQ6hmKWdnQHvK
         6tui/rN8oXpr+k0DdHJmuoyhBbnFKqRv+Q7b7efLKwgw2++YvKCLSK1IOlYlKNIT4gmk
         vpcQ==
X-Forwarded-Encrypted: i=1; AL+hErEyjHV8XPztlfLxEdHWF8z02GVNJADKL0u8CPZO445znQwII0t9bwGUDDlG8xKNy2cZIJQvn71CUa+utKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IdBpLsVNwUoLq17VnsVCNyn3c4EEReaufiqdh9fajUf7Pr8tF
	Zp19WN7g+9qKZfU+onOULYgXQLpOs4lKggQTqbvIXNKeRAG+Goa6Tg4vgTuhJkEMnOz2dGd84u/
	ftRXn9/GwH9rThyJKIYj+NbOLWa7SjUw=
X-Gm-Gg: AZFdTZdmHywgxpx9AbV9aQaZJVZ/1mNPXZHDchAQonpVLn+VrJ3n0+hEmyJdM8Wy6wB
	z1cOyuwGThCrRvPYeUG0x96Rc07PeHxE1wp14CXXQhuZ9tQPzrufZuoLv2HRB1o0Y7OyePhQ5tr
	jR58p4cE+QPHwVnYeGug5izX83gVjbgGmyvtxwXwPoAaEX0Uu69tZCbweakVyEEjSIbz94pFq4j
	KGKDAngkYaWS9IOjt42qrxEHaFHSvFdICjAo5PzRDOZYci0TJquZ2NjW7+DXt/pNRPmh1js9kmw
	sAdGFIQiie1NCPP7dbWj2+2+eUjmpGY9hO36XYIiGgUHhJHzGMgME3PSa//Kx60X0c25VdY+L2k
	/N6PiAOtYtdOu56eJIvWcU0Wd/OMMj/+O0RHVi3Q=
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id
 a92af1059eb24-1b5568a4f37mr13449809c88.8.1795518487615; Tue, 24 Nov 2026
 03:08:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020104710.2366146-1-dolinux.peng@gmail.com>
In-Reply-To: <20261020104710.2366146-1-dolinux.peng@gmail.com>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Tue, 24 Nov 2026 19:07:55 +0800
X-Gm-Features: Aa3M54rJSbFkT150mcAAsBUPDfD2FajCh9qRRPl3qz22VxpNwn4ZoQyq4YKUwi0
Message-ID: <CAErzpmtcDUu6dtQAvV4fJTuDyr6YqtyrLi6XBjWHLjxS55RTYQ@mail.gmail.com>
Subject: Re: [PATCH] fgraph: Format error pointers as signed errno values
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pengdonglin <pengdonglin@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just a quick ping on this patch.

Thanks,
Donglin

On Tue, Oct 20, 2026 at 6:47=E2=80=AFPM Donglin Peng <dolinux.peng@gmail.co=
m> wrote:
>
> From: pengdonglin <pengdonglin@xiaomi.com>
>
> The BTF-aware funcgraph-retval formatter currently treats all pointer
> returns as hexadecimal values. Error pointers returned with ERR_PTR()
> therefore appear as high unsigned addresses in smart mode, obscuring the
> underlying errno.
>
> Recognize error-pointer values for pointer return types in
> btf_trim_retval() and select signed decimal formatting.
>
> Before:
>   trim_retval_ptr_error(); /* ret=3D0xffffffffffffffea */
>
> After:
>   trim_retval_ptr_error(); /* ret=3D-22 */
>
> Users who need to inspect the raw encoded value can enable
> funcgraph-retval-hex, which produces:
>
>   trim_retval_ptr_error(); /* ret=3D0xffffffffffffffea */
>
> Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
> ---
>  kernel/trace/trace_btf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
> index bcf65fec7bb1..1201105aa48b 100644
> --- a/kernel/trace/trace_btf.c
> +++ b/kernel/trace/trace_btf.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/btf.h>
> +#include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/kallsyms.h>
> @@ -197,6 +198,12 @@ void btf_trim_retval(unsigned long func, unsigned lo=
ng *retval, bool *print_retv
>                 if (signed_type && !hex)
>                         *retval =3D sign_extend64(*retval, msb);
>                 break;
> +       case BTF_KIND_PTR:
> +               if (!hex && IS_ERR_VALUE(*retval))
> +                       *fmt =3D RETVAL_FMT_DEC;
> +               else
> +                       *fmt =3D RETVAL_FMT_HEX;
> +               break;
>         default:
>                 *fmt =3D RETVAL_FMT_HEX;
>                 break;
> --
> 2.34.1
>
