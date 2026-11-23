Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450855;
	b=QAumJPl6Ih/SAzxva7LH1vPS8DUTrfH5+T7Z5dilMUvXSjCbH5iPHQNEQjfHRUenkOiP
	 fxEx1GUoXGi40+WTywoseAVviXJMQOwAUnMyVD0vRrDNkPk/ALhDbWDro7rH8nbOrEbrW
	 p1ZYXWREb1b6Z2u5DAp6kiCM2U26IXNxAJj+oJNVQwG+ycmANU4wh57LrIc6U134lAncL
	 otkkz5/i9L/HvoGNdmHYDrInuiqwE8Jv3+bonsR8fntYKzV8dFM+cAfpNEUOcvzfuCwAX
	 roA7Kq4O6ehpF6c6297TURz5dk6n+BPb9PJd5gjTUuevSmcb9Lkl+mG+t6icZjYebTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450855;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OMtq5aBML9D8zyZzLVDbeex6HGKBk1QCt6vR9V0tuYU=;
	b=VMzNUHlr3BO3TpnBRMZGKvCU23969ecjOs+xYmZdjnnroHGBLVzGF7kvOeALN5NIU86c
	 xZndpEsCQGirOUhxoGaEh/xTGre1zvD675Cig5WDxEdEdpFENzpDF+a48TeKIJNbWJSTN
	 HqalgMmvjooqlzgL/QUz+m3g2laiHw4WVg0l86DZUSTCyAkvItqtJ7+dptmwHhDg+lEKw
	 b6Vqd0due2c22/+lm0Z+nfZ5bppa9JjHNOs4Tllzk7nhYenrg5E2m1LI+HzIbjJCIRgzG
	 Tph+dNuepHPio/aV1EdI9fJdpgcEnC74dFxkCQFeD5/FTu6LqBGMjpAuQvESZC5dZyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ryw0eabE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bUzFLfz7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB833606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB833606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ryw0eabE;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bUzFLfz7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795450853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OMtq5aBML9D8zyZzLVDbeex6HGKBk1QCt6vR9V0tuYU=;
	b=Ryw0eabEgPGuOSZzVXRN6BfZDCget4nrLvTEhf6Ht/8aadAFVmfwlGJCSaVjnOibH2JCtE
	5NFuU+ZY9UrFKE3FU7QVzBRMwIxOnu4Q7KbG2TjnM3BfhnWNkcP/7aPxbHg9geMzYH+KJx
	pLCHZgEnKl3XJqL4YNW2vdykqgMCceo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-53dRhKhSM1iJrUUPqbutFw-1; Mon, 23 Nov 2026 16:20:51 +0000
X-MC-Unique: 53dRhKhSM1iJrUUPqbutFw-1
X-Mimecast-MFC-AGG-ID: 53dRhKhSM1iJrUUPqbutFw_1795450851
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso1832480f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795450851; x=1796055651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OMtq5aBML9D8zyZzLVDbeex6HGKBk1QCt6vR9V0tuYU=;
        b=bUzFLfz74y5qbCVGHjDhYxEeigC9aluW+HztuPAdq6hFzOqtRKHTLhHflo4IUPnUeY
         mW19uZKUQxKJfnkMKlvmEa8N8oaM4GsEYK103xruhls/JD5evz4v0DRnZfkM7oc4UPcM
         d93andd6WDsPFdoE3mrK2vW7lheN1Kg/Njm7J1UoYFLDCLSlROCmSuZRK/7b30t9ML9n
         N6Maf5faXrPHKvnCTCRv2kOK5XqBqZYcl1iFsgeIlDiXtnmIpEfFoeou0TyTcVKzXBM5
         30O70kW3LUdx5NsFrrEnX6ObGQygOQUw5AcEjBOZr/mICWP8qiXSEXVFrRHISjX5+GJn
         hVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450851; x=1796055651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMtq5aBML9D8zyZzLVDbeex6HGKBk1QCt6vR9V0tuYU=;
        b=o6yOog444xOFDTG8WspoYNfQu5sE9Mm+cTx252kXb2wqGxpi71eLg7J+R+IKiKi+s+
         M4ATJIsiHA6cpYPXMwCSJ/hkUn1BZ5Oj1J4XHaRfiQureyfghc2XVsYqEJiCzSI9aApj
         5QjLRyPhOAmpgjgc3g79lQ90OvfTUXiDFnDnlUvMdFxoNhLYiW3z0wtOg8zV6kccpkhw
         b3ccb5SznSiywoDTvWdLf+8A/ZIS2fuvFAdmxTeV6ss942oCYAm4iBJAN3HGg0plVoCr
         u1n+WeHgjaJsIj6c2O9i93xh3GbYIVfOVOSE0jS/6KbhQmpqg0q9IpZiRr7lpvgGinhZ
         szvg==
