Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861787;
	b=VuRMhAR/nyrYQkhAzDSskAOKyauu4mSjL7bx8WbYBKGQN+OjCOa7CVZ9kS18dUed+rIT
	 aKLtTr2/jDD0ZBZRA2tosswLZyaOLdGKHs81FQdhRBIcvfxNN3KWFqJvyEqcHElAp9gws
	 h5IeIf4Rq9ZI6GK2A9zqk/ajYeFepXXYWxnZDgp0chmUk1DESC9iCAjIWZLQS4lZZdvuY
	 SW7a+uFeIWTJ+FllXBkmACBRWMRgizUN1Da0cj1/0SkYzHczaGLGRJHaDlldPC7xqqVe1
	 XLeTZ2Rc/VkgvJQoCqFuXhiN+VTouhBUi1SRKa3Pbrwzy1QsmRftMLVcLQ1how5buMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OGatrJrhZXZFZnVZkbnTV9agxOCUCnGrI7cV8MvlKDE=;
	b=Mo/vcnOuZkoT7dKQPdHe99ojOEyxmHL/goctx8Fw49UWt0cVvDeW4137ayxJT83u67Rw
	 xu3zDVWEfA13NSFtMNC2qZPPhnE/8mEgldxkCJTrOCWaGRiVWvQ10uHODIbjCi3Cths+N
	 EP1L5+rBrUcgIRFOWf76L1t9eagT5wxRY3essJ2EwKWVscRN7GKnDOSy45HhfXRD4zFvl
	 UQDBGc0LjLR+hlJhrZv9UxOB3AyiN4b7LAii1pQRwfRWHua6N/UHbI7U2APrrZL/EuEcp
	 fYhY71/w9ES1hXLxvnQvkvZRtBXprhjxpgXORFFxD7zvbfEX9wECdbh/NwHE/rP134w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=gjaqfL2K;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE70606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE70606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=gjaqfL2K
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so13824849c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795861786; x=1796466586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGatrJrhZXZFZnVZkbnTV9agxOCUCnGrI7cV8MvlKDE=;
        b=gjaqfL2KXUTBC8khT3KL2f4vZNOwhiZK13vfqZOcFYHE2rWXvMNwHHbNV1iaE9RsQj
         j0TygNNrWk4S1zOQnCLiuXZLJzdyR9k3ZtAsR7vockQLiz3muuuMsAs1opFrDhAL4m/q
         tjk4XJA35Jg0Yynffec7zE/WZ030kngnVAWTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795861786; x=1796466586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGatrJrhZXZFZnVZkbnTV9agxOCUCnGrI7cV8MvlKDE=;
        b=T+LBJY9tL5QLPH9CnBqlI3daDYphuIP+Yu2X8bWNy8UvfYl2v/z3Z6J3qLdSGSbstI
         b550SSwfHy+AHi1ZNre2bQZXFTzja2i0F2Io2zBX5h3qDPGiRrIFGCSyChK8xmiu9/Ru
         MwCGPeoT7R7fExoTInWuv/3yOVXJDJkFM2CaSO3sy9hc0Q9h7wjMi4rnoPgik3BsH7mR
         3PqneAmC8Q/RKL5Mweyf3GkatrFdtBwB9Jvr6LP1jjrk1gClPuXojxcOcljukVfiSKyK
         V8eG95gNzyjwACYvaUO6wm7WVg9MMHLZvwgpjngWsj/tJ3jGTqOPtLM+e2QZOQTMjBBp
         FKhg==
X-Forwarded-Encrypted: i=1; AL+hErEoXKByj/IA0o1bKXNxMtxyvRzMGS2wFt8DOAn1PWYGs0U30G7vWfbHepwnZ97rwcJcIzUAFDg+M0ksMYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q/5FN6FHO7ZuvKLgwi35bQw/m6z+wfFm1m2uy9w6RaYV0ipvr
	5Az2GodsVw2DALD5pe2jo1769F6fXrERu3dv3mAZMsYrMk0BKkzubf4ZnFSQTPnM9g8=
X-Gm-Gg: AZFdTZeCvzz4UazkfrL54pRDS3e1SaENxTOb+r0eJyhvpYed+me8oTsvFepuacvsprp
	EzeY21CXAkflMTSaDU1FKCpJOiZNEXxVJMbTwnxsp1iBR21eo6fakkJYNGVBXlQAN/hcjCaKN9u
	3TnKaWAZM5V601SFrQekBJbttFtrFlLGsSfHC63uDAAgZnSlZO9ZfCcxiuqsCmPz6CF8c+IFz+U
	A3oKEvxJ9LQwGUhvCOSaMqldBbLTtSVAtZV30YLVAUbRheJr8piv4xKTq/UIcWB95kShAYEA40M
	6N9L8l/5P06DgmBc1TW3u5oxWs5JGr53jEK5FOhdo/+u/mVwdeuxdwDYqhgma4dL8oOvt8Fj24J
	R8o7h2wU7z2TlVnS8Hn/pqFQ2ukaoefDvVTJeIkjgpIV0LVFlNmXHeXMTy4pK5N+zuH0RsPN3F1
	4rlVQEf/nQGJ5PkwPg+z+Qrh+XmhcrJMOr3X/k9b2tjkPgozcsuv4TBzgdx9ZR5K4OsSUmBPKMM
	SbaVMUWTIsQ1p8msafDSZp5qftR/QRDOiensNonAMMZQzejmpYmxCrXkg2xrygICrDjFBERT+vO
	en9u+m3MvUBThPfbGbE7Fvj8zeEoIZDMff+kyWM6V0xU7EpLiB/tN3efry1800g3/S+9yVQx0vN
	9LDAMCx6mXjmfdPoOfhopPi2XnF3DfTMrI+QzvpYinu48rjFwOUEKxkyIILFAiVHV
