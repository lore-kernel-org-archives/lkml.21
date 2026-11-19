Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097643;
	b=PLTdmbrJSSBoLxBpwMShyjSQjlKpLQ1cnSuf5LAdc+Iye32ktJpZ2uXlN/jzwlXY/B6M
	 yyzjsb3to9aEnoeyAK/6UPwAl/YZ2VopA1y4Ufg2JydYWksEAHoONanWaET902lqUDfyA
	 8XcWJtWYdqY5WfsbzPz/0gbiV3gwVTuLZYiiRa9wtmJeFS1lbiTCoHSk8N2tzOZ0TLGtI
	 5YXcjcG24kuYE3ZX3I7yKXO8d5hW2QFRHomgN8tRCPTSvj/MV9ExwMztMhtzsFjTuQRIT
	 z0mGaj8zYd5WvmuM/ZGg/SS4qqRFpcCThmuQnpKBw4YGdilyjEmMUGbjmyz3iBMjYHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gG4kM32mzN3LthzLbRfQBBSxIfuJWjOzBoKoTt6zAKY=;
	b=2pou6aHL9d2Ph3wLWhzJY7I90v7p3JGprlCf6bnueBOy+V7lHa+WiQz2UPaoe4RWP3jc
	 Plpy1DLmbfM95KbITTGMfdxwLlfxrailCoYqRUX0KzO8gxerKyHjHDZmUpSe6wUcJojWo
	 T1EwHE+9y0FTzObLi2PhXarTdl+3jAseL5e3paigyd2LUAqc0DDyYYnQbRSgfWgz8udpD
	 U+gjuKKGhhl8DFZw7nGwEH9JPJsBJne2dE8wA+XrkexSTeYiOQ5xY21SWzgfG4JM9hrvv
	 hHYunaLnPh2/Txk8aU2mZlI0j6OV1lguHeV45l0tn50tjWyjfPhs46QbnQsW26IS2xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M6JD7yIi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE92606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE92606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M6JD7yIi
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b51871c5c4so3380527b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:14:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097641; cv=none;
        d=google.com; s=arc-20260327;
        b=J1zmpD8t1I7BJmGIWKlfnWBo0qigMJK9OZMWMbMWq2nrRS++t2LXwxFEvx7B0crRU7
         BTFd9kze1COkLUlQewsnwhu+TYUN6hnk+pIulyNhn8oASC9G6dL2T6y2mquMDFjNi6hX
         Fo1mMUppJp1qjLkFolkaKKw/8+cpJ5C2s5BzmKxgxXGB2tew9It3McpZS6GC5SxUqH93
         2ldUDKV2aWbvcgOTkw7DK0s1T1xvD6K50mwgvxMEDI3vFk5dXJ/ssgofWRFw6Cm5eroV
         HlLE21ILv11yyr6cXLiyjTvK//KWSSlqV19W0iSq2zH/aBPj+2TC+o1xSO4Iw9xqhbkR
         qVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gG4kM32mzN3LthzLbRfQBBSxIfuJWjOzBoKoTt6zAKY=;
        fh=bIjaw0EdYTRh7jYA3IKY+vHjFp64OCZNkzVtY73Bjy8=;
        b=I5oBWaEbHfru+q496NrBENoV67vRFX9s05QrZDWgfhhpD2BtNoZFkRiM/5co2YNiKX
         4nEyrtLdKY7mxMJtsTQgfosjACzkNPxckCh1qrln1jNpt2Mfhb/rkmZWeovaDFiVJW0y
         ci1IIB8Aootf0QqMHedIjlyOtUIImh7jXR4PRECkyAV6603TpQ+7AcdFl386Rk9UhPvu
         w28YxNdgbKrMujXEUn3vcmsHcI56RMjEKrJ4Q4IdrssD5DQXYzV0WpAUP32grzERRFjs
         oR59cEreXoY9KYU5XJAYGrRGJEHxCva9pdkAXL9yXivCqQxaAqejgHsswJvxA5mVTStW
         6RXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795097641; x=1795702441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gG4kM32mzN3LthzLbRfQBBSxIfuJWjOzBoKoTt6zAKY=;
        b=M6JD7yIiLwpgTYQRF736tEiVJkbxKXpefBTLQ/TPElWA+3xFBi1CbRuRD5sEXL8sVX
         eWctIC3evmi5DEgicOgHKiD1vizsS70PFSLOlq4PQPQCXV5I4yQqPE7IgiV9JvOPW5Zl
         S+G3nT0God8TS3nXhDsSbj31xT6FsXIEbqm4Z9+zmZuExCfyYwc3jH/x7RBqFF49jTS5
         Wl2kbFkRrZnLyG9S52VbOxUR0xHgsGV/KHb5pXV//6OViwlLEh+4XBxn6IgBWYY6qjIU
         yiRYGxtk2j9d1+iuqK/yr9IOA0arda3MDhPu2ixip8c2AfQVyInnbSabm4HzieYC/YVW
         KEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097641; x=1795702441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gG4kM32mzN3LthzLbRfQBBSxIfuJWjOzBoKoTt6zAKY=;
        b=kGlL6Y7LBevoJSHb1ctWpVGZVBaInb7nSfOrP2IPUBGiCddvrSV0yVIR/neSHvOL42
         icOJIjT9k6b2Xye2DeBcq3pbIwiFad9wWUZ+RmDN8rJXLsw8qlDe4ODE6uxStLGi0q/T
         GL9MRif+GepwVSoKcpHAqZVqqCiLRRxZ5HFXAaA7c/jWsWYq9/qQegRRW0IqECdp7zrc
         XDM+mIQOIop+15UqIkhqYi1MhMY82EseNqL0ev0TINuvrL7lXs6TWOpWdIf4GeHdlOP+
         rQ4ho9uYVPtdFzg5CUYxpdip1gx0qbDtQXEMmDhJcQIPPVUTVgHS/NW+GJlKUmfehGdj
         ZnYQ==
