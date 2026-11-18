Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995638;
	b=ZaG2F22AF2R6AfV5E00ne9WBoh/wXbXwsFEqDo4nUmr0TDZJTVGF2m1swRAWCKm7avTL
	 fzDAs6RwEiHEtEM1XNl3SRWPtli4XFZzz20UaAO7CRzpg8wo7duBrKvHNxTt0KkoOL+ns
	 tm2wSCAmNjK9kNE1YRwWtCNxV4GlayuwliaM+EtoHR6KkUiU1tpboegFg/TKhPK1irXPU
	 115xQBmaTrSODXwW3Ov53El+AVRp88S5fvjFh3xx0lb72JryyJM6ha0ZTr5muoWwRnMlp
	 Qa5L0t6C7M+K8q7vAIP8ByKQTNS1nS9ydJKFdSosBVu6QHRrllgsYQxYzxxbllsXmog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jOQdwFFmcdU2t3MoRBuiPs+2TwOTpuyDjeUAWF0EYFA=;
	b=ZIlrSGZD+tuUDrh3lZ69kp6EPnyTZDKVrJ7NdJIwFZ9AwPAHaXip9Q98S1hmedy8pwVr
	 wyImppDVaWTkBncAp8negbBjL4roobsduJGx4rGqejH5pTe8UybKq4ZvtM2RvOrusvrHQ
	 9276Z1AEy78dVSfm8za37b0sabun1Ern3880IL1yaXLUC/nTra18QFkWRaZiMar4dT7gj
	 4KJL8s5aaHcnSHheWHoY0MjkyUrMJrQBCuzWp6bJSEH3uTlndG0suBL6Q5AYX9YKFDtcO
	 1bvSYsdX7eKJWyOb9A5X3Ge0Y4NCyRHO8hqrxvi8g6+CJ77TLaelP+KFI5i1c78HOpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=H2pOIoxq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58834606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58834606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=H2pOIoxq
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1165493a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995636; cv=none;
        d=google.com; s=arc-20260327;
        b=IX1wp9Luvhzb7bX8oA2ecSFsTJjf3TCM5/vItyqQl0nbUb1+YemSPCBYi9ydiqym7M
         PioOD9DSYngr9l/pgZolZjPy+EOG9QRfnUseFureNKZqYm+cY82AYWV8zRSn95JRH/6M
         Rck1TTAT4fVVz6/5VTvB0h7hznS9Q8M1ExNJ9F4DFR9d8Li/TD1pY/OiafR7bbSJsc3i
         4SRg5lPJbgGbOEGchz3eaUMYxTUxQAj/FgNvskv49yQ5IKD+AZU/O5GS4zKaoj+oso04
         wfEdtQw+Uq6UE70YlaCP3ZgLPg3QHXCKpfVfSepuMSAPIVE83e4XvweHaDS6xvM2/0UB
         eVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jOQdwFFmcdU2t3MoRBuiPs+2TwOTpuyDjeUAWF0EYFA=;
        fh=/NnnKwp9ylcXWqW1xBsiJPXAKnn7FVMb++sT66kPRDQ=;
        b=rLgPKQ2d1Kdw3NWQMzkQp10gnTrOGUkiob8MSq8X6mn6DbZlDstOyePSpa0c9HkLoc
         2bj0YvzSejGYGfS/oCosibTbKWZTCBdODjm1GfxuObUKnGCGzZ5kAw1uw4WzPHZqN4N/
         dPYWTVQ3ney3ORx8ajgQUn1I7L0NJbMpcZFQWZ9BXekVFYHUFjPvRFvsZtM3cT4yaIx4
         ulEr34twINFWLk7cMvS5Sy36FjkFyh2xVDNdsc0SZ0hAnh/CFk6lfrI85T5B+FKM2hKe
         6XKeV3bIrIagPzolD6jvDMtmKwXumXtIEp762EyVCqT5vugO9ZNsJYf8qzGTPK+LBBjb
         nvvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794995636; x=1795600436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOQdwFFmcdU2t3MoRBuiPs+2TwOTpuyDjeUAWF0EYFA=;
        b=H2pOIoxqPswoPleCarndVFfGIljsWoTlHBNxVXGE2SKZb2xTWx5+3G/ykUEtwpCO3O
         vqMSD2+Y87PGrZNyJRwoI2EtTmSLLvr5NCNyTOXSOJVTawUSQktUvuBGWAPv6tizhSKp
         loWE4oL59PDgutci1nGhbQTZ20P8Zkq3mpbQ4j2qbvHl/FNlBSr6XX/y61qPy/nyjas9
         IpdQDTaEu1g9jQjCtS6x3VreD9dK8wTfCuxmu31oaiMgq4RGtSwdR5DwECv+ufntCqp9
         Shuc+sKhiuNYREtqQWILWjKJ4KxyJM00VjpR7ECtlrzfWR2cUldtBbosuKwbsVCRJwMH
         yzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995636; x=1795600436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOQdwFFmcdU2t3MoRBuiPs+2TwOTpuyDjeUAWF0EYFA=;
        b=chwYGFbFtJogY8SoTPza1LC3ky60kZ8MgqASLfA2MJ3iHZ9/YWt6Ad0JrPH7irvBps
         EvkGqmpR+3PDGTJ3WimS07XVzv68B4CGw6mfI5mGlJ8Nu62lHKHH/xAin42oCYAylMfv
         S6n2P0uetTMVkTPs6260L8xGrV0jPQdWSlWS92YTCuRLeXV53tb4RSpK9DLQ8DkLc22o
         V2eJ7MWLx9GIui0wxx4pJ5Og+d3QgKsRknPeP0u+2b2I0slqxZtrXp5jLkRrKzXQIzhQ
         w4fEHdycnb7dIn1/DAAL81K5zyx9gzpiheLR+geiYvSf4+e1qpVvWfj3dp7HTgd0i2kK
         6pPA==
