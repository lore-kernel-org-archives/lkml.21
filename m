Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450129;
	b=0oKRuAC/+S5vYIWVCsnD29rUiLASYKfHPrEa5sz9HsBhQXdNvsJ22jTN6FkUe8R/4GzX
	 E+ls4T4Ag1jviyxJugJM7fFOFqSD3EKaUjlaFwQn4BuKleul1g1gn5Bwnm+WM7FVm/kF4
	 O1ahXwyMA3D+Qh/IyLjHrxiJMqf43ik/49NBWaiIcYEWFAE7Pe/u5rmwyH7EgTLgbyyeh
	 Ek79nI7yC6d9prQ6ZCCDh3jhyRCHjEZ8qt3dne7tFDiVqSo2I1SUkYolbB7bb//p//zpX
	 NPn1BtrLctDR5SPgnYSeiFtzFl3asglqR1YzbreGafp2Cb0iS3YcldhCB7S6n3PLTCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450129;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=lzGh06KvbW29kTdCwqSFpXTG7Ti9DVLUu53y+m7EPw8=;
	b=exC35Ecgo6Adss0Im/+4EKeDASoojim6ssFlTWNt/DTfpG85pBnsaPCSICi7K4KiFa3e
	 Z9fAdoBVTDB5UqU/D2eef0oLFYgnGxBaOd6uNmp+geX9w4OnvgGgdU6DSEy1riXlqhKat
	 pYNMEgUusCoeGN6bQZlDoyXXUmnKswNbfdgUxZwQ7zLzf1O56ZJ48bCzedDZCiNFYBCH2
	 SmeM5RBOvy+u6zjlGhMZIAVTHjgK5tCao0XMWn7DnspNHfoOm2wcXe3a7jHKJG8OEzbvL
	 FANyYIOTOqAXfgoDqxDgyz8Qc7My9sY6YffXn7u/q+hG+fxLdsxOKwRVl5B9h3q/UJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C5nucsP5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Qd5JR7g6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6970C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6970C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C5nucsP5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Qd5JR7g6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795450128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lzGh06KvbW29kTdCwqSFpXTG7Ti9DVLUu53y+m7EPw8=;
	b=C5nucsP50WObmK5Q7uRc+TveRbQ433qzGh7y2uyYQKa3lu8VBblMI/jfSafsNlAU5bzqM3
	2Oof31kKa1N1IDRagkxQGSOfEn7xcPfxwBTeYUwTJmOllC7W87Xmt98CG4KzUEqxzOoPdu
	PXhmAJmsmsCBRCvg+AyMrINooTjHRUA=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-1Zr869p8NdW1cjkjmGidGA-1; Mon, 23 Nov 2026 16:08:46 +0000
