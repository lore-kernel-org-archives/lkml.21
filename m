Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795747320;
	b=rn7P3+GLF4eunZLSi1ZrjTQadlDSTZUoQGhgu5qfMzOwwmoo79YhJcwWgDc1KyR0rbqp
	 Ar7HWvBNFDRuq9ZIj1m4Hs3v4bbSQXUXAqicfRCibWFaS8TtxqJHokzFvlXDciw2p/ap3
	 orxlOR3KwPvJaSL8SPJLzCeEiShB+B+UEwcrlU+iPrLGrD8KExJfLnmjJcdX0mvDNNiyR
	 i4lmvXgd8GKpLRY93UiQwFjiBjvAbOZgXI4cUfRmOhIVMz5wTmUyUoE0ZyjXnpz/0JFyy
	 N7YMinMoivoyQEv8Wtlhzxt2a8AIU+UF8UBGWRLWCqheotV4AeoopsfbXaPDIC1/Vtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mjTKmUue8uDRgqqOrMpuy+EJyNp8jfd045TOjApN2+M=;
	b=dENoXVOQk0UagxO/AwMkcW9YSnPcyw53xMGI+gCwhmdZTthek57zgoL+biGCwVE5gfSR
	 v3cLC2vI7YC0YP4OyPy4Bz736q2OA1C4fPU8vF9UaUvb9Xnuu1ZjR1YjQc0yB4/9fMA8/
	 kTLWVuga8NLy3f0DNvcqi5JRX5Yrta5FeN2X/FsiQXsU7cixyZ6XcXZ3zKa0d4t8yEd3Z
	 Gzq5t31pyAD/T11feyvMtOOm21m3USuyo5nwWd1U1chR2eBhacYdfJrcMg3FgFtDSyeWw
	 lXgzZJ50FWZQXD/Nr56w0oTVFJCboY1M32KL/jkCQa7DoLpYiccwzxt3h4HNomZO9RA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LymxqVqE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44152606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44152606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LymxqVqE
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f0274f88cso99929506d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795747319; cv=none;
        d=google.com; s=arc-20260327;
        b=IFpJnSRmimEuUqW5KfImFfBuRb2LEH976JlBL1vg9a2UmRX3GDy084dip8VzFi07QY
         A0bCIUiFkDEc5czmOrSRh6N3gTnf5EYx4yUqtuhHK6iCoiuJ+zx3fQFbV0jfoeaYdBjy
         /ftSF9MZefa/WH+6B300CVesAz6fogoC/Y6O3LiOhZz1SsUIrycmfdQMXWNKl75+QiNS
         oQQCCLp+9qWthlA1OziEeg4Pd0Qj2VeFg2U2DisLreruCDd0e+YbeG9Sc09KI7XMZbD0
         YIzLfChrfe59xm2F9ROhggm1X9MbHfqu9wFTuCcTOdCCJF8Gti0cwUrhBnb2LM+d8vmA
         jeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjTKmUue8uDRgqqOrMpuy+EJyNp8jfd045TOjApN2+M=;
        fh=HrkUqq2P0UblkUs0ndfh/I6SXbVbTsXmOVFfs2CBcuU=;
        b=lhzqERFrhYc5SZ3apwkgg4avamRNX/IEbFrMnXV/qzGzXbRqVDfPQw5ejdBbA78S0A
         ImOru7uYKBBDIgorKi7L7i+xv+FVFkcFf2DW3JAhu83yB2tJeehE2xiF/ocapqUZkoAD
         hu0xfqAdQOwHPxvcNH6FLhR/CyYMT7u9tbnB2k5Nmjmfp6jBkhbfWDIJMxbvHWni4h4R
         TwsDea577D8JNGPVLpHacsLuIMSyVXqPUW3RO0DmEhafo3h2oLMOEMvUvSKx4622ZLhw
         zdSVI0Y9nD+YvTLJPgfFJ7kCtEGel0W6isz0U6/nykpsb08fapo4EOSh84ctVDTu+9jf
         ys1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795747319; x=1796352119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjTKmUue8uDRgqqOrMpuy+EJyNp8jfd045TOjApN2+M=;
        b=LymxqVqE8yKkfvLJxa/4Kw1dQnzxd5RBz0e9MwTAJSaII/nSUMUacLxA9zWn8EPWwe
         zpFBNAZV3BfX3VZc1Hj8PZ+ulZlE8v/3GYsYir0nI+k5hWw6F/yAfbVWLpRb+M+8ErMx
         iyQmK4V13fSsxWaCEGvkvPt8FZdL7ZVe5QDsG5E/dAsmYgUI6r5U9szA+GiibPhPtL54
         RXZWP0mZxAwCevEKiik7qpqlYgCAAvWBjlkp17PfAmqWk3eLX2mK06ZFqlhGMUYkP/1P
         Igik/ouRyJ1oa86D0IM+0Bh4bQFIK/+szJkBgG40sOaWrTlENmsGeXYvK8ToxUtAV3S8
         xt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747319; x=1796352119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjTKmUue8uDRgqqOrMpuy+EJyNp8jfd045TOjApN2+M=;
        b=BPO5NJ+gHMlYu9ChwuhXuACWAMa9wixF44UCr5IBTvjiwSCzRK8gcp8NroPAUURLFr
         w8gy663JgfYjQkuoLHAE2vSqM8XJqjU37DAUrdaP0GCaqhO+4zaDTFvlU2HG9hdP2ZcN
         WaHF7ZbUuSLEtk6Lwul4udJfQNrVmDpZj8gAtzjHQbxYKhBX7bpvSWVA6GUtnfuiv+nF
         row+wqSk7yPEWTRvOcOkktKv5r8y1/r1IEZPGiQsLXFMSEBNlubA1rqEaFuqu/8vqt8G
         3W4P0aijcMK4UnIj70o1wgfTLEyxILX05v1YzFlyQf6G0Mi64ao+YyFOjYZjX8zbYW1U
         p3Lw==
