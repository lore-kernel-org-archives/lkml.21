Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134723;
	b=NxZLtXpYMliyADUTNVEgAMued2lK0kf+7icjdwoqwMpK2JZyhxFFb7ThBcWDtoX7dA22
	 Oryybi6KVcPoZpTJL9M2C+EBweSSiTfCeirQGDE9io+R0MgrL5a3utBIB33N9ChSihSK4
	 vDrbeFYbTc/5HANm787q2jfnFSeDfn7c67iqM3iQpWyl/cQFT1pW26E6PTLw3/M32sAjh
	 DIFm2Bq9N5oz4xjWRt3ZVqjsXED0gATnNcQ/CpOMzzglosFKEo6durKIGocbu9Df9QCLr
	 LhAUkzYqzItU6cq3kTZTYfulZ1KMMRFa3tFm1+/5F+HepApaojxkzELsZ3sJ6S7WjDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=mZzEzgMMxjB3j+vPh5g8u5NJjrN6f+VQAyZJOgWj1P0=;
	b=cIdqMSm9nejRLKWmChUH/2eLx5LmLBQ2FrxupjBmkD/CmYn6Iet3dmPhjmLWoew3m1FS
	 5mJFx4fvqU7fwnLULgQ+sgFlfaG/qHiZvOkfpIgeVJLJrc3SgL0eYQNd5U1A4oQJFGpKu
	 E+dvfXto3WFpHUG9KTcFCUDy8eL/3ueI69L1h1T8/vtexzdlBRrhTK8hbC9Va+SShKO58
	 wujkiigCWCm6Fv0BxDV/tsGyf5N1WiicGlPmjbiu9oS7HgkXWE5biK0Py+RcivyftDPGk
	 2P6wVIYk235KhYKQfRnTGp9rIgEOSdVJHzMl/17ZDLTjbPhmj1xEJVpuolF32Tt3Mpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J1PZDsZF;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9760A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE9760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J1PZDsZF
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso36299c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134721; x=1795739521; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZzEzgMMxjB3j+vPh5g8u5NJjrN6f+VQAyZJOgWj1P0=;
        b=J1PZDsZFoBAXVvY8eLaT3O9ZAxsKHQPQZXVEpTBdAF/zGKg2Yz5aa3BWEF/jSek5Jr
         J3xF+pqrXvgbWIMVnaqbVbdUxElYIsIH+tJYALqOqxLkcMUhSCHsuRMD8HAPIpLKaoYW
         4/MwUy0c8p/OzEv0bDCBWuDkOBx5o8PscdEBB3qLQ9RfgDU4vXPYpDE3t3zsK1SPpRcY
         h9L2yZt8MhkdGQma/ctNPuJVV106bV/lmPIQ9JVrHl1BQmR922qMxGprNIA4pqnbz2tJ
         lO1WmLpm7cDaZf57/6aCtonm6Pp9+O8XE++K/6rWIJn8VnlbuY4xrM4W2d5mStYHtMRq
         u3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134721; x=1795739521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mZzEzgMMxjB3j+vPh5g8u5NJjrN6f+VQAyZJOgWj1P0=;
        b=dNc05MrwT77tql2aiZn2p9lijJdtGWcf7hxMfJiCqSFDwKJ6yTzAx5nIIfGkHsA7/z
         qNdvEjrluk+YStvXuRYDIGMorYu+xsRlsZiaSrtdZYBmay9VtqByq7P7IPy7h03BBKf8
         eNPHLUggOwpsYMO4oA5kcXIt0UzyvlXUJQsjyuQkE1R9n/14AXuc0fffmKIm+3s5Grgs
         Un5KdHDYdNQVzrERDFuVLUaZcC0uzPf0N2Vu9bB77ezfVzVDy1qhRrTfTjpH+eEMo0xK
         1DqDZsGtV52bpvlWVF55y8vMQPrO2Qq7f89y6tnCv7lUYmoiLr2YmaqzkPoE6tYN1oLw
         A54w==
X-Forwarded-Encrypted: i=1; AL+hErHuz+aXKLS45L0KQtucSe+QHty/yzflnSWNGOH6swoX6eLbPS/AitSfFrCw0N2AcM9eWRRYPd3VIXagDFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ap2F+hIK4d4vLK3k6Ukrdz62lYw0U7TV2Hw13eouAynivt0fA
	VQcPpayirMLN4sjNOhG22DuRpH/Fh94C7GkJf8WRCPDR8kFzTFbTjcJX