X-Forwarded-Encrypted: i=1; AL+hErEQH99BY2xhYbjWB/DdpJgFp+c67l7kk1yyI1fd39rVqp8uWI4Vq01EhNTgKzD2Rjv/kRDtnwprWApf1A0=@vger.kernel.org
X-Gm-Message-State: APuU4Z833cq2h9U6Gwr096W1s/td8re1v0Ovq3druzYe1Rgt3RLL38QO
	5dqhvjCKk9YAW8JBW0TaezaeQpVQDKkI0pJb847pTaxvRH6FkSnNXIFwYQ33ksgX1dYox1BtTi5
	Ia/IgV8Vi0BTK6cTut/Shy53zQGaT/W9tf/z8HZp80Q==
X-Gm-Gg: AYBFou2ffUvFfZ6c+cx2nSlt7F+eUlikSWEDaUjBleqhP5wDZ5TCxMNC9FuojY4SY2Y
	l8a9zaMlrZUQtUrQj2pF/XZcLNBsNxRC1WUaQYGDuKTz9qS8VKe6MaNLAUtAfW4p8bjABWHbjMz
	IpDMktmTdYUztlFeeLLkCvo4A68W69SD37Qr/VVRWwcFPV6S7UPLMhfiy5CvBjHq+C+BYd9HIDd
	D9Z6kgQ2l+ohmKTo5PIwsQtnB3GQtivb/mWDcMai9652kMy7raboFLjLITQbeFni75YTioTYG+f
	KmIAQKwVDN1N0A393GAAEQBiC1Q8PCH36HnWF8xPxnWSC4P/4dxu0jOqR2KJdCqAldAc0b8fPiC
	7Tn5ew+l6WPBJu07rLP8qZYnqBUi1g7FmI8GEB5+THVa1tOg/BwCzfmQSf6CUET/DzZGnFF76/8
	P+MKZn7Y/tRzS6D6NEVHogIu33me2Ib5g4clxjElJxmLsC38o4KV0fqtu4QvsKMVyM38ht1YQiS
	VpjPf0e9en2B2oVhhmQOado
X-Received: by 2002:a05:6402:210d:b0:6b8:6d8e:bf1 with SMTP id
 4fb4d7f45d1cf-6b887f208bbmr1500440a12.25.1794995635626; Wed, 18 Nov 2026
 01:53:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105202939.3104321-1-shuangpeng.kernel@gmail.com>
In-Reply-To: <20261105202939.3104321-1-shuangpeng.kernel@gmail.com>
From: Haris Iqbal <haris.iqbal@cloud.ionos.com>
Date: Wed, 18 Nov 2026 10:53:44 +0100
X-Gm-Features: AclHuK8hhZDh4YS1kG5ohrpKCRFfNpHez4ilI0r2l5cGXVd9OXlKYmFjusqU4og
Message-ID: <CAJpMwyhqnaqHjeF0_3MsEZj1-TG0dG-ksuJrbrOgbSLMPAOo+A@mail.gmail.com>
Subject: Re: [BUG] RDMA/rtrs-clt: KASAN use-after-free in rtrs_clt_query
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: Jack Wang <jinpu.wang@ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:29=E2=80=AFPM Shuangpeng Bai
<shuangpeng.kernel@gmail.com> wrote:
>
> Hi Kernel Maintainers,
>
> I hit the following report while testing current upstream kernel:

Thanks Shuangpeng.
I am looking into this, and will send a patch soon.

