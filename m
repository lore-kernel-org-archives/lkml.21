Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206652;
	b=pNKS6a4spppRP3WXVE7XnGRE5yHXZpcjKP3Ih2K9qjNMshcWsO4CPpCdxHw4x0dyEWi5
	 kctjCsb1AhRNpdZ2CoLGGaBQCdzJGkqsgIpiRMVJ6dDwnbrRle+gLx4W7+6WaF0CJhIbw
	 vHbiW/aunKibDrR7RxmLuINrdl5re8n0WnoT1gLYr0V3nBkAb4xpdm5LfBeiEaxGsiO07
	 QXXLmZlpFMaTnqVJvdA/oIdQK2AQ1nMRU5d31DYd4bvHnonc/o4U2acx5EQTXGsnNW+pM
	 V/h3qO6YUUZcdUJT7PcGW/Onw46+CjSrCzNReDus5SmFHt/CeBrwcCVUg4PNdWoggcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206652;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
	b=leuFkXlOpJU6APkDPaN1yxJktw0bH+gp12lFEqu8QZ4k/6sWFhpoMpJrAyAZsTvvPAme
	 En5MABoqExBJ2cGOlYVuT+K56ByKFnkG9tE5hAuoYJe7Lr6Msb8OhBAG3bs+FtEpoJLgu
	 C6kmGPlcWKHFTLuMnB4FJwR9VUtWtRonFf8AS5isy+UK3nxTR7ZgIpJIccODi1LD4ODfu
	 msXnI8kQ4c4/syAVEeNtFs7BOoUBvHWkv2xxM5YEFS82UF05yosKvNIoQJkz6JXTsbsH8
	 Nz3osLyepZLqERZ9AiaEShZ3evrPZ0FLt9C81wekZEA23IPIRM5cl1POs2QcJPW3u4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eeuEyrsj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=chYm9dX0;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DBF606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DBF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eeuEyrsj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=chYm9dX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795206649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
	b=eeuEyrsjLc3qUPt/PpNNwm7D5rjcpJugBUoSrHBb/RpxpsZhVI82e4CcLH5V0MnXU243qE
	gC8Lfjy2RpH6Oq/JivVJyyBilAGvHH7jOSsErioS6i6d4m6ZXiHgUzjxXUhegUdAiZWMDx
	P2FCc/cpqyYhQKx/+6jD1LG7k0sKGdY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-C27n4gChNrq9LQDDdRqJZA-1; Fri, 20 Nov 2026 20:30:44 +0000
X-MC-Unique: C27n4gChNrq9LQDDdRqJZA-1
X-Mimecast-MFC-AGG-ID: C27n4gChNrq9LQDDdRqJZA_1795206644
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-544019b1831so26373451cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795206644; x=1795811444; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
        b=chYm9dX0imvp5wyvcD+7Wpp9IlRMQOQL8ap3FSU+/lXL3pkXj6h679Zxctl538ZiuJ
         adUJgJmOWB+c0kYKEloVVdjVhLaGuR4LhYL/mD+itLGZ8PvsAR4QcY5KZLFmJ30ULqJA
         alls5klSlmTSUVXjf+fAtSDr20X+5A4Apn5Uc8Vbbkn37+5qaDpBzWrZUBiY9Myb2qri
         0yIWeM5eWHDyZtqOY8Vh/lJf/tZcCEoTdwbRZuAXNo6ymJ2jb8wtA1oev7+v2q/Tqnn4
         1oWwVxKIUYn/81Rsat/syD3mYCwS53FRTaLNpwA1L4R6k0WOV/t7UFoirTed9oo4VKkb
         sq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206644; x=1795811444;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mx8lv7UCTvTnaJ2WerqoFZH52wwM+hfy6gTfkRrFF10=;
        b=WSqRA7i3KmotrwsbnD05Sc60g6lpNxEfzgQ2JBmiPlgYmK2gYJ5QEyfFge9cWtrIyC
         q2zg+FoXHhRDWQJiUt4MJlFUX2s5Jp98vx81siY9R6kKZxa2JgOjChgiSjEzArNeQctC
         diWCy2NYLHF0uThsca2Gf5Cr6fDC0iSu21Y1U8VmO20aRpH1uiKqfyUIIKTyfsDiW6+L
         IstBM4AxK+l0T0oM8QZ0QlBV0UyruXSgYuQOlNYk56FYTPoMgC0GfxZrc8DEh9swkbVN
         oojG351RCmHzoQqOpXcQ5HXVsincCIN5NHyc8AWT6c1FgxFpGvfCklrbaA9Hol/2Pd55
         dyMA==
