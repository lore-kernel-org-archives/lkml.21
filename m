Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.70.137.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159666;
	b=Bi0PukyYL7pY6MsklRwbW9XXhPkzkdp2vnmFSUl/WfyeCjjgzAmiI/Sd/7uLaYg1HcO7
	 W7NMyPsJ0ak/kPPzCvdE/GXH4NTKpSxqbY7cPNypQq0a4KnCdpbrx0PRaKPdLTxuJXsVe
	 1X0+Z/YfyUcHx7+l0ZZvseMTwOEfE/omPlhgzUEz19DjAvHod2koS9viyGXIZDYfJy/5j
	 Cml9+RM6HRefSqUjd/ZA3axEUJJjWbA1Xc6ecby7RhBxKZemvFE1FSnR0XU/ZWQ1/5xpd
	 RFIvnZZOWQpj+sVreE+cGGju0QnlNtb4JSTquZG+qAtoptavXzS+mpXhfKqoojSTt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159666;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Spam-Score:X-Spam-Score:X-Clacks-Overhead;
	bh=A5p512q1vWE8Uy9SPysuh8aKMj7lGxs0o4LND/TLe8s=;
	b=Kk+PlOlf1Mrq6c+uRFFmTEUUiT/k5GFpbk5s5NeoIET3SPltJnfDi7UmriMWBsu4zsie
	 aVWk7vM7Xnt63E6bBvFo0wOyVu6OQKIwkim4NfCRU8/US990YjGzTS8UmbfhPqWg1hJkx
	 HyLtUIE3leAxz14vF1zqSPZDw4w3PblZmo51kVtU6UC5E7+421SucKbpusRIU9mwKr90s
	 rbG40yT3qk9jx7sgNSPX/Qe4v305sMuTEK5FX7zYIQ+KGlDzmlkhjFj0iO0aGlgk1zerH
	 CSSw8G40rCL+pt1HVuf7nZdI9guxIaKcY5l4r33XbiQbajqvJuyA+pZMrtU9Ae7/6Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cambridgegreys.com;
	spf=pass smtp.mailfrom=cambridgegreys.com;
	arc=none smtp.remote-ip=31.70.137.218
Received: from ns3.kot-begemot.co.uk (ns3.kot-begemot.co.uk [31.70.137.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75137606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75137606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cambridgegreys.com
Received: from [192.168.19.6] (helo=jain.kot-begemot.co.uk)
	by ns3.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xUJ1z-00000002Hv4-3XfP;
	Fri, 20 Nov 2026 07:27:36 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
	by jain.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xUIo7-0000000E1eN-2ICf;
	Fri, 20 Nov 2026 07:27:33 +0000
Message-ID: <aa262899-6b0c-47b8-b099-a8aa83a2a881@cambridgegreys.com>
Date: Fri, 20 Nov 2026 07:27:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] um: vector: Don't clean up NAPI that was never set up
To: shyckless@gmail.com, johannes@sipsolutions.net, richard@nod.at
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
References: <20261119-uml-vector-napi-v1-1-b3751cf4fa60@gmail.com>
Content-Language: en-US
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
In-Reply-To: <20261119-uml-vector-napi-v1-1-b3751cf4fa60@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett

On 19/11/2026 22:39, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> vector_net_open() calls vector_net_close() on any failure once
> vp->fds is set, and vector_net_close() then runs napi_disable() and
> netif_napi_del() unconditionally. But the NAPI context is only added
> and enabled after build_transport_data() and the header buffer
> allocations, so a failure in any of those disables a NAPI context that
> was never added. napi_disable() locks n->dev, which is still NULL:
> 
>    ip link set vec0 up   (vec0:transport=gre,...,rx_key=1, no tx_key)
>    Kernel panic - not syncing: Kernel mode fault at addr 0x910
>     napi_disable+0x4e/0x9e
>     vector_net_close+0x2b9/0x87d
>     vector_net_open+0x105d/0x106f
>     __dev_open+0x244/0x334
> 
> Record in vp->napi_enabled whether vector_net_open() got as far as
> enabling NAPI, and only disable and delete it in vector_net_close()
> when it did. NAPI is still enabled only after the queues and buffers
> that vector_poll() uses are set up.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: b35507a4cfb2 ("um: Migrate vector drivers to NAPI")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Tested with UML (seccomp=on) on top of the um fixes branch: with a GRE
> vector device missing tx_key, "ip link set vec0 up" panics without the
> patch and fails cleanly with -EINVAL with it, also when repeated. A raw
> vector device on the host's lo still goes up and down twice as before.
> ---
>   arch/um/drivers/vector_kern.c | 9 +++++++--
>   arch/um/drivers/vector_kern.h | 1 +
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> index 8008278ccee7..021f14780b45 100644
> --- a/arch/um/drivers/vector_kern.c
> +++ b/arch/um/drivers/vector_kern.c
> @@ -1137,8 +1137,12 @@ static int vector_net_close(struct net_device *dev)
>   		um_free_irq(vp->tx_irq, dev);
>   		vp->tx_irq = 0;
>   	}
> -	napi_disable(&vp->napi);
> -	netif_napi_del(&vp->napi);
> +	/* vector_net_open() may fail before setting up NAPI */
> +	if (vp->napi_enabled) {
> +		napi_disable(&vp->napi);
> +		netif_napi_del(&vp->napi);
> +		vp->napi_enabled = false;
> +	}
>   	if (vp->fds->rx_fd > 0) {
>   		if (vp->bpf)
>   			uml_vector_detach_bpf(vp->fds->rx_fd, vp->bpf);
> @@ -1260,6 +1264,7 @@ static int vector_net_open(struct net_device *dev)
>   		netif_napi_add_weight(vp->dev, &vp->napi, vector_poll, NAPI_POLL_WEIGHT);
>   
>   	napi_enable(&vp->napi);
> +	vp->napi_enabled = true;
>   
>   	/* READ IRQ */
>   	err = um_request_irq(
> diff --git a/arch/um/drivers/vector_kern.h b/arch/um/drivers/vector_kern.h
> index 5f0ceb80779d..e1b697266fa7 100644
> --- a/arch/um/drivers/vector_kern.h
> +++ b/arch/um/drivers/vector_kern.h
> @@ -118,6 +118,7 @@ struct vector_private {
>   
>   	bool rexmit_scheduled;
>   	bool opened;
> +	bool napi_enabled;
>   	bool in_write_poll;
>   	bool in_error;
>   
> 
> 
> 
> 
> 

Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
