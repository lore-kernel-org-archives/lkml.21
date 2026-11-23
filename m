Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448906;
	b=aAoKz/L1MsdLWhJS6Jx+fExa3Z6tt4AeqoQIKZCQxUIyujfj9x2YmsV2qEUj+wj57cLX
	 Eb6mTyCnAybaf4v2l9wR0OWtq3HS9cibGofeSAgsdjm6OxcuUp3SiII+gBUA2Q/FOm91T
	 7tFb8vmEaA0e0MiT52KjWmhiYp0RHex1JnryXvtA6p/WuNdVuKbiVtXk1ZL4po7Mk/TA2
	 OeYXY/1tAkTAMAzVn2rre53PyoGgTDDB/GDJo/Tg2flB1t09IXmEfHGoCkFbakh+Vj1QU
	 PooAeHbcnb15vUwZxQss66yifpm/b64S6n0NZrmlHrLHXTYXRE7+FF1Z8lYSSOmzyNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448906;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=OWmsxzAWhp8YogqWe/sWTbGuQ3w1HS7FA6g8w4z3/dM=;
	b=iefOmOJiQe4ZiHTqlhlTcCUFvqea5gkWUIm81c3HVxFW4i5qXTVGtQV6hKg/EJ4TS2Lt
	 xY9nVoBEqXTPMD3tICVmkP6WTXH3yeokB2Jl2nJBMxu6/aNNQbUzvhrmlMqd/61Bb2GFD
	 LqzwqARTZpWV06Klw54YoXuoLlv97bzkqjPRy/C3sOSsOjLS4lgkYZ97rYTOg0N1pRfmv
	 2bBVgN4MUwgmoM0uVSPTLJAoEIcGP9dFZ8Lv/Cfh7G3XUpRRGan/P4dn5umySnS88WuwO
	 4pdMkAyw3i0zbN1joSbHL+mmfjQRySFg8g/7WILkTehzyEhfvqCZlRlCeGWl7SX7ViA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mbt1JdmK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JLh66vfR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E8606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mbt1JdmK;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JLh66vfR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795448904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWmsxzAWhp8YogqWe/sWTbGuQ3w1HS7FA6g8w4z3/dM=;
	b=Mbt1JdmK1AyJOIbMwV/jO1KHp57Acl/HXHw2EDf6MzsCI5jR3Q8dutqkzgLDV/gGyRssaK
	venGwI/P/vth4U2CPdp7M5JL5jAQQ/4K0uad5rDa0I5wUF1A83VSbWviwphHFslZPSE25J
	2MQSh5pTPOAgaSWGdwT8OGKgmw7adUc=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-Zqiwt-BsNF2ShNoInGJ8_Q-1; Mon, 23 Nov 2026 15:48:22 +0000
