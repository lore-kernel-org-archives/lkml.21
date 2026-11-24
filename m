Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522901;
	b=wrirIyPkaniayrro9G782lrd2GQkYwJmH5Dr4d5CFADj0e34g7R1EUVXpmRMDtt+j/f3
	 aQV0wZne1khafuEP/IhBpuPGghcPfrizHJ5gG6/ckUs/HmKn2w42vC1LHVwexfGKzQLf8
	 ZwtT/UKub4NZSRXczgg19SJiCqLCnx0UQEbvBTqpIhWG3GOqAaI66ZFgy9VuTLFDrZqa1
	 qul1XACiyF5RuABXLGFY5b+T6BsyXKTHwXDghXtlppLQjG21g0redyYjfTi9+NcKzAKTX
	 wk2KVIGuMKLmpGD3USyknQ90UXbcrsOheJ2ZM+ZHLP9/V5Ml6jJ33uB/xHsPRVVTY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522901;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ip7OqnOPWA382+L4zd800WcdSezVmBpGTHBVFqhAjEc=;
	b=pZlip3njMMtUQOv+VgqKUPwYWViCd3bnFHudoLxkRUEzlDnSECo81Ttp3A4MIeN2iQ1X
	 lLjxmGdMAfQuJSPWGJSlz70dcrjN7AC2X4LekYUtrmnwz0hn7GUdxNLlsM7fp99G0Lb7W
	 t3Wcyb0UnWj4D8RQizTAWPfMS5KGsewCfovkqQDf6+Tg7ZcIPg5WY651EzlaETAE5+gq3
	 LM07X2mficB4bCJCO+NWS7a5YGWu+y4pNzPVdrkS/VgGf8JObnchX3GfsosYGrCXKIpEJ
	 7VBS+DGpwz0GQUlRftfK6SHrg1aNp8Ko7Ty1WXFou+MjdxHijw4ri9P90phyH68114Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Por9bv2F;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sHF89bxL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92E606A6A2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E92E606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Por9bv2F;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sHF89bxL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795522900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ip7OqnOPWA382+L4zd800WcdSezVmBpGTHBVFqhAjEc=;
	b=Por9bv2FJLgAWOA0M44gXb1igP4iErE4tVZGGJywO4FUuCyfPFcKrbNAnnQrIKTrNS0mlG
	aauliuXsmg2zKZwPUG3uVcN6nlL92Y3B5DA/tFUvlYd6ySfCHj/azEQtBbh8TjjtVJmXIT
	Ol/oye8JCWqXShIwO/JQj+NXstKn7HA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-0oO9xO9NOLuqwWoDMotyJQ-1; Tue, 24 Nov 2026 12:21:38 +0000
X-MC-Unique: 0oO9xO9NOLuqwWoDMotyJQ-1
X-Mimecast-MFC-AGG-ID: 0oO9xO9NOLuqwWoDMotyJQ_1795522898
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fcb657f32so2642674f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795522897; x=1796127697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ip7OqnOPWA382+L4zd800WcdSezVmBpGTHBVFqhAjEc=;
        b=sHF89bxLtGdulUqN+SzMzMXmA9FDiK0aVS0TfSnxykt1+WHh8y+6kejQerEx2IowB3
         YXjqI7YcYnep24ypAPoclM5sEpokGTAyPWm6IguwBOG+tX8gLh4hMlM8zvIhualJd1yi
         YYY8G+GgdiYHd3XXYytoDAbh4oVIu/1/qSlxCEeH4NnOyximEpzAlz0152pSu8TGIep9
         upaxfSuksc4yHnBhHwIIGFIUHrNHPIVhAV4gIzPhR7J5nhguSr9Em7p8fPrhPBqB4Za8
         9p5hHk58LpxjruL/Qd3TkLFTzveqDXoXC8amSsCrWIhYSWZJTPYyN/443JtHb7PhFqE9
         eCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522897; x=1796127697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ip7OqnOPWA382+L4zd800WcdSezVmBpGTHBVFqhAjEc=;
        b=GNYZWbBBOnKlBmajhSpotc4Bpn1XJIVIsRo6Nd8m/A01BvrYiiifElba3yOtasJ+6i
         pKi2XA7+oy0K3i6HCBot1sZT2Q53oqVClZEvbsxO2wa9kL0QSO/nb5LE4agpSdKKGn5e
         7Ft1MSYRGcPwr55K7izPYxKqIDb064AqLUPpDjSGGvGvpYVPywzWKrwFdobJXNm2OSpq
         BojQtSQsEhDoBOZc8YLe7Hj2aXxaHBd22R7xqBG07ThSAGtxSEtmPdBRhCk3T0XMj5FJ
         a+gv9NCoCUdx/OT5iEv3vSuISfgXo1vv8Hp9hlGonWwwNrTtymVVCcxB3xdp1ICDqgRj
         bACw==
