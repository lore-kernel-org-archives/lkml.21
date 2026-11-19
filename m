Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110592;
	b=TR77mK1LMIEoFRv0VX5viCMUbIlTfvFEpNPO/2JUicH+wBdOzYCSluVx97inwuj3TKMs
	 L1GLmrA1ehVkFriGTSo/M2IrYb9cExB3K+zOpDQufHVm5OcRoKuwpRhecdLiH9V2FhUal
	 +l+HqAklVbkBFyTq0/F0uscnTPMiI/jD30SWonai7W/Fux4U57fjIgWdued47KURfx9bm
	 TKrv85HpWATsvB/fhcTaQAI8WYWzQpOY9Q51Rs20t8zPKtFTGBVh5AUJFfwbooWgl0AgS
	 lY8csnx2+GuO17xGQu0uBfGvcLDgeQN08LhdxhbyzodVFQE6jgJJl7vL/bt8fNMbupg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/O0/GX+7ajqO6zTAHBdQP6c0ZEI97XrYu3SAglUaXjY=;
	b=mb0qamzHmgCznBUTPuMGvW9rhZH41TLTpUPaJHBfINVHIQO1yhEI06XywArVJAxvWQAU
	 r1/jZQ3ZYka0FHS2kKUvsZ+DzVUERn/3tbjQW9ab5gvUzWyPCPWjgwk0CKgUXCeTGFMgn
	 0ZcI1LO3rA53BHvkoZczKekh0fTkLjUSfj3TtoW1J03bTwx8JOKYhKIga8B/ZO9TI8nAf
	 bqykXnE6iuS06AcMkpNORIRBhlhDqipfXr9oeUvXdwmoSmHoN/1TZOQZ1sZJezPCmHEhs
	 DJH9Ly+dSySikn5X9qzffutbHYlxY8O/ioMKCdEXUyx6VNeq8lUUF9prngcu1wY8vog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=BDFzAuNp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBC606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CBC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=BDFzAuNp
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso5025066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795110590; cv=none;
        d=google.com; s=arc-20260327;
        b=Vt0O6N9melowWpvMJETo47fvM09PdMKBy0o1pf/ouLwDIQBAoL0uGFxsw0mpv9c8XC
         smmaSXLksrt9UxQQ2J1j+XGkXGaV8VzTGfWrp0gtP57vKsCATSaNAThgoGLlaz6/ab8j
         ScTCUxzzQ5qjXmNwkcossmKOsb6SKaTMtNF2Iw/yOrD7L4FEWA0a7Yro0esOddh1mDrP
         J2xM2jUj60sT6p6U4m4eQY+q1R1lQpHUQtsAqJI0+2PhB2DLc/SczMvkHBStLUWzwKdF
         664cuj8sVRpmyqoxZyrbE3oqSnCo+8MGYXPBx7WuJt9xeDRIJAsOB9aTqGDnwdTtLK7Z
         Q2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/O0/GX+7ajqO6zTAHBdQP6c0ZEI97XrYu3SAglUaXjY=;
        fh=VzmwtGYeCcwMBMxtBf+UvY8C2BxCoYcnKaGYAUxWd+Q=;
        b=ixCrNUJt2wlfCktZR4FczQiYoEbST1wJUEtqGiqYURUEpRnqJzlQVClJRelAK9ZYI2
         XS14wRIOzo5xRKFmRMpqEn3bNNmUbmybebk5DGEImMObfNeIaqWjNcQzyCb0rkmqfQIs
         34RAGOjKN0jpjmK2qmFbu0s21gcvVzQjyQX23jrSVn7z+FW1LbP7AafuhHT/sKkuzxeR
         K2eZM38CSSb7QBpPo33w7HUmjUQGk50kQRfeOROuFnZuRJvAd37s7XlKWbAvweTBF5ff
         XXdJY2TJS6PGNJ0C6h0hQT0NtK1wA/chX1K4TzHD5NLZogm5LtBuSxbiaQIwBLCJKDuG
         1A/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795110590; x=1795715390; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O0/GX+7ajqO6zTAHBdQP6c0ZEI97XrYu3SAglUaXjY=;
        b=BDFzAuNpRvvcKd/LuWfKHb0Up3yVJK+lUdRHw+QAkLWhRGbKgaDhPyUL+XgX1qkSB0
         KO7wVl3Injn8WCdGcF6KS5G6p4PzoZxufMdeSy+FshWVIeuVb0XURSX4XNfGitKoED9+
         2SHwoor2xnYoAyS+HVcqrAu49HdzMTILfgwi8W9Scl5Bm3P9ijv6S2No9HS4l+9xe5p7
         dTG3SJGgGaxbQDUFXAZjmta1OcEL7s9+bRWSoMeFMzRKF/8w5pa/F9Sq29fDmyWUqSqw
         CrB7DFdjOySfyTim15Ah3kei8YaR/HGLNrwLSWFaH8JEqaVA+juXKaEcD+MtgLP3YpOb
         iStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110590; x=1795715390;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/O0/GX+7ajqO6zTAHBdQP6c0ZEI97XrYu3SAglUaXjY=;
        b=ZX6dnmQzKttzdqCvVyMKG2YCBGzoLn3D54QAT16l87I0RGGCC4UoB5zxkf/32GmIZw
         S6WoPfkZRAhOq27OspXaBR25gtqDddTtLPHJsB2c/n2fWzsGhtzcoHWLlSXRuso8nZV+
         MKToEH51+t2Ms7sLsfTBbqL52kRa5Ez2J9zDsrhMJngayFBXg2Lmz0kTo+ANG14fsGWY
         PdV+GXJn+TcXE2JSl7pgF0N5l1NHJYCMu26j87EUHiYmF5EoQB8r3CDuCd2PRBaZcEfr
         tyUKPvGHdaPwvM8KbDR2/KYcm5EAJTILsvK0AW+uHZYlMKFay2TSK0Xt92I/tPNeFEdv
         n0ow==