X-MC-Unique: Zqiwt-BsNF2ShNoInGJ8_Q-1
X-Mimecast-MFC-AGG-ID: Zqiwt-BsNF2ShNoInGJ8_Q_1795448902
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dcb5f084cso6138801d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448902; cv=none;
        d=google.com; s=arc-20260327;
        b=U0R7dokg9osA4vajlmJ7TwMo6CNHbpwvkOUbDdxilWbZzAKMruoqsItEKhS0W+2Ayv
         UXeY92nzZkuickN/VgIhAd+6dbaYEIbH3PnM+FxIw0Ozi7WCREklyz/v8KLdf6pYLxSW
         A5vPRd8swNuQu3kMY41G8VLKZZcpfVl1GuS1oEKpEec+vIm8S9LG7ml2LlFH4K+vw24f
         cYWJ4KuzvqB5C9EWDmVpu0iDm4SJWaiuXOoM+H83FdlmM8GpXkLDjDaQEQLjlwm3tVMs
         s3qNaZal3QhHAgWpigiEY26gU/9svF3r+sUWzJJLxCEtNLgZo1olDf2+eAWWRyFW3lUG
         yvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWmsxzAWhp8YogqWe/sWTbGuQ3w1HS7FA6g8w4z3/dM=;
        fh=+zUkIdCLP1Q7WppREDFO7Fcp8fnzOreeWP2DNtboXeQ=;
        b=omlNvE3V5DoLJAtBze60YepJGsO6HOkvwqBE3376QfsAxTOKiqBPhcL1twRJ6y4nw/
         9wL3S6KLEgh3Mo7gCMe3nz5ognMQTHIgpbgXHbugFYAi6fbZrMxZxdf1gqSIx4Q96QYV
         CFPuQiQcWBZ0EgXSUM2aezhdp/3SgI2+C+AalDxG9hmW8bK3tOxIePKZfc4WtPnR3Ex2
         0bIeq12gGxOANc6eoOXL5mKrZ1eYJDKzD/rbFkupIeXoGGpJzMLORV7FpHm/gUauz3tx
         CJQj/dvhb2X75hMmlrDj6wNDe9Ru+S3zsRyQo/rlqPlHErT8YANdECeVQcIgL1oSuc6X
         H9WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795448902; x=1796053702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWmsxzAWhp8YogqWe/sWTbGuQ3w1HS7FA6g8w4z3/dM=;
        b=JLh66vfRg7qYDbK+G9m/GEZdNqr54zgMc0tieYm+p8HLGTbqsAW0uS/dYxIDFd+7+T
         aSzO+97apFk8RqlGR1kBf5nI6U9omtbCbjh24TWJMK+HrzClkmKENQm6wZ4+tW+pNVTb
         McvdUb+0uy6Yke+vRXcaYkWbYhhSdj8QipIrW44Uthdgpa+nwjOuE5CZFdLprBGWdC2Z
         eoYsFM+4E4/BbQQyj/PEJrW8gBPUDV9l+TrVIVRYDQG1GrKlUyqzGzFpM/N6xy7SXG10
         guusQxamxBzd+O63oGh1Y6bzYlf6GWG/FhQqH9Dq3l+EoxXyPwGu31TqJHZNBWtu8AGr
         13dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448902; x=1796053702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWmsxzAWhp8YogqWe/sWTbGuQ3w1HS7FA6g8w4z3/dM=;
        b=YqKDJqsw//in2gjh1+HcR6o13FibT5A7pwSivfUDRmpWgRQpxevLoTFTqn1Ze+v2Wl
         KL1nn+rDVjwDvCltPainnCGaHpAtGPne9VEh1TbDbYebUfNkBS75K1w50G8E9MYUh8ad
         PagYyEmBdHmHDzfGerPzsWiIwlM42I2/FGIHKe37fiS3tOLxqA0LFuzYqTqr2e0BT68c
         q9ShpSotcvlXynRVU8m49sJxkIOXT1fH1Lt8A1qPonzpXN+tnHx90a4NXxJXgc2IyiAZ
         Gi7yDumt2wHwvptJ391z5tjBttLKmJ61eW6Ms8cp02AeeYSjsoacWmdCbyMPgbUx3Hmm
         8vjw==
X-Forwarded-Encrypted: i=1; AL+hErElSqW3DT+l+f8JDKgwyLWOFTjs3hDYYh0uaXBotawaBXMh6GCE0iDSCChv07E47WJaiN1I76CM9WSkSOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UpBf5C95rAnDKA1UXaQfqWhVi2SDYpA0jGKiqkj3BAvJCzNAL
	mQbj/r7gBDcUkcHXImVOCYPAoeKpm31mvKaUyvtwNzknfz2Z393uCkTJjpsPsTYAmXBXogfLPs/
	jwbigcI5CuSWyU0mG6/0ikJhnaeslejm6EZHSw84JY8A/7PequJVQSD0axLVzLkYoYxmENW+7CM
	ImrJpTbnXQIVSU/kXgxBwJxaAVa+gBpgTOVQBviGDf
X-Gm-Gg: AZFdTZfIQTFem3q7HILjjwSMmi8OyjSBSbCnUbkI/IgmxkZTS6haxPkWk6OtEMKfv5R
	UJ5397uX9w3uNfaqU/LoA4laDL4BuVfwQkXamHnRxM3ZawWZ1uaIkuHYZcl4QHPH+e6FujK05fz
	z5jbf3pYgDVxVmWeaXlCB3yfBubHLaabPNjBquG+0SV4cfEeVIc1y/4RW8hgnvqMCbz9OWN3Pl5
	n9GgQY2rFhnggX1kHlc/MwDEHqEa9EB8+R6M+dVBojnqnq3S2jm6Gjah6k=
