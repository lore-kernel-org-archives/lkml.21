Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795054011;
	b=nzdK0UzIPYj+61ZtFMh47ThGlj1eqom4d+811lj1EcUZYWPqeH73FSa8H7RrxYMcNO6n
	 o2IGnRiRX+YUh5tvdBb334cDVq95o8LDxv0Z/+Z5k63x77/OY/y38AaehMDE7eZoTLSPZ
	 Z6loAW4doMzO7M4p3lkve6BEopqAgq9MW85y2arwvi1xtME9imnhTt3BuQUsUeQqs0n4s
	 ZYRNC3DelkJ12sRZlD4ETuq7IC6LFygA1QWK4odVyw85D/LzUgcby68gtNzua2CfFO0jh
	 DIuRu2pgLBcJdteT47cDh3TZtjdfllia6yQy5aVe2pgIaJlcplrX5uHBr/YjuIBTHkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NCO/dWkf50AZTb5CSt4Ge8e/B88cMhBm74UQ+F1PYOU=;
	b=Ery6F+fVa3nNScOEw9sElYEU8/MF7HkJ4/eSBRxIJe9lotw4Ml2Z7v+uMvBIKIe2IBXo
	 pH5iwRHau2yUWDhCQ97zHEbAnPLc7+GoUxVR4ZG4FNDsIjHPOGcJTHMQeNoqUYrpbFjJZ
	 nTG8PlrVY+N22OamIr4px3AmhtNk1Bg/EbzA6BdIsHIDoMkApKL/92PjerVMfxD+JqGkG
	 NyXJXNcQo4QhWgX3tU1V61WU/XnkU+a7QhFnXQqyGZDDBs8mWFwyR8sp5TFHSBXGW1XmS
	 fSxfnjYhkm/NAyow8EGXQxyjmqCIrrwvkMIjsvbWstapFhy8EBNeCelda+o9E/zZ9sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUQcBVty;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F9606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719F9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUQcBVty
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b360828905so15902937b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795054010; cv=none;
        d=google.com; s=arc-20260327;
        b=WUE+G/lY3UwhWKT7K9l66U4vETxtmyhqCIxIM2eoJmUI+Pt1BmCSttU5avVef1u+ki
         7p+GeAIVKzaE6/vWxhZ74eNee6HSrArKrVkWAupAfflYNngoa92tDx5GAd+g+AaRVYOF
         NQJ65aN7ztmao0DKeAyK6rrK3wJhJHznwi0+PlDceL6JNksgKW9tm5jZs5Iosgv6yWUA
         z61vdlfTb8nxqKj19ur0OEYaIFdg4PspIveeIwc+7LMhTSGCTbjRFxi921ae1rdf7hY5
         ShWTz14EeyTaNU4Jx0Q/wlemWMBUUuD9PToTl8HZvGGBZrXGOVEBof3LqQS4n59I+yxN
         Vnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NCO/dWkf50AZTb5CSt4Ge8e/B88cMhBm74UQ+F1PYOU=;
        fh=vQBu7XFdIBPd32S52hs4vY/UeFuqMqGFWw+KPtKFsX4=;
        b=hzaVpEZlK1UB1GpUF0ezcl7tvaBG25/Hle+DIzCrZEMqh+QCxRZZkaTNLzA8OP8iX8
         Se4Zp9vORR7ryhbV53tf/5vSKyta2+giMOwXqQ/Q6v/UJqcFRpTbah10Ie3tORLVT0b7
         GM/EesQkkytfutUERyLRIs2z+UWr3NaO2nGq2yAS4SJTpNjEfx8hdH2S9tfwuQpbTYaE
         xMG3Za9ou8O5q3oR/tVutt4OGEpxrxqIBr1cH8HjETs4L0m8ATyAQdfAXIWEKj/4POk8
         XBvR+e9uLnj6f3xjVu3oUPFXU19RlmThtEsq+82i1Pvrdzrt3AP+wX0qXKVP96xGM3kk
         R2iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795054010; x=1795658810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NCO/dWkf50AZTb5CSt4Ge8e/B88cMhBm74UQ+F1PYOU=;
        b=MUQcBVtyUzJRoojUTrNjL9onWir2Px+mfjnx9u5ppxEgtV3YoVXn2MzDdacL8r9Jff
         gqPF/5wAbOw/Y9EW7iRyd/xtMQFgTzjZGeR7ifufm0KHL6WQJFiIEfa4XiS/bUqciqv2
         mVci2TRWXo9JiyXyM4bgGC8FxtoJzIO9pYrk847STndlMI/6jzVh4whOq4NtJGgmX8Pp
         JrIU+OPASOJ6UmNioXJ82x5XY7vfGhrdXXJK9lbMMeEHUGL/urUB/zoDq0wYlxmsPJy2
         iC99SGdpcwrI7F/G2RalchDIbKl4Nz7QKMJNw79WFNyyXSw/z1IpwWLNI17yeKfWdvlZ
         urJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795054010; x=1795658810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCO/dWkf50AZTb5CSt4Ge8e/B88cMhBm74UQ+F1PYOU=;
        b=Yb3KBAg8cwTJ+F8fQe6h0m4Lonec7UvX4BtFq5mCKGwsreEcAIs6r+NvMMqMsiiP3E
         mgjB/G5u1zs0DL8dxGa91RPLkzyVpemnKkkxgTUssb4rZ+ayK3LADbD6Q3by0qzUUmbn
         /mw5sIC76t+/wgRqlFWfgCikpOJW8SRMoe6LPjBPZhSjrHjz+I4/heWiMjLDwjLgiigN
         RZ9mYGWZsZFMhT8B3iDqMi/7cNBo+Q/oO4L+Dqy4/9G4Wr3Cgu170zPb7C72dhgbRy2p
         XWecKMzGpqiBjsUT69nP3URabPVMfPif42BS3aK0MMdbMmhgRhLrzCwCxdNGILK9D0yr
         mfjQ==