X-Forwarded-Encrypted: i=1; AL+hErHxBg/dPR3C5pmQKxXF+7y/w3bR4NLJ0P//7cHYBB2wOVeZl4wm92sqK//Am03n7YycBRzZwAh+Zqum1Os=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ssEsIcQ/1mvkZ1ihrYg6a4SjKPvtAWAI3oltj0Xy4vvNIBTjF
	MSQoCUB4KfSg3pmuSVtZzMg3dCAz1lxFnVLJTp1QKCDGk+M6X7oQa4yJ1k4I5VjUa4I2qpiathV
	sROs9JoflD9tDqQ6uYV2SZOqUHB/Za2YpSH4FJXa6nm7tfG5jDxGbdn7/XdZ7UsIkcg==
X-Gm-Gg: AZFdTZcWkDwhm4qKX1mcM/qXZ1Y52A7SaLN8ntr0bYftH0UENhg1Z2K/2cRMLiDNWJT
	v95ixt0zoTz8HXmtP+G6MLNcHxKdxL/aNEGDKvBjbmfJOOZ42QCnj5gb3NN8P90RYbiE+0MR+u5
	bMVRrwwKP7vOeZStw3o1l9aGHtiZYQe8z16CnZELXicbsTlK6JoNG0JTeABTtGInkpbArR/v1y9
	NpBsfQNceNxZ+WokjLQ8lLPmfIGYkBfJ6YHmNzVB6SKvGsxNUIjZe4vT9olq3+vXQUeyB1gVU1l
	r46UbovUeJAXsp1FMBTsNwlueXc/l0ggXnFtB57H7pAvNLH9Tbq/3oMvqiSRniLH2sjPZpb6+LI
	4Pns2bQLhz6j2KisziMYeWiwfA62ejquiWC7LTLRjF/INmIi73feB/NRjiYkWMl+Tl8e838J/pb
	4n8NJPdjA7Ops=
X-Received: by 2002:a05:6000:2905:b0:4aa:842f:5f84 with SMTP id ffacd0b85a97d-4abb692ff67mr28830245f8f.42.1795522897483;
        Tue, 24 Nov 2026 04:21:37 -0800 (PST)
X-Received: by 2002:a05:6000:2905:b0:4aa:842f:5f84 with SMTP id ffacd0b85a97d-4abb692ff67mr28830168f8f.42.1795522897020;
        Tue, 24 Nov 2026 04:21:37 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm22753198f8f.35.2026.11.24.04.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:21:36 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Tue, 24 Nov 2026 13:20:21 +0100
