Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995755;
	b=43o4/Ylvfkn7Z+gMwrKs+QadRBwshxzLw9sgLrEgSCU2Gbtr+IWPcUdDAroR1Ndpm0GV
	 616NvbJwQwwfoR8ZRFeqhL1LRcHpV0l3O6z9oviv7r3cJFP759esip5OuM03++XnURe69
	 CvvVtS5847ZgISkpNMJFs4EkuYpg9ES4a2lR1ChO2EhtQklxnXoXJvuSWH4l+Z8KndR7q
	 9cmdddj2R69lQxiKaDb1X2YlH4AgKYjpBRATT12lIA9tXGXPQWD5kG6nlHubmb90qCOt1
	 4pAbIhckt5fHMlcCvxJJo1RSc3o3pflBm66jheP4Kh8C5kWHhhc59FILRpQZ1cOSq7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YT4Ew11jfkdMKzaiNmNTlrlUPIMOKEMpL6JNzVMVnPY=;
	b=e77w3Lkvq82qPl5PNgjVfF3rSsWEo6R5Zob3MfzqeRJScL6vkz72rIwAw9LZsvftPMb+
	 IeMdVOi64MGLBojRT6GBu74Px7tj4N+5Do+TDEyv7hUultTQUC1dRJN8bRsq2gU9dK6qm
	 3Aw0EQHhjtX6KGGw3DhlQAWsZi3I7FiTWed6u3oJZ9ih0HrCRAvJjgcno1mdPzbF59xFX
	 FUVXFR7KQiZp3ovGkaRfZ6qGYUpuRXDy7UxUyqurFzPvaEkHkkHggrtHfZSDRN4xubjrE
	 pXXF5nBG9TCv2lZyQMgztlyqW2a9OVVZXgYgw9oQYY3xupCbN4va81bMyWoNdRyV4Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=bFysKzKl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F85606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F85606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=bFysKzKl
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5118deebcfso44963466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995753; cv=none;
        d=google.com; s=arc-20260327;
        b=YPyzd/z/MMy+ypJHDp3BpjpuRAhetdC7Xsk54R79i1xtTKidNWeYoghh+QIDhvi8Qa
         mXZZMDoYrhi1RplXp98dFiAHHC24bsZGAXgHQC472UgIBbOrHxaUhQZQaizpk8vR4Rk1
         W+HpNE280G3k6OkRNE6Xc7owbp3AwEWDEVViz84PJe9Yf7JzEg5hfL3mYO5lH+w9JOjW
         v33V61MRJuVDyd9KNe1K/917xVqPWcvx1MXBnK+0CheE8kWHV+y5WlceFqOYZTz5Okwr
         J3uc/39qz2cI3kb/5Go4L+G8RdH4joVrth332um001YvYWV7JVy0c7T4sx+UrZEU0ohg
         4/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YT4Ew11jfkdMKzaiNmNTlrlUPIMOKEMpL6JNzVMVnPY=;
        fh=WqzsXZy5yZqsBeuvYTPRfc4EqF+HSzRMBd8hNJeo2II=;
        b=fbTexkqDA3Af0z0EgVh9O2fxF9m5dNHMG4uVYAZij3K5np3tP8+ULcusQzaKUe/f2x
         IbveePWh7gwjxi2MxhvtFwyaJCDnF7QSXWsV4DjxxbJU+LwuastOKxqdgHU6x+aD3ke0
         r+G05xUHlvUf3v5AZ5Mq4MV84scVuvrjtAPustwmsVJs/DngRyqnxn56zNXmedpH2OCi
         9UilB2+Xv+vYkqNi54qYfbb76TtjoSs8RogIWIs6om+zc0G0Tk4sCbdi4CRj/nWBIiQT
         UPGtMQOoL9nMFO5npOWdAKd9G7ibLCVt2JazSH9rLPiZdiHfUb/OBNs9RAzPLVeEGdcp
         2b1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1794995753; x=1795600553; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YT4Ew11jfkdMKzaiNmNTlrlUPIMOKEMpL6JNzVMVnPY=;
        b=bFysKzKl3BMCNocpAfYC7/aJh1MOAWQ7YzzDrZYZ334ZSPk6IEeETAjh8QuZ+4lQfK
         /iYRw8ji1Fxtl+cU4Yj1D3rPtz59p1vxdURIiPCbLfUsx8xUR/QDNc/v3TT0UKnpBi5g
         +aj0EqyD7G8XCLGfE/3v9Xg6h/3huxJc8IsD7w+yW3uhhKhMni2MFJy1l8yy0WHcXvCO
         ypUitwLhyW1wq1zd0EN1lC3xRiiGt+nZYTWh9e6G1TXiMMnUWDIpqMN+4is9A0OO/XAQ
         Da74g0FrWvFw9BgnCS/xMD6YEFyad6sA658faJZ26qpB3OWeVSUMWdSzhrhMvPrdA291
         Vx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995753; x=1795600553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YT4Ew11jfkdMKzaiNmNTlrlUPIMOKEMpL6JNzVMVnPY=;
        b=U/XS+FOANkYl/KH79EadDLMcuUAMFpQ1aFglgt40Pbm6w30cxl1ZrjSilinSM7jKZA
         6xGT28dlA9vEZ+2l3mT/QKJd5pibVzRNWa+uInu/u/jaMBcqR9FeR5ZlUbc0Q52FAdSV
         ydnLseOT6WGqHjPFqrImWi3og11v8fIHMh75Na9qpK7WiX64OioUN3aCRgFmAHhAWGH7
         CxGQSdBLQaucaLTv8t1N3PSoXIqM4ltb464vRPr3NBQnk1Urzch1/8vyiVWPSREBDDB7
         e3AcfHa69C7sMlcddUX7bOugDwlGj5U8lnEpzN7JstiDuRX851XH8VwNDycAkv/Jb5nd
         GXqQ==
