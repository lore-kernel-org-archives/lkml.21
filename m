Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448358;
	b=277DY4cOskDPJGeXU0aWFGHLFh9EP9C+fq3D9KV+TDq7yhMxdlxUvsCZFEeC/rCJiejM
	 CfVWx6f2SBd5D8HMVgy+YFteRgcKQKkvHRTHe0aNoqFc6qlvNvv0yGL/1C+Ea5WqpdTUC
	 wgSYLzTePvtYHzl2rF0il1XVZOrooojvsgQcdzaqyTbR+rXVRTb8PO6rzOnwu0vMb6YZ6
	 DRmENqHRrPawiZIZF9aAkU1Lt5Q/QiRJece7qho2AGhONPatPjU8LsHOKfHKiUBw5Lfyx
	 5ytYCyah1wSn7fXrW6sQPVdTGmZZPuABp0ONOAsLiba0YJ4pfK39/HVUFjerj8YFLaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448358;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHGeO62t+HFnsrJIv0BtafcJl/YZUNb4ktd3CTqJklc=;
	b=KC4Z1GJ4IpW8DfUoxp0c0RZZdy1FZ7Nl3Uj6fBaLJc+H3r9KnurR3S/z8DcaozQYrqym
	 izX5G93aOVn432b2lxisaDCJ5fIlKU1nQWyfZJN82ikE3XBu4emjPTXJvON56Anm0BzEk
	 uFwQLauHs+jj1nZbR/vZpMoXNOqIzI9Ljazsj8G4LkEAaRzIcAIvLKVxy1vjRP3NGlKu/
	 SElierMIwDnR22mw2+EPmo1DRAHisWh1t4A8rzx5XcBGkUOWlIV6uKiZjPVLScPR5he1b
	 bHrTtd1KnR8DLxlcpeOFTgS1lXvBZvTewzwvsIFdDaBrEa2WG4+zixfUU3yrml1VrWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a57uxpBZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XC8kL8H+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a57uxpBZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XC8kL8H+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795448357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHGeO62t+HFnsrJIv0BtafcJl/YZUNb4ktd3CTqJklc=;
	b=a57uxpBZDLHfrmCork62OYqreU7S3HBuK/1ZQ79lOPU+fnvQ54ohkGBTxEOedtHGRO6bh7
	nj+cg014VjsEwONjnpXIEOcDUB+b4pwxyjoaT2z6Zq+zXYBgHUVnBALWRgKSoqOghHAZSZ
	OQJu7eFXIGOJS3pJXoEYfDRgY5HHzXs=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-OAh7DUqAPIOGifnPOCQ6Yw-1; Mon, 23 Nov 2026 15:39:15 +0000
X-MC-Unique: OAh7DUqAPIOGifnPOCQ6Yw-1
X-Mimecast-MFC-AGG-ID: OAh7DUqAPIOGifnPOCQ6Yw_1795448355
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6799288480dso4890337d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448355; cv=none;
        d=google.com; s=arc-20260327;
        b=ktV7pgJicmshnZk9ogN3SLGNpSanFE72RoPDQdBrKcn3vdVLPRSM4FLPAjjrlQNrA+
         hHwijqmLD4NlIfV2n5hM2IDdmcwbofkEZuiJalr96hX6zHmLMSmaHK1DJL1Fe6OmU31N
         dJ2DSlhBVs9jAF5NRTESJXE5a61zFOvEsG/4QTS6Tt5dzIBhhXuWoDvhQ5Qttgz/3mBC
         ggbrwFG1tfPR7ppEHZtYkguTnNT2exSwaDAFg6+7J5bNBwahTN+E0IxfIqyAu1wwOjCN
         Ne9iqcmBkz11pNwR7mZ9tP9ZAMn8kWlr4oyJ1c1F8WsHi5W5rU9USkKuk2zct3ZeEhqK
         QW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHGeO62t+HFnsrJIv0BtafcJl/YZUNb4ktd3CTqJklc=;
        fh=MmSvpDYafMkCMLWumRg6V+qM1vRwNKWPitnQMjmVfcQ=;
        b=YBPfgO1JhqCJahRKrgl0GC4qaXdYhW8iSnA7vrL6NKXDDsXSEdVisSjM755EFSFepb
         UhI6DREXYCLjgHR0ZAGy2420nD4b5tjba0q048PdRsxvDE9BZkRvVPJXAHY0gRXN0Hs4
         QFPD9DahuT3DUSlxQ4v1O8IdUDsE+KzLSqwwTHVC3CLn2hIQZEN/9otp3VtSsWBmQMAm
         M+DelzBh+FtZfNDq69A+dzyL93vd8j1Zpc0XPPk5W5W/6OTdRW7jwQZpJFNWladi1/FM
         1UsgN7w7Fm+rNinMnsiV0pRL+AkBF8v8N0zHo2XjpQ7OtPbcYA9NEOis4/C1RUYii/e/
         I4tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795448355; x=1796053155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHGeO62t+HFnsrJIv0BtafcJl/YZUNb4ktd3CTqJklc=;
        b=XC8kL8H+P0wbE7BHL81/z7A01/tzJ3dz+cfOsc4BgwvFVupeNa/HUoiithwmVHe9Z5
         kyX+xQEFXT2GkG/Hd/Rc8bEyh4eNqFzn+ImaA9Rbn8iuxKcQ9P9HNZtAPlDRnfbmf1Cc
         MJs4AeDD1m2Klaqbg5JPf5/tFfPqYUq2Ev3f1EtTI5QQJ9nWs0GymiaSkZw78M8zv2ff
         Nx7MsVzuv1AieJyR9/i0c0IgfR/XimXeEBM3surbL4jEIapcClbFJFcsyBmBUC3qb7x+
         GlqzHv8MI7klkHWlN9PlcjnvKhcTO5Vpm/qWZ2ZU3jilbrSAniynLfBdkv/CxDRLAOLC
         sJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448355; x=1796053155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHGeO62t+HFnsrJIv0BtafcJl/YZUNb4ktd3CTqJklc=;
        b=hy8n5/H676CPa8J3uHiP69HX/mE7C09f0R2QKOx32o5+nJY8eLrmxLzMkT5x7cCc1T
         HfjUvV/RFQNRQZ+gJYmSAThPyExBAhep03Ftxkhe20LUT/ebyktD5nEV4QpypxQb2sns
         4kBnvmlQozIpNKe7pkT/VyLBELjWLGJgztjAg/v6auPCNdpym6hgjMzRoGFDfMoZNTr0
         GGf+6XmhVZ1GIHI1tecD3ZK2OcdVgzU0jtaIvUwcKNIgC6yeEGZ4FrHKDV+HTkhrrlD0
         Ko4/lK+yZnKKGQqyKGpoiiwHLp1RBJNq0pAJq9qWyfyxmh5e9qlXXefNqbM1SuoJHo7M
         GO7w==
