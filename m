Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127440;
	b=Xnxc0no7a7/mhhMUzg8IIlzB8ttw3cJYkfnQ5btmNlDU4MK2x4ZOmPo8n/bf3jsqhG13
	 32hIRs6DEglPt1AgwjES9hqNBgbBgppjY9/bCSdtGSw+jgD8sfsYnBgwDbgjHhTLFhgbP
	 TDFxugV4x76vWRwcImmLNkscIR5BaMHFDgtbJtN+RWLJwLiufRhNBKwupKtJs16zLUu3b
	 gOT/h2ICTc7hRfe+fAQnTjaUrzWmUs6hp7qoi+97QFh6KShsuGNmGG+kSRsrCnWa+NARB
	 Nhg/lslvd1ULCt4PR697lde++FgqjliBFT/rMpHJOcbHcDbmXHQneTBJD9DhELeFSBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
	b=o7HZn1pw6D847i7l4zfyET7Q4d0SrliUhnajCF1AgcFIV7B5CGwY4MYy76EqrW+vghw2
	 79N6YEOU8hf+CAEQKgmnKthQfm6f6cZQaK/Hjg8SOR8F5ghH/b8rSMCkSIM66+/By+ZqV
	 OHTyxwvJnJwd0gWfSHaZ/r0qeoFjA1fTNvx2kYkhOdjIZ6U88zh/k/dW2kFy3BWNjhRnR
	 9RKbS4wyYkJ+Z0dv845PqH16Ngdh4/pivBLBzxQW74DYDBKmqas47+Gv2uDYkrj51/P05
	 NPCiiGK8puPuIu9BC7HUu5UFuDqEh+AcnopDPhRgS3A1Fj7UOkbVFrbtxC4EmhyxGpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BQ4xrwA1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2115606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2115606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BQ4xrwA1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so141804f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:30:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795127438; cv=none;
        d=google.com; s=arc-20260327;
        b=FVi+iBBNlNh/NET20gGDQZMvL2C7JIoTIGNjposj08z4kiQao1S/9kmbrDXVFW96D/
         XGLzUP8QevQisVxRmBe5ZiDTJElkkTaL3RIZs9lOenkJx1voZWJhrcK7T2x9tHgIkpfL
         hxRsnjnDQ9FUkCzDH49uaCzgYvEFb9e/GMr8co3zWJubTM1O7GGOrd1GExFN7sYsw2mI
         0bQWzvSzwgR9KjUDlQx7uat+jGYCQ/K4VOw0N/6129r+0zlg/zaQUh2+Qoib2P1PHdkA
         K+HvcUsq1CXkxL0wKih5GgrmQ34sOglviRUz6/Mbzef8Fx+6nOLcgZC0gh8vMe9brNYy
         FP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
        fh=gnwL0q0/NMBffWPR2f665dpCLx9eBnwP7vxOgML4pb4=;
        b=evCuoYbXGcL+S4b5g1wX06YTuZXZvipxVJp2wWNR04yNE4DV05gNxQfTLmWxitmjvp
         VUp/voB0gVdsRp3aoNWkaRPu62VuXpPpIs4mxTu/h97CEbKRNrqRfhjrVXiEcazGAZA4
         cirqHGLDq4nFLT5BEkRJWsRu1ttxc2P+eggpoUVJtnn0lQI5VH8aHxb2IlOo4E8laggI
         zjcslFS7fZq3fVNXvGi4iGabW0QVteb727LYdt7ZQBEfHeeMDhJxVK6kFe1NNoo2RKJb
         QB/cZrc3E5xXKJGfa4gT6Macslm3MplUp9ASBrsqljKR8v93QeETskC6XAHwr6ISgVXO
         3QqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795127438; x=1795732238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
        b=BQ4xrwA1vRMLoekmeBRKLeZyKiWCOU9K5XDKaYDdXazTvJlfQ5jUIF9VFw3YnG5IbP
         KHMmM63D1zcPo+4XmSAC9cYuEjnCho8Kfvxgid+MMSIJZ2PQRPaRRb+S5BIctkU8F/4q
         cg1zSLSEbZdPrDHojmxg0BGOM5pC7MQ7rzRZHnu+JxQRbRfu0R7LupMmLoJmcJ8xF/72
         wq8X77MVHGjw8TKwglsYuGYAxkZv1KQ6cPts1lCKJSOABMqPzCYP6edFR6zr+C9b4MQi
         bP83bNH2HplFz3Ex1RnOR5uSQsk7qVShVEuMPO35YThv23LbAmDnkCC9otx3Olckkafl
         12IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127438; x=1795732238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
        b=dVzFNC5LnKp2/RJ8aljTVI5oR2lfbt+5Ka7ZmFton0udaTeszIP1ugVXuZ9ai+9kRs
         fkqk5ZZT7F2ueTl9HvBwKhaJRC7L4Q7FugcVH6ll5Nt9eMAP5vhHdAB5QvFUbh3b+S5y
         bf6Sh/s8GEuJuEsWA+9LwKTD5euuUh6BEcIEo6T+REffdv6Zx6F3crnPaMhRSJYJXj8x
         6SrWuR/x7dlYq6OLM4K12468GpwKhMRzfmtXyECtn3eOwH0eRCleAdb2qffxXHjFdOU1
         QNgq3EUbjf6DZv4v4R6f/1bDpKmc0aOzgU3uCrRdG5OY7V1bJt+cP3B/FwbvBXyoTosy
         xK5A==