Subject: [PATCH RFC v4 3/8] vsock/virtio: implement the datagram data path
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-vsock-dgram-support-v4-3-3607484e85e8@redhat.com>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
In-Reply-To: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sashiko AI bot <sashiko-bot@kernel.org>, 
 Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11186; i=slp@redhat.com;
 h=from:subject:message-id; bh=HDuvzaYHkUWJ5X9Jj1YzuMXhUH5TfX/ACn0pbY3JQnw=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBrBYFEq4NI9cIH6KwVAOtJYrEsDH7e2Sj64n1b8
 LbKoRCq6sqJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCawWBRAAKCRD0aSeNLwwC
 Na76EACbRjtBf90pEXGErafhkC9sRYh8KRH27m1CIzV9QfwL8lPpXmsJ2uxabKmxcU8MuXnmd+0
 vYHJ0izYz7YQCtrON+Um70mH9xA0GSmKnEkdFuenpvY0D4mMx42hUqVNTwB2UaOXCvRqR/3KE+n
 Gkv3e9FdAYUIRcPC6SwSc+Ix0q4xfsxZiSoZpdaJefv3zQELXrTxtMb9wQ1Un/skGOiun5l2jXJ
 JPRB7pFVDY8nLoFEfR8Ptq+AhMisKJ/EGpKnVG+xYk/blGsi2SqIOL1BHqpliJ3r7aiNASB4+BT
 AXHLeqwYkZ8896VYaGdft6306JbaZWqFaCQB5tvVFNjHLhaIbRMb3ZPlfbrwGcf4EaMrMVbhRr4
 wDU06CvauUIS/dPqSD9UldJhl6mzkMWXm5e65jjnBH2Z5uQw3LrWAM8h4MOnbJZGHsgJHligI4l
 r7h3llMoTWXQf9bhYGpptNG1nZgsT3q256Ts3pYivDSiEpZ7QC110wObzJHOZ1uLFEXajRo3Mt0
 JcsXZMRrNQE6l1KuJLxtaoQHsJ+R3oEJOor64wwjRrjKjfAjTsjN0QzW5n8FNoUZQCh3hDSzFnA
 bUPpQ03Fa3uNsWxEYE6bEYXpEo0HKpEMxUKc6ipChRoX8fFzKStwwn42NjVGeAfWVP+AUcPa8Fa
 uuUA1/Vb2MY051Q==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

Add the datagram feature bit and packet type, and implement the common
virtio transport operations needed to bind, send, and receive
datagrams.

Send each message as an OP_RW packet with a maximum 64 KiB payload,
including support for empty messages. Bound pending sends by the
socket send buffer instead of connection-oriented peer credits. Use
the socket's skb memory charge for datagram SIOCOUTQ, including empty
messages, and release it through the normal skb ownership lifetime on
completion, rejection, or queued drops.

Deliver incoming datagrams through the datagram bound-socket lookup
without entering the connection state machine. Connection-oriented
receive lookup excludes datagram sockets, so each class can use the
same destination CID and port. Validate the transport and connected
peer under the socket lock, including after shutdown, and silently
discard undeliverable messages. Use the socket datagram queue for
recvmsg(), including source addresses, peeking, and truncation
reporting based on the payload length after socket filtering. Reject
MSG_OOB and MSG_ERRQUEUE before accessing the receive queue. Reject
datagram sockmap admission until its receive callbacks support it.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 include/uapi/linux/virtio_vsock.h       |   2 +
 net/vmw_vsock/af_vsock.c                |  31 +++++---
 net/vmw_vsock/virtio_transport_common.c | 132 ++++++++++++++++++++++++++++----
 net/vmw_vsock/vsock_bpf.c               |   3 +-
 4 files changed, 140 insertions(+), 28 deletions(-)

diff --git a/include/uapi/linux/virtio_vsock.h b/include/uapi/linux/virtio_vsock.h
index 64738838bee5..27b4b2b8bf13 100644
--- a/include/uapi/linux/virtio_vsock.h
+++ b/include/uapi/linux/virtio_vsock.h
@@ -40,6 +40,7 @@
 
 /* The feature bitmap for virtio vsock */
 #define VIRTIO_VSOCK_F_SEQPACKET	1	/* SOCK_SEQPACKET supported */
