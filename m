Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634233;
	b=wiAZELohk95IO4CgCMLqR/Y9tJfkR7ZRji8cCrjovacVQMHACQC7bGd7FLD65irwWnbk
	 C4A0q+ox+SpZR6Izenmci1M/JVymcp8d3Dhq81j5/ZqDpGpp19UON4EFltQhJoSMW3WKU
	 iQcV0j51EbkbdxyrVatyzCxNspwmRCISx30In3j0z/uWF6ORCFW36aLWWDY99Ruj9LRRr
	 HGFAX/d7CP7BadQhg/b1xIm0kRGPDPFUq9CyzIjbFT5EOAyzoAJBlA+99fq916UHmEjxZ
	 sNkVdmF3JpQb8aubvLlNGpr3n4gnmcSERWLbtbr3J/ZxbBDBzg7Z4Rzrka7IVDNLYNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634233;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=6zdB/rQeLDq3D894FluXdu2Y35sjCX21XfyveRyDSBA=;
	b=J1HZ0Vtbu3+/n4vZZve7qvPHV39p7S3KO6+cR+k5aS+1FkFcf15w9Xxq9tH0seHrQhsc
	 wn3a17ompX8ThL6cLdLJAOHIuO5rXqw6cgn7KANrNyftZ50NfWRXO9pErIqwqn9ptvqEc
	 HkuGqiIgtJSuNLURw2oQKPvfC01QKprolj7DprTTsxUBcrcSLDDJb18MlrLuzNAuWnE94
	 9DaSjdW2TcQa9KmCx3AtdzE0TxnaSojhIsrqrHCK5FeyXSqQrIR3mBHKpZ3R/4AUikfIE
	 g6IJ/1/XSP6J1b/qUeMThWWWSJ4hZTcvK4B8WFP2LNklLr7WbXT2zotS7Ll/0DXdwbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DxoEcY39;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oSCRW3SU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE84606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE84606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DxoEcY39;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oSCRW3SU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795634231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zdB/rQeLDq3D894FluXdu2Y35sjCX21XfyveRyDSBA=;
	b=DxoEcY395e9jYyMMvqxn1Kskt1p6w5ftW8jvN0tZWATYcVoirDINh9Yjs9jy1YJvn0qXjp
	SHkGfKreOSIIows3wMT1gM/Qt8CHzSuUnbR/Sh31hI/Ch+BwHoQwe6Kmj2yjO7y6y1KFI0
	tTHJAweZfazVdpAwqMUJ+ASBRVNcuuU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-HwmnXno9MOSg_vWM3d6q5Q-1; Wed, 25 Nov 2026 19:17:10 +0000
X-MC-Unique: HwmnXno9MOSg_vWM3d6q5Q-1
X-Mimecast-MFC-AGG-ID: HwmnXno9MOSg_vWM3d6q5Q_1795634229
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5be43747161so2790201e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795634228; cv=none;
        d=google.com; s=arc-20260327;
        b=H0AApGLZq26U/EZr6ee3PaJS7xyTL7TT1No0h4QoeuaUM+yKpuTASWhju4+SWIenSj
         W6g+lxd5eVT1SDnGkG3k4jRnXe12KkD+HANsPtSVzvHHackOdNcW5h9+VTXZi85iOCQO
         pggEYK4JGfKFx8vZAp2mFKRyZfA80fxWoP3yAK3p9OB67YOXWVITGEJO3q359DWgP7ES
         fLhzy8FT2iyNck/B3JmkAM9QjiqnaXjYni4qVoS/dHaqZiHIzyKU0XrgCiBzv1A3gT3s
         85AAdjEzHjoLsDLADvK2lU1BuXvU9pHdzHR8IYIZ/WsmCVnMofb8FF4WKAqmrFfbO8ov
         HBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6zdB/rQeLDq3D894FluXdu2Y35sjCX21XfyveRyDSBA=;
        fh=hKO0Ls6vHKfCxvSt0GkyZf1bIDFKvvT30/sov4A0jKQ=;
        b=ol7faf2MICmfLrB24qxTtuDSZ7o5oGRs+W6UhA1A3FDhbQcZi17gvBdQkX9tP+LqBp
         Ak4a2xYVmJSCy900Mx440GtkMrwrdZ/snXCsD4jZE5jvTZcf5RonzFRQqEdhVWNie2kO
         fE7F5rsB5cRmmZsUprV0PvICVaUmLL9SppSdDcaNVI2snh9UNioxkq7WJf3FW+agJBh7
         jdRaaKKkNy4uHPXsL5HS+PAt6w5SvAcLEobSIxh0KaEX+3ItQNwWMzZjRQfUVn9rEEIY
         J2+QgF7XgvY85L1TE1497TmDu3BCrxogrO65KChzepPX4qCU6aEAUa5pKvg3n3s0AR4R
         yqrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795634228; x=1796239028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zdB/rQeLDq3D894FluXdu2Y35sjCX21XfyveRyDSBA=;
        b=oSCRW3SU+XVThO7Kye4978us7jRRSrpkMEnLAof0Eu/KIR8HsDbWGC7moFOGTMpYG2
         5L85JVEV23Sigp5s0SvgyyLSu3DwjfAuFnqNMfdDdKLaZybCo8kfv/csPdMZrByzH3Bz
         wwwcrhGiCjfjcS9NrOLTU/3D8tyQoZx6i9lwXkNjbKmFJu80ySpRuZ2nCaXQtqs8c9hd
         8qXz2CBulleqLTN9KLUBSEgu7Abd5ztlBoshdiJtgxv4uhzrH3teBU51e7c30NOTHY+x
         8m/aSQpt6zz9dnea3TKJokwOCB5eARNBPv+9pr8lrxptqzv5vnpUulKdjyzLH+htzO/7
         rGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634228; x=1796239028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zdB/rQeLDq3D894FluXdu2Y35sjCX21XfyveRyDSBA=;
        b=RSE6l+6jm7ptkvSmpx1gp8lGDm26ZZuMo4DFC18J21IwBFeDyIpTBRy8MxUFcZvEOu
         j58ATvisFZpujZaMDfiASH5kSvjdhSc3FAQtWY+qr1da4M3CtYbGPeEixwrvvRtOkauX
         Pb7witlxVrPLwkXm9NeWM92xkhDZmCmhzf/0Y1/ijvX2Ok1BmvLUJge87l1czsPwRTY4
         RcG0e43GthdQwqh/MIl3eLftHYaWzoLijuNlV8E0rcvnRucjH4PiSA3xKk+7UNap8LIK
         Cj32nHxyt7vMjKWgr5nlW2EMqx2MFwl2P6JYf7IoCPiMf4PnZaMdTeUdZS4VGbY4GiBA
         0nTg==