X-MC-Unique: 1Zr869p8NdW1cjkjmGidGA-1
X-Mimecast-MFC-AGG-ID: 1Zr869p8NdW1cjkjmGidGA_1795450126
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6798fd97f3aso5815654d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450126; cv=none;
        d=google.com; s=arc-20260327;
        b=Fc7FlPSiDwoBuTlIyny8jxM3v88Y3YbuqXu097CdLI3Ozzx24h8pfDj0EIZ9M+8PA+
         GOhAgSzTJbGHziPwDEGCn3c4XNdcLgY0k0WAnW6IB2pUPe0hwCkSvgy1IIdJCwpyTuBh
         o0vYtxidS+cPbUaaUZlYE1VFTYe7loC5HcM8VmFXDawEInp40dKVPr/bhJeo6ywMU1gP
         D4W7oWlYyLKdAZ3uANHr+kGOF/SjdD++rEciAFn04X3lV/qvtfsxf4+TtNurx34axN+l
         e2uXS49YqpDH2SY4guyAppGLYU0MeMwZWURC5LYTdArbwGrKKQDs1rB9sSPk99eQ6U5i
         hrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lzGh06KvbW29kTdCwqSFpXTG7Ti9DVLUu53y+m7EPw8=;
        fh=ak4GYgI4LsOz2ZAM7Z4Cncicb5Bph79d4qvANLJ2vwI=;
        b=bIuf1EBtjIj49A/ALP5R9KH38tgq4/41tDGGyMgdAHMmPcg8NMg10s9hrWhNyZt7iZ
         XhpNSB//ok3xKrwFI6FYC4BD0CgDUzThNKBgPoJZvHHhGOrb8VONxqc/nsS/ECOvw67j
         eF9tzEhbN2BSHiRz9+yEJl0vi0ZAjPX7vEwLPU7WidI6ws4hufV5a7SAEuA6AK6KpM7Q
         cLO95vxNnJMHicxA38bX66k8K4rxPXU2P67fF9aRoxaP4DOM8eNEsUHjtBXjKznYjNPl
         xMRGP6iSBKocAecSDO1BDlLO/s1PftHLGk2kRwZqgGFc+rZNBfd4QZMCbaevUNDsmhUj
         HD9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795450126; x=1796054926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lzGh06KvbW29kTdCwqSFpXTG7Ti9DVLUu53y+m7EPw8=;
        b=Qd5JR7g6lbc1bTE57DLvSbAcvCu+U5VnKV9hn7rTxISUy+bY47heC761ODwqICnDgn
         0qFgXuS7257s4kjYStNiNV8VAYTq3w+s8h09+qO05ZU2DwHrId+FhHfAYKeSITGi3N3P
         fSTI8BPp6EenPsopJifSxHd6LZlIocbNSV5EFqDuKpOSLWBzNbJOzYuOFrykRuEUhKcg
         UNQu+LPVEhoI28bovtV7kSmZL/Pk1CSuRx/jFxwWnx3YX7fkH+GA3pyeyYE1vGgmsYt5
         D0y43koEF5r0ggN0J3B8YGq1SRmtxPUnpJcpWuMuzqZEZwF6pjJFek11VkAxZk1UXnEp
         8LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450126; x=1796054926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzGh06KvbW29kTdCwqSFpXTG7Ti9DVLUu53y+m7EPw8=;
        b=ZKoc3lhVWStRbgLNa/nGdvWwugHeKpAz320sTYliNkmuNOg3AOrVAs7ez38YPfdsTI
         +mDw3HAiVOFeU9ZAhSkttv/Jg+T+teVPM+So8zlbmU15QX6r/eDb19+HZqf3AREHeNV/
         cioyhZdL2zBv4xqpxouSMgzBdQKNGHFwR0bKuDhNITVU5Z8Ujpl8lA3ydATQgnu1ZBpn
         gNrfZ5uoEkk6yKQKMnKqJWYWsLe49npyDe/byRrekPaPz+DtAgEvNQRpFRml1Dc5SBUM
         6Rg6FZuEB+tJ+/r5klbOZmEvMx2MfFDPcvqAPi6Nb4cDxd+niEauxorZeDrxpMSWxa/D
         zDpg==
X-Forwarded-Encrypted: i=1; AL+hErE4U8e6ViYs40pXSh8v37GrI2rCc/NkP4Jw2FEmU3T9xiXsKt/9j7BnYxuj8R9pV05o6o5lAGqh/tOXVEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ooEjYuYRMiEVEzJwFOQeCDNFo7DejgAxK44KiEZQ2Db+jpnDf
	22U+e0qmDELVwlcyP15KkZyl4NUXb/gP+lbQpAO4M9iS2vXLnBXoWRnD33n31jerdjnxXVnI6X4
	+1Wd1kF33CaeVp8n/tOfLLTP9fxC6r7kMLhYX5xajq0zu1nuTe1eQQKM9NcFEs1DLfee4MMlicp
	uosoDeCdKDEK9IMi6pnTOhKwsXyjXnHrc/JguaOnBA
X-Gm-Gg: AZFdTZfy3wgukL/9LZ4BnVvFF80daxvCnlnA8cei1di9LHll3Z8mWYqcn1tP08ZOWYd
	rsWt85ZX/c3jvYhqwLs2PA/a/CiMuEr9aiHYFLEBIp1hYbtlvyOGMm9ud4uaKNZIFne2DU6hUDb
	CGPYMHd/0pVBlMhKoMxxQaAwI79h6LDbpF9wHChjVyKiCXxWQZQHixe8neHqcJnaDmzOyJtDakM
	l9yCndi01pFOZxBlxV1f1shgv8zc9JqfTRyuUlrITytrawjW1siJEYm/Ic=
