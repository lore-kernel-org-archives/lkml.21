Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861782;
	b=EeIKXnI4ivdXMJushHyuiOCRPpbVjanETeRuxHVD/MKXU0b07hWGTGc1BOr5BbN4WjGv
	 UpJWrwAi6epnSuYNKq2pz6XOoccrVl+uj6LMFY80fwGwryS29dF19b2vKG537L9sCs3qj
	 xSOtybEseTdXK/kCD21DiY7jkgrP9j+lRghhkj5CKjEAKTmy1atJ+2EJ3/IlV/sBWmLeM
	 iKANoI5p8DiW9ELqtrzVRZ4jcS6OS8stCawg9EpZ3NY6E0J8fTul7DNrwIs70nLKr9FQ+
	 QV4/16AZD/gy4iV+dcdwX3RGqM5Gj58CtcFFidBzZtPqJgIS5+BfuJR/ulncylFY2Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yfk+itu/miNKmAfINwyWiMzT+wuiKggJHRBWRDC8lIM=;
	b=cYZ54hh0OqSvv0YgjgM01WoKX89mthi7LAyc7wYcPnw8C1q26GepmUCmV+Rx16i/j578
	 iXAN0UQf1Io8n2dMR+li6uWLPD0EDzPOt8G1o76hja4mGykTT8fQGjBeHoSgLBT59aBGR
	 fA/27H/X9l/Kh9eXiiOhYnqcARtX2haRlygR2RYrnCXeTxaEhF5zns6EvQxxJcLr3yI/u
	 6BnUSdg1C7PlZXRLMoOCNBLHxGc3ZLTixW67nF2f2upAwcnGLyoDx9IqqhHfq8ssGTdgw
	 4hbMdUU7siClMMc8goixSGeCdoj+g5huweoV8KGoXsRt+B2XPoChlDfMCeAXg5DVFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=BSeANsyf;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB047606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB047606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=BSeANsyf
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386bd881d39so10881978eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795861780; x=1796466580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yfk+itu/miNKmAfINwyWiMzT+wuiKggJHRBWRDC8lIM=;
        b=BSeANsyfH29+9TCXx9PoWzTGD/q7gDSImwausAYLpHWayO2xtiSVT2PqWok+K9RzaM
         SWpoMXG6N4EQ09MD5Qq6hjWEEaW/xd0hU8TyQPSGO5Sc1rJlpDYElxmbGJeLXtgx0Cmu
         HAq91AiIjF+KhQBC7eoLmWuAq8Rh6T61KSE6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795861780; x=1796466580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yfk+itu/miNKmAfINwyWiMzT+wuiKggJHRBWRDC8lIM=;
        b=mnQs5GFe8IK0LRp8hSbijjVfGRGuTHaR3cXF9wKo8vgln1QJaDNp+HBpvefZG9Ot/w
         2wyqNgFSZO4EAAbHDjBG+WphMFWb/ms7jHwgFKZwajFv8FRRNYDbMvM3L1jwXaKZ0t5Y
         iEFK7bXMeXTp8a/J1MauwYFpgpccHntnjtIG/O/fF598osWjiYYhcAD61hNCwqDwQrKE
         QIuXT+nDmtTAlY0PkI5naNdraD3ky3/+qN5tM4+v4fyjX0Kc34Pev0MxP1u4yWK0Kxgq
         FGuGJBW/JfYT072w4jVHfvEmYISDSXub1/yZBy4/voKjZqvb1K52J/pNBC2vLhcJhJqk
         hL7Q==
X-Forwarded-Encrypted: i=1; AL+hErEwG/CT+8oQ+wDS+PRdlo2GUt4x/QPYKcsYwVKTSX5uIEPbC5M+mRLMVcII2AfWZVXIbczvsY7bbngNjCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NoUTB70MfiJPbnxLC+0pB7DenlwoCDOrG2UnwDdKEAI7J0Wwf
	k0fClcX/ISL3N8fNDhs81z9+se9jm/T9186nerv3T9kfw+N8/rxDBrDbGspu2BrLPy8=