X-Forwarded-Encrypted: i=1; AL+hErHipb/qgaqiRKXDPv2Ib6zF2UzPQ5PBhvW6DfcNE3ISu1JFQx+kb9uP4zrVzpcLc1NZ47bSPjf0W7jo/n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a9RvdMDsGP9y2CuFFkeLhYdTh5pdR4JviEON8R5/aXf7bokOp
	mYbhiIrkaFz3fUssC5JTr10HM8p8VNYbOUKcX9tGL2v9jaw79DqZTjvGsmCu2DhHY2Qy+QucIHQ
	+jAbFGTl20zsWdukylIfg3gIlSnaSpy1oLL0rRaUg07Sl6LKSNMc68ETcbColB7SPzg==
X-Gm-Gg: AYBFou1tWorx8gD4/ZNSr3NYEGJa8eoBN2FFvHLeZa1dnxLtO+0i1BTmzJS44LpiDIR
	LAdBiTqtlAKbql5KsX+eI3HpOa9BAT2bSMzv80sMP/X9xd5RbAlxzYq/rpbVBwx9q/VzIIM5//p
	cwXtlCs/eL0AA4KymxmqRzVEfuXB4y8hOVxsCCt09GMOOUdJfOdwydT/SWDVEKBrSL2FsgyweDr
	SnHoLUfi9YOqfpxMHDfsn9NKk3TgbXDU111xvICdTmMvD+IF7Xp/VHlbTBggcL0FHcKu5WG5fy8
	O8oQ7jk0OxO6FADgCAY00i3gIkveLAMGkJMIkZcVv+fg/h1fmnv0FYm5rrA5MF4SAf4w8d7KrLE
	qIDyi2T28JL2W/exaPfSnrx3PYrJK8I/LjdoVyuGuEF6BOtzXu2hG03tO8IeCy9EjKNndQo1TNJ
	csbDcILgHYVU8qSwLqZB8Kpmq+X0FbSrzjNVFTQwbEjR0JkmNp4goWIjpkdDDanLzhGwCXplI=
X-Received: by 2002:a05:622a:4d93:b0:55d:2e93:ffad with SMTP id d75a77b69052e-55d76ac5898mr77806291cf.37.1795206644057;
        Fri, 20 Nov 2026 12:30:44 -0800 (PST)
X-Received: by 2002:a05:622a:4d93:b0:55d:2e93:ffad with SMTP id d75a77b69052e-55d76ac5898mr77805261cf.37.1795206643352;
        Fri, 20 Nov 2026 12:30:43 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm34804246d6.1.2026.11.20.12.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:30:42 -0800 (PST)
Message-ID: <4569fb5f7f3d7c65263d4154d7cc3350d9cf8330.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] scsi: mpi3mr: Fix error return, start_time, and
 timeout check in mpi3mr_bring_ioc_ready()
From: Laurence Oberman <loberman@redhat.com>
To: Ian Rogers <irogers@google.com>, Sathya Prakash Veerichetty	
 <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
 Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <mkp@kernel.org>
Cc: mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Elkin Cruz
 <elkin@google.com>