X-Forwarded-Encrypted: i=1; AL+hErE2OcRewJTwk+lSQt0WCbAKT2AEeXHIbcxUPwwOeiEFTJdpFFJAlv7HYM2Nay76THcyagVfiPXxYgyjQwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z3b0ri0HnuCnFaRcnwEi8Gxt1w0QwQoWAfZL916h/VQj4ucV3
	xC6RpIlJn14Q1xUd3M4pyUpUAaXsbKDPNOGaLgF+XoAwXxdE/8MEHpQG8cPN14t1gUjwpLjHuvZ
	SpvhWvG6FRANSwn5/HZfFODcOfwW9Y30pryeRH6XqSw==
X-Gm-Gg: AYBFou07cBFKt1woZsBZL+x7TVaH4tsM46Qf5dkZMoAvzXr2hdcG027DbD1bJGkI74H
	YSrXTdrzHrmXosvQRuo7P/YjkHYje3hBhmJjaRE+0ndwz+ZWT6l5zI0th5n/95HkhbBkdXz7wbc
	iXq7tyBD8fAFmkZGiYvt9q+fnH0PWWAu+yvyISJAuXF1o3xi03NRB+o8ZRuUFQUrluvkg1SXDAw
	PyD0i/Q4vUI/QG5CifeCu7bbvxxEFvjUdxrrRALR9PHWUkGSSjX5mfW/IeEfpRCQ8ynaG3OOrU1
	hwe6y9xN/6+XT5TTLNIMFxPPt8v8SOoWd4Y0lWpyNYm8tllx7txuHY0wEk6jlcFTmh7AKictcqy
	DYhLF12yVdxHvRCIDgHR6pC6jjqyXCDDxVA==
X-Received: by 2002:a17:906:3b94:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c513ab209f4mr54087866b.35.1795110589931; Thu, 19 Nov 2026
 09:49:49 -0800 (PST)
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
 <avwzid1Ovl4ACkaQ@kernel.org> <avxJ9MxZ0PoWbQTc@kernel.org>
 <avxKqn-PlzJyxVdK@kernel.org> <CAG6=z5sxUo1x6mpotkNZXk=nQYvD2AyMLSDhzD3B3kqxJ1=iaw@mail.gmail.com>
 <av23L5HBpy2gbm3m@kernel.org>
In-Reply-To: <av23L5HBpy2gbm3m@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 20 Nov 2026 00:49:37 +0700
X-Gm-Features: AclHuK9Q0IcDkucYCJnM_63DevcnoFoQpfJyHRtWSFgpZWzV5JY0H-0a_Kp8-CU
Message-ID: <CAG6=z5u+qK3JQ4OwqS8e9ncfcasYPWLQhU9Y4iBFi1pEf0QFuQ@mail.gmail.com>
Subject: Re: [PATCH] tpm: track the response read position internally, not via
 the file offset
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Jaewon Yang <yong010301@gmail.com>, 
	Tadeusz Struk <tadeusz.struk@intel.com>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 9:33 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> I wrote that out of my memory. I did not expect to be exactly out.
>
> Block uring.

Hi Jarkko,

I looked at three ways to do it:

1. ->read_iter and ->write_iter that just return -EINVAL.

   Simple, but readv() and single-iovec writev() stop working.

2. ->read_iter and ->write_iter that keep readv()/writev() working
   and fail with:

       if (!is_sync_kiocb(iocb) ||
           (iocb->ki_flags & IOCB_NOWAIT) ||
           (current->flags & PF_IO_WORKER))
               return -EINVAL;

   The first check catches normal io_uring reads/writes and AIO. The
   other two are for IORING_OP_READ_MULTISHOT, which uses a sync kiocb.

3. A new per-request flag set by io_uring and checked by TPM.

   Needs io_uring/VFS changes and is harder to backport.

With 2 and 3, vfs_iter_read() callers such as Coda (which forwards
reads to a file passed in by its userspace daemon) can reach
tpm_common_read() with their own offset. Today these calls fail,
because the TPM files have no ->read_iter.

I have 2 implemented and tested. It would also need a check of *off
in tpm_common_read(), because of the above.

Which one do you prefer?

Br,
Rustam