X-Forwarded-Encrypted: i=1; AL+hErF9dxemPIkE3HluWud8s1U2v1Vywxy6incNGLVto4zcOKIapSKrnA/ZcZY/i7yZdg52AYggsk01S9wfXFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rGx7KRmufUw+E6V+ARvEUxvdtP30eTWDjXcV36r8gpSymMqiu
	exPoXsUPTr5SyJqMKeG8k/4jw3SYi3sbC0yJhCTzrt3o9MVLi88lrwQTMj9qAwzSb58cQtgHFSt
	dRC4/72hGycYC20YWBD4AaOB6dZpOMi2hJHT9VcX9Mar50anyrmWV/VaxgTPzPgtnW6PEHuMvlE
	QILDoQZlBoP89y3YTHM6a2bWRASZZJNstF0KB18+M=
X-Gm-Gg: AZFdTZcl9nqNfZQUfZb1Ucv0xXm9Pp6ffgLZAyRNoZaIQvLIBn9eyXWMsoC5OuhvFrl
	HqppVA0VhG8OaqMGZs5mf9PzhUJ0GIoFn7nIRBg5hfK2/d7XIyhcAiXYiy0d8IEaK5EwmHu20Ke
	zzziOxNFfkoguE0BXR3OmGOYwOLuOTus9ZCMUOe+gRDf0SB0sf/NBs5GnaGCiTjH3016CM+CbIi
	czzYlY1CzJwN4sylnFx6g5q64Nj9CEeyga5EODMosadzW2/PsFruqYe7fUXfZ59ErIZI1LF/CE=
X-Received: by 2002:a05:6512:33ca:b0:5c1:57b6:5ffd with SMTP id 2adb3069b0e04-5c1bc552d9emr6331062e87.0.1795634228572;
        Wed, 25 Nov 2026 11:17:08 -0800 (PST)
X-Received: by 2002:a05:6512:33ca:b0:5c1:57b6:5ffd with SMTP id
 2adb3069b0e04-5c1bc552d9emr6331053e87.0.1795634228074; Wed, 25 Nov 2026
 11:17:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-bug-dm-thin-rcu-gp-v3-0-c80ecc475e1e@linux.dev> <20261119-bug-dm-thin-rcu-gp-v3-2-c80ecc475e1e@linux.dev>
In-Reply-To: <20261119-bug-dm-thin-rcu-gp-v3-2-c80ecc475e1e@linux.dev>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Thu, 26 Nov 2026 03:16:55 +0800
X-Gm-Features: Aa3M54pe6gUnH3xtgi3WUj1GWiGz9BVqRKh8waNkvHN9vH0Lj5E79L-u9RV6F0w
Message-ID: <CALjSBEtdn0PUx0WNsSDojK976JGg66ZqjEmUutuB-XwH1n=q4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dm thin: keep a thin on active_thins until its
 last reference is dropped
