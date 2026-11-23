Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427006;
	b=RJaVYm+hgi4gB/XYBDvpZUJLd0heiZ5prl/BEf78M969FNtfbp02QIOpty7m35R5oHSa
	 Pe2nag9as2K8HBILOKj44WaNCc0TbICuE5d2mxh26QhTYQDk4vWvJ2mmIm0GDPuwCbd8j
	 C+gibFLVILMl9akvpsZMR9hoRLPYQHq/F2qmehh8Myf54Kxap3MM+Y8SuFPGCsMmMSKPE
	 3INibTejaMfXkO8ASzor10BHmlF7MX7PDF/WwUQkucgpShvb0PKdr0i2L9nnsZV6MOyHo
	 ts/939Ty/yJJy89nkJ+oKLCYfN4AA5rXCbBthkJc7blqyBojfdJqq52g5YqIdvYeNiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427006;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4J356MHWnNb4uOE0NENBbeFM2roPC3vQr9WKSEBSDyU=;
	b=t6TPd3GjYrvS89n2Hkzk1zhPHcz4bDWn5PXCIiMnmK2GTbqM1CgqSJblQxfTd5FUy9WO
	 2j40ZsYdEdzPiPy79B772dXkv8/zvCJMelat8tJgeglr7ij+MUJd5B4pEp6NuK6ZQcP4m
	 g209S2hpx7I6354gwkbc3kWuqIqgkQjhU+4idPtrC7DbMNq/+brCZetV0xLXg6OSFK7WG
	 Z59Q7X/FbrgXDkNurEdkF2Kx1xZXvhfO6431kooZr4E28vXazmunB3Hb2jBK+L/nrHUDB
	 BRfWOqnfP9X9S3gcNqLDaCWwmR0SzjelUF+XcbzJF2w4AItPULadVfeFGI7SmlIg4/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NqAExSE+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gIsy0EOG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7FA606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7FA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NqAExSE+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gIsy0EOG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795427004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4J356MHWnNb4uOE0NENBbeFM2roPC3vQr9WKSEBSDyU=;
	b=NqAExSE+Nirw4cjsl35aP646QZPs77Aip/mU5KSxPRl2mQl/KNZDtcJAP1OGCxFkQWmvjL
	HdU2Xq2OP/qEMIKy+dHqgE7wirn773Am4ZzkBW9sTkb9YqLvYhhkLSL8dH0VN0OXkyNhsZ
	Sy2Wqyns/Z0m4w5MfRg+F3T3Z5MFY4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-UaLI4zfqMjaaGhCkq_t2Mw-1; Mon, 23 Nov 2026 09:43:22 +0000
X-MC-Unique: UaLI4zfqMjaaGhCkq_t2Mw-1
X-Mimecast-MFC-AGG-ID: UaLI4zfqMjaaGhCkq_t2Mw_1795427002
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so24085755e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795427001; x=1796031801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4J356MHWnNb4uOE0NENBbeFM2roPC3vQr9WKSEBSDyU=;
        b=gIsy0EOG46GUIw4z6094Fqa9Kw4kM0sbGHFxhfE5oUfeBHWSId9yWlA5H0Jno4FERl
         WBeZ+NKGH+u/IDsPZugMuT2vt3ZpY1NUNZ3mfcfA6f+gsDgIX7xrKACPdXJ5/GEFLxrw
         0g4FfvSMDA/RQBtAyF9Tw8MOz59T43bby4Vs7ue15TFOIj3JcGlcYyKpZA1W0tWhtEeJ
         siNlsp2pKot09Jpk5o1Xdgc2Q15wahJZyKP+iF+iXHvxboVeXCLxAGqlDbVHwN/mGvdU
         6leS8xOrRyN31+aLoEgGbkTILj+QteWWxcFv5ca1+JlpmNZ9MsMlLo/daE+AGTGjPPRn
         RVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427001; x=1796031801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4J356MHWnNb4uOE0NENBbeFM2roPC3vQr9WKSEBSDyU=;
        b=Oobln7OexKGomPHfUDGNCcsPu5SyZihd5jQmztV9nyscKAA2qdp12W1wNFr3Iz5x6d
         4u1LFLo4uWQlUtcJUcNZD+uezsW61B8pTsZpZe1s45pVNrjkDAVXFXvvJ3sDVr4LKYP7
         khRP7W0UPedYyk5TRBvhjf6FoA6O2907hYCW8X/3Y2fQWz+3kAYQRkmoVRVN9hClt62O
         I8ZIC1JuhnypkQpJ4UGilvOyEio3rkidhIaRWcd4frFAtSM07owdjXabaHBjD+fYERuA
         Pjvca/v6n1EFFH5VUxb6Rd/5sIX2UZ3BdqX8BhYplqg+K7vHj39waGOti9EKfmU8kPs8
         QHTA==
