Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197838;
	b=SQgqWXQKjghCLGerH6aW3cbst+hf2VB0WOW7IZtbu0IDHflzxsscmk6yukUfc/gxOSz3
	 sas0YgyL/tKTzNTCkzGtEDOeKNVbiIK+uJmz0flsi7xOBwH6Azc3e2fEUkN91wWEnOue6
	 jwrOovyGJktl8BLI/3XEHLOxwLXL+hL06V8EsTg0dYD38fMdbPCFxCLMkF7r5PNlXcRHy
	 8coeieT/vQE5+0u8T2lLm0gyvt/Fkvd3WovY1hL2LGQxePWEE3MijmEqYN68fcF3VoFdb
	 OLt46/28xGA1d4fO4zS3unhVPYSWuvkXWPfDsQrrlSmDAIsYDTp2yuc+iVMALyr/Xeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GnsEcx87GzzaejT9L6e8FDpU3hLwBs+MljkBJ8PhOT0=;
	b=ZTzU097nGvXrQMoufTl0Hcc4nLPAoosRiBvqCVnFvzmU7ntHHo64IFrRssG6g/l/I6Vy
	 tkRjaa4h6AGNG1fZtXzX6odqDy6DjA/Qr9965ZI/NU39idKvuXqxL00ExMbNIZoFD+6sB
	 7sV3VJe4Au/YXlKg3BvftYE13Xl+6d56CSbVFyB34P+2TLI0XVhz+9+tI+ZSoKB8q1Ocn
	 NZt/IrHv8xbpGicokscSoBfirRNN9WoKYC7FACrCerD1O2AOA8IAyS/3yeFvcggbtgq1p
	 RAz2zX4O2MsEqlyxH9xXDfa4WltxIVPNT+evncoy9k6U70UO83sh+9rQR7PKDbfEMYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Qn9xrzae;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8EF606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8EF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Qn9xrzae
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-703e2625ce6so60137eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795197823; cv=none;
        d=google.com; s=arc-20260327;
        b=jg9DQlIe/m0Jy7RkeP+Pc6p3SRiHvMN+mMdbli2cI5BWI1M36I0U46hYPyeRP0CNzh
         y4LhHnu7C4N4NVqzGPeQ1nw0eVfAODL+Prnf7qurvgmOJLx5GFGxjQMfP5VaiJkdAIc6
         FV78ezAViZSzkIIx0+/2JwckD/3lpI0wJ2i4pU6L1On4gaRDs8cNwvtpK0E3GHmfFmd1
         4i8I4jwloLIS1IDgvetVAsz3IdSRJV1wvUCzYxFCLdlgwfTLMpbgsUEBae4DAL++sWay
         voV+zbQJtHP3i3MlAonM2CBMnIZ3DM6YM54CPqhWo05/K3RTWsYs6gZIUykYk016xsGu
         1k1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GnsEcx87GzzaejT9L6e8FDpU3hLwBs+MljkBJ8PhOT0=;
        fh=D7XUQhP4ZcePf48R0av69wMET9pwSBJHyhh6N0qgl78=;
        b=AVXudJ0E4UgENKesRu7KVhbVYAjooRwWyejCaUuZZv5/ornPcZZZ2aKppjKcoG5ICq
         /CLFYufdZwhWBU6Fxk0Be1qDfhMKwCKTIUsaZqxT2aQJBp3HuqVnRDjCN7tU5HCUu3h3
         YS+IgCwtF6oxyA0SOUS0dHMYkkJtk7PWQr4Ln+NV1yCV+p3MpEBdEHaUzYG1vxEKLmx0
         2eUDT6lP0C9SpymJyKkwMAJTeOYI2afNeiJ+3p+fEbL7FT57B9QQZbaGJQF9Ozs0BSKw
         ZginCnE/JtbyfIvdKEkTPIHVtUJWjWNp6e7KmFZG6pdr3gi3w7BvAaFIBIkdE0NDV/Dr
         ciBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795197823; x=1795802623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnsEcx87GzzaejT9L6e8FDpU3hLwBs+MljkBJ8PhOT0=;
        b=Qn9xrzaeM6NC/lNCk5HvJjlS74/wdHgv02t9aWq6wVtdOIP2N4hJzHGr8euQzMOiRO
         7DjB5MpA5ALDBuo1PTYyDk58lc88mdxJ/YHZSBj/8lauORp1/rVM69euVsu0nhkCPzYm
         0TpqTqXhUmRJavCOrHaCCJp8KDISHRadqrkthIv9p+cTeJOAX5QBPK3OCW6V8C9s0+gw
         s6fZf8r8Zf4j4/DoshqTXTkcgI1d2zrDBwDWJ4sSZbk2CW8CcaUzAPCqKP/BXm0Rj8rC
         aHGAkEleTKW+y+YMHGjBMkm1fH46bIiwQLJRWzBMZ44tWlpht6WCm3mQIaXieelfoDV/
         4dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197823; x=1795802623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnsEcx87GzzaejT9L6e8FDpU3hLwBs+MljkBJ8PhOT0=;
        b=N5B1kaHt2d8LQW2zlJc3EJbyP+dSA12eMS2AaC5oSjEvvUeH9EGlcbl94rViYtv3cB
         ViOxBO1VY+SsnHG+SyfStJyS2TkY5b7vu6C0xPzMdticQP5wDEdcf7m9tMls2OaFsPFb
         B02g22pw5xo5yryyoaZBGvgdtyhPOgK8XJwlNUWKrN7qZHlreUM3LP8sCpmIdhxfKNLi
         RWgcvu1DMFHoZqoRzyWg/zBDiNYSFKvhFKUJTLF76K7jJJNrrB7yXQCJ1GsvlRbfb6zb
         25YGOXa72eyd2D/GYRNJkp+Rgthy24zhs5Y7xHI3ejq7qd/8Q9+wFtKIjoC3xMsLnrrW
         /PfQ==