X-Forwarded-Encrypted: i=1; AL+hErGm76HzDB6Mwg/WZpR1j8bfNJzfROgiQzitNtzuf31KPFTQef0uXPjqU27F07JrmOD79eJbbbsVX5/CfHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AMYEEthY7makYmisRUMnzSmxCMePoGZ7MUCC5PtTy+YnMzH/W
	Hqj8JjceWESI8pjtQ0H8kFvV0G1b3h6wmF8Dr4cc0leQwoNDXb7zj1H3PJOT6M3W2122vAyde+h
	mELLtPs8r1W0FUpS1+I8SfxG2poQStMicz5zgmAwjFQ==
X-Gm-Gg: AZFdTZc8Yg8/S2TpjvExrB+c5Nc+xfx55dZczkCiXRl/ZUiu2j0bKDE0Tll+v12J8Nm
	vhkhA/SMNpZJ2AwpV2SXyA/7uc60bGExBJJKiqEzLMq4EWZsMycx8cYXDI2KRSvDC//lFMWX9bv
	CW0cJc49+L3ucUWj0fDnEMB86lqYuINQNe3L9J3alEnoMKPv2+gOQZCGuWV+vdLxHoT3KxjeJGg
	4ROscWYwH3E+WmbLnq7SBx1ha75tFSb9UJ3f5eaP2UFyJ74sBcZoc+vbSC1a8yC6ZAvyIkPVdgw
	TdOZ3kgMW9GFcUT3z+OseiqWP3Yj1hWZwJ5AyyMFCk4Ps8S8757EbmC9995yTwRNiWWGK1Itwta
	YL1OjuBUYjHdPhGeGglXzjCo9B/+neh6SDE0JjNGQ2nC/4EJ08f4wopVGYlTQBBTXFDnvtPs=
X-Received: by 2002:a05:690c:680c:b0:8b1:60a0:c311 with SMTP id
 00721157ae682-8b518e20cecmr4131297b3.33.1795097640986; Thu, 19 Nov 2026
 06:14:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119024248.1497433-1-shunsheng1218@gmail.com>
In-Reply-To: <20261119024248.1497433-1-shunsheng1218@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 19 Nov 2026 08:13:48 -0600
X-Gm-Features: AclHuK9wcV_UV7jBIFkxeKjWTloKYfPaF6HMGgpxuYK0Xl4oC2cyrHzQdAH7w4g
Message-ID: <CANLsYkzoUF12sQX-pi8Ee-iZvVScVOeUkzhkWhnam56=9NkXkg@mail.gmail.com>
Subject: Re: [RFC PATCH] rpmsg: stop the inbound callbacks before the driver
 is removed
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Please note that I give priority to patches written by humans.  AI
generated patches such as this one end up in a secondary queue that I
look at only when the primary queue is empty.

