Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194895;
	b=fJUV/A1K1UN0GQUw4A4ueR4KWS/iSvl5fHohVnBRnp4bDCRAPXzyG7BpuBORvPvHIoBS
	 cVGIazsnDYNPthg4DaD7B/xPqm4eofTNn9lL9p6d5PqHKoHVsLpY5TCK7DYF1q4oIfFmV
	 ViRAndR67NStlLe3/2dFGYHHzmL5qwt22rAOQZIITjm7RpvooZehex0AY5ga47DDngZBU
	 nDyItPrCYn1c+XKzQREPb7J9Hh6jkagDoyPjxV0UfAd01TJF6veGOnkcoBhtOUQi6E02u
	 zGSIbfK67hpJx2+5EphWqlJG146hNS2Y8DjWlwZubHyF0N3aFKX77kq6P92zgVwvXoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LkHPVV5puI4vDTHgviLsfMcYaMRsroW0UN+lwZ6xwNI=;
	b=xyFjXZ+ELnW87nB9mypyYiIveTo5olslfZFPdCsBNEi1+pacW232dJ/1sVAx9fMJGkWU
	 8Hec/mrksKhlM0k46hWZBGLtXU0AfVm7unvOyKQSnSlk4EAq2M6EXL1D78ibebCt521go
	 l/8lYIjCe2uLrcuAb4IeF5vEfpGqTce0bo4lga6gCBhJRfpqDjCgvdDU0fMHIulolrbw3
	 b5CrRAi+7DjYgbdUZI8fkR3+NuAQdfHu81xmuIIWyTKFZUbxAILFt2Ps+nZrY83Z1PgUw
	 qTLD4JyAzzJKBE7TNbN7oErw5ROP+yw7APTzSFi6kZmuapgmdTHKEQ61WedrStkl6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5JzbllR;
	arc=none smtp.remote-ip=74.125.230.132