X-Forwarded-Encrypted: i=1; AL+hErEC404O4BM2HFh7uh5W6f/1CJKyQJYz/QxgTrnNZvNyHNz7rQFBkZ2K8VTBINKsGyyqUvZ+kwYD/mALlfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gaHCIod8NP0G4DG+BQ1Tuy50K7Lxdx54uR9gUMUWfPHFjMfx2
	pLhYRRsWhhs089Sl8JinErdThaFN8lfWF0j3MdjzA5gIh7V/u4DGjIP6bHzetBZBy4E14tf46oB
	8w6rEZH+xQu6E4ZxbsB/bUaV92Q398oiHBnaxmvF2
X-Gm-Gg: AZFdTZevraaXreLAhapL+hNvTv2zDdAgWA6wy90YAhIQA4gPSlNxlFgd4boTNDq8uy+
	SpwgTG7KG1CdPCHtlr1vvRIEO5U/A4eIt23UY9bY/RLsjarktPz7ZJzpDAE2b2Zh1BzK6CWcmp2
	B8aBS8Q/tjBjbf3kb5BH2QqYeCiBkYdmt3aO8v+1sFweSOtoml4zjjxvOtet0+Pj2Db/SGMT7uG
	KI48O39tE70KPj4pOl/lf8Sxmho4O0M093tKfM76rIoq3UGvMb5DvLP4PZeS92oSzEAE+GUU8dX
	FxL6H9LNMA3otryE/a47JDRTSQFA+NYyYp36EIHIkRXFkWggFQtNVtwSbrho+kNQGr+AxafSXd8
	1diYH8KaEvYVgKd8lQnpWOpsNzC6E2mPzWJCUY77byMpBDHQW8fgUjMvyNPiybnqtEXZjkqmVg8
	dViu3hxOlIF1oSjx7yn124Ep1E8Y0MfS4P4w0CZJr9jsf4YpYGAW9mp10Ksy2tVrmxI/W1IL07J
	QHWzm3yh78heO36/cUlJS73WhALmdUZMJfw
X-Received: by 2002:a5d:5f42:0:b0:4a3:8b21:51c1 with SMTP id
 ffacd0b85a97d-4abb9de7e00mr1547177f8f.53.1795127437643; Thu, 19 Nov 2026
 14:30:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119213147.1094488-1-usama.arif@linux.dev> <20261119213147.1094488-2-usama.arif@linux.dev>
In-Reply-To: <20261119213147.1094488-2-usama.arif@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Nov 2026 14:30:25 -0800
X-Gm-Features: Aa3M54rH-aa26JdIN-pUYW-8cMRdCYq4lpDC8en2IEgeQrnp1pYq2y4nekWn-HI
Message-ID: <CAKwvOdmCuYrdHX1ACVyC3BBo7V5vQ9HiqSx=+vVCYQ=9d17Kdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/boot/startup: Disable kernel stack depth tracking
To: Usama Arif <usama.arif@linux.dev>, Kees Cook <kees@kernel.org>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com, nathan@kernel.org, 
	morbo@google.com, justinstitt@google.com, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com, 
	atish.patra@linux.dev, dgreid@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:31=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> Commit 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
> renamed DISABLE_STACKLEAK_PLUGIN to DISABLE_KSTACK_ERASE everywhere
> except in arch/x86/boot/startup/Makefile. The old name now expands to
> nothing, so the startup code is built with stack depth tracking enabled.
>
> The startup code is linked with every symbol prefixed by __pi_, so that
> it cannot call into the rest of the kernel by accident. It has no alias
> for the tracking callback, and tracking stack depth there is of no use.
>
> At the default KSTACK_ERASE_TRACK_MIN_SIZE of 100 no startup function is
> large enough to be tracked, so this went unnoticed. With Clang,
> CONFIG_AMD_MEM_ENCRYPT=3Dy and a minimum below about 90 bytes,
> pvalidate_4k_page(), snp_cpuid() and do_vc_no_ghcb() get a call to
> __sanitizer_cov_stack_depth() and vmlinux fails to link:
>
>   ld.lld: error: undefined symbol: __pi___sanitizer_cov_stack_depth
>
> Use DISABLE_KSTACK_ERASE, which disables tracking with either compiler.
>
> Fixes: 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")

tsk tsk, Kees your `grep` might be borked!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/boot/startup/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makef=
ile
> index 5e499cfb29b5c0..0815105e7205c7 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -3,7 +3,7 @@
>  KBUILD_AFLAGS          +=3D -D__DISABLE_EXPORTS
>  KBUILD_CFLAGS          +=3D -D__DISABLE_EXPORTS -mcmodel=3Dsmall -fPIC \
>                            -Os -DDISABLE_BRANCH_PROFILING \
> -                          $(DISABLE_STACKLEAK_PLUGIN) \
> +                          $(DISABLE_KSTACK_ERASE) \
>                            $(DISABLE_LATENT_ENTROPY_PLUGIN) \
>                            -fno-stack-protector -D__NO_FORTIFY \
>                            -fno-jump-tables \
> --
> 2.53.1-Meta
>


--=20
Thanks,
~Nick Desaulniers
