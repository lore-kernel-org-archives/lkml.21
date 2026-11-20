Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184947;
	b=xnES5hjSJdjHPL2RsKduHH4bfdBk77sR83VFsxaGrfT2V/IJWwPwW5Ix3WTRDrDC6Ms0
	 9twWu6nekmK70tt38aerhpd8m88QXPg+eVFqx0uJM7RdVKpzQBZCJ0Une8f+ivKjlTS6i
	 egAlgOCnHHdACXnFVf111mD6WLal+F2CNnPs50rp3BWhJ6923fdcTndi9MTRliwF3a8di
	 n5KnguF2iHrXCZ4jDElsvPd9JJ7a0++2g+utxpYu3cil5tlzRLUKojRyk/OJVRZPxaVYH
	 G5MZDBS6l2xdRHZWmpbaM9j9B5/AKmi3NEYCV+l1Bi6rjbGgAvr5tRbo0jB6QZy8Xcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
	b=MbTGn2+9VOYpXwZcp5xUnk+sodapkBuNw6SP2d6/EAEZqpQFnGdVbgZV6pmwgYv536yH
	 0WsQn0W5/TcSov9ApYlADeHTsSayVZ3NHKare/CFTsWNo+sywJHWwP7sr5vDlmCdsm+sC
	 9+a7VVbV02/xr6LGOyE5U1QJiyNVh43zN/RNtIdfcjYCNcRwAH8Irr6DzsTG3KJ0LJKYD
	 TQNrYHpcVfuRICfM9oUIqBruWPyJXt3IltQ41V5EyEyPGfe+8DV35pi3Pt7QGS/+2KAKJ
	 faGQQf2d2VtmGrHEptgiFIUgFkvvL/wbeYsiROz9fe1nD7Qpq2eEwFCbEYiHmmSVEIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b="KGPM2/li";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2435C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=KGPM2/li
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so1400554a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184945; cv=none;
        d=google.com; s=arc-20260327;
        b=roKp/bW4x2Wk8ImecBBIBernvet5pdabMMH6orEMseSuRWwkVfXMcsnYwRyScbd1KT
         4zJkHbP3DH+3m+xXeTpcPFK33Ngh/WLrGWsfqJLd3gB2cu9F7fC1CD8GMtc+bu1GIs63
         1RRP7skL0GPR0VdC4oI+1/NsWWV4V4I7DqHD02zz7rwsn895IEteFBTFgTBYP8DZixFd
         252ldOEdckiYTn+1sskvijOCBE2htM3w9zVbCJNDqphWdQJuCpabAEpmiAr6E4s+r+zb
         ctIUIS1O+0M2LMDr8fsCb5mPs5zXFjC7QP8fg7OYvXcvtXzy+TWqnFdr8wNG2iH9UfUz
         8K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
        fh=oZ+bySepXjPNg2Sc3VSmZ/vOso7p3ZLwupFkskEa51g=;
        b=OFXONXfUUx5d7z4ybSNRYRa8FqBdPM+4oMQ6Vkf7vRa0AyPr1Fv+60s+Cmp9ZxkhOD
         uwoFALhFUtij9uKjXWe0xw8s9upudne1aPUBl+iAGr9093KPKdD05XgfcW5KCtn0o7Pw
         RN+SzWeWqo+wd7ON90uZYm+mC2uDmXzQfWJdH11BWNzS1uhIYVg/dacP9pyHhGgr3oY/
         dBhOHTt7K3LPyVaV6dZU8S5DjT3hKbFWRxVnACIm0syxlCtff0P3VeCCbpmozo4suNLU
         A11T5joHqy3l+MvZYyIyU6YhEzs+GM0JVAzkKwMFnEavUqKRcOO8rN0452l0r8eeUUzX
         WMQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795184945; x=1795789745; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
        b=KGPM2/li2EqKJYsf/Gv0WBthhS+7luPZAuNGPpKyoFR0Tzkw/keRMcPSqNncdo+2u3
         uZ+z8CtXzAHyFe95zXtUVAzd3/EqXdFCu6If/GIpuT/0EUC5sR2s5ZHQAtrFj3wHUQ0Z
         IXdKQpGDDTztrw1WwuQaleOUwzoMUx9m7ewvakMso9Ku4mvH+wudthJmCerHjg1bYbRV
         o1ynKSSNX6Rg214EU/v8oT5eMHlVczo/yhDp5h56i+74PPC6D1YDy+Ll9n4D/UClUXHw
         Cli1pzyCwK1zM/moRyGGU2j/ZJ4fZUiQSbjkpPtk5urWyIMeD44Rglud1eb1xF9kceFu
         b2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184945; x=1795789745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PrOqE+bSiayWOYxEYrs3jZYEla+CkFoA9nQLVlRCn6Y=;
        b=fVhhs8MzyERg/a4mlqSAgqPBVXw/gqmp/qcwq4JlLwT55YkcyXhijIkbKi3Hymvpcg
         XnjTfA9wxOeapwgxgeQpUIyAuIIxLgrSijY6SNnBjejn+WPkb5H3KTJiGTiLajiGIUkf
         OE/mJglM3/qypuWRCZeXoBYD0i5gFNKGO2Yp0BLt6j336NUYuHF8W8HUnv87KPhnzDuo
         eSBIYnFP8taPqmSg0bc8N1ACPfyQuHsV4KTsCTkrnFQg+++lwbFen4Fe7z2o8BCSLDSn
         X4TbxROYxcEn2OqB4m9lDR4aH26SoPbRaIG9KetpCda0IwWAJPLjhlkOptnRqrgWi4XE
         T2nw==