Received: from mail-qv2-f4.google.com (mail-qv2-f4.google.com [74.125.230.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE1960A2612
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE1960A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5JzbllR
Received: by mail-qv2-f4.google.com with SMTP id 6a1803df08f44-9211c92e822so7599176d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194894; x=1795799694; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkHPVV5puI4vDTHgviLsfMcYaMRsroW0UN+lwZ6xwNI=;
        b=h5JzbllRY3FFd7SIlh0QHu3I3pNyf2yBnW2eYr8i9y2WY8PUKpO6C0LnWiy/0p0xH9
         Efz3vuIykc6aRoNZE3Ar6sFTIWmBCvtC6CWCwJu2ipXHHsgbLsUhDIWVqKO5P/9SVZLK
         IEZDUKZFV79jb8XUORh13uLelSXXNTemAw1RfDRIJh4C4RmqHr94Aw1JHoU4EtWxjeM3
         RbZJp4jfvF55Q1A+Ix1ERuQ8Iyp8iv0qki41OhjQ3wNcd1Uk8XX50JJyTil6lCuvX94K
         zasNhD4NETRKK/ruAOeeFZKNgz5N2pOn6TxPQDJWzHWaB+ZwXPwPfFXSnFrc9ccFzUoI
         6DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194894; x=1795799694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LkHPVV5puI4vDTHgviLsfMcYaMRsroW0UN+lwZ6xwNI=;
        b=0ggg4CGDicDYNHffBx+4YtlO47DgR7ZaiVmxEe2WV01NbclRXimCLcorOkCneAJ+Oj
         U2dt40M28a4kZkM7/bX8Hh4dhgvxe8a5wg2zw4wegVcWVaMzXU4MU8ffPVF48+iOK4SK
         K5Nq1qSwZ+WNsL/y7mbrFuVu4idp1VK99mqJl3Vu+mPS4Uy6UNAagmW2LkO3LsU7VSAi
         sl5/QoJ8vWFW2aAEQDNAQMrV9XICJRoQvTU+W1aDRX47lQ3owKWHNGH8MTuwqmX2HglM
         DpWcUmpcXJJQ6N3t8FEyi/XWIOvzxv+hpsdSRP7b5IjTJs8kXIjo6KucTjzuGp6lnZZz
         xb+Q==
X-Forwarded-Encrypted: i=1; AL+hErG/cauTJJMDrOKG3mQOjrk/WxfjhU5ncAFshzNMtf3QAYBUMQb9HKQkz8/pGQlcIaomVQOlfx5NXtfKT08=@vger.kernel.org
X-Gm-Message-State: APuU4Z95YrPs1ounfODoCMEbg8lNftccOf/x8hEWZUoUSDOUxGYkuJOa
	F9MI+EUKt3ro5ttdJv4GBiTTXGa0cG759uExjl1ZvtROkkc5YLsHt1Rm
X-Gm-Gg: AYBFou0GlygHbRmgMZk6MUt5vyRdmYdJ5CikP+66eO1mwpeLlCoxMnOow5B/hxHUFM+
	gvMLfVvZhm4HiBp6bI0VpKtBRtFuwTg7aR5463e34k7acBJxszmSlPA79nUMbAQ4xQN0raGdE1c
	8HS56WLx2oMAnXG1PJkSapGAMAMi49omTwM/TF2eWeD8bJ/xRgSH8ntJTZ+cdwS8xJvLUIPop1U
	AcdiFwhWICKpZcE+ngitawUxCeg6mJzGrZjOqQlq/InXb33T9uf6hjXAPUEw3a8kA2QrJO4ZTm3
	iNCEB4fTtvnIRPDadvpW05i0bxhTvqrf5HhfACuAwsB9AzR9nrZtGby8jGHFILc7JKuHfVAiqny
	99bWpF4BYnvg4HR2jDEdxgH07IleHMoRjOS0ARLGL/feD8zTzNP7/fswfSDafy3Miu95+QpRMvN
	k2G0LpZXQIfiXmkj59sc1Yvcw+GqZGjloIOwMg3xqxonb/NZikY34NnxlM3MKXmxOcFO1DgpBsg
	MCoYCbUSGjE2d3ntdFso16qSKk6TRSP4/AqnwNLNmliiFxECqvxo5hbwdxG/Nmd/wld+EhHr7YS
	bdaARAO9sw9JrKDRvOsGnPQ=
X-Received: by 2002:ac8:5f0b:0:b0:54b:5cc6:6036 with SMTP id d75a77b69052e-55d76afed61mr72126961cf.58.1795194893996;
        Fri, 20 Nov 2026 09:14:53 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm27280191cf.4.2026.11.20.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:14:53 -0800 (PST)
Date: Fri, 20 Nov 2026 09:14:49 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Mina Almasry <almasrymina@google.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Wei <dw@davidwei.uk>, Erfan Sharafzadeh <erfansh@meta.com>, 
	Gal Pressman <gal@nvidia.com>, Jacob Keller <Jacob.e.keller@intel.com>, 
	Kaifeng Wang <kaifengw@google.com>, Leon Romanovsky <leon@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, William Tu <witu@nvidia.com>
Subject: Re: [PATCH net-next V2 00/13] net/mlx5e: Add netdev support for data
 direct
Message-ID: <awB_rJxrIDQ3u-73@devvm16445.scu0.facebook.com>
References: <20261110183826.2927274-1-tariqt@nvidia.com>
 <b5305251-b758-45cf-a28d-406b04d8bccd@nvidia.com>
 <CAHS8izMhSVabXgMmNbHHLm8cYqW_EVQbpXME2z_tUEJuN2BTnA@mail.gmail.com>
 <0a1be802-1c53-46ff-a08c-614c3a2d6f41@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a1be802-1c53-46ff-a08c-614c3a2d6f41@nvidia.com>

On 11/20, Dragos Tatulea wrote:
> On 20.11.26 17:38, Mina Almasry wrote:
> > On Fri, Nov 20, 2026 at 6:39 AM Dragos Tatulea <dtatulea@nvidia.com> wrote:
> >>
> >> Hi all,
> >>
> >> On 10.11.26 19:38, Tariq Toukan wrote:
> >> [...]
> >>>
> >>>  .../ethernet/mellanox/mlx5/core/data_direct.c |   9 +-
> >>>  drivers/net/ethernet/mellanox/mlx5/core/en.h  |  14 +
> >>>  .../ethernet/mellanox/mlx5/core/en/params.c   |  18 +-
> >>>  .../ethernet/mellanox/mlx5/core/en/params.h   |   2 +
> >>>  .../mellanox/mlx5/core/en/reporter_rx.c       |   1 +
> >>>  .../mellanox/mlx5/core/en/reporter_tx.c       |   1 +
> >>>  .../ethernet/mellanox/mlx5/core/en_common.c   |  38 ++-
> >>>  .../ethernet/mellanox/mlx5/core/en_ethtool.c  |  67 +++++
> >>>  .../net/ethernet/mellanox/mlx5/core/en_main.c | 253 +++++++++++++++++-
> >>>  .../net/ethernet/mellanox/mlx5/core/en_rx.c   |  33 +--
> >>>  .../net/ethernet/mellanox/mlx5/core/en_tx.c   |   4 +-
> >>>  .../net/ethernet/mellanox/mlx5/core/main.c    |   1 +
> >>>  include/linux/mlx5/driver.h                   |   1 +
> >>>  include/net/netdev_queues.h                   |   1 +
> >>>  include/net/netmem.h                          |  24 ++
> >>>  net/core/devmem.c                             |  85 ++++++
> >>>  net/core/devmem.h                             |   6 +
> >>>  net/core/netdev_queues.c                      |  51 ++++
> >> While working on V3 I realized that keeping the core part in
> >> this series is not the best approach. Initially it made sense
> >> because the change was small.
> >>
> >> I think I should re-spin it in a separate series with netdevsim
> >> based selftests for the new APIs. I would base it on Mina's devmem
> >> leased queues unregister [1].
> >>
> >> Any reason not to?
> >>
> > 
> > I honestly wanted to comment that you should base it on the leased
> > queues series from me but didn't want to be annoying, especially
> > because I made you wait for the previous series.
> >
> I realized that quite a few changes were needed after your series
> so I decided to base it on it.
> 
> > My series creates binding->bind_dev, and binding->map_dev, and core
> > will (should) handle things correctly across both devices. This seems
> > perfect for you, because you have a bind device and a separate map
> > device and their lifetime is different.
> > 
> In my series I am actually skipping leased rx queues in
> net_devmem_unbind_dma_dev() because we need some kind of notification
> mechanism + netkit implementation. I think this should be added later
> if there is a usecase. For now mlx5 simply doesn't support the combo.
> 
> One note on net_devmem_unbind_dmabuf(). Posting it here as I don't
> find the right place to mention in your series:
> 
> @@ -234,8 +234,17 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>                                 busy = true;
>                 }
>  
> -               if (binding->direction == DMA_FROM_DEVICE && !busy)
> +               if (binding->direction == DMA_FROM_DEVICE && !busy) {
> +                       struct net_device *map_dev = NULL;
> +                       netdevice_tracker dev_tracker;
> +
> +                       /* Leased queue: attachment readers hold map_dev's lock. */
> +                       if (READ_ONCE(binding->map_dev) != binding->bind_dev)
> +                               map_dev = net_devmem_lock_dev(&binding->map_dev,
> +                                                             &dev_tracker);
>                         net_devmem_dmabuf_binding_unmap(binding);
> +                       net_devmem_unlock_dev(map_dev, &dev_tracker);
> +               }
>                 WRITE_ONCE(binding->bind_dev, NULL);
>         }
> 
> map_dev devmem lock is taken to prevent use after free in
> netdev_has_dmabuf_binding() when called in parallel with
> net_devmem_unbind_dmabuf(). As this can happen in my series I added it
> there.
> 
> Waiting for feedback from Stan/Jakub/Paolo for a few more hours and
> will post the series tomorrow.

More and more workloads are moving into ns/netkit setup on our side,
so it would be nice to have netkit support as well. We can start with
what you have so you're not blocked for too long, but we do want the
netkit portion as well :-)