X-Forwarded-Encrypted: i=1; AL+hErEPsgcvRMCBGycO5MDgH3gPoIqVuAFZdXHoM+73FQO7F/rBUpetD/5BeEnlAs5EUDRzv+Z6GHxmBm3hyPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i+4+FAH9BRDJDlAaw/P+7ANA+z7eOuS8jH1jq0lwwWcCMeocZ
	88m2ugxTEzxVEeYliWuj/q2b/kfshVLSLwRaNzROKdx6tzd9t4spPFEqmkcsBXS4kQVeiLheTqn
	B9kgRzWKozDfdOzO82tVRAezkhonxvf4=
X-Gm-Gg: AZFdTZejr/VuchfCblZEJHczpi97k7JVw2DbbPBjvk7IUs90eTO3VeGHFa7cx0cG9pD
	QL4bTC9usred66JPOwQFvYEB9VusWbtoS/iTxSJgGjnR5Y+hCkXd43iA8jZ8Xo40PYB87YTSYsi
	Lu/O6CCoHBVX7XV0UYTXBF/c6mzh6u5jQvOfDy/1sQnLEzlSA1VUq3fqSU9Aihkzrhk6aaNfo3F
	g0gGbvp9QWRUYP1MzReOwcj/jAu56HpylzVHa68iTCEWH3dRdnHqPuq0WlJ2PBbRt68LnSDJWXz
	+FEU155ozpLLyrcb8+kyz23ADbIqMPqEq75HAoJGH+d4e8kXH2vLm8NPeYjkA3uukRPW2Xk4JYE
	IUagXKmlqNUyHVkPG371eSHc926s54pbf29nMuxFyu05dtBIPt7oGel4VTq4=
X-Received: by 2002:a05:690c:799:b0:8b4:ef8d:88a9 with SMTP id
 00721157ae682-8b4febd6644mr15765197b3.12.1795054010454; Wed, 18 Nov 2026
 18:06:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101073700.1261966-1-gye976@gmail.com> <179490829262.50223.600134266125251477.b4-ty@b4>
In-Reply-To: <179490829262.50223.600134266125251477.b4-ty@b4>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 19 Nov 2026 11:06:39 +0900
X-Gm-Features: AclHuK95wjyOSL3USWJSLiddXMHlAMqUxucxyJ8PocUeHdqhrsCSx-8gPf2yb_w
Message-ID: <CAKbEzntg_+A6rERcgBmYNwDEz0_Ta6F_N8YGQP1uH1ETNgYiUg@mail.gmail.com>
Subject: Re: [PATCH v2] accel/rocket: Fix drm_mm UAF on close vs in-flight job
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!
(Re-adding the lists)

On Tue, Nov 17, 2026 at 10:05=E2=80=AFPM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
>
>
> On Sun, 01 Nov 2026 16:37:00 +0900, Gyeyoung Baek wrote:
> > The drm_mm and its mutex live in rocket_file_priv, which
> > rocket_postclose() frees on fd close.  But a BO held by an
> > in-flight job is only freed after close, from the drm_sched
> > free_job worker, and its destructor then accesses the already
> > freed drm_mm and mutex.
> >
> >   BUG: KASAN: slab-use-after-free in __mutex_trylock_common+0x90/0x1e8
> >   Workqueue: <NPU>.npu drm_sched_free_job_work [gpu_sched]
> >   Call trace:
> >     __mutex_lock
> >     rocket_gem_bo_free
> >     rocket_job_cleanup
> >     rocket_job_free
> >     drm_sched_free_job_work [gpu_sched]
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] accel/rocket: Fix drm_mm UAF on close vs in-flight job
>       commit: c3fe8795ecd844d0bf76102217bec01cce01b715
>
> Best regards,
> --
> Tomeu Vizoso <tomeu@tomeuvizoso.net>



--
Thanks,
Gyeyoung
