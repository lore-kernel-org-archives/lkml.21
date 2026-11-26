Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712963;
	b=Gh+aZtygWhaP30q+PLscsWKH3sIZKUOg+Z3u/S0SauPC0q238GshBB0gSzKvZTzWFRD0
	 O9HreKoSGXQZfuLrilvxM6fWUY5y5Aau5kpeJu06seyzLYt9nWtEZ8Uim59AoqnyM+0kh
	 z+pR7jYqK3DCxqptLNcjMnXJUv20+VkbZiJNh/y30cxfuPqJsAr2OYCWKtjWdKO3EWDrt
	 b7ZNUzQIcONVxs45j0q4N/KtzwXA+Li1uo3C8NTJkEKGUCu+uxayHdG/0Ymmq6U3VMJOf
	 eIZMcwNJuCzRlaWhb/5wWjK7A8Zz3Zvxh1eLRtKgB2P1npJeeDTxhFuA1BLhdYW8bDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712963;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
	b=0A4HRdb+p9Ed5NIgN2B3Q4jigR1XGNe5WilQPE/E4dcVF8Njwva9JN+ouUEqcoOItzew
	 hBGsYDehwfk/QqjDbIIYl5qOo9iac2Jem/N5yAhIPCieHZ8Y/N8EtiAoX4fqE7/urG7tN
	 IyxCTgmKJ34TNbClIQ1oDNEhIT+N4YB8o/icywinw/Ub8j2knFP0hZhd3Iw6ZBczxpAyp
	 MEM8uF+nSXCwWk5gjrp48Tup63j7Qtetd886DSjb4QrkEPpNSGULhjLGZ2PkBb5nGg3js
	 H3QFojS93WCb/aZaY89wavjeYMfJCUaYzWcIJsmVGswQAc/CgWCVoSCEAM7naJ0jhEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnML46z1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E2HTHYOg;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C03A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnML46z1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E2HTHYOg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795712962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
	b=FnML46z1aKTU851FRljT9jbreBq/r0otgjSuzrG9UzeVKalrUvdilILaCp0+AXV/dsZsQn
	XHYOTYka6ePHqawDF0hSkcAVqJVpd6Xgfb0E3zA+89XESBGSnVqBPOJ9cSMCAIRtb4tQbk
	od9mUfpu+Im94SnSTukCXX+5vSR5pKg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-DHCq2AvsMUKntFlDqVND1Q-1; Thu, 26 Nov 2026 17:09:20 +0000
X-MC-Unique: DHCq2AvsMUKntFlDqVND1Q-1
X-Mimecast-MFC-AGG-ID: DHCq2AvsMUKntFlDqVND1Q_1795712959
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so60122335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795712959; x=1796317759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
        b=E2HTHYOgas0DAMS+DYtcR0451sZQR4i3/+LyLr9K5i+THsZ6rTj6Y20+KA5kiZY6FR
         9XpxrIW/TbyTlPLthWkzmog07jpfx2KK0boMtdJGl+Ra2KRxupEQGTAJ0nQc1pg+FyMJ
         PJp3D8hc90XBeYfYM8vaZDulUADEDU98pcVKwfDdQGGemfL/gMLxzIOZFftR1347E/Yi
         wcfULIk5CImOH6nuldSqCYXBipUtW/ib9jMg/+cFNKkaqCRft9K2oh94XbseKQ/AtBb0
         0wS86dh/ruQTFUobywOv2Nu7ARqOyHT0Hpq8m11/SYQ8fFC4d0OhClGx2o6MagZHTjPY
         Ishw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712959; x=1796317759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
        b=On2bo+vaul1K33X7ljeZP3pKYB6FVW2whMsSFK+9l3AyjkKhwyK4Bk/6KEcY0qK8+5
         aJp4O0nKG9TWj1Ej9XKGKNAHd1YHIqiuw9IFCJpKQ88jlGGWb7puvUyp93Zu1mvmeXaN
         QGLBPKVsfD5MSKHjdme6Ib5/vU3AINm5E8Ho2J5VtRbLm/MZsIX82Bv1UVkaJESPe/XY
         NWyX+DE50xStCCVmZtrgFhpWdAZWbvEdzbWkCortL2XWJWOo+L36ff/8szhOY2UZBV9A
         qpsVsXSI+CZHdrKufBqfej82Fv35kk8NiVWxjDMxvLSBW9Ona7c4VpLlKw4zT3A0FFcR
         NoAQ==