X-Forwarded-Encrypted: i=1; AL+hErG+7HAmkV3Cv8Y1cw/Q9pdMk6jtqbMPnihr6IcYL+wQ7sls1WJKXkbOSAj8xX/+A5SwTjwpb5oeEfeiSew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pS8IgmpF+YiFB3R2OTWvEeWq/F0DmfU++XDh3pKW5ueNizGwP
	RlY80hKTSP1S8DJOqGc1L4A2jicRunA146Mk3h01LysPuCgkAI9a7GohNSa4cnTUXQQJwzzP2nE
	6uHtjadR9tAQjfuWUsV7jJlseZp0u/JCHcOcOLz6gGA==
X-Gm-Gg: AYBFou1+R/o602XLb71SPGCivxCegfYGRBVcG3M86YtPrutmjTPnj6HMkDjxOPfOoNa
	c7+F26RWbEYBcVbnb4xl0uwiVm5HpjQsD21mdKVQ4tMGVeZ3Tohoy9VuIo6eltaIw3Zvdf6VnZL
	TquyZ0FX44J/b5Q4Z+0GxUNwaO7Gx36PIntmxXcorcn4sESPc4A3l4fPlKu0rnHxYboiwwnrKtl
	6DJpobm1GKs0hfU3R6a7qPcX3Tll6OFoUirZrkmZO9Ggv3hXLSrTzLYBCwau/9kvksKJnOtkbYt
	jfohFyar2qN+v0Dz/IggqtiO1nM0F0HqHL63IUdufXfFSYVJFabX2NJZfQyPaGTUm7Z33smpSHT
	89bNwSKoi3NrabZIvtFqWEKl7S//C6HVFDOaezHUJNiqojBc1zb20bBU=
X-Received: by 2002:a17:907:960a:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c510e148c2amr181497666b.21.1794995753370; Wed, 18 Nov 2026
 01:55:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <alvD5nOP15O5B8Ai@kernel.org> <20261117104838.2650999-1-rmustafin@cloudlinux.com>
 <avwzid1Ovl4ACkaQ@kernel.org> <avxJ9MxZ0PoWbQTc@kernel.org> <avxKqn-PlzJyxVdK@kernel.org>
In-Reply-To: <avxKqn-PlzJyxVdK@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Wed, 18 Nov 2026 16:55:42 +0700
X-Gm-Features: AclHuK_OB-KbT-AGKLoVYFZj4MHc_UtbK05YckQfXNXzeGf1DWEJlXVBx-HXIJw
Message-ID: <CAG6=z5uvRmJ38iCOeAOKjjVfpfSXJK8Ta-MmCMNmCWqkqiw6Bw@mail.gmail.com>
Subject: Re: [PATCH] tpm: track the response read position internally, not via
 the file offset
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Jaewon Yang <yong010301@gmail.com>, 
	Tadeusz Struk <tadeusz.struk@intel.com>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 7:38 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Tue, Nov 17, 2026 at 02:35:04PM +0200, Jarkko Sakkinen wrote:
> > I think this would be more feasible:
> >
> >         if (current->flags & PF_IO_WORKER)
> >                 return -EIO;
> >
> >         if ((current->flags & PF_KTHREAD) && current->io_uring)
> >                 return -EIO;
> >
> > I.e., block io_uring entirely.

Hi Jarkko, thanks for the review.

These checks do not fully block io_uring. With O_NONBLOCK set and a
response ready, io_uring calls ->read() inline from the caller's own
task, where neither PF_IO_WORKER nor PF_KTHREAD is set.
loop_rw_iter() declines the inline attempt only when the file lacks
O_NONBLOCK:

    if ((kiocb->ki_flags & IOCB_NOWAIT) &&
        !(kiocb->ki_filp->f_flags & O_NONBLOCK))
        return -EAGAIN;

I built a kernel with both checks applied and the injected offset
still reaches tpm_common_read():

    BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x4b/0x70
    Read of size 16 at addr ffff88810c3455d2 by task python3/134
    Call Trace:
    _copy_to_user+0x4b/0x70
    tpm_common_read+0x1e6/0x360
    loop_rw_iter+0x235/0x5a0
    __io_read+0xc6e/0x11a0
    io_read+0x8a/0x180

Reproducer:
- open("/dev/tpm0", O_RDWR | O_NONBLOCK)
- write() a command, then poll() until POLLIN
- submit IORING_OP_READ with sqe->off = 0x1400, without IOSQE_ASYNC
(this is how tpm2-tss opens the device O_RDWR | O_NONBLOCK).

Checking current->io_uring alone would catch the inline path, but
then a process that uses io_uring for anything else would also lose
plain read()/write() on the device.

For v2 I propose:

1. The read position fix, with your review comments applied.
2. stream_open() instead of nonseekable_open(), on top of 1. With
   FMODE_STREAM both the VFS and io_uring pass a NULL offset to the
   driver. This follows c5bf68fe0c86 ("*: convert stream-like files
   from nonseekable_open -> stream_open").
3. A kselftest: lseek() and pread() fail with -ESPIPE, chunked reads
   of a TPM2_GetCapability(TPM_PT_FAMILY_INDICATOR) response match a
   one-shot read, and an io_uring read with an explicit sqe->off
   returns the start of the response.

Br,
Rustam