X-Forwarded-Encrypted: i=1; AL+hErEshWsHDDAQS+Kzua0pdFsJI1YvClFU/cFKCkl5jp3VwNx1/ObwaKv6eVwje0FFPuo+J+JvDun1fhoqfb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ttb3P2nzqsNH4KnJuY0ZharDpofibWaDw9lJSChAtKOf91o3/
	sq5GDzctobdlEFHnBfn+pmTORVEhrCYkU9Kq0cw2GeWdKaT3wXjCIXQHiTgE3y8Pty7ixMU7zYL
	4Eg2ad4XKL3MEu2yOTRVMbQr8D/RoS/s02i4QPUMBMm1SERhzmXktCxY1Ro0t5hLe9Q==
X-Gm-Gg: AZFdTZePKHhqmuYzEPIc3inqXgVm/Bx8f/V2Q14TijG6TPlbSlDFlAOzUSyviSNGz5y
	1O/zsZZVIstmzuuHxhKYEShHKk/HCaYzzXwywXQ0+2vXGjgdthp4sf3Oxz0UwIy4ZG+rrHoHRA8
	MLwLy8hIDdNeRuL+iPbQnkaYsrUHE1RZDptKG6NeOOw8nlAAGo9aGUJ6m5IRCQ1+xA5R1LLzii0
	Pi1cCE7wZtbetWZ5pHNrEuXebe0XvWR+f33pHyoVALwCLzKYiiXHnXhy4CUlR+/JKZB42wNZRDq
	6QlCHjiXL7jnkmbgRhT/pIvY+Eet0102LWPFKOOL2aLzLS5Lnatj56KR7KYE/nZgobo73CtYkum
	+OdvIIwjFdtB1DGHqh24z/Zn5X+pafz+8zPhdUPI1vgk1kf25iTCa+A==
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr265197945e9.34.1795450850731;
        Mon, 23 Nov 2026 08:20:50 -0800 (PST)
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr265197125e9.34.1795450850173;
        Mon, 23 Nov 2026 08:20:50 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm320400955e9.8.2026.11.23.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:20:49 -0800 (PST)
Date: Mon, 23 Nov 2026 17:20:44 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v6 2/2] vsock/bpf: release sock lock while waiting
 for data in recvmsg
Message-ID: <awRnkbbxYUw-ihGb@sgarzare-redhat>
References: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>
 <20261114-kbh3-1-022-fix-v2-v6-2-96b6029bbffa@eldare.de>
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
In-Reply-To: <20261114-kbh3-1-022-fix-v2-v6-2-96b6029bbffa@eldare.de>

On Sat, Nov 14, 2026 at 12:59:15PM +0100, Jerome Mohm via B4 Relay wrote:
>From: Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>vsock_bpf_recvmsg() sleeps in vsock_msg_wait_data() with the socket lock
>held, so the virtio delivery worker, which needs that lock, deadlocks
>with the reader and all vsock rx on that worker stops.
>
>Release the lock around the wait. The reader can then wake without
>data, so the wait also has to loop; the fix needs both halves. The loop
>ends on data, the timeout, a signal (the sleep returns at once while
>one is pending), a lost transport after a failed connect(), or a state
>in which __vsock_recvmsg() would not wait. Those states go to
>__vsock_recvmsg(), so a non-blocking read now sees them before -EAGAIN.
>A blocking read interrupted by a signal now gets -EINTR, or restarts,
>instead of -EAGAIN. One tested difference remains: a reader asleep at a
>virtio transport reset gets -ENOTCONN, where a native socket gets
>-ECONNRESET (0 on seqpacket).
>
>The deadlock was found with the help of Anthropic's Claude; the netdev
>Sashiko reviews and Alexei found the wakeup, reset, shutdown and
>lost-transport cases. Each was reproduced in a VM without kernel
>changes or error injection (the resets unbind the guest's virtio-vsock
>device), except the lost transport and a SHUT_RD with a pending socket
>error, which were checked only in the code. With this patch the
>reproduced cases behave as on a native socket, apart from the reset. I
>ran the vsock vmtest.sh single-VM tests and the BPF sockmap selftests
>with the series; they pass, though none of them sleeps in this wait.