X-Forwarded-Encrypted: i=1; AL+hErGxQxiLnNPVT9ZFb7VHzLJYMpcYcvHIgJmJMZkI0IOwgb+kyt6vIGUbToJRa/NzlgkyYQSKKsFcP77EhxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XzbfT/9qr0jRxkKnpiMjY72YOf6jSLKGcTKmjrPjQhtZgc9LB
	/xTyY3T5RBus0A7hTZayf8GnC9yHbBnvBXKgXpJF8HDd+nNFEU1Uz0J4NeIxre0rIUaBH2MPg8O
	H5oyk9cv8jvcMpA0QD6SNnbEPXpXCbV7+p1ujNXp2b905HH1+tNJ7Z3Kw/2cT2k3H+A==
X-Gm-Gg: AZFdTZfB726pBXIqYQJ8MdCc/NOWO69HifFa/L3TSNVC2D38hAdkmsen9vjF6RLZRYS
	CqomIWvpp0nAIuDpDsA4LtqaR70IdiooKnNeST9RPzLBuXA/woXUO68kbAqPW7kWknx5gC2bT42
	x58noO6MECam9gbUcpVt01x8p3pFtbBnCdoBhYeE5AbbF6iyhnW/wNTRVaWPsIgwdZXDFHf2Z4P
	g627jsg88yTEgrYj0+Aawbh4+k/p2/6pPYg0Dy7u2G/S0Ces4kPfS0CJumIrYKEq8jDHfgk7zGk
	IiTCNxzQmI7JD046ySk3K1Ak7O/s+bCU9BMq1YZaTcCoFOQ6OKy6F28GGRqI7+V9gMv37r0FnW6
	OLME75GtwIVQ9qXoZI8q3SebP/h8eb4LWQXYAD8QpfBazFPFZHPVh2g==
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr412484545e9.16.1795712959007;
        Thu, 26 Nov 2026 09:09:19 -0800 (PST)
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr412483085e9.16.1795712957967;
        Thu, 26 Nov 2026 09:09:17 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39471009f8f.34.2026.11.26.09.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:09:17 -0800 (PST)
Date: Thu, 26 Nov 2026 18:09:14 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Sashiko AI bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v4 4/8] vsock/virtio: negotiate datagram support on
 the guest
Message-ID: <awg9rYcvF-Vw4_f5@sgarzare-redhat>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
 <20261124-vsock-dgram-support-v4-4-3607484e85e8@redhat.com>
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
In-Reply-To: <20261124-vsock-dgram-support-v4-4-3607484e85e8@redhat.com>