X-Forwarded-Encrypted: i=1; AL+hErG+2cpMTpBrJFv9WoWFtyRejekPI3BmR49oIIAEQyagfa8zUjofq9ssnt2XjajoQ3y+piiQyGUfASh0QPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tUyPMTmeouvHF0B0FVuoRovOG+3h8uJqzu3PhJqfvqlrGOfAS
	7/7x1d+xKzptxgST4jKskuDg3guXGqMQVoSesvJOMmZU2Nz4NqWZb745mR0+SGtynovdy66uSbW
	rivLriW4w/AvjNYt4OKW7qSZ/+8lPDL6m50x4BWD7Iw==
X-Gm-Gg: AYBFou3XivUd8S+68TcHykRbnmVYjP8I6HgWFFj7hiUwYhYor4oUm4FHkqg3exySKp8
	AmkvySy8H3zS74Pg2TmbrfMdWSMob2norO2u+U2xV6DNaGEPea0GoSsaFMAeaY8GEFtIA66mSiU
	9aXfpwuooGZF2PI3GPDUYnBvMjEWPcPeLKdTrMP8R2yCAcAar6JhA24jshYcTyfY6qxzdyed7im
	sr2Dn26dlKqEzz2BE6CN5SbZkdXM4NeHUq61ApMZNPVo/5YVrCpLM5Ci2viIXyTeLmelJPe8c43
	9kJpkYsSmF8sfmkWnXh5LvDQ7OUPk06UnZDH+6+iIBDKKr348iMVqzhCtKADyKygorDxboc0yTa
	ZuzaBhjqRLKJYMaW9GYco63U8F1AcpLlQSyjCc7x30tJbsuhBuysU0DQgqQ==
X-Received: by 2002:a05:6820:840d:b0:71a:ee8a:5d26 with SMTP id
 006d021491bc7-71b3903669fmr3370770eaf.0.1795197823321; Fri, 20 Nov 2026
 10:03:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611150127512368BGQ07ZNIRAIwClkam-8u@zte.com.cn> <20261115012754244CUh01sEOwZp4S8maAbDDM@zte.com.cn>
In-Reply-To: <20261115012754244CUh01sEOwZp4S8maAbDDM@zte.com.cn>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 20 Nov 2026 10:03:32 -0800
X-Gm-Features: Aa3M54pd1WfunxbMR_7rgO7xsdkMjIOdAlBuB31wGQur8IoVOOkbFLJHq_cPaug
Message-ID: <CADUfDZppuZYzPyOeAc8GfW=KjpGQj5wK0T0D-UXBHokG67Zxbg@mail.gmail.com>
Subject: Re: [PATCH 2/5] nvme: map passthrough data when the length is nonzero
To: shao.mingyin@zte.com.cn
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 11:13=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> nvme_submit_user_cmd() skips mapping when the user address is zero,
> even if a nonzero data length was supplied.  Passthrough ioctls and
> NVME_IOCTL_SUBMIT_IO can therefore submit a data-transfer command
> without a mapped payload.  For example, the loop target returns a
> Data SGL Length Invalid status instead of rejecting the user buffer.
>
> Map whenever a length is given and let the mapping helper validate the
> address.  This also permits address zero if the process has valid
> memory mapped there, matching the io_uring passthrough behavior from
> commit 99fde895ff56 ("nvme: map uring_cmd data even if address is 0").
>
> Fixes: d29ec8241c10 ("nvme: submit internal commands through the block la=
yer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> Tested on 7.3.0-next-20261030 (QEMU/TCG guest) with the loop transport
> and a file-backed namespace.
>
> NVME_IOCTL_IO_CMD with addr=3D0 and a nonzero data_len skips the mapping
> on the unpatched kernel and submits the command with an empty data
> pointer, so the target rejects it with "Data SGL Length Invalid" (status
> 0x600f).  With the patch the mapping helper rejects the null user
> address with -EFAULT before the command is submitted:
>
>   unpatched                            patched
>   control read (valid addr) ret 0      control read (valid addr) ret 0
>   read  addr=3D0 len=3D4096 ret 0x600f     read  addr=3D0 len=3D4096 -EFA=
ULT
>   write addr=3D0 len=3D4096 ret 0x600f     write addr=3D0 len=3D4096 -EFA=
ULT
>
>  drivers/nvme/host/ioctl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
> index a87c9ca9d06c..22efc5412416 100644
> --- a/drivers/nvme/host/ioctl.c
> +++ b/drivers/nvme/host/ioctl.c
> @@ -207,7 +207,7 @@ static int nvme_submit_user_cmd(struct request_queue =
*q,
>                 return PTR_ERR(req);
>
>         req->timeout =3D timeout;
> -       if (ubuffer && bufflen) {
> +       if (bufflen) {

This is a potential UAPI change if a userspace process was setting
only the addr field 0 in struct nvme_user_io/nvme_passthru_cmd to opt
out of data mapping. (This seems quite possible if a struct
nvme_passthru_cmd is reused for multiple commands, one with data and
one without. Or if userspace isn't bothering to initialize data_len
when it sets addr =3D 0.) I agree I would have used this condition if I
were designing this UAPI from scratch, but I'm concerned about
breaking existing users. Are there real applications mapping data at
virtual address 0? The change for nvme_uring_cmd was needed to work
with kernel io_uring registered buffers, where addr =3D 0 represents
"from the start of the registered buffer".

Best,
Caleb

>                 ret =3D nvme_map_user_request(req, ubuffer, bufflen, meta=
_buffer,
>                                 meta_len, NULL, flags);
>                 if (ret)
> --
> 2.43.0
>
