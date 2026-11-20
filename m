Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795201090;
	b=bywcvq4m0QEgyBgXEBldl39N5/xePE1TeugrHMdsWYfKYLseWtC33IzFBB6rocNy0wW7
	 v4xPgFUf/6nkuwGnYcrhihFVzqI6n8SPfh9zMvfVqwO+FMq01VhHWth3nZKW8nmTy14SJ
	 SZDdI5VpuhhqRtXq8WCLU91QynljBhrzEVlpNSB7LtyUMVR/IBckphYDN628+YfMvku2B
	 KEWtoEbOLf4p8SY/tW1M7mtPdbnMn2C+gCPKhpJRTm/flPPT1srn3lzirkoQnbU/iqOHC
	 tdWJRhEQwp4TVeu4+lNQ4mCSu0G9G8R5mCXvPqxOokOotVK5g50QAHc2XKzpvSWtz5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
	b=Wd+o9SnYCGLjglpnUg4tYQO8exMrjxQ6sAdYBCGPupq65FPwI0ZVijHSk0mdLWMWFK7U
	 65GBr8msp/E1qa2dXJV1wRoRa+tcbU+EtMDwEfLBVwE/e4vwgWivtcjHe1KH2EZ67tOuB
	 qT9T0nSiXLMMq7XkECvxtvYH7ZmhTQctnacPPnLFHBP0eN/1Ou1auYK7SJ00v1QyQ1YzS
	 kDh/yVvJzS5SClDM2lYzfE6iaHnS1HOt2eW3PAIaYtGXeQCApkpJ2AHFptlappwmWnbKe
	 Y5yx6Ih3w8KtslXI1CEMO3Z18kyTPWfRp5fGx15zoEBB/Sl+av0LBqZWJBpTGZbHSOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a6Rz3SFw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91860A3807
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A91860A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a6Rz3SFw
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so4735e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795201086; cv=none;
        d=google.com; s=arc-20260327;
        b=GE/tH3ivkVK68+KFq4tTZWuUQIO3s8Nu47xoREPXGjyTi62BYpESsjr3yW4GFyi2sa
         jeYrgETaIN4uA99wIoqs3S0T6KhubZn9zNRtHyXEkExGwlrDoUYo72Xf2sBjNaM1T/Ib
         MbqE3bO+jjsRKmIkQiuFJLLZ2Mreoa1vzJHHpzJpJOJjV3PmdoAXDqourFByFZZWklnx
         dd05z9L6ujANt1ZbKcYFLsmt1Ia0K+8TPZ+wQ90q9ANXUltdj5EkovREVbbc0hFAsI/u
         amDOlfwMI5BIWbCsVLAxuczBynShsZl0PhUDntcwOOdFXMIbYqYD9X/+MyrE1DSK07K0
         rJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
        fh=CI2dVt3DeXpF99BuriN964QmNmeVzI6TbEUEt638X34=;
        b=FhbFSBTWl2x6YmmK1azUgcCx0fxOFuHYpfzoQ7k9N3yar63CwSQ6obOhTDLkcFT055
         wN64EYN9LfAq5PrydIVAC6uufNzgSabhb7MB0xCtRkcIPYKMOlFwH10n9SUAmb0p1lIk
         llqSt+3vymOp9up2BRq6TbGB+sMUFLskN7ZR/0u6jPp6xPmMU11nsYoZ0uaX3zF7i1e9
         oasFkRIGCciEG8JjWnB+VDFR2++met7HNnAQIh2QXp30S3qqt9lcHmj2vYtzg75N2LbR
         iJLa18ySUOrxCI+2RCqkncOnxydOgqS3+F/MIQh69bHgDF9Q3vBDrkVZZ2UtwpWIZ7GP
         Dqsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201086; x=1795805886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
        b=a6Rz3SFwLU/l85Z6gFtgpiNGTLOXe8g79Sw3flJHb7F6ccuFn63e+a/y2x7Px9F7cT
         N9ml4MzoD3m9ZHlntSy6L4+Qj3TO7Dk02QL64xw02D6ED3fvky9if8fI+prvPjlbbFaA
         UfqlFTHfE5hgx3Rd1Vt2wKbRbhOU/LrBYmw5tuJ2dgpH9J7txXgeu8yO9O5RcsttCPZD
         Aci0XPIkCb1+FF9WSxwNVVmVVIt8yqydwS5jeF1zYDK42+NCZ3QFwE78LN4I6KBHYsLg
         I4ur610HDRWXLXhc4cRf0squcxXUFgThZehO06h+wB6GZuORX5eWvsGz9FX+ePDAmBmb
         1AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201086; x=1795805886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
        b=Z5/aWegsy8X+5u7593pAcqejoFh/swYDLYEQLE2dWuztbJI2pI7W5WbGO2/kldgNMY
         P9gYY+iT3sBf6ZPgx5zC61KlZ0WAv5UWXSPA6qHMcfWCZbtFe49+p2kV0H6XXFyy67tB
         RASLz9RndLS7D6e8M/LxQNXksy1Sj4gaEQOb59wXtinULREglYcapeIi9X2BTFplL3oD
         bS/E5V/u18u4qfQ6pHj+DkihgRENj7gtxOha2aMYylUyxs/pN3TM/sYAT+kCChf2zX/9
         s1NYFIIY81JUVgM8mNUyNQSqfuWJuvVQZzuf1qqJY8MfRjEvrJMqq7H2Ov9FiB71LOoJ
         ck/A==