X-Gm-Gg: AYBFou3ATo2KG7SQnUF3t4jfx/1M/GEeF/qiHobVGZtUM/382XVl6Ck8bFp7yfOihg5
	KtFmio4ZSif/TnZj6E9fzdgrw3d41c9oxYNxeRmllRxms5vLTTgSSMmwJWHT/Xaa0hT3Hko5xWo
	SvQYi1Tsbn7gjuK0iZy8A6vKVgoJIKKGT/bSEaJH3Rkh5kJLgo2ucCzurVyJrHJYpGZ8Mw5ujFG
	vNLLmU0HfORNtV6inz92OIhmynqZglsHdU52LRqLem4xI248uBVzbiRWKAaMGMnoZWEayU1XVcb
	YqdwUURZx7uj323MdLbf2co5sbE+xSr4XefvnJWamH0TNITDNXHorXIduatMgRz+eVMF7mW8l5e
	+yCytyARPdgD6aNnBmhhYVL5TBe9NFcmUP+zafRS7UFQbJBrGQF7Pi3hIHWhnJnrETGGuAsG31+
	UUCIydeMMiuemaDiVvPeH0xapiOIhDWa8HqLceIWV9j6IrFdYTnu0b3LbiWcrW6Xgm+9gyaKHPO
	Eufu+V5dQ1MM9dg4MyyRvr7lfWKICrUzRILyz6niSzIiQsWGlgNn3lcVX/E/VQL666FoW4AUK58
	Hes5MYcc3keKc/HrFCmIE0xkrbJ++wD+fd2sdApsnoXsgw==
X-Received: by 2002:a05:7022:7f01:b0:1b5:1a6c:af64 with SMTP id a92af1059eb24-1b5568c0fa1mr1258049c88.17.1795134721419;
        Thu, 19 Nov 2026 16:32:01 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:63::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm2282420c88.1.2026.11.19.16.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:32:01 -0800 (PST)
Date: Thu, 19 Nov 2026 16:24:58 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 3/7] net: Admit native XDP on provider queues
Message-ID: <av-TQztlq185q6VW@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-4-bjorn@kernel.org>
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
In-Reply-To: <20261117164700.2157816-4-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> XDP and memory providers are currently rejected on the same device.
> Header-split RX keeps headers in normal memory, so a program can
> filter packets without reading the provider payload.
> 
> Keep this restriction unless the driver declares xdp_unreadable
> support. Admit native XDP in either attach order on these drivers.
> Existing header-split checks require frags-aware programs.
> 
> The driver must mark provider fragments and reject XDP_TX while those
> fragments remain. The core rejects helper access and frame redirects.
> 
> Keep generic and hardware-offloaded XDP rejected. Generic XDP builds
> an xdp_buff from an skb without carrying the unreadable flag. Its
> transmit and redirect paths also bypass the native driver guard.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  Documentation/networking/netmem.rst |  8 ++++++++
>  include/net/netdev_queues.h         |  6 ++++++
>  include/net/xdp.h                   |  5 ++---
>  net/core/dev.c                      | 28 ++++++++++++++++++++++++++--
>  net/core/dev.h                      |  1 +
>  net/core/netdev_rx_queue.c          |  2 +-
>  6 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
> index 6871dcdd700c..1ac94fc9d667 100644
> --- a/Documentation/networking/netmem.rst
> +++ b/Documentation/networking/netmem.rst
> @@ -131,6 +131,14 @@ Driver RX Requirements
>     circulation times, such as when userspace holds a reference in zerocopy
>     scenarios.
>  
> +8. XDP programs run next to unreadable memory providers only if the driver
> +   sets netdev_queue_mgmt_ops.xdp_unreadable, and only in native mode. The
> +   programs see the headers in the linear part, and helpers that reach
> +   unreadable fragments fail. Attach payload fragments with
> +   xdp_buff_add_frag(), which marks unreadable ones, and drop XDP_TX of a
> +   buffer for which xdp_buff_is_frag_unreadable() is true: the payload is
> +   mapped for receive only. Redirects of such a buffer fail in the core.
> +
>  Driver TX Requirements
>  ======================
>  
> diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
> index c5335e935b7d..4f6702b284b4 100644
> --- a/include/net/netdev_queues.h
> +++ b/include/net/netdev_queues.h
> @@ -199,6 +199,11 @@ enum {
>   *
>   * @supported_params:	Bitmask of supported parameters, see QCFG_*.
>   *
> + * @xdp_unreadable:	Native XDP programs may run on queues with unreadable
> + *			memory providers. The driver builds XDP buffers with
> + *			xdp_buff_add_frag(), and drops XDP_TX of a buffer for
> + *			which xdp_buff_is_frag_unreadable() is true.
> + *
>   * Note that @ndo_queue_mem_alloc and @ndo_queue_mem_free may be called while
>   * the interface is closed. @ndo_queue_start and @ndo_queue_stop will only
>   * be called for an interface which is open.
> @@ -229,6 +234,7 @@ struct netdev_queue_mgmt_ops {
>  				    struct netlink_ext_ack *extack);
>  
>  	unsigned int supported_params;
> +	bool xdp_unreadable;

Any reason this is not a new QCFG_ in supported_params ?
