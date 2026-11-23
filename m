Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436846;
	b=fPKTFb+keYpoEkq7YBJ3innHnx2icGtSG/wAV4Rw4Av0eW2hwvckffYB2z/OhykR5QuZ
	 e9ciF7Ab0y9Bk/72vCagjtVewUjh1cH6XZtbczAXj5n7PUGD+MMlKlahu8m2O7XHQILk0
	 jc9eRzJJOE0/Ln35z32Iw27Ucx1Ad6tn7qzf446v/ffqimMRM4YtF6mISp44UrvP5RDh/
	 Ljsd1nml8r0z44e5nKb+mfpdovMTGUvESbaHMrSMnKDl9WFqRm6GiRhlur+115SEuMt13
	 hfuEpYxfybJoUuHdZvZTBuOFPnvCxcFEccKAn1L6LEeTVr7cqhmhAVWnGEQlmFA4y4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436846;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
	b=R4g2/qDhAfawfF38KzMP0pZF+QYiOOjriXEmZwiTFqc7Q8/Q07u4SP+pxNoTCLWuoSJi
	 qE2RpHiRt+2XIKLEnaAW5BrpCRsb2Vlh7LNrIfnngTnWIUMAtLKe4Ro1dJOyQxRTLn40J
	 pr40cZvTq6OWIP2nPxRNrbj4YIq92AUY0pjDpBl5l+sjSHnmCBSVaDjWuzIPDtBmrf6RH
	 wohF1HHibcegK58Ti1A4bgdMmwb2f6dC3MJFjcVHt8iAS3aswvzwBzYEy+d29EjmkRvam
	 e4mbo5Fr0SWhw/jadNHhN11KyA3yZsvDZxGDisi9r539QGYunxzTfrU55X/ADGWKUgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=austTnm7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a86GKC8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA9606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEA9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=austTnm7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a86GKC8Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795436844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
	b=austTnm7GrXvKGBWWbH7EvCQRT/3bOSu4hhfoJ8Pnc9yCya1+YU0j6JMjuXyAder4h2uOh
	szhZaW/9DV8y1eI0olivAEHPnDLG/tWAgMr297bwBRx1kGOtt5MPFKxZ6wxPF6wjnKPm3W
	8v4G2N2GgOXhQ5LVO0ChNlIe4AvLjuI=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-f_h86UsoOmiUdZ9XNC_J3g-1; Mon, 23 Nov 2026 12:27:22 +0000
X-MC-Unique: f_h86UsoOmiUdZ9XNC_J3g-1
X-Mimecast-MFC-AGG-ID: f_h86UsoOmiUdZ9XNC_J3g_1795436841
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6756044f260so4944443d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436841; cv=none;
        d=google.com; s=arc-20260327;
        b=eucYT/Z5iflWcBHxHnbGdG60sIRardBeTu254qcXfT3eKXs7xq79OGuTtUAHL1ULuT
         icKeb3dTD4YtAwfma+Uqq+YXBE9+4lpM57UHYnoCkZdIA5VDRDvZ/LMS0wFNH5Wmiq8p
         jN2o19fPpfx3phj8IB7asKAbXHnxLiEXF5ithqX+g3RAIDt8ISP5Hp7G4aylqdwmhU2H
         BsAOn+mZgVNHWWL29yIcyBu3CuTZjejOJTb3/wGVMSpW0eAzQOyX1nyLUtHTOau2L8KR
         a+vCfhdGo8B5C8eZz+Mkbcavw5qyL20ZLwGv3mzYhXlEIXlQyW/HU7w00hlTE5Dha0U0
         XhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
        fh=qmKcfK4oYQQgX6tQKBEyu9H+niP/pwkJeu26ZY1+8Ro=;
        b=FChsemYQJR3QAuCASh5iPBR6sXGa5ILLI5SbQJ3qy9TVvaxAeSDYnpjF1msvfpLSfE
         1QFHbft4VSVuJP1ia8CTDpQHeozuWV7BL3lSip8I1SVuRyDxHQR9TU+Wn42YPgMGgQOZ
         aTgVMEexVNHmqD1fpItm3Qrq3q72IgtISl4roTmNofRNpdmNskR2k8WTOjj393SCcL5Q
         A31BonHIKxYagMF/fUfCDAMzRKpFPin5riTmYyGEGlktI+4YeaoS7ObSSXzjM65RVoc2
         qHrpbIxxfr3o8/igLCP98k47W1Hyq57wPcQRHTXlbgYK5FdUrepPwxGSunPSchpXriHj
         tboA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795436841; x=1796041641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
        b=a86GKC8ZxMPKgJZBDZRTlBSk8eqs3NKGyoXvQZNXgJ2QG306KpoonkcXzpIHDWZTaV
         acN/sK2jxtp6cPVd0LtowwY8x53KENScPGFKXPzytnNlXt+RPHUtfllQYvh/+tL7jtHe
         sIuXfl+e4VLHOfmKFycq9kV4LPCofXNpeh5ORhbgfFraEcgHuwain8ZFZwtv/wdEC4iq
         5K1lmjyGW9SCQAD2kGEG424KC7pj898Lt0Fp33UBL1/oS/1OY5FgYrIwd/d3ukH469ZH
         /W0cfPFnw1XjRHf+Bonny1O02OW5XBum2khW1w65Sc8t54Y2pWObcF1r9hiwskMD5jHd
         Kzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436841; x=1796041641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
        b=rR3ImDGlseNA7J8OJTePC0lvooAFY+0B5sKBjfDhHg6aOBL+PSaVTNE4zaOxsVNBN1
         XCkakbiyrf1e5K4vtreqBCWIlYz7e+VFTzCGguvFxfcpo+v1qYUgDoetYssGiAeoa8t0
         CxiAAANSqfbphM9V2GWo5ZU4TO6p4fQlt3IxPpXVS0MXhlqpdmxGjhFDyt1dmu5/3vb/
         GioVz99EfiyGSEbnCKDix2BD5JSUTNbJeQi2G4D7NYNXilOuWPcWI+nJUPbu3RuelIMS
         jBelN8jUevN9MxKjm8BJLXnbd7+YzSYTCTC8shMC/hDlVn9K1XqJO+oB6ZtdnlxbdiH0
         Ybhg==