X-Received: by 2002:a05:7022:ed02:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b5568f335cmr25646207c88.24.1795861786405;
        Sat, 28 Nov 2026 02:29:46 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm56407668c88.4.2026.11.28.02.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 02:29:45 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-nfs@vger.kernel.org
Cc: NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [PATCH] SUNRPC: name a listener socket before publishing its transport
Date: Sat, 28 Nov 2026 15:59:40 +0530
Message-Id: <20261128102940.733689-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

svc_addsock() hands the new transport to the service and then reads it
back:

	svc_add_new_perm_xprt(serv, &svsk->sk_xprt);
	return svc_one_sock_name(svsk, name_return, len);

svc_add_new_perm_xprt() puts the transport on sv_permsocks and clears
XPT_BUSY, so an nfsd thread can dequeue it straight away.  The socket
handed in need not be connected: an unbound AF_INET SOCK_STREAM
descriptor passes every check in svc_addsock(), and for such a socket
svc_tcp_init() has already called svc_xprt_deferred_close(), because
sk_state is neither TCP_SYN_RECV nor TCP_ESTABLISHED.  XPT_CLOSE is
therefore set before the transport is ever visible, the dequeuing thread
runs svc_delete_xprt() at once, and that drops the list reference - the
only reference a new transport holds.  The svc_xprt_put() at the end of
svc_xprt_received() is then the last one, so the svc_sock is freed
before svc_add_new_perm_xprt() has returned, and svc_one_sock_name()
reads svsk->sk_sk out of the freed object:

  BUG: KASAN: slab-use-after-free in svc_one_sock_name+0x23/0x150
  Read of size 8 at addr ffff888026d502c0 by task repro/9512
   svc_one_sock_name+0x23/0x150
   svc_addsock+0x38d/0x3a0
   write_ports+0x608/0x9e0
   nfsctl_transaction_write+0xcc/0x110
   vfs_write+0x218/0x810
   ksys_write+0x123/0x200

  Allocated by task 9512:
   __kmalloc_noprof+0x36a/0x720
   svc_setup_socket+0xf4/0xa30
   svc_addsock+0x29b/0x3a0

  Freed by task 9512:
   kfree+0x1c9/0x660
   svc_xprt_put+0x398/0x540
   svc_addsock+0x37b/0x3a0

The free is at svc_addsock+0x37b and the read at svc_addsock+0x38d, in
the same task and the same write(2).  It is reached by writing a
descriptor number to /proc/fs/nfsd/portlist, which
__write_ports_addfd() passes straight to svc_addsock().

Commit ed2849d3ecfa ("sunrpc: prevent use-after-free on clearing
XPT_BUSY") stated the rule - "when a creator clears XPT_BUSY it is
dropping its only reference and so must not touch the xprt again" - and
fixed svc_create_xprt() by reading the port it wanted to return before
publishing the transport.  It only touched svc_xprt.c, so svc_addsock()
kept its dereference-after-publication.

Do the same here.  Before publication the calling thread owns the
transport exclusively, so format the name there.  Nothing between the
two statements changes what svc_one_sock_name() prints, and the
transport is still published when the name does not fit, as before.

Over 500 attempts on v7.4-rc4-00571-g9437ee8b6cf6 with KASAN and
kasan_multi_shot, 483 of which were accepted, this fired 29 times.  With
this patch, 490 accepted attempts produced no KASAN report at all.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.

Fixes: ed2849d3ecfa ("sunrpc: prevent use-after-free on clearing XPT_BUSY")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/sunrpc/svcsock.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 498c5096eef9..3482ae59d8a0 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -1660,8 +1660,16 @@ int svc_addsock(struct svc_serv *serv, struct net *net, const int fd,
 	if (salen >= 0)
 		svc_xprt_set_local(&svsk->sk_xprt, sin, salen);
 	svsk->sk_xprt.xpt_cred = get_cred(cred);
+
+	/*
+	 * Format the name while this thread still owns the transport
+	 * exclusively.  svc_add_new_perm_xprt() clears XPT_BUSY, and an
+	 * nfsd thread can then delete and free the transport before
+	 * svc_add_new_perm_xprt() has returned.
+	 */
+	err = svc_one_sock_name(svsk, name_return, len);
 	svc_add_new_perm_xprt(serv, &svsk->sk_xprt);
-	return svc_one_sock_name(svsk, name_return, len);
+	return err;
 out:
 	sockfd_put(so);
 	return err;
-- 
2.34.1