To: dm-devel@lists.linux.dev
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, linux-kernel@vger.kernel.org, 
	Qiliang Yuan <qiliang.yuan@linux.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:12=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> get_first_thin() and get_next_thin() let the pool worker process the
> thins on pool->active_thins without holding rcu_read_lock() while it
> does: they take a reference on a thin under the lock, and
> get_next_thin() continues from that thin in a new read-side section.
> thin_dtr() takes the thin off the list, waits for a grace period and
> then for the references still held.
>
> Once thin_dtr() has removed a thin that the worker holds, nothing
> updates its list.next pointer any more. If the thin after it is removed
> and freed before the worker calls get_next_thin(), the walk continues
> from freed memory:
>
>   BUG: KASAN: slab-use-after-free in get_next_thin+0x8b/0x240 [dm_thin_po=
ol]
>   Write of size 4 at addr ff11000116371cc8 by task kworker/u128:0/13
>   Workqueue: dm-thin do_worker [dm_thin_pool]
>   Call Trace:
>    get_next_thin+0x8b/0x240 [dm_thin_pool]
>    process_deferred_bios+0x34/0x650 [dm_thin_pool]
>    do_worker+0x2b7/0x4f0 [dm_thin_pool]
>    process_one_work+0x8ce/0x1850
>    worker_thread+0x639/0x1190
>   Allocated by task 2290:
>    thin_ctr+0x130/0x1260 [dm_thin_pool]
>    dm_table_add_target+0x65f/0xf60 [dm_mod]
>    table_load+0x1c2/0x480 [dm_mod]
>   Freed by task 2391:
>    kfree+0x15d/0x550
>    thin_dtr+0x21c/0x2c0 [dm_thin_pool]
>    dm_table_destroy+0x13c/0x570 [dm_mod]
>    __dm_destroy+0x2eb/0x5d0 [dm_mod]
>    dev_remove+0x2f1/0x3c0 [dm_mod]
>
> Mark the thin as dying in thin_dtr() instead of removing it, and take it
> off the list only after the last reference is dropped, so that removing
> its neighbours keeps its list.next valid. Take references with
> refcount_inc_not_zero() and skip dying thins, so that thin_dtr() only
> waits for the references already taken, and have requeue_bios() and
> error_retry_list_with_code() skip dying thins as they skipped the thins
> already off the list.

The code looks correct to me. These notes are only for the record. The
two checks in thin_tryget() have different roles.

refcount_inc_not_zero() is what makes the patch correct. Once the
count reaches zero, no walker can take the thin again, so
list_del_rcu() is safe after wait_for_completion() returns.

The dying flag is only a hint. As Ben said, it is racy. It keeps the
old behavior of taking the thin off the list early, so thin_dtr()
mostly waits for the references already taken. For the ref-less
readers (requeue_bios() and error_retry_list_with_code()), the dying
check keeps most of them away, but their actual safety comes from the
synchronize_rcu() after list_del_rcu().

> With a test-only 3 s msleep() added to the worker after each thin it
> processes, thins 1 and 2 of a pool with three thins are suspended and
> then removed while the worker holds thin 1. Trials in which KASAN reports
> a slab-use-after-free in get_next_thin():
>
>                  before (trials)   after (trials)   change
>   KASAN report            3 of 3           0 of 5     -100%

Two thins are enough. Suspend both thins, let the worker sleep while
it holds thin 1, and then remove thin 1 and thin 2. When the worker
wakes up, get_next_thin() follows thin 1's stale list.next to the
freed thin 2:

    dmsetup suspend thin_1
    dmsetup suspend thin_2
    # make the worker sleep while it holds thin_1
    dmsetup remove thin_1 &    # thin_dtr() unlinks thin_1, then waits
    dmsetup remove thin_2      # thin_dtr() unlinks and frees thin_2

The suspend step is needed on kernels before v6.19. Before
be4addb1914f ("dm: Fix deadlock when reloading a multipath table"),
thin_postsuspend() always called noflush_work(), which queues a work
item on the ordered pool workqueue and waits for it. Removing an
active device runs the presuspend and postsuspend hooks, so the
removal waited until the worker returned. By then the worker had
dropped thin 1, so the bug did not trigger. A suspended device skips
the hooks on removal and goes straight to thin_dtr().

The walkers in pool_suspend_active_thins() and
pool_resume_active_thins() hit the same bug. To reproduce it there,
put the sleep in those walkers instead. It then runs in the dmsetup
process, not on the pool workqueue, so the suspend step is not needed.

> Fixes: 17181fb7a0c3 ("dm thin: fix a race in thin_dtr")
> Cc: stable@vger.kernel.org
> Reported-by: Benjamin Marzinski <bmarzins@redhat.com>
> Closes: https://lore.kernel.org/r/avz7qDWd2g-uubmL@redhat.com
> Co-developed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