X-Forwarded-Encrypted: i=1; AL+hErFJ1GPkDUBFtT1Fbyw9JHO4YCj272TjMHfvKpA+efLXwMKQrNA6kqdwDK7p3afQ2CPQsjL9ecENdW3xbJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AVts/2ykVTSKPesHkzC7Pnkoe3hofXqgUQerx9o3wWuI3h9QT
	gOmg+VXnnv4Z7c7Kpi0/V5f6HOJfB9qJTN9QI7zqx1VWwZuhPkIgyqT7MvOFOgcMA9FrnhE+jxE
	umqGCf/O/8V7BqwCQyCQgc9YR4vLfwmFlc/IubIsY
X-Gm-Gg: AYBFou1gH+eZ/LoAL6BML+/sYVsZoB5XtUMouVa3rENsXYUuuO45P6rmMkJOlZvhLpi
	EP9JHvl82kACT/Se5HwcD+FoXWOBgpRtSdDg3KAEfVrIpP5X42vbugMzjvAPNq04y1pc0+EJeWW
	rCAgurOOFa2OKrQZHnozH7V0TR4kguq7cYm0oyh/MjpwW5zy4yJFtkn+/VDhBj8XqpVvjZPpwdz
	ACOoJHu+33FIpvAzPS4wm8culo4rsZrmXHACJtcZrBT3E4pDn/mzU67YSceYf44te5CfMs5MbqD
	uUeWWjOYe7v8DpWMyNvzLMSRsp7Fq+9h/oTMm+Bx21Jp3TxAlDfEkfhSvkKSgrMqlhq+ALg2Q0V
	eJIhSGpNjCeUGggphW3KqOrZJiqxi5uEWlE0PG5WI8ck3eJrx2fqehFFdA0ZveqPMo70=
X-Received: by 2002:a7b:c013:0:b0:4a7:1116:2065 with SMTP id
 5b1f17b1804b1-4bb851bd399mr1347485e9.15.1795201085271; Fri, 20 Nov 2026
 10:58:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118220154.2965621-1-shakeel.butt@linux.dev>
In-Reply-To: <20261118220154.2965621-1-shakeel.butt@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Nov 2026 10:57:53 -0800
X-Gm-Features: Aa3M54oeme_MbHCPj8QJ7UbZJ3gKz6ac7ZgfFvJPWhUpehNdFPXUV52bzquf-SQ
Message-ID: <CABdmKX3DUR72jcgaH6zzEO54iFDpbAf8vGzpEi_tXEV+hJ6-mg@mail.gmail.com>
Subject: Re: [PATCH 0/6] kernfs: stop taking kernfs_iattr_rwsem for writing in mkdir/rmdir
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Ian Kent <raven@themaw.net>, 
	Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:02=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> In the Meta fleet, cgroup mkdir and rmdir can stall cgroup operations