X-Gm-Gg: AZFdTZfs6c8KOTVffIRJXWIkEpWY1ZBnEV6riPVex82JpxYUYu/inMzSypcdHgyKz4N
	nyk1ButS8q3q0QDhvRG1Sfwvr/iGnjnRuzckCKB0Yr4NGQ4NVsgSIwrzoCU6LsQZ3SqblwEVX4E
	t68gIu9d3UgulC69c26mJGFMHfz2w3uPiyGwi378G25+z9gVjxpf/dQnPG0B9rTA+74FJMjlGu0
	htc86u9F2otw2Y6MrmXz8hmh2kT2qqEnjiskq8kOmCT0xUO7AROuXEtcY8alMdTBqap3pONYTT+
	/YkfyggaawKvjUzqzxFjt3VoXWjYg0pPttP6C0Sju9uT1Vu3LBmN2dMqHt+MkpLBy13OSihQCQ0
	r6BuTsV39c/QB+2d/LiWr7HUWDnGI23fXI9LaJBr4QjVp+3cEgYbjuuGSRKNhdZdkGV0soJ4ZES
	lxRglBqbEv+LpYyBN9I0P83JZyPWm3QV49+uPlY/ZP0YhPAQVafanS8YrOi3bOU5LL3z9TPkqzB
	ApvqXkdngAVx573YcMrGake2AkjXT/Rhd4pPH/kaFEt09X2d2MC1r4Vy+AX5AWzGBvqSQYsRTyT
	rK4cQuGT8Yi2h3Bgy2f4qR/wcQ8IMBUblQ3t/hwac41BFM8EEyJN0L86nF6C00Td1ysdahQI2FK
	3XqiwWnVbACrYUK2eMYhfDikBf9D13IxGxP0D42+YP0vLRqhWxeM8Lesv+SCw+AdQcyY6hbeS0T
	fRSIfB8kdDfQ==
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id 5a478bee46e88-38571814b1dmr26833795eec.40.1795861779962;
        Sat, 28 Nov 2026 02:29:39 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm66558383eec.1.2026.11.28.02.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 02:29:39 -0800 (PST)
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
Subject: [BUG] SUNRPC: use-after-free in svc_one_sock_name() from svc_addsock()
Date: Sat, 28 Nov 2026 15:59:33 +0530
Message-Id: <20261128102933.733561-1-piyus@iiitd.ac.in>
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

Hi,

svc_addsock() publishes the transport it has just created and then reads
it back:

  net/sunrpc/svcsock.c
	svsk->sk_xprt.xpt_cred = get_cred(cred);
	svc_add_new_perm_xprt(serv, &svsk->sk_xprt);
	return svc_one_sock_name(svsk, name_return, len);

svc_add_new_perm_xprt() puts the transport on sv_permsocks and clears
XPT_BUSY, so an nfsd thread can dequeue it immediately.  When the socket
that was handed in is unbound, that thread deletes it right away and the
svc_sock is freed before svc_add_new_perm_xprt() has even returned:

  - an unbound AF_INET SOCK_STREAM descriptor passes every check in
    svc_addsock() - sockfd_lookup(), the netns, family PF_INET/PF_INET6,
    protocol TCP/UDP, and so->state > SS_UNCONNECTED;
  - its sk_state is TCP_CLOSE, so svc_tcp_init() took the default: arm
    of its switch and called svc_xprt_deferred_close().  XPT_CLOSE is
    set before the transport is ever visible;
  - the dequeuing nfsd thread therefore runs svc_delete_xprt(), which
    drops the list reference - the only reference a new transport holds;
  - the svc_xprt_put() at the end of svc_xprt_received() is then the
    last one, and frees the svc_sock.

svc_one_sock_name() then reads svsk->sk_sk out of the freed object.

This is reachable by a single write() of a descriptor number to
/proc/fs/nfsd/portlist, which __write_ports_addfd() passes straight to
svc_addsock().  It needs CAP_SYS_ADMIN over the nfsd filesystem; the
write returns success.

WE HAVE REPRODUCED THIS ON AN UNMODIFIED MAINLINE KERNEL.  Not only on
the kernel the fuzzer runs: we built 9437ee8b6cf6 (your net-7.4-rc5
merge) straight from Linus' tree with KASAN, carrying no local patches
of any kind, and reproduced it there.  The kernel says so itself - the
baseline boot line below has no "-dirty" suffix, which it would have if
the tree had been touched:

  7.4.0-rc4-00571-g9437ee8b6cf6 #1 SMP PREEMPT_DYNAMIC

The reproducer is a plain C program that brings nfsd up and then writes
the descriptor of a fresh unbound AF_INET SOCK_STREAM socket to
/proc/fs/nfsd/portlist:

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