Ditto about series/patches.

>
>Fixes: 634f1a7110b4 ("vsock: support sockmap")
>Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
>Cc: stable@vger.kernel.org
>Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
>---
> net/vmw_vsock/vsock_bpf.c | 42 +++++++++++++++++++++++++++---------------
> 1 file changed, 27 insertions(+), 15 deletions(-)
>
>diff --git a/net/vmw_vsock/vsock_bpf.c b/net/vmw_vsock/vsock_bpf.c
>index c9b399f37720..41307759da99 100644
>--- a/net/vmw_vsock/vsock_bpf.c
>+++ b/net/vmw_vsock/vsock_bpf.c
>@@ -34,24 +34,37 @@ static bool vsock_has_data(struct sock *sk, struct sk_psock *psock)
> 	return vsock_sk_has_data(sk, psock);
> }
>
>-static bool vsock_msg_wait_data(struct sock *sk, struct sk_psock *psock, long timeo)
>+/* __vsock_recvmsg() doesn't wait in these states. */
>+static bool vsock_rx_done(struct sock *sk)
> {
>-	bool ret;
>+	return sk->sk_err || sk->sk_state != TCP_ESTABLISHED ||
>+	       (sk->sk_shutdown & RCV_SHUTDOWN) ||
>+	       (vsock_sk(sk)->peer_shutdown & SEND_SHUTDOWN);
>+}
>+
>+static int vsock_msg_wait_data(struct sock *sk, struct sk_psock *psock,
>+			       long timeo)
>+{
>+	struct vsock_sock *vsk = vsock_sk(sk);
>+	int ret = 0;
>
> 	DEFINE_WAIT_FUNC(wait, woken_wake_function);
>
>-	if (sk->sk_shutdown & RCV_SHUTDOWN)
>-		return true;
>-
>-	if (!timeo)
>-		return false;
>-
> 	add_wait_queue(sk_sleep(sk), &wait);
> 	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
>-	ret = vsock_has_data(sk, psock);
>-	if (!ret) {
>-		wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
>-		ret = vsock_has_data(sk, psock);

nit: a comment here to explain why a transport can become null would be 
nice.

>+	while (vsk->transport && !vsock_has_data(sk, psock) &&
>+	       !vsock_rx_done(sk)) {
>+		if (!timeo) {
>+			ret = -EAGAIN;
>+			break;
>+		}
>+		if (signal_pending(current)) {
>+			ret = sock_intr_errno(timeo);
>+			break;
>+		}
>+		release_sock(sk);
>+		timeo = wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
>+		lock_sock(sk);
> 	}
> 	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
> 	remove_wait_queue(sk_sleep(sk), &wait);
>@@ -105,10 +118,9 @@ static int vsock_bpf_recvmsg(struct sock *sk, struct msghdr *msg,
> 	while (copied == 0) {
> 		long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
>
>-		if (!vsock_msg_wait_data(sk, psock, timeo)) {
>-			copied = -EAGAIN;
>+		copied = vsock_msg_wait_data(sk, psock, timeo);
>+		if (copied)
> 			break;
>-		}
>
> 		if (sk_psock_queue_empty(psock)) {
> 			release_sock(sk);
>
>-- 
>2.56.0
>
>

I can't see anything wrong, just some nit comments left.

Acked-by: Stefano Garzarella <sgarzare@redhat.com>