+#define VIRTIO_VSOCK_F_DGRAM		3	/* SOCK_DGRAM supported */
 
 struct virtio_vsock_config {
 	__le64 guest_cid;
@@ -69,6 +70,7 @@ struct virtio_vsock_hdr {
 enum virtio_vsock_type {
 	VIRTIO_VSOCK_TYPE_STREAM = 1,
 	VIRTIO_VSOCK_TYPE_SEQPACKET = 2,
+	VIRTIO_VSOCK_TYPE_DGRAM = 3,
 };
 
 enum virtio_vsock_op {
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 8a271eb66860..aef5389eeca2 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1659,20 +1659,27 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
 	case SIOCOUTQ: {
 		ssize_t n_bytes;
 
-		if (!vsk->transport || !vsk->transport->unsent_bytes) {
-			ret = -EOPNOTSUPP;
-			break;
-		}
+		if (sk->sk_type == SOCK_DGRAM) {
+			/* Match UDP: report charged send memory, including skb
+			 * overhead and empty datagrams.
+			 */
+			n_bytes = sk_wmem_alloc_get(sk);
+		} else {
+			if (!vsk->transport || !vsk->transport->unsent_bytes) {
+				ret = -EOPNOTSUPP;
+				break;
+			}
 
-		if (sock_type_connectible(sk->sk_type) && sk->sk_state == TCP_LISTEN) {
-			ret = -EINVAL;
-			break;
-		}
+			if (sk->sk_state == TCP_LISTEN) {
+				ret = -EINVAL;
+				break;
+			}
 
-		n_bytes = vsk->transport->unsent_bytes(vsk);
-		if (n_bytes < 0) {
-			ret = n_bytes;
-			break;
+			n_bytes = vsk->transport->unsent_bytes(vsk);
+			if (n_bytes < 0) {
+				ret = n_bytes;
+				break;
+			}
 		}
 
 		ret = put_user(n_bytes, arg);
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 1e762a480df4..08baa1181ba6 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -204,6 +204,8 @@ static u16 virtio_transport_get_type(struct sock *sk)
 {
 	if (sk->sk_type == SOCK_STREAM)
 		return VIRTIO_VSOCK_TYPE_STREAM;
+	else if (sk->sk_type == SOCK_DGRAM)
+		return VIRTIO_VSOCK_TYPE_DGRAM;
 	else
 		return VIRTIO_VSOCK_TYPE_SEQPACKET;
 }
@@ -303,6 +305,7 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 	u32 src_cid, src_port, dst_cid, dst_port;
 	const struct virtio_transport *t_ops;
 	struct iov_iter_state msg_iter_state;
+	struct sock *sk = sk_vsock(vsk);
 	struct virtio_vsock_sock *vvs;
 	struct ubuf_info *uarg = NULL;
 	u32 pkt_len = info->pkt_len;
@@ -327,14 +330,27 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 		dst_port = info->remote_port;
 	}
 
-	vvs = vsk->trans;
+	/* Datagram sends use socket memory accounting instead of peer credits. */
+	vvs = info->type == VIRTIO_VSOCK_TYPE_DGRAM ? NULL : vsk->trans;
 
-	/* virtio_transport_get_credit might return less than pkt_len credit */
-	pkt_len = virtio_transport_get_credit(vvs, pkt_len);
+	if (info->type == VIRTIO_VSOCK_TYPE_DGRAM) {
+		if (pkt_len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE)
+			return -EMSGSIZE;
 
-	/* Do not send zero length OP_RW pkt */
-	if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
-		return pkt_len;
+		/* Datagram sends are serialized by the socket lock. */
+		if (sk_wmem_alloc_get(sk) >= READ_ONCE(sk->sk_sndbuf)) {
+			sk_set_bit(SOCKWQ_ASYNC_NOSPACE, sk);
+			set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
+			return -EAGAIN;
+		}
+	} else {
+		/* virtio_transport_get_credit might return less than pkt_len credit */
+		pkt_len = virtio_transport_get_credit(vvs, pkt_len);
+
+		/* Do not send zero length OP_RW pkt */
+		if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
+			return pkt_len;
+	}
 
 	if (info->msg && (info->msg->msg_flags & MSG_ZEROCOPY)) {
 		/* If 'info->msg' is not NULL, this is only VIRTIO_VSOCK_OP_RW.
@@ -348,7 +364,8 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 			uarg = msg_zerocopy_realloc(sk_vsock(vsk), pkt_len,
 						    NULL, false);
 			if (!uarg) {
-				virtio_transport_put_credit(vvs, pkt_len);
+				if (info->type != VIRTIO_VSOCK_TYPE_DGRAM)
+					virtio_transport_put_credit(vvs, pkt_len);
 				return -ENOMEM;
 			}
 
@@ -393,7 +410,8 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 			break;
 		}
 
-		virtio_transport_inc_tx_pkt(vvs, skb);
+		if (info->type != VIRTIO_VSOCK_TYPE_DGRAM)
+			virtio_transport_inc_tx_pkt(vvs, skb);
 
 		ret = t_ops->send_pkt(skb, info->net);
 		if (ret < 0)
@@ -416,7 +434,8 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 	if (info->msg && ret < 0)
 		iov_iter_restore(&info->msg->msg_iter, &msg_iter_state);
 
-	virtio_transport_put_credit(vvs, rest_len);
+	if (info->type != VIRTIO_VSOCK_TYPE_DGRAM)
+		virtio_transport_put_credit(vvs, rest_len);
 
 	/* msg_zerocopy_realloc() initializes the ubuf_info refcnt to 1.
 	 * skb_zcopy_set() increases it for each skb, so we can drop that
@@ -620,7 +639,7 @@ void virtio_transport_consume_skb_sent(struct sk_buff *skb, bool consume)
 {
 	struct sock *s = skb->sk;
 
-	if (s && skb->len) {
+	if (s && skb->len && s->sk_type != SOCK_DGRAM) {
 		struct vsock_sock *vs = vsock_sk(s);
 		struct virtio_vsock_sock *vvs;
 
@@ -999,7 +1018,47 @@ virtio_transport_dgram_dequeue(struct vsock_sock *vsk,
 			       struct msghdr *msg,
 			       size_t len, int flags)
 {
-	return -EOPNOTSUPP;
+	struct sock *sk = sk_vsock(vsk);
+	struct virtio_vsock_hdr *hdr;
+	struct sk_buff *skb;
+	size_t payload_len;
+	int err;
+
+	if (flags & (MSG_OOB | MSG_ERRQUEUE))
+		return -EOPNOTSUPP;
+
+	skb = skb_recv_datagram(sk, flags, &err);
+	if (!skb)
+		return err;
+
+	hdr = virtio_vsock_hdr(skb);
+	payload_len = skb->len;
+
+	if (payload_len > len) {
+		payload_len = len;
+		msg->msg_flags |= MSG_TRUNC;
+	}
+
+	err = skb_copy_datagram_iter(skb, 0, &msg->msg_iter, payload_len);
+	if (err)
+		goto out;
+
+	if (msg->msg_name) {
+		DECLARE_SOCKADDR(struct sockaddr_vm *, vm_addr, msg->msg_name);
+
+		vsock_addr_init(vm_addr, le64_to_cpu(hdr->src_cid),
+				le32_to_cpu(hdr->src_port));
+		msg->msg_namelen = sizeof(*vm_addr);
+	}
+
+	if (flags & MSG_TRUNC)
+		err = skb->len;
+	else
+		err = payload_len;
+
+out:
+	skb_free_datagram(sk, skb);
+	return err;
 }
 EXPORT_SYMBOL_GPL(virtio_transport_dgram_dequeue);
 
@@ -1202,13 +1261,13 @@ EXPORT_SYMBOL_GPL(virtio_transport_stream_is_active);
 int virtio_transport_dgram_bind(struct vsock_sock *vsk,
 				struct sockaddr_vm *addr)
 {
-	return -EOPNOTSUPP;
+	return vsock_bind_common(vsk, addr);
 }
 EXPORT_SYMBOL_GPL(virtio_transport_dgram_bind);
 
 bool virtio_transport_dgram_allow(struct vsock_sock *vsk, u32 cid, u32 port)
 {
-	return false;
+	return true;
 }
 EXPORT_SYMBOL_GPL(virtio_transport_dgram_allow);
 
@@ -1246,7 +1305,17 @@ virtio_transport_dgram_enqueue(struct vsock_sock *vsk,
 			       struct msghdr *msg,
 			       size_t dgram_len)
 {
-	return -EOPNOTSUPP;
+	struct virtio_vsock_pkt_info info = {
+		.op = VIRTIO_VSOCK_OP_RW,
+		.msg = msg,
+		.pkt_len = dgram_len,
+		.vsk = vsk,
+		.remote_cid = remote_addr->svm_cid,
+		.remote_port = remote_addr->svm_port,
+		.net = sock_net(sk_vsock(vsk)),
+	};
+
+	return virtio_transport_send_pkt_info(vsk, &info);
 }
 EXPORT_SYMBOL_GPL(virtio_transport_dgram_enqueue);
 
@@ -1771,7 +1840,8 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
 static bool virtio_transport_valid_type(u16 type)
 {
 	return (type == VIRTIO_VSOCK_TYPE_STREAM) ||
-	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET);
+	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET) ||
+	       (type == VIRTIO_VSOCK_TYPE_DGRAM);
 }
 
 /* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
@@ -1805,6 +1875,38 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
 		goto free_pkt;
 	}
 
+	/* Dgram packets are delivered directly to bound sockets without
+	 * going through the connection state machine. Undeliverable
+	 * datagrams are silently dropped (no RST).
+	 */
+	if (le16_to_cpu(hdr->type) == VIRTIO_VSOCK_TYPE_DGRAM) {
+		if (le16_to_cpu(hdr->op) != VIRTIO_VSOCK_OP_RW)
+			goto free_pkt;
+
+		sk = vsock_find_bound_dgram_socket_net(&dst, net);
+
+		if (!sk)
+			goto free_pkt;
+
+		vsk = vsock_sk(sk);
+		lock_sock(sk);
+		if (sock_flag(sk, SOCK_DEAD) ||
+		    vsk->transport != &t->transport ||
+		    (sk->sk_socket->state != SS_UNCONNECTED &&
+		     !vsock_check_source(vsk, &t->transport, &src))) {
+			release_sock(sk);
+			sock_put(sk);
+			goto free_pkt;
+		}
+
+		if (sock_queue_rcv_skb(sk, skb))
+			kfree_skb(skb);
+
+		release_sock(sk);
+		sock_put(sk);
+		return;
+	}
+
 	/* The socket must be in connected or bound table
 	 * otherwise send reset back
 	 */
diff --git a/net/vmw_vsock/vsock_bpf.c b/net/vmw_vsock/vsock_bpf.c
index 9049d2648646..296e1fa7970b 100644
--- a/net/vmw_vsock/vsock_bpf.c
+++ b/net/vmw_vsock/vsock_bpf.c
@@ -161,7 +161,8 @@ int vsock_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore
 	if (!vsk->transport)
 		return -ENODEV;
 
-	if (!vsk->transport->read_skb)
+	/* Datagram receive is not implemented by the sockmap callbacks. */
+	if (sk->sk_type == SOCK_DGRAM || !vsk->transport->read_skb)
 		return -EOPNOTSUPP;
 
 	vsock_bpf_check_needs_rebuild(psock->sk_proto);

-- 
2.56.0