X-Forwarded-Encrypted: i=1; AL+hErFjuNtTUvJ6i6pgRadsSw8Gn+tVpFsd5yOfMrtpWIWlXYqaqFodPMSMrWjhv7+YnP5f1ttRKQisCkyT/AQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KJPvoUtmqw+HSoWm5lWGBEQ5VziVmj6JJdsFI/PsabsBOqLkq
	pcjcxpyo6qqmK9P+LeaKk7hi1uGgwAxTE7/2//a1RsHWCkLWg1L4gKzHeARk4xI7hnG0bseq5Ad
	uRIrIeHoM81aX+1OfQz/noZmWEEn7821AGiUGcOJWZlBeEtF87ADOoF4he/WvaMxaVQ==
X-Gm-Gg: AZFdTZf/l/n0HFFsG7h9ETfhrtjxa+pqdUEbtu4ddK2dO8IJYcJaShtMzybDHHIWCAH
	lCLPAL24SCGPhb1CnGnCGgbtMOLseerIe+AbLq6tvz9I1X9PLV5fGPOnshc/c9jc+69vCVsGGwe
	ccQW6HoqkT3axEph2F+Ne/hj1L6LDHe+Zr91saNdYOkur6Kcr689e11kbAJfCiw701k/eeL8kTj
	l2YBZEmjZOozbkbV43QZJbmCU59NJQo5NmhH5p43goCjbNTV1qzneb/Ofozuw55tVLFUc1CcYCi
	6RzKFwaSPaY8h+VAHnaqEvhQqPXHAcJ9h+jsWaCAtiZc/sQbp+R0UHAfEdt/8zbM5j7eXOfBtUz
	q7+Eu4oUj6NonEDnulKMi4eytnOgkug8m1vhI53gsca9jvuartH8DIw==
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb888277b3mr231836215e9.16.1795427001520;
        Mon, 23 Nov 2026 01:43:21 -0800 (PST)
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb888277b3mr231835605e9.16.1795427001047;
        Mon, 23 Nov 2026 01:43:21 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm334271205e9.15.2026.11.23.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:43:19 -0800 (PST)
Date: Mon, 23 Nov 2026 10:43:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can
 reach the device
Message-ID: <awQJo8WE5Gn4nYHp@sgarzare-redhat>
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>

On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>vsock_deliver_tap() clones every packet to every vsockmon device on the
>system. Creating one needs only CAP_NET_ADMIN in the owning user
>namespace, so an unprivileged user can capture the traffic of local mode
>namespaces.
>
>Pass the packet's netns to vsock_deliver_tap() and only deliver to
>devices that pass vsock_net_check_mode(), the same rule socket lookups
>use. vhost passes the vhost_vsock netns, loopback the sending socket's
>netns, and virtio-vsock NULL (global mode).

For local namespaces I think we are fine, but what about global?

Is it okay that a namespace with global can capture all the packets of 
other global namespaces?

Asking because at this point the CAP_NET_ADMIN is useless, since an user 
on a global namespace, without CAP_NET_ADMIN, can just create a 
namespace to have CAP_NET_ADMIN and access all the traffic. Should we 
fix also that?

Thanks,
Stefano