> on the whole host.  They hold cgroup_mutex and kernfs_rwsem while they
> wait for kernfs_iattr_rwsem, which every path walk takes for reading,
> and they take it once or twice for every file of the cgroup.  systemd,
> clone3() into a cgroup, BPF queries and the OOM daemon all wait behind
> them.
>
> - Our lock monitor saw a kernfs_rwsem writer blocked on
>   kernfs_iattr_rwsem several thousand times on a large number of hosts
>   in 29 days (in mkdir and rmdir), for up to 1.8 s at a time.
>
> - Under memory and CPU pressure the waits become host-wide stalls.  In
>   one week, we observed several cases where the OOM daemon and the
>   monitoring agent were stuck for up to 22 minutes.  In October, one
>   batch job caused these stalls on a large number of hosts.  On the
>   sampled hosts with current kernels, the cgroup_mutex owner was always
>   waiting for kernfs_iattr_rwsem (in mkdir and rmdir).  One specific
>   stall lasted 90 minutes and ended in a reboot.
>
> The write lock is not needed for most of what it covers:
>
> - kernfs_rwsem already serialises the parent's two counters and
>   KERNFS_REMOVING (patches 3 and 4).
> - The parent's times get a seqlock of their own (patch 5).
> - Only inode setup needs to set a directory's i_nlink, so removal can
>   clear it without the lock (patches 2 and 6).
>
> The lock also kept times and link counts stable while getattr and
> permission copied them into the shared inode.  Patches 1 and 2 make
> getattr report them from the node and stop copying them, so stat()
> cannot return a stale or torn value.
>
> After the series, mkdir and rmdir take no kernfs_iattr_rwsem for
> writing.  Write acquisitions, from lock_stat:
>
>                                           before   after
>   5 dummy netdevs created and removed       1850       0
>   100 cgroup mkdirs and 100 rmdirs          7500       0
>
> Latency in a VM with 8 vCPUs, while 32 threads walk cgroupfs paths
> (worst of three 20 s runs; mkdir and rmdir by a SCHED_FIFO thread):
>
>                          before                  after
>                     p50     p99     max     p50    p99    max
>   cgroup mkdir     2.8ms   9.0ms  20.1ms    25us   37us   84us
>   cgroup rmdir     4.2ms  12.7ms  26.6ms    28us   38us  107us
>
> A write that only needs cgroup_mutex waited up to 23 ms before and up
> to 34 us after.  With 8 threads and no writer, stat() and access() on
> a path whose directories have iattrs are 12-14% faster, since the
> refresh copies less.
>
> Tested with the kernfs selftests on lockdep + KASAN and KCSAN kernels;
> with extra checks of link counts, times and IN_DELETE_SELF; with
> concurrent mkdir/rmdir, setattr, stat, readdir and netdev churn; and
> with test-only delays that force the stale stat(), lost time update,
> backwards time, overwritten setattr and stat()-during-removal races.
> KCSAN reports nothing new, and its set_nlink() reports from the refresh
> are gone.
>
> Based on vfs-7.5.kernfs.  It also applies to v7.4-rc3.
>
> Shakeel Butt (6):
>   kernfs: report times and link count from the node in getattr
>   kernfs: don't copy times and link count into the inode on refresh
>   kernfs: don't take kernfs_iattr_rwsem for the directory counters
>   kernfs: don't take kernfs_iattr_rwsem to publish KERNFS_REMOVING
>   kernfs: update a directory's times without kernfs_iattr_rwsem
>   kernfs: don't take kernfs_iattr_rwsem in __kernfs_remove()
>
>  fs/kernfs/dir.c             |  48 +++++---------
>  fs/kernfs/inode.c           | 125 ++++++++++++++++++++++++++++++------
>  fs/kernfs/kernfs-internal.h |   2 +
>  3 files changed, 124 insertions(+), 51 deletions(-)
>
>
> base-commit: ccf2a4692fed0fa77751d32d2690585127a152c5
> --
> 2.53.1-Meta
>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
for the whole series