X-Received: by 2002:a05:690e:150e:b0:677:b670:bc2 with SMTP id 956f58d0204a3-67df4497b11mr3158233d50.131.1795448901293;
        Mon, 23 Nov 2026 07:48:21 -0800 (PST)
X-Received: by 2002:a05:690e:150e:b0:677:b670:bc2 with SMTP id
 956f58d0204a3-67df4497b11mr3158224d50.131.1795448900838; Mon, 23 Nov 2026
 07:48:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135646.3962652-2-dtatulea@nvidia.com> <20261123135646.3962652-5-dtatulea@nvidia.com>
In-Reply-To: <20261123135646.3962652-5-dtatulea@nvidia.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 23 Nov 2026 16:47:44 +0100
X-Gm-Features: Aa3M54o4ueCnunOOjRD8BYS6eetZBocpj0aR00-pSGaCcCscH__3XBFasy8mITE
Message-ID: <CAJaqyWeVfFBohQ+x1_MCmNCt0FgvepgKV+H_u4GqR+GLCqf6Mw@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa/mlx5: Don't flush the workqueue under reslock
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gal Pressman <gal@nvidia.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:00=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> The control VQ work (mlx5_cvq_kick_handler()) runs on mvdev->wq and
> takes reslock. Device reset and the error path of .set_status take
> reslock and then call unregister_link_notifier() which flushes the same
> workqueue. A deadlock occurs if a CVQ kick arrives just before the reset
> for the CVQ work.
>
> Lockdep caught this when QEMU quits (pkill qemu) and closes the
> vhost-vdpa device:
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>  WARNING: possible circular locking dependency detected
>  ------------------------------------------------------
>  qemu-system-x86/5785 is trying to acquire lock:
>  ff110001cd292940 ((wq_completion)mlx5_vdpa_wq){+.+.}-{0:0}, at: touch_wq=
_lockdep_map+0x7a/0x180
>
>  but task is already holding lock:
>  ff11000136eb4928 (&ndev->reslock){+.+.}-{4:4}, at: mlx5_vdpa_compat_rese=
t+0xed/0x760 [mlx5_vdpa]
>
>  which lock already depends on the new lock.
>
>  the existing dependency chain (in reverse order) is:
>
>  -> #2 (&ndev->reslock){+.+.}-{4:4}:
>         lock_acquire+0x126/0x330
>         down_write+0x87/0x1d0
>         mlx5_cvq_kick_handler+0xb1/0x1180 [mlx5_vdpa]
>         process_one_work+0x8df/0x1660
>         worker_thread+0x62c/0x1030
>         kthread+0x377/0x490
>         ret_from_fork+0x4d7/0x720
>         ret_from_fork_asm+0x11/0x20
>
>  -> #1 ((work_completion)(&ndev->cvq_ent.work)){+.+.}-{0:0}:
>         lock_acquire+0x126/0x330
>         process_one_work+0x874/0x1660
>         worker_thread+0x62c/0x1030
>         kthread+0x377/0x490
>         ret_from_fork+0x4d7/0x720
>         ret_from_fork_asm+0x11/0x20
>
>  -> #0 ((wq_completion)mlx5_vdpa_wq){+.+.}-{0:0}:
>         check_prev_add+0xe8/0xdb0
>         __lock_acquire+0x1801/0x23e0
>         lock_acquire+0x126/0x330
>         touch_wq_lockdep_map+0x93/0x180
>         __flush_workqueue+0xed/0x1090
>         unregister_link_notifier+0x10c/0x170 [mlx5_vdpa]
>         mlx5_vdpa_compat_reset+0xfe/0x760 [mlx5_vdpa]
>         mlx5_vdpa_reset+0x15/0x30 [mlx5_vdpa]
>         _compat_vdpa_reset+0x29b/0x3b0 [vhost_vdpa]
>         vhost_vdpa_release+0x16f/0x380 [vhost_vdpa]
>         __fput+0x36a/0xaa0
>         task_work_run+0x111/0x1f0
>         do_exit+0x7ba/0x2590
>         do_group_exit+0xb8/0x250
>         get_signal+0x1f46/0x2020
>         arch_do_signal_or_restart+0x79/0x4a0
>         exit_to_user_mode_loop+0xbe/0x450
>         do_syscall_64+0x257/0x4f0
>         entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
>  other info that might help us debug this:
>
>  Chain exists of:
>    (wq_completion)mlx5_vdpa_wq --> (work_completion)(&ndev->cvq_ent.work)=
 --> &ndev->reslock