On Tue, Nov 24, 2026 at 01:20:22PM +0100, Sergio Lopez wrote:
>Advertise VIRTIO_VSOCK_F_DGRAM and record whether the device
>negotiated it. Gate datagram socket initialization and destination
>checks on the negotiated feature and the transport's supported network
>namespace mode.
>
>Perform device capability checks at socket creation without requiring
>a remote address, which is not yet known for an unconnected datagram
>socket. The common virtio implementation provides the datagram data
>path.
>
>Discard received datagrams when the device has not negotiated support,
>including when a socket was initialized through another transport.
>Reject packets addressed to a different CID using the full 64-bit wire
>value before bound-socket lookup narrows it or matches a wildcard.
>
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
> net/vmw_vsock/virtio_transport.c | 50 +++++++++++++++++++++++++++++++++++++---
> 1 file changed, 47 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 4f9aa9c4c3aa..fd10f20d7611 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -57,6 +57,7 @@ struct virtio_vsock {
>
> 	u32 guest_cid;
> 	bool seqpacket_allow;
>+	bool dgram_allow;
>
> 	/* These fields are used only in tx path in function
> 	 * 'virtio_transport_send_pkt_work()', so to save
>@@ -547,6 +548,18 @@ bool virtio_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
>
> static bool virtio_transport_seqpacket_allow(struct vsock_sock *vsk,
> 					     u32 remote_cid);
>+static bool virtio_transport_dgram_allow_check(struct vsock_sock *vsk,
>+					       u32 cid, u32 port);
>+
>+static int virtio_transport_socket_init(struct vsock_sock *vsk,
>+					struct vsock_sock *psk)
>+{
>+	if (sk_vsock(vsk)->sk_type == SOCK_DGRAM &&
>+	    !virtio_transport_dgram_allow_check(vsk, 0, 0))
>+		return -ESOCKTNOSUPPORT;
>+
>+	return virtio_transport_do_socket_init(vsk, psk);
>+}
>
> static bool virtio_transport_has_remote_cid(struct vsock_sock *vsk, u32 cid)
> {
>@@ -561,7 +574,7 @@ static struct virtio_transport virtio_transport = {
> 		.get_local_cid            = virtio_transport_get_local_cid,
> 		.has_remote_cid           = virtio_transport_has_remote_cid,
>
>-		.init                     = virtio_transport_do_socket_init,
>+		.init                     = virtio_transport_socket_init,
> 		.destruct                 = virtio_transport_destruct,
> 		.release                  = virtio_transport_release,
> 		.connect                  = virtio_transport_connect,
>@@ -571,7 +584,7 @@ static struct virtio_transport virtio_transport = {
> 		.dgram_bind               = virtio_transport_dgram_bind,
> 		.dgram_dequeue            = virtio_transport_dgram_dequeue,
> 		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>-		.dgram_allow              = virtio_transport_dgram_allow,
>+		.dgram_allow              = virtio_transport_dgram_allow_check,

IMO we should remove virtio_transport_dgram_allow() and implement it in 
every virtio transport.

>
> 		.stream_dequeue           = virtio_transport_stream_dequeue,
> 		.stream_enqueue           = virtio_transport_stream_enqueue,
>@@ -629,6 +642,25 @@ virtio_transport_seqpacket_allow(struct vsock_sock *vsk, u32 remote_cid)
> 	return seqpacket_allow;
> }
>
>+static bool
>+virtio_transport_dgram_allow_check(struct vsock_sock *vsk, u32 cid, u32 port)
>+{
>+	struct virtio_vsock *vsock;
>+	bool dgram_allow;
>+
>+	if (!vsock_net_mode_global(vsk))
>+		return false;
>+
>+	dgram_allow = false;
>+	rcu_read_lock();
>+	vsock = rcu_dereference(the_virtio_vsock);
>+	if (vsock)
>+		dgram_allow = vsock->dgram_allow;
>+	rcu_read_unlock();
>+
>+	return dgram_allow;
>+}
>+
> static void virtio_transport_rx_work(struct work_struct *work)
> {
> 	struct virtio_vsock *vsock =
>@@ -677,6 +709,14 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 				continue;
> 			}
>
>+			/* Check the full wire CID before socket lookup truncates it. */
>+			if (le16_to_cpu(hdr->type) == VIRTIO_VSOCK_TYPE_DGRAM &&

Why only for DGRAM? What issues are we fixing?

>+			    (!vsock->dgram_allow ||
>+			     le64_to_cpu(hdr->dst_cid) != vsock->guest_cid)) {
>+				kfree_skb(skb);
>+				continue;
>+			}
>+
> 			if (payload_len)
> 				virtio_vsock_skb_put(skb, payload_len);
>
>@@ -835,6 +875,9 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
> 	if (virtio_has_feature(vdev, VIRTIO_VSOCK_F_SEQPACKET))
> 		vsock->seqpacket_allow = true;
>
>+	if (virtio_has_feature(vdev, VIRTIO_VSOCK_F_DGRAM))
>+		vsock->dgram_allow = true;
>+
> 	vdev->priv = vsock;
>
> 	ret = virtio_vsock_vqs_init(vsock);
>@@ -932,7 +975,8 @@ static struct virtio_device_id id_table[] = {
> };
>
> static unsigned int features[] = {
>-	VIRTIO_VSOCK_F_SEQPACKET
>+	VIRTIO_VSOCK_F_SEQPACKET,
>+	VIRTIO_VSOCK_F_DGRAM,

BTW I'm confused about the order of patches. The previous patch enables 
dgram unconditionally, here we are checking the feature. IMO we should 
first have patches to implement everything, just at end enables it.

Thanks,
Stefano