X-Forwarded-Encrypted: i=1; AL+hErHCrAREhYE2vq4oORlSl50uMjXW4seh+61suP/Dv8f9hqkH3oTm9f3YZRWGYo7IXmNSfqXbQfZp70jnMv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4uR5ZXjsR5ZEVO+STHDPc/FzneXFD8cRpeEM/Ycf6h1+DGxTl
	BvSthswPh7N/3kMtHryaBVbkkF3Bt4Gfy4x5BE8sLkaRszYoEGZDRSlbMnKzCOD1aP7eQANaif+
	W9zmZeaj6ZpsIiP8zPuiMBmtLjLodVOCFL0JaXNWEtmm5dSj/LiVcqQRjCZq4nm7LnBOIgdXKov
	wMgZFJKrxuFvi3C9EAWOYsLPquupf3ef6GQnEUYNqg
X-Gm-Gg: AZFdTZcWYSd+Iv1Sc5HSEgsmnUnuuqIA+5RO/fJ7z1r2siL5QNpX0HzodhNniVkNCMn
	hYtsOH5sb/+AEDJagjnNJqd+UYi8Rk3rEmYRfUYkxPmIeGC3bixExKXD8OD8veRuAvTxv5F4LqR
	F9/g+gIVVxbRCHVh58oYHQoyZ86kgQxhTWII2dUTHC6Mn4kr+ltOL9xysdcbe+f2zQNJHgDrTRZ
	mSYSFnpXcS5EZkt2RUacjC9ULIsBW8cq5lt+6cPlaobZxwPX5M3TlE44YU=
X-Received: by 2002:a05:690e:11c5:b0:67d:a3c2:c95 with SMTP id 956f58d0204a3-67dec2bd130mr4963374d50.3.1795436841518;
        Mon, 23 Nov 2026 04:27:21 -0800 (PST)
X-Received: by 2002:a05:690e:11c5:b0:67d:a3c2:c95 with SMTP id
 956f58d0204a3-67dec2bd130mr4963360d50.3.1795436840812; Mon, 23 Nov 2026
 04:27:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-06-vhost-in-order-log-oob-v1-35efdba8fbab-v1-1-fc1253d60351@pm.me>