The free is at svc_addsock+0x37b and the read at svc_addsock+0x38d -
the same task, the same write(2), eighteen bytes of text apart.
svc_xprt_received() and svc_add_new_perm_xprt() are inlined into
svc_addsock() in this build, which is why they do not appear by name.

WHETHER IT FIRES ON ANY GIVEN WRITE IS A RACE, and one that the writer
usually wins: the nfsd thread has to dequeue the transport and get
through svc_delete_xprt() within the few instructions between
svc_xprt_enqueue() and the svc_xprt_put() that follows it.  So a single
write() normally reads a still-live object and reports nothing.  Each
write is an independent attempt, though, so the rate is what we measured
- 500 attempts per boot, with kasan_multi_shot so that every occurrence
is printed and not just the first:

  7.4.0-rc4-00571-g9437ee8b6cf6 #1          483 accepted   29 reports
  7.4.0-rc4-00571-g9437ee8b6cf6-dirty #2    490 accepted    0 reports

Same tree, same config, same binary, same number of attempts; the only
difference between #1 and #2 is the patch below, which is the whole of
the "-dirty".  The patched kernel had MORE live attempts than the
baseline and produced no KASAN report of any kind.

(The reports carry a "W" taint from an unrelated set_cpu_sibling_map
WARNING that this guest's CPU topology trips at boot, long before any
of this.)

For completeness, the first sighting, on the 7.3.1-based kernel the
fuzzer runs:

  BUG: KASAN: slab-use-after-free in svc_one_sock_name+0x38/0x180 net/sunrpc/svcsock.c:209
  Read of size 8 at addr ffff8880259752c0 by task syz-executor/10445
   svc_one_sock_name+0x38/0x180 net/sunrpc/svcsock.c:209
   svc_addsock+0x34e/0x360 net/sunrpc/svcsock.c:1558
   __write_ports_addfd fs/nfsd/nfsctl.c:749 [inline]
   __write_ports fs/nfsd/nfsctl.c:812 [inline]
   write_ports+0x596/0x960 fs/nfsd/nfsctl.c:868
   nfsctl_transaction_write+0xcc/0x110 fs/nfsd/nfsctl.c:114
   vfs_write+0x218/0x810 fs/read_write.c:685

  Allocated by task 10445:
   svc_setup_socket+0x76/0x320 net/sunrpc/svcsock.c:1454
   svc_addsock+0x27d/0x360 net/sunrpc/svcsock.c:1547

  Freed by task 10445:
   kfree+0x1c4/0x660 mm/slub.c:6808
   svc_sock_free+0xb1/0xd0 net/sunrpc/svcsock.c:1696
   svc_xprt_free+0x155/0x180 net/sunrpc/svc_xprt.c:181
   svc_xprt_put+0x2f/0x50 net/sunrpc/svc_xprt.c:187
   svc_xprt_received+0xce/0xf0 net/sunrpc/svc_xprt.c:250
   svc_add_new_perm_xprt+0xc1/0xf0 net/sunrpc/svc_xprt.c:260
   svc_addsock+0x33c/0x360 net/sunrpc/svcsock.c:1557

There too the allocation, the free and the read are all in the same task
and the same write() syscall, with svc_xprt_received() and
svc_add_new_perm_xprt() still visible by name in the free stack.

ed2849d3ecfa ("sunrpc: prevent use-after-free on clearing XPT_BUSY")
already stated the rule:

	So when a creator clears XPT_BUSY it is dropping its only
	reference and so must not touch the xprt again.

and fixed svc_create_xprt() by reading the port it wanted to return
before publishing.  It only touched svc_xprt.c, so svc_addsock() kept
its dereference-after-publication.  06f90cf104fc ("SUNRPC: trace an
accepted transport before publishing it") fixed the same class in
svc_handle_xprt() three months ago, and Chuck's note on that one -
"trace before publication instead of taking an extra reference" - is
the shape of the patch that follows: format the name while the calling
thread still owns the transport exclusively.

A patch is attached separately.  We checked mainline as of
9437ee8b6cf6 (net-7.4-rc5 merge); if a fix is already queued in
nfsd-next then please ignore this.

We have a reproducer - a short C program, no syzkaller needed - and can
send it on request.  We have left it out of this mail.

We found this with a syzkaller-based fuzzing harness driven by an AI
tool.

Thanks,
Piyus