>
>   Possible unsafe locking scenario:
>
>         CPU0                    CPU1
>         ----                    ----
>    lock(&ndev->reslock);
>                                 lock((work_completion)(&ndev->cvq_ent.wor=
k));
>                                 lock(&ndev->reslock);
>    lock((wq_completion)mlx5_vdpa_wq);
>
>   *** DEADLOCK ***
>
>  locks held by qemu-system-x86/5785: 3, last CPU#9:
>   #0: ff1100021d7c2068 (&dev->mutex#3){+.+.}-{4:4}, at: vhost_vdpa_releas=
e+0x4b/0x380 [vhost_vdpa]
>   #1: ff11000136eb44c8 (&vdev->cf_lock){++++}-{4:4}, at: _compat_vdpa_res=
et+0x16b/0x3b0 [vhost_vdpa]
>   #2: ff11000136eb4928 (&ndev->reslock){+.+.}-{4:4}, at: mlx5_vdpa_compat=
_reset+0xed/0x760 [mlx5_vdpa]
>
> vhost_vdpa_release() resets the device before stopping the kick
> handlers, so CVQ kicks can still be queued while the reset runs.
>
> The fix is to move unregister_link_notifier() calls outside of
> reslock. The function doesn't need the reslock.
>
> Fixes: c384c2401eed ("vdpa/mlx5: Avoid losing link state updates")
> Cc: stable@vger.kernel.org

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/ml=
x5_vnet.c
> index f1c5f72032a3..a175f734517d 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -2908,6 +2908,8 @@ static void unregister_link_notifier(struct mlx5_vd=
pa_net *ndev)
>
>         ndev->nb_registered =3D false;
>         mlx5_notifier_unregister(ndev->mvdev.mdev, &ndev->nb);
> +       /* mlx5_cvq_kick_handler() work needs the reslock. */
> +       lockdep_assert_not_held(&ndev->reslock);
>         if (ndev->mvdev.wq)
>                 flush_workqueue(ndev->mvdev.wq);
>  }
> @@ -3215,6 +3217,7 @@ static void mlx5_vdpa_set_status(struct vdpa_device=
 *vdev, u8 status)
>  {
>         struct mlx5_vdpa_dev *mvdev =3D to_mvdev(vdev);
>         struct mlx5_vdpa_net *ndev =3D to_mlx5_vdpa_ndev(mvdev);
> +       bool unregister_nb =3D false;
>         int err;
>
>         print_status(mvdev, status, true);
> @@ -3257,12 +3260,14 @@ static void mlx5_vdpa_set_status(struct vdpa_devi=
ce *vdev, u8 status)
>         return;
>
>  err_driver:
> -       unregister_link_notifier(ndev);
> +       unregister_nb =3D true;
>  err_setup:
>         mlx5_vdpa_clean_mrs(&ndev->mvdev);
>         ndev->mvdev.status |=3D VIRTIO_CONFIG_S_FAILED;
>  err_clear:
>         up_write(&ndev->reslock);
> +       if (unregister_nb)
> +               unregister_link_notifier(ndev);
>  }
>
>  static void init_group_to_asid_map(struct mlx5_vdpa_dev *mvdev)
> @@ -3301,9 +3306,9 @@ static int mlx5_vdpa_compat_reset(struct vdpa_devic=
e *vdev, u32 flags)
>
>         print_status(mvdev, 0, true);
>         mlx5_vdpa_info(mvdev, "performing device reset\n");
> +       unregister_link_notifier(ndev);
>
>         down_write(&ndev->reslock);
> -       unregister_link_notifier(ndev);
>         vq_reset =3D needs_vqs_reset(mvdev);
>         if (vq_reset) {
>                 teardown_vq_resources(ndev);
> --
> 2.54.0
>