>
>Fixes: a69686327e42 ("vsock: add netns support to virtio transports")
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> drivers/vhost/vsock.c                   |  4 ++--
> include/linux/virtio_vsock.h            |  2 +-
> include/net/af_vsock.h                  |  3 ++-
> net/vmw_vsock/af_vsock_tap.c            | 10 +++++++---
> net/vmw_vsock/virtio_transport.c        |  4 ++--
> net/vmw_vsock/virtio_transport_common.c |  4 ++--
> net/vmw_vsock/vsock_loopback.c          |  2 +-
> 7 files changed, 17 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 88a310390eb0..3de1f1920717 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -229,7 +229,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		/* Deliver to monitoring devices all packets that we
> 		 * will transmit.
> 		 */
>-		virtio_transport_deliver_tap_pkt(skb);
>+		virtio_transport_deliver_tap_pkt(skb, vsock->net);
>
> 		vhost_add_used(vq, head, sizeof(*hdr) + payload_len);
> 		added = true;
>@@ -567,7 +567,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 		total_len += sizeof(*hdr) + skb->len;
>
> 		/* Deliver to monitoring devices all received packets */
>-		virtio_transport_deliver_tap_pkt(skb);
>+		virtio_transport_deliver_tap_pkt(skb, vsock->net);
>
> 		hdr = virtio_vsock_hdr(skb);
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index f91704731057..46058d354940 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -285,7 +285,7 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
> void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *skb);
> u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 wanted);
> void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
>-void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
>+void virtio_transport_deliver_tap_pkt(struct sk_buff *skb, struct net *net);
> int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *list);
> int virtio_transport_read_skb(struct vsock_sock *vsk, skb_read_actor_t read_actor);
> int virtio_transport_notify_set_rcvlowat(struct vsock_sock *vsk, int val);
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index e8481f12312e..3e28865578eb 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -250,7 +250,8 @@ struct vsock_tap {
>
> int vsock_add_tap(struct vsock_tap *vt);
> int vsock_remove_tap(struct vsock_tap *vt);
>-void vsock_deliver_tap(struct sk_buff *build_skb(void *opaque), void *opaque);
>+void vsock_deliver_tap(struct sk_buff *build_skb(void *opaque), void *opaque,
>+		       struct net *net);
> int __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 				int flags);
> int vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
>diff --git a/net/vmw_vsock/af_vsock_tap.c b/net/vmw_vsock/af_vsock_tap.c
>index 7c5cdceabb2a..4c8821835251 100644
>--- a/net/vmw_vsock/af_vsock_tap.c
>+++ b/net/vmw_vsock/af_vsock_tap.c
>@@ -73,19 +73,23 @@ static int __vsock_deliver_tap_skb(struct sk_buff *skb,
> 	return ret;
> }
>
>-static void __vsock_deliver_tap(struct sk_buff *skb)
>+static void __vsock_deliver_tap(struct sk_buff *skb, struct net *net)
> {
> 	int ret;
> 	struct vsock_tap *tmp;
>
> 	list_for_each_entry_rcu(tmp, &vsock_tap_all, list) {
>+		if (!vsock_net_check_mode(dev_net(tmp->dev), net))
>+			continue;
>+
> 		ret = __vsock_deliver_tap_skb(skb, tmp->dev);
> 		if (unlikely(ret))
> 			break;
> 	}
> }
>
>-void vsock_deliver_tap(struct sk_buff *build_skb(void *opaque), void *opaque)
>+void vsock_deliver_tap(struct sk_buff *build_skb(void *opaque), void *opaque,
>+		       struct net *net)
> {
> 	struct sk_buff *skb;
>
>@@ -96,7 +100,7 @@ void vsock_deliver_tap(struct sk_buff *build_skb(void *opaque), void *opaque)
>
> 	skb = build_skb(opaque);
> 	if (skb) {
>-		__vsock_deliver_tap(skb);
>+		__vsock_deliver_tap(skb, net);
> 		consume_skb(skb);
> 	}
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index cf63bc99f3cc..b39c001260a9 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -150,7 +150,7 @@ static int virtio_transport_send_skb(struct sk_buff *skb, struct virtqueue *vq,
> 	if (ret < 0)
> 		return ret;
>
>-	virtio_transport_deliver_tap_pkt(skb);
>+	virtio_transport_deliver_tap_pkt(skb, NULL);
> 	return 0;
> }
>
>@@ -680,7 +680,7 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 			if (payload_len)
> 				virtio_vsock_skb_put(skb, payload_len);
>
>-			virtio_transport_deliver_tap_pkt(skb);
>+			virtio_transport_deliver_tap_pkt(skb, NULL);
>
> 			/* Force virtio-transport into global mode since it
> 			 * does not yet support local-mode namespacing.
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 1e762a480df4..027fe41c676a 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -190,12 +190,12 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)
> 	return skb;
> }
>
>-void virtio_transport_deliver_tap_pkt(struct sk_buff *skb)
>+void virtio_transport_deliver_tap_pkt(struct sk_buff *skb, struct net *net)
> {
> 	if (virtio_vsock_skb_tap_delivered(skb))
> 		return;
>
>-	vsock_deliver_tap(virtio_transport_build_skb, skb);
>+	vsock_deliver_tap(virtio_transport_build_skb, skb, net);
> 	virtio_vsock_skb_set_tap_delivered(skb);
> }
> EXPORT_SYMBOL_GPL(virtio_transport_deliver_tap_pkt);
>diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
>index 8068d1b6e851..cacd313a454b 100644
>--- a/net/vmw_vsock/vsock_loopback.c
>+++ b/net/vmw_vsock/vsock_loopback.c
>@@ -138,7 +138,7 @@ static void vsock_loopback_work(struct work_struct *work)
> 		 * It is freed by the receiver.
> 		 */
> 		virtio_transport_consume_skb_sent(skb, false);
>-		virtio_transport_deliver_tap_pkt(skb);
>+		virtio_transport_deliver_tap_pkt(skb, sock_net(skb->sk));
> 		virtio_transport_recv_pkt(&loopback_transport, skb,
> 					  sock_net(skb->sk));
> 	}
>
>---
>base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
>change-id: 20261116-vsock-tap-net-1b09a0945779
>
>Best regards,
>-- 
>Bobby Eshleman <bobbyeshleman@meta.com>
>