Date: Fri, 20 Nov 2026 15:30:41 -0500
In-Reply-To: <20261120190031.1587531-1-irogers@google.com>
References: <20261120190031.1587531-1-irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-20 at 11:00 -0800, Ian Rogers wrote:
> Split the mpi3mr_bring_ioc_ready() error-handling and retry fixes
> into
> three independent patches with individual Fixes: tags as requested by
> Laurence Oberman:
>=20
> 1. Return -1 instead of 0 on failure exits in
> mpi3mr_bring_ioc_ready()
> =C2=A0=C2=A0 when retval is 0 (such as unrecoverable controller faults, h=
ot-
> unplug
> =C2=A0=C2=A0 during reset/diag-save waits, or ready-state faults and time=
outs
> =C2=A0=C2=A0 after mpi3mr_setup_admin_qpair() sets retval =3D 0).
> 2. Initialize start_time =3D jiffies on entry and guard the post-enable
> =C2=A0=C2=A0 timestamp reset with a boolean flag so pre-enable failures a=
nd
> =C2=A0=C2=A0 subsequent retries never read an uninitialized start_time.
> 3. Rewrite 'elapsed_time_sec < (mrioc->ready_timeout - 60)' as
> =C2=A0=C2=A0 'elapsed_time_sec + 60 < mrioc->ready_timeout' to avoid 32-b=
it
> =C2=A0=C2=A0 unsigned underflow if a controller reports ready_timeout < 6=
0.
>=20
> v2:
> =C2=A0 - Split v1 into three patches, each with its own Fixes: tag
> (Laurence
> =C2=A0=C2=A0=C2=A0 Oberman).
> =C2=A0 - Move 'if (!retval) retval =3D -1;' to 'out_device_not_present:' =
in
> =C2=A0=C2=A0=C2=A0 patch 1 so a single hunk covers both out_failed fallth=
roughs and
> =C2=A0=C2=A0=C2=A0 early out_device_not_present jumps cleanly for stable =
backports.
> =C2=A0 - Add Laurence's Reviewed-by tag on patches 1 and 2, and note the
> =C2=A0=C2=A0=C2=A0 510s (570s - 60s) firmware timeout math from commit 96=
34bb07083c
> in
> =C2=A0=C2=A0=C2=A0 patch 3.
>=20
> v1:
> https://lore.kernel.org/r/20261119170900.1530138-1-irogers@google.com
>=20
> Ian Rogers (3):
> =C2=A0 scsi: mpi3mr: Return error on all failure exits in
> =C2=A0=C2=A0=C2=A0 mpi3mr_bring_ioc_ready()
> =C2=A0 scsi: mpi3mr: Initialize start_time on all paths in
> =C2=A0=C2=A0=C2=A0 mpi3mr_bring_ioc_ready()
> =C2=A0 scsi: mpi3mr: Avoid ready_timeout underflow in
> =C2=A0=C2=A0=C2=A0 mpi3mr_bring_ioc_ready()
>=20
> =C2=A0drivers/scsi/mpi3mr/mpi3mr_fw.c | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)

Hello Ian

Thanks for the quick v2. Tested the series on 7.4.0-rc1 with a
Broadcom SAS40xx/41xx (FW 8.5.1.0.0.1), two SAS disks attached.

Firmware advertises "ready timeout: 510 seconds" (ioc_info
0xff000000), before and after the series.

Tests, all with mpi3mr_bring_ioc_ready() reaching ready on the first
attempt and no "retrying to bring IOC ready" or "failed to bring"
messages:

 - boot probe
 - modprobe -r / modprobe (mpi3mr_init_ioc path)
 - sg_reset -H under fio 4k randread QD32 (mpi3mr_reinit_ioc path);
   host reset completed in ~45s including diag save and port enable,
   fio completed with no errors
 - PCI remove/rescan of the controller
 - 20 iterations of reload + host reset under fio: 40 successful
   ready transitions, no retries, no failures, no fio errors

The failure paths themselves were not exercised, as they are hard to
trigger on healthy hardware; this confirms no regression on the good
path.

Minor, 3/3 changelog: the IOC info timeout field is 8 bits in 2s
units, so ready_timeout tops out at 510s and the retry window at 450s;
the "510 seconds" in 9634bb07083c most likely refers to the maximum
ready timeout rather than the retry cap, so 570s cannot be advertised.
Doesn't affect the code change. Martin may be able to fix it up on
apply.

The question to Broadcom on firmware advertising ready_timeout < 60
is still open for 3/3; on this controller it makes no difference.

For the series:

Tested-by: Laurence Oberman <loberman@redhat.com>

Regards
Laurence