In-Reply-To: <20261122-b4-06-vhost-in-order-log-oob-v1-35efdba8fbab-v1-1-fc1253d60351@pm.me>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 23 Nov 2026 13:26:44 +0100
X-Gm-Features: Aa3M54pt5PWY45sVKrMEfHYWn7Rl4h8pw_TEQAIUnc03qW3ChT2fpOFP_O-rkHg
Message-ID: <CAJaqyWdOF3LVF+WHaGw8gimULaCunRkuLnKAhciB7HWpYhnm9w@mail.gmail.com>
Subject: Re: [PATCH] vhost: mask the in-order used-ring log cursor
To: fadouse@pm.me
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Linfeng Sun <linfeng.sun.dev@gmail.com>, Fang Xieyan <fangxy@xiaopeng.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 2:20=E2=80=AFPM YanXin Li via B4 Relay
<devnull+fadouse.pm.me@kernel.org> wrote:
>
> From: YanXin Li <fadouse@pm.me>
>
> vhost_add_used_n_in_order() plays the batch of used-ring writes back a
> second time for dirty logging.  Commit e244725e86be ("vhost: fix used
> ring index wrap in vhost_add_used_n_in_order") masked the index in the
> descriptor-publishing loop.  The dirty-logging loop introduced by
> bfcde6b64769 still uses the single-subtraction form
>
>     next =3D start + nheads[i];
>     if (next >=3D vq->num)
>         next -=3D vq->num;
>
> If the guest refills the available ring while get_rx_bufs() collects
> one mergeable-RX packet, that packet can consume more heads than
> vq->num.

Although I'm ok with the proposed patch as hardening or optimization,
this sounds more like a bug in get_rx_bufs. Where are the memory
addresses for these pieces stored if there are no more buffers in the
virtqueue? Or is it able to loop through the vq?

> get_rx_bufs() permits up to UIO_MAXIOV =3D 1024 descriptor
> chains in one call, so a single subtraction is not enough.  For
> vq->num =3D 32, last_used_idx =3D 0 and nheads[0] =3D 64, next becomes
> 64 - 32 =3D 32, which is still equal to vq->num and out of bounds.  The
> next iteration then logs
>
>     used =3D vq->used->ring + 32;
>     log_used(vq, 4 + 32 * 8, 8);
>
> which starts past the end of the 260-byte ring body (4 + 32 * 8).
> For a used ring placed inside page 7 at guest address 0x7ef8 (so the
> entire 262-byte ring occupies [0x7ef8, 0x7ffe) and
> vq_log_used_access_ok() validates only log_base[0]), log_used()
> marks [0x7ffc, 0x8004) as dirty.  log_write() then sets a bit in
> log_base[1] for page 8, past the single validated byte.  On a
> vhost-net RX queue configured with VIRTIO_F_IN_ORDER,
> VIRTIO_NET_F_MRG_RXBUF,
> VHOST_F_LOG_ALL, VHOST_VRING_F_LOG, vq->num =3D 32, and
> log_guest_addr =3D 0x7ef8, delivering one 8 KiB frame consuming 64
> mergeable buffers followed by one 1-buffer frame in the same
> count =3D 2 flush writes
>
>     log_base[1] =3D 0x01
>
> where log_base[0] =3D 0x80 is the only byte the kernel was entitled to
> touch.  A guest attached to a vhost-net backend with dirty-page
> logging enabled (for example during live migration) and a small RX
> ring can therefore corrupt dirty-log bitmap memory that the VMM owns
> outside the region registered for this ring.
>
> Wrap the logging loop index the same way the first loop does:
>
>     next =3D (start + nheads[i]) & (vq->num - 1);
>
> vhost_vring_set_num() already enforces that vq->num is a nonzero
> power of two, so this is well defined for every accepted ring size.
> The coalescing invariant is preserved: if a run is not flushed,
> next =3D=3D start + 1.  When start =3D=3D vq->num - 1, start + 1 =3D=3D v=
q->num,
> whereas the masked next is always less than vq->num.  The run is
> therefore flushed before the cursor wraps.
> With this change the same vhost-net configuration publishes
> used->idx =3D 65 and confines the dirty log to log_base[0] =3D 0x80,
> leaving log_base[1] =3D 0x00.  The mask keeps next in [0, vq->num) for
> every accepted power-of-two ring size.  As a bounded cross-check of
> the index arithmetic, a Z3 model over ring sizes {1, 2, 4, 8, 16, 32}
> and buffer counts in [1, 64] finds an out-of-range result for the old
> subtraction (vq->num =3D 16, start =3D 15, nheads =3D 17) and none for th=
e
> mask within those bounds.
>
> Runtime verification and fix validation were performed in an x86-64
> QEMU/KVM guest running mainline after v7.4-rc3, with Generic KASAN,
> UBSAN, lockdep, and DEBUG_OBJECTS.
>

Can you post the reproducer? Even better if it is integrated in
tools/virtio/vhost_net_test.c.

Thanks!

> Fixes: bfcde6b64769 ("vhost: fix dirty logging for in-order used ring ent=
ries")
> Cc: stable@vger.kernel.org
> Signed-off-by: YanXin Li <fadouse@pm.me>
> ---
>  drivers/vhost/vhost.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index dc973287567..80b887e1511 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -3206,9 +3206,7 @@ static int vhost_add_used_n_in_order(struct vhost_v=
irtqueue *vq,
>                                 log_start =3D start;
>                         log_count++;
>
> -                       next =3D start + nheads[i];
> -                       if (next >=3D vq->num)
> -                               next -=3D vq->num;
> +                       next =3D (start + nheads[i]) & (vq->num - 1);
>                         if (i + 1 =3D=3D count || next !=3D start + 1) {
>                                 used =3D vq->used->ring + log_start;
>                                 log_used(vq,
>
> ---
> base-commit: c44104f3642da720164042623e4832836aefdd8e
> change-id: 20261122-b4-06-vhost-in-order-log-oob-v1-35efdba8fbab-43734ad1=
0f0a
>
> Best regards,
> --
> YanXin Li <fadouse@pm.me>
>
>
>