On Wed, 18 Nov 2026 at 20:42, Yaohan Li <shunsheng1218@gmail.com> wrote:
>
> rpmsg_dev_remove() calls rpdrv->remove() and destroys the default
> endpoint only afterwards.  Until the endpoint is destroyed it keeps
> delivering inbound messages to rpmsg_ept_cb() and flow control
> notifications to rpmsg_ept_flow_cb(), both with ept->priv pointing to the
> per-endpoint data that the driver releases during its remove.  For the
> default endpoint of rpmsg_chrdev that data is the rpmsg_eptdev that is
> freed as soon as the channel goes away.
>
> Add an optional quiesce_ept operation that stops the inbound callbacks
> without releasing the endpoint, and call it from rpmsg_dev_remove()
> before rpdrv->remove(), and from the probe failure path which calls the
> driver remove callback as well.  The endpoint itself is still destroyed
> after the driver remove() returns, so drivers that want to send a last
> message keep working.  No in-tree RPMsg driver sends on the endpoint
> from its remove callback.
>
> The operation runs in process context; it is not an atomic one.  Virtio
> takes the mutex it already holds around the callbacks, mtk_rpmsg waits
> for an RCU grace period, and qcom_smd and qcom_glink take their receive
> spinlock.  Callback execution context is transport specific: a callback
> invoked under a spinlock or an RCU read side section must not sleep, and
> the operation preserves the context each transport already used.  Glink
> also takes recv_lock around the flow control callback, whose only
> in-tree implementation, rpmsg_ept_flow_cb(), sets two flags and wakes
> the read queue; glink is also the only transport that delivers that
> callback today.
>
> qcom_smd skips the callback once it is gone and mtk_rpmsg switches the
> callback pointer to RCU because its IPI handler runs without a lock.  The
> warning that mtk_rpmsg_ipi_handler() prints for a failing callback has to
> be inside the RCU read side section: quiesce_ept() waits for the readers
> with synchronize_rcu(), and afterwards the endpoint and the device it
> names may be gone.
>
> quiesce_ept is optional, so the guarantee is per transport: only a
> transport that implements it can promise that no inbound callback is
> left when the driver remove callback returns.  All four in-tree
> transports do.
>
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c         | 28 +++++++++++++++++++++++-----
>  drivers/rpmsg/qcom_glink_native.c | 17 ++++++++++++++---
>  drivers/rpmsg/qcom_smd.c          | 20 +++++++++++++++++---
>  drivers/rpmsg/rpmsg_core.c        | 11 +++++++++++
>  drivers/rpmsg/rpmsg_internal.h    | 18 ++++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 16 ++++++++++++----
>  6 files changed, 95 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 430a9b2aa7bb..37d573287ced 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -73,12 +73,23 @@ static void mtk_rpmsg_ipi_handler(void *data, unsigned int len, void *priv)
>  {
>         struct mtk_rpmsg_endpoint *mept = priv;
>         struct rpmsg_endpoint *ept = &mept->ept;
> +       rpmsg_rx_cb_t cb;
>         int ret;
>
> -       ret = (*ept->cb)(ept->rpdev, data, len, ept->priv, ept->addr);
> -       if (ret)
> -               dev_warn(&ept->rpdev->dev, "rpmsg handler return error = %d",
> -                        ret);
> +       /*
> +        * The warning has to be inside the read side section as well: @ept and
> +        * the device it points to are released once quiesce_ept() has waited
> +        * for the readers, and that wait would be over right after the unlock.
> +        */
> +       rcu_read_lock();
> +       cb = rcu_dereference(ept->cb);
> +       if (cb) {
> +               ret = cb(ept->rpdev, data, len, ept->priv, ept->addr);
> +               if (ret)
> +                       dev_warn(&ept->rpdev->dev,
> +                                "rpmsg handler return error = %d", ret);
> +       }
> +       rcu_read_unlock();
>  }
>
>  static struct rpmsg_endpoint *
> @@ -100,7 +111,7 @@ __mtk_create_ept(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
>         kref_init(&ept->refcount);
>
>         ept->rpdev = rpdev;
> -       ept->cb = cb;
> +       RCU_INIT_POINTER(ept->cb, cb);
>         ept->priv = priv;
>         ept->ops = &mtk_rpmsg_endpoint_ops;
>         ept->addr = id;
> @@ -126,6 +137,12 @@ mtk_rpmsg_create_ept(struct rpmsg_device *rpdev, rpmsg_rx_cb_t cb, void *priv,
>         return __mtk_create_ept(mtk_subdev, rpdev, cb, priv, chinfo.src);
>  }
>
> +static void mtk_rpmsg_quiesce_ept(struct rpmsg_endpoint *ept)
> +{
> +       rcu_assign_pointer(ept->cb, NULL);
> +       synchronize_rcu();
> +}
> +
>  static void mtk_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>  {
>         struct mtk_rpmsg_rproc_subdev *mtk_subdev =
> @@ -158,6 +175,7 @@ static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int l
>  }
>
>  static const struct rpmsg_endpoint_ops mtk_rpmsg_endpoint_ops = {
> +       .quiesce_ept = mtk_rpmsg_quiesce_ept,
>         .destroy_ept = mtk_rpmsg_destroy_ept,
>         .send = mtk_rpmsg_send,
>         .trysend = mtk_rpmsg_trysend,
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index f848ab46161d..5b88a70ed08c 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1165,8 +1165,11 @@ static void qcom_glink_handle_signals(struct qcom_glink *glink,
>
>         enable = sigs & NATIVE_DSR_SIG || sigs & NATIVE_CTS_SIG;
>
> +       spin_lock_irqsave(&channel->recv_lock, flags);
>         if (channel->ept.flow_cb)
> -               channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv, enable);
> +               channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv,
> +                                    enable);
> +       spin_unlock_irqrestore(&channel->recv_lock, flags);
>  }
>
>  void qcom_glink_native_rx(struct qcom_glink *glink)
> @@ -1408,16 +1411,23 @@ static void qcom_glink_remove_rpmsg_device(struct qcom_glink *glink, struct glin
>         channel->rpdev = NULL;
>  }
>
> -static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
> +static void qcom_glink_quiesce_ept(struct rpmsg_endpoint *ept)
>  {
>         struct glink_channel *channel = to_glink_channel(ept);
> -       struct qcom_glink *glink = channel->glink;
>         unsigned long flags;
>
>         spin_lock_irqsave(&channel->recv_lock, flags);
>         channel->ept.cb = NULL;
> +       channel->ept.flow_cb = NULL;
>         spin_unlock_irqrestore(&channel->recv_lock, flags);
> +}
> +
> +static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
> +{
> +       struct glink_channel *channel = to_glink_channel(ept);
> +       struct qcom_glink *glink = channel->glink;
>
> +       qcom_glink_quiesce_ept(ept);
>         qcom_glink_send_close_req(glink, channel);
>  }
>
> @@ -1611,6 +1621,7 @@ static const struct rpmsg_device_ops glink_device_ops = {
>  };
>
>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
> +       .quiesce_ept = qcom_glink_quiesce_ept,
>         .destroy_ept = qcom_glink_destroy_ept,
>         .send = qcom_glink_send,
>         .sendto = qcom_glink_sendto,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 7dbe1c6efe41..a27964c757ca 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -558,9 +558,11 @@ static int qcom_smd_channel_recv_single(struct qcom_smd_channel *channel)
>                 len = channel->pkt_size;
>         }
>
> -       ret = ept->cb(ept->rpdev, ptr, len, ept->priv, RPMSG_ADDR_ANY);
> -       if (ret < 0)
> -               return ret;
> +       if (ept->cb) {
> +               ret = ept->cb(ept->rpdev, ptr, len, ept->priv, RPMSG_ADDR_ANY);
> +               if (ret < 0)
> +                       return ret;
> +       }
>
>         /* Only forward the tail if the client consumed the data */
>         qcom_smd_channel_advance(channel, len);
> @@ -950,6 +952,17 @@ static struct rpmsg_endpoint *qcom_smd_create_ept(struct rpmsg_device *rpdev,
>         return NULL;
>  }
>
> +static void qcom_smd_quiesce_ept(struct rpmsg_endpoint *ept)
> +{
> +       struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
> +       struct qcom_smd_channel *channel = qsept->qsch;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&channel->recv_lock, flags);
> +       ept->cb = NULL;
> +       spin_unlock_irqrestore(&channel->recv_lock, flags);
> +}
> +
>  static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
>  {
>         struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
> @@ -1052,6 +1065,7 @@ static const struct rpmsg_device_ops qcom_smd_device_ops = {
>  };
>
>  static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
> +       .quiesce_ept = qcom_smd_quiesce_ept,
>         .destroy_ept = qcom_smd_destroy_ept,
>         .send = qcom_smd_send,
>         .sendto = qcom_smd_sendto,
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 04bfcc75f05b..b832345ca262 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -481,6 +481,9 @@ static int rpmsg_dev_probe(struct device *dev)
>         return 0;
>
>  remove_rpdev:
> +       if (ept && ept->ops->quiesce_ept)
> +               ept->ops->quiesce_ept(ept);
> +
>         if (rpdrv->remove)
>                 rpdrv->remove(rpdev);
>  destroy_ept:
> @@ -498,6 +501,14 @@ static void rpmsg_dev_remove(struct device *dev)
>         if (rpdev->ops->announce_destroy)
>                 rpdev->ops->announce_destroy(rpdev);
>
> +       /*
> +        * Stop the inbound callbacks before the driver releases the data
> +        * reachable through @ept->priv.  The endpoint itself is destroyed
> +        * below, once the driver does not need it anymore.
> +        */
> +       if (rpdev->ept && rpdev->ept->ops->quiesce_ept)
> +               rpdev->ept->ops->quiesce_ept(rpdev->ept);
> +
>         if (rpdrv->remove)
>                 rpdrv->remove(rpdev);
>
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a8b7065fd165..02dda4b6809b 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -61,6 +61,24 @@ struct rpmsg_device_ops {
>   * @trysend, while the variants sending data off-channel are optional.
>   */
>  struct rpmsg_endpoint_ops {
> +       /*
> +        * Stop the inbound callbacks of the endpoint without releasing it.
> +        * Optional: a transport that does not implement it keeps delivering
> +        * messages until the endpoint is destroyed, so only the transports
> +        * that do can promise that no callback is left when the driver
> +        * remove callback returns.
> +        *
> +        * Called from a sleepable context.  An implementation must wait for
> +        * the endpoint callbacks that are in flight before it returns, with
> +        * whatever lock already serializes them with its receive path.
> +        *
> +        * The context the callbacks themselves run in is transport
> +        * specific: a callback invoked under a spinlock or an RCU read side
> +        * section must not sleep.  A transport keeps the context it already
> +        * used for its callbacks.
> +        */
> +       void (*quiesce_ept)(struct rpmsg_endpoint *ept);
> +
>         void (*destroy_ept)(struct rpmsg_endpoint *ept);
>
>         int (*send)(struct rpmsg_endpoint *ept, const void *data, int len);
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20..c8a15bb63841 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -137,6 +137,7 @@ struct virtio_rpmsg_channel {
>   */
>  #define RPMSG_RESERVED_ADDRESSES       (1024)
>
> +static void virtio_rpmsg_quiesce_ept(struct rpmsg_endpoint *ept);
>  static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
>  static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
>  static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
> @@ -152,6 +153,7 @@ static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
>                                                    struct rpmsg_channel_info *chinfo);
>
>  static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
> +       .quiesce_ept = virtio_rpmsg_quiesce_ept,
>         .destroy_ept = virtio_rpmsg_destroy_ept,
>         .send = virtio_rpmsg_send,
>         .sendto = virtio_rpmsg_sendto,
> @@ -292,6 +294,15 @@ static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev
>   * name service endpoint, which isn't bound to an rpmsg channel.
>   * See also __rpmsg_create_ept().
>   */
> +static void virtio_rpmsg_quiesce_ept(struct rpmsg_endpoint *ept)
> +{
> +       /* make sure in-flight inbound messages won't invoke cb anymore */
> +       mutex_lock(&ept->cb_lock);
> +       ept->cb = NULL;
> +       ept->flow_cb = NULL;
> +       mutex_unlock(&ept->cb_lock);
> +}
> +
>  static void
>  __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
>  {
> @@ -300,10 +311,7 @@ __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
>         idr_remove(&vrp->endpoints, ept->addr);
>         mutex_unlock(&vrp->endpoints_lock);
>
> -       /* make sure in-flight inbound messages won't invoke cb anymore */
> -       mutex_lock(&ept->cb_lock);
> -       ept->cb = NULL;
> -       mutex_unlock(&ept->cb_lock);
> +       virtio_rpmsg_quiesce_ept(ept);
>
>         kref_put(&ept->refcount, __ept_release);
>  }
> --
> 2.34.1
>