X-Forwarded-Encrypted: i=1; AL+hErEcpbEhVMD9PFlMkOMc5G5G/l1CePaVMLkxMzLK0i06yJsQ6SqLCXSj+ZjAQD0mZEh0WcxwwK3+pIDpDjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EOi/83sDMUSWifzKMCzYoX2zTfweR+Cfk//ItlDRlw6lCUJP3
	5sT3Qf3xZg6K7wRc/F4t0F30byM9qmVrl002No0VKks7E1fUh41fn9GIHjDu7yfGe8lIWUlSXYq
	9nygtBbxm2SnCJY6cbkSZJhx9LQpdCICGCLBIJ8goBg==
X-Gm-Gg: AZFdTZcaFklxWBY3wKB+X/kbSbiZmw9znWXYsbg9r3qb45wnc7UfpUMhKF+G5TjaSR6
	6MIGjVVCW8gWjXQE0ZnA5LN+Knmo5gAnipt4JlO6lfMOLOIjL5xetztMNXjuGgQFsrdawDcHU4c
	gP0FhYiqYULw3TaU/KeklFVPhzxWpBU1DkyP8gFdu/xRvdrCmEUyTQN1du2B5TJ2Izirb6F44fQ
	IAzxYtT+Dwh7KsYS4pLOsFJjVua5wPqaY5r7KHKS7RKllF6I33WY1ipSWJ/M2phfXIdVZ0E8VRw
	se+SJzH6kJz3iL7XdtxRbMmJjc6HBs2foUgmqf99Q0plOgps27X/ldVNfNyms8bCDC9OD2lgD2e
	mE2qUISBUOKBHjSHb5D9Wk6id79IyNnzF4Q==
X-Received: by 2002:a17:907:ec02:b0:c50:aa10:d898 with SMTP id
 a640c23a62f3a-c513a859528mr312083666b.26.1795184945410; Fri, 20 Nov 2026
 06:29:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120121614.978396-1-rmustafin@cloudlinux.com>
 <20261120121614.978396-2-rmustafin@cloudlinux.com> <awA8o4oIq81a7J1z@kernel.org>
In-Reply-To: <awA8o4oIq81a7J1z@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 20 Nov 2026 21:28:53 +0700
X-Gm-Features: Aa3M54ovtmNup2lPY6rNVpSaJu-oUVw9OB9JbjDeYfkHzHe9GxRDZx2A7BPFff4
Message-ID: <CAG6=z5tzc8DG-7gU03mKs1JxqEzUULwBinfHKtYWyPycKkG6mA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tpm: Track the response read position internally
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Shuah Khan <shuah@kernel.org>, 
	Jaewon Yang <yong010301@gmail.com>, linux-integrity@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 7:27 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Fri, Nov 20, 2026 at 07:16:13PM +0700, Rustam Mustafin wrote:
[...]
> So... why does not this block uring? You are implementing a feature
> as a bug fix, or so that it appears.

Patch 1 also fixes a plain read() racing a write() (the second trace),
which does not involve io_uring, so blocking io_uring alone would not
cover it. Patch 1 is small, so it might be easier to backport.

The io_uring block is posted on top of this series:
https://lore.kernel.org/all/20261120142116.1630010-1-rmustafin@cloudlinux.com/

It depends on this series, because the new ->read_iter() would let
vfs_iter_read() callers such as Coda reach tpm_common_read() with
their own offset.

Br,
Rustam