X-Forwarded-Encrypted: i=1; AL+hErFkNsTQt7Iajk4RpmXfsLvdTqUhJj2qHsZtWmBIiGoV1J680mnelitMIBjJnSozFxzjsqsz7lAnDke+vD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GTZrigMLQBQrIXFaLYu6A9Lru2RDKeO5ZdyxrLZPlqUUM4Bt9
	Z4srN9nyIh5yko5rhluqOTl9j6ZemwbYuZd8dDXiyHGPc9AaTdRBjxIddKOgX4fwgxEnpEbU5tX
	kYqXA8EF2c51QoxAG/0LjZpGys7phzH3MIZuv44tTtA==
X-Gm-Gg: AZFdTZcmIrD8tZ5cAjMbH+sZ+PJcKhMw3TqjuhcukSEbdJnKXqCTj4bVGn73cSQjcmO
	elUCUTqTLisRW9VrFwxcxUAL9n1QhZclQBwyGWh349H0pApZ/M6JExC4aTEttDFp/wCloRMV3JM
	h/kNSkQBerujgwGNHoLbFpAQ8QO8Hmb3b5jQzSH9SEtrib3kqGjTFjEhpJk3yYg+rzsroycnbt2
	di437bNmyMld4425E6Gz8hs74V/KBFZXyIQ1rJ7AKWN01SqcIhYaCgfjyX1ZT/e/sC7CKzTQ1yJ
	pZYvRzJSiylQ3JIsQZKWkByde3HCt+3v7/5mQEgvP2V5bQF54GVTcQWA1WDPt0QuoUl6HsrTkCO
	S5AkUd8Z9AxCuv/2Dlf6TbGC3SRAR6/oX3eHo
X-Received: by 2002:a05:6214:27c6:b0:921:7f88:9af2 with SMTP id
 6a1803df08f44-9217f889d57mr115043886d6.16.1795747318873; Thu, 26 Nov 2026
 18:41:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127004411.109585-1-artem122novak@gmail.com>
 <awjaHB2ugCG_F3Io@google.com> <CAPufuhb9txcosy48VXtfxwnC7Ct448J=_HbR00JnZR1QG-NfHg@mail.gmail.com>
 <awjlpLnyVmKRqhmQ@google.com>
In-Reply-To: <awjlpLnyVmKRqhmQ@google.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Thu, 26 Nov 2026 20:41:48 -0600
X-Gm-Features: Aa3M54qy0vNlqas6YULOPcsNSCZ7uefCUSENGQM7ReO8lLzeNpabTmpK4rgiuJU
Message-ID: <CAPufuhYd8daR2EPB=fE+g=Bejt=85pB3qvmOBdA-QzyO1Qx-yg@mail.gmail.com>
Subject: Re: [PATCH] zram: validate decompressed page size
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: minchan@kernel.org, axboe@kernel.dk, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

> I would probably prefer to do nothing about it, IOW rely on the
> backend contract.  Most of those compression libraries are used
> in other places in the kernel (f2fs, squashfs, etc. etc.), zram
> is not the only one to rely on them.
LGTM; I'll drop this change.

Thanks for the explanation.

Artem


On Thu, Nov 26, 2026 at 8:11=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Hi Artem,
>
> On (26/11/26 19:34), Artem Novak wrote:
> > Hey Sergey,
> >
> > On Thu, Nov 26, 2026 at 7:19=E2=80=AFPM Sergey Senozhatsky
> > <senozhatsky@chromium.org> wrote:
> > > Yeah, I don't think we should do this.  We only ever compress PAGE_SI=
ZE
> > > buffers, if some backend decompresses it to a something that is not
> > > PAGE_SIZE and doesn't signal an error via "ret" then it's a bug in th=
e
> > > backend and zram should not cover it up.
> >
> > I see.
> >
> > I thought it might be worth having a defensive check here,
> > since allowing an incorrectly sized result to propagate seems a bit slo=
ppy.
> >
> > Do you consider this useful, or should I rely completely on the
> > backend contract?
>