X-Received: by 2002:a05:690e:4883:10b0:677:d5bd:8349 with SMTP id 956f58d0204a3-67df445d5bfmr2252248d50.63.1795450125535;
        Mon, 23 Nov 2026 08:08:45 -0800 (PST)
X-Received: by 2002:a05:690e:4883:10b0:677:d5bd:8349 with SMTP id
 956f58d0204a3-67df445d5bfmr2252240d50.63.1795450125014; Mon, 23 Nov 2026
 08:08:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135646.3962652-2-dtatulea@nvidia.com> <20261123135646.3962652-3-dtatulea@nvidia.com>
In-Reply-To: <20261123135646.3962652-3-dtatulea@nvidia.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 23 Nov 2026 17:08:08 +0100
X-Gm-Features: Aa3M54pR7ZVMpPP5oNO1OCA7GwyP-se96UdMP4VNO94DAWt_5DL7ZGYCWayniuk
Message-ID: <CAJaqyWedvj6htnM4rJyrbynW3u1k=6uLHrfuK05YvM5z8v1Hjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] vdpa/mlx5: Fix error cleanup when VQ setup fails in .dev_add
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gal Pressman <gal@nvidia.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:59=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> When setup_vq_resources() fails in mlx5_vdpa_dev_add(), e.g. because the
> firmware rejects the provisioned features (HOST_TSO4/6 without CSUM),
> the error path unregisters the vdpa device first and then keeps using
> it:
>
> - _vdpa_unregister_device() drops the last reference to the device, so
>   mlx5_vdpa_free() runs and ndev is freed.
> - destroy_workqueue(mvdev->wq) then reads the freed ndev.
> - put_device() on the freed device underflows the refcount:
>
>   refcount_t: underflow; use-after-free.
>   WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x59/0x90
>   Call Trace:
>    mlx5_vdpa_dev_add+0x3e0/0x760 [mlx5_vdpa]
>    vdpa_nl_cmd_dev_add_set_doit+0x362/0x440 [vdpa]
>    ...
>
> - mgtdev->ndev is left pointing to the freed ndev, so every following
>   "vdpa dev add" on this management device fails with -ENOSPC.
>
> mlx5_vdpa_dev_del() already does the cleanup properly so use that. Just
> make sure that an extra reference is taken during the call to avoid
> _vdpa_unregister_device() from freeing the device under us.
>
> Fixes: ffb1aae43ed5 ("vdpa/mlx5: Pre-create hardware VQs at vdpa .dev_add=
 time")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/ml=
x5_vnet.c
> index 6830a80e8543..7a39b0bbbee3 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -161,6 +161,8 @@ static void mvqs_set_defaults(struct mlx5_vdpa_net *n=
dev);
>  static int setup_vq_resources(struct mlx5_vdpa_net *ndev, bool filled);
>  static void teardown_vq_resources(struct mlx5_vdpa_net *ndev);
>  static int resume_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqu=
eue *mvq);
> +static void mlx5_vdpa_dev_del(struct vdpa_mgmt_dev *v_mdev,
> +                             struct vdpa_device *dev);
>
>  static bool mlx5_vdpa_debug;
>
> @@ -4043,7 +4045,10 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev =
*v_mdev, const char *name,
>         return 0;
>
>  err_setup_vq_res:
> -       _vdpa_unregister_device(&mvdev->vdev);
> +       get_device(&mvdev->vdev.dev);
> +       mlx5_vdpa_dev_del(&mgtdev->mgtdev, &mvdev->vdev);
> +       put_device(&mvdev->vdev.dev);
> +       return err;

As a suggestion, the cleanup could be more symmetric if
mlx5_vdpa_dev_del checks for NULLs.

But I'm ok if you prefer this way,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

>  err_reg:
>         destroy_workqueue(mvdev->wq);
>  err_alloc:
> --
> 2.54.0
>
>