>
> KASAN: slab-use-after-free in rtrs_clt_query
>
> on commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d (2026-11-03)
>
> The reproducer triggers this report. It uses the supported RTRS path disc=
onnect
> and RNBD force unmap_device sysfs interfaces.
>
> To help trigger the bug more reliably, we applied a minimal diagnostic pa=
tch
> that only adds delays and print statements.
>
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/5409f0d93ab7414fcb6d97ac799fe28f
>
> For context, I previously reported a related but distinct RTRS client
> use-after-free in the same subsystem:
> Link: https://lore.kernel.org/linux-rdma/20260921033339.1320291-1-shuangp=
eng.kernel@gmail.com/
>
> I'm happy to test debug patches or provide additional information.
>
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in rtrs_clt_query (drivers/infiniband/ulp=
/rtrs/rtrs-clt.c:59 drivers/infiniband/ulp/rtrs/rtrs-clt.c:3140)
> Read of size 4 at addr ffff88810228d2f8 by task kworker/1:0/24
>
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 199=
6), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: rtrs_client_wq rtrs_clt_reconnect_work
> Call Trace:
> <TASK>
> dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> kasan_report (mm/kasan/report.c:595)
> rtrs_clt_query (drivers/infiniband/ulp/rtrs/rtrs-clt.c:59 drivers/infinib=
and/ulp/rtrs/rtrs-clt.c:3140)
> rnbd_clt_link_ev (drivers/block/rnbd/rnbd-clt.c:691 drivers/block/rnbd/rn=
bd-clt.c:731)
> init_path (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2161 drivers/infiniband=
/ulp/rtrs/rtrs-clt.c:2677)
> rtrs_clt_reconnect_work (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2709)
> process_scheduled_works (kernel/workqueue.c:3495 kernel/workqueue.c:3578)
> worker_thread (kernel/workqueue.c:3659)
> kthread (kernel/kthread.c:436)
> ret_from_fork (arch/x86/kernel/process.c:158)
> ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> </TASK>
>
> Allocated by task 306 on cpu 1 at 11.590323s:
> kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
> __kasan_kmalloc (mm/kasan/common.c:409 mm/kasan/common.c:426)
> alloc_path (include/linux/slab.h:991 include/linux/slab.h:1312 drivers/in=
finiband/ulp/rtrs/rtrs-clt.c:1540)
> rtrs_clt_open (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2871)
> rnbd_clt_map_device (drivers/block/rnbd/rnbd-clt.c:1288 drivers/block/rnb=
d/rnbd-clt.c:1571)
> rnbd_clt_map_device_store (drivers/block/rnbd/rnbd-clt-sysfs.c:612)
> kernfs_fop_write_iter (fs/kernfs/file.c:345)
> vfs_write (fs/read_write.c:595 fs/read_write.c:687)
> ksys_write (fs/read_write.c:739)
> do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c=
:84)
> entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>
> Freed by task 306 on cpu 1 at 47.089348s:
> kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
> kasan_save_free_info (mm/kasan/generic.c:584)
> __kasan_slab_free (mm/kasan/common.c:264 mm/kasan/common.c:296)
> kfree (include/linux/kasan.h:235 mm/slub.c:2780 mm/slub.c:6630 mm/slub.c:=
6923)
> kobject_put (lib/kobject.c:689 lib/kobject.c:720 include/linux/kref.h:65 =
lib/kobject.c:737)
> rtrs_clt_close (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2940)
> free_sess (drivers/block/rnbd/rnbd-clt.c:770 drivers/block/rnbd/rnbd-clt.=
c:786)
> rnbd_clt_put_dev (drivers/block/rnbd/rnbd-clt.c:49 drivers/block/rnbd/rnb=
d-clt.c:62)
> rnbd_clt_unmap_device (drivers/block/rnbd/rnbd-clt.c:1723)
> rnbd_clt_unmap_dev_store (drivers/block/rnbd/rnbd-clt-sysfs.c:334)
> kernfs_fop_write_iter (fs/kernfs/file.c:345)
> vfs_write (fs/read_write.c:595 fs/read_write.c:687)
> ksys_write (fs/read_write.c:739)
> do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c=
:84)
> entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>
> Last potentially related work creation:
> kasan_save_stack (mm/kasan/common.c:57)
> kasan_record_aux_stack (mm/kasan/generic.c:556)
> insert_work (kernel/workqueue.c:2356)
> __queue_work (kernel/workqueue.c:2546)
> queue_work_on (kernel/workqueue.c:2599)
> rtrs_clt_close_conns (include/linux/workqueue.h:700 drivers/infiniband/ul=
p/rtrs/rtrs-clt.c:1963)
> rtrs_clt_disconnect_store (drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c:2=
59)
> kernfs_fop_write_iter (fs/kernfs/file.c:345)
> vfs_write (fs/read_write.c:595 fs/read_write.c:687)
> ksys_write (fs/read_write.c:739)
> do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c=
:84)
> entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>
> The buggy address belongs to the object at ffff88810228d000
> which belongs to the cache kmalloc-2k of size 2048
> The buggy address is located 760 bytes inside of
> freed 2048-byte region [ffff88810228d000, ffff88810228d800)
>
> Best,
> Shuangpeng



--=20

Regards
-Haris