X-Forwarded-Encrypted: i=1; AL+hErEc5nJ33kdaHR+vOO/auSAsQJq+Ak7RBx972c8X5f3JVWgQ0NeslTEGfWrEcfFxFtHcBlMz1CghsRvk15w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U20jOWMfH/pGYDVpXNXxDaECIm3FhSjDXHrZMSTMPuuWJHteR
	GT5LY6aB40uckhuo2K6BfZHYsEpCWlHlogbrp0RTKc4uvBKHNrTqN9B6DuBn/VIhQ1obxPoH0tD
	ZPHzPgPcT5XawZwJhzAstGMmHN3E+jkQwYgt1xud4IVHUfgxxLaBlQrGzX/6rBMaMp/yfXgmamg
	eznv7MF1Cm7sNbhD+S0/umiC4MyPn+1HAgK87rT63E
X-Gm-Gg: AZFdTZe9Zi62TH8FOd6prVlLcj72C3ZopUgZXO+EDcLv8MTHxIRU+DotricFwTsjGjr
	Rvex7EKuSgdb0i0ifwB3otUW2atR312Bi6NnEoEFUCKdvMZKAElmzDaSovgZWRGEh0SROwvwpHh
	16KVgz3R00TyFDG8eCdbuls8zGt5cQEGG/q/+sVkJdneHCCKB8gEqIYhRMKMBvOzaBXDKmaEJKh
	wilWNulk9EVW8V1Uq6bhzHdIGMU7YhovPp2MZj7QRfkQLD2hzmiqEzy90A=
X-Received: by 2002:a05:690e:1248:b0:67d:b995:a5c3 with SMTP id 956f58d0204a3-67df44b55admr4416366d50.70.1795448354408;
        Mon, 23 Nov 2026 07:39:14 -0800 (PST)
X-Received: by 2002:a05:690e:1248:b0:67d:b995:a5c3 with SMTP id
 956f58d0204a3-67df44b55admr4416353d50.70.1795448354006; Mon, 23 Nov 2026
 07:39:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135646.3962652-2-dtatulea@nvidia.com> <20261123135646.3962652-4-dtatulea@nvidia.com>
In-Reply-To: <20261123135646.3962652-4-dtatulea@nvidia.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 23 Nov 2026 16:38:36 +0100
X-Gm-Features: Aa3M54o_X1llfaYVgrhNMk5-QtVPWRJiZP6Jl7gQZsBvDw4xjjtYogw0lgFiv-A
Message-ID: <CAJaqyWeKT3A2A5OHiB47j1P+e8BSoAbtJ9XaGLjU+kKOzOusMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa/mlx5: Increase the maximum virtqueue size
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gal Pressman <gal@nvidia.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:59=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> mlx5_vdpa has always advertised a maximum virtqueue size of 256 through
> .get_vq_num_max(), while accepting any queue size in .set_vq_num(). The
> hardware handles larger rings just fine and users have been running with
> 1024-entry queues (e.g. QEMU's virtio-net rx_queue_size/tx_queue_size)
> since the driver was introduced.
>
> The commit in the fixes tag vhost-vdpa enforces the advertised maximum
> on VHOST_SET_VRING_NUM, so configuring a 1024-entry queue fails with
> -EINVAL.
>
> Advertise 1024 which is the max that qemu uses today. The device itself
> supports more but doesn't advertise it in any way.
>
> The Fixes tag points at the vhost-vdpa commit rather than at the driver
> because that is where the mismatch became user visible. It also keeps
> this change out of trees without the vhost enforcement, where virtio-vdpa
> would otherwise start creating 1024-entry rings instead of 256.
>
> Fixes: ccb1dc7c527f ("vhost/vdpa: reject VRING_NUM larger than device max=
")

Is it worth backporting this change? Nothing should break (or be
broken because of the 256 vq size), it sounds like an improvement to
me.

Either way,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Cc: stable@vger.kernel.org
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/ml=
x5_vnet.c
> index 7a39b0bbbee3..f1c5f72032a3 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -2965,7 +2965,7 @@ static void mlx5_vdpa_set_config_cb(struct vdpa_dev=
ice *vdev, struct vdpa_callba
>         ndev->config_cb =3D *cb;
>  }
>
> -#define MLX5_VDPA_MAX_VQ_ENTRIES 256
> +#define MLX5_VDPA_MAX_VQ_ENTRIES 1024
>  static u16 mlx5_vdpa_get_vq_num_max(struct vdpa_device *vdev)
>  {
>         return MLX5_VDPA_MAX_VQ_ENTRIES;
> --
> 2.54.0
>

