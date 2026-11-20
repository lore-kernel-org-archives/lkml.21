Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194817;
	b=tZ5tZNT7MK2Hc4tHVQ4VT7DLHoLg77lWPZ8bIvZpYYfbDEqPqK975yQAuiSubkjVuu5u
	 kGucYlw1yEwY6Jogko8i9CuvgBN5l/yIkcvp9d46aEuy3i4iUUFrkC3bDbtjLsf8luX1z
	 24YhcnPyEJpgopXudXI7J77M7euqvBLf+LwqS34rxXlAgF1992qBVyLws01Btl8R5OOb6
	 b+13ku/Welsf3FR4cPimFgzZqE2piz6crCOPlzgjr4p79NHjdI2TolQXWOBtVQu1kB78w
	 lpHxTmKTpkDy9Dhr6MX38Cl/MASPyo+9pHkbcabAfpeMh9A/wF/sbqlZB3NHfX1YD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KjPgCbUzN1D+YOhV31hO/zmYZL7tdGugpdJIEZntHNc=;
	b=EMNDi7wzvCEvcvRfkiIRX+KdJuBgzCEkMi0VCCeqklrxS3G9pie9Wk+ixa/iwv9QDcax
	 5Sus8jk+MQ2X7Wi14avK5FbiG919rXQKXUCFb6HTPnxS935RRh11gN5K72bPy0VRXtZjR
	 2hYIYFPxyK6p5W1Y79GrqhfdbwmANBKby8vS4HDtDPty9nXx4l7q2l36MlGwqSZVVnolR
	 QSoIi2xFeQq+Z3MuvR540BKa0tsmg2vcE8vE2u0tnFUkK3rZobXYYGigsO7tE7lsXaVDN
	 5Y+ntNVj583U/wN8GKPhw6OZhDfCaTWTq7z/ZqrrX4Sxf8+Tu82W04JEA/uJcq/ZbyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=RBhUHbpI;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72D60A2607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D72D60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=RBhUHbpI
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so11433495e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795194814; x=1795799614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjPgCbUzN1D+YOhV31hO/zmYZL7tdGugpdJIEZntHNc=;
        b=RBhUHbpIqrkv08WHuQRt875FWMxuS4lb10/Ee+ETSWUDT8SJGfL3H/etrmMfVeswE1
         FwoIhvtz+Fp28P9yh3xPcZ20+EOuUKgysr+4qSPXn+v+oM/7wZAWv1+8jtOxn1CIpAkh
         IdFLwNMbF/LKJap1nxIdt1RWzGKnf0WW7nLdHUPYE9Ks7tavLbaBJgSW3HsG5mWvNUEg
         ajfhZcPEcMFuexa9P9/SH4YK78fnIMo/Fj6XU7UUPqCt+wEPyn9/UTAJ5TQKvzBf+eeH
         K4FuKZXDjdCa20fe8YGRGaF9qdBZs+TRQwo2077PA041jVXY6VtKc/igElCYiEPOCV9R
         A21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194814; x=1795799614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjPgCbUzN1D+YOhV31hO/zmYZL7tdGugpdJIEZntHNc=;
        b=Ej/04FQ1wskqLrJ9qqU9YWPxZdsqE0M0KIRW2KpFty88GNGdU4FwahVhL8DmWqo8pz
         ekf41MFhIAMa4yEIrnfURQPsuX3YbOYQimWPROuw69Ex0t+mSkrJE3bVM427HQXaV/7z
         jKrAFToF8eymJvuj+x9DdZFqM3xMUIVmSi5VFIoCO+ur1RZq2gBD/N+uF8+6TZYtw+aT
         bsKtbC8u05oThcYD6oddpO1AV4LfBWZ4pECFLTH/QHRimCVifmHn2m4gUT2X3kA/8LTJ
         Tfvmcc4+6sX/ahfKsPBDh6yIv98huVrPoA95Q/wvEOQMlvzjU/FmS30BSlPSIizWguiY
         e6aw==
X-Forwarded-Encrypted: i=1; AL+hErF82zWXxdGmdH+Gylhom7ZQPNa25e1Hyj2wiAj4DLgpb6BDw6NPSrScK2QeLOAxeIy7PzUAxh18dEAdZ5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mtNwD/TmcrQBfXHc1nYfGOPdLHws6Ffi91LmzMGyfcLTIXCYO
	auFEMVZbgIkGRhEJnSlGHhEP41yEqxUFZjYFqlgyCwLLDjiaSfr+RJ+JB/U4cHo3gGo=
X-Gm-Gg: AYBFou0tgMLWQ0yqysMH2Ph21BNNSJO8rtj3L+Qw8SN1UQAwd3LlAtKKJ+2dsZ6hFTo
	Wd50qjBu4JVBeVZ0knNyMovhy181HY63wxro9pfm7nQTDIkYtzuHh+NvU/eVSCZ3ZB1w3slibcW
	sydQ102upJog6PNjtfs1ZSS7HmrN3BsK/ZRTJFYPK/eJQbJlj800KnK17VSuCcV+30jniGxWHlX
	diWKZ6Vl6dAUDPwRZXFLNn719tZk4RsiVULaMrBBHaIjF2jAZJycG5bpy1IVNjq1SY6dwPlmcvn
	z5zUfcrEeESShDDEoLY3XdCGRSJA/SNcGt23VSM79Exl01U6vJsTc5z831xVuDHBOPK4MEhN8Of
	7WKR/mK8TiEMoy8urGHD+rHFjZ+CJJn2MpDcShNpbrGziUCgEdeYQeQ4uKZiB+VFBKLvRHJYoWp
	Z1/EQK5AFndYWg2xO6FlCeS6sTdWcbWXqXH+GJrFKLCSzqxXjCcKxBIVpIIg9ZC/RsZwkZJfFtT
	Axh5vNsv0Ms8Phmf+2dzafrf4f5n+JcwdfL5oG4asp9KBrZO71TloKVk4PbDQtRAosTFBs0M5/L
	0vtkpun+9QTkPl9m0nmGGUoHJZ3uFMndsnCPsYlCH5g0gw==
X-Received: by 2002:a05:600d:82e4:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb8882677cmr87433725e9.7.1795194813839;
        Fri, 20 Nov 2026 09:13:33 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm190918955e9.13.2026.11.20.09.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:13:33 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>,
	Phil Sutter <phil@nwl.cc>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	amisiurov@cloudlinux.com
Subject: [PATCH nf] netfilter: bpf: reject a repeated bpf_ct_set_nat_info()
Date: Fri, 20 Nov 2026 18:13:25 +0100
Message-ID: <20261120171325.2721546-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

bpf_ct_set_nat_info() checks the l3 protocol and the manip type and then
calls nf_nat_setup_info(). It does not check whether NAT for that manip was
already set up.

A BPF program holding an unconfirmed nf_conn___init can call it twice with
the same manip. The first call sets IPS_SRC_NAT_DONE (or IPS_DST_NAT_DONE).
On the second call nf_nat_setup_info() hits WARN_ON(nf_nat_initialized()):

  WARNING: CPU: 1 PID: 21673 at net/netfilter/nf_nat_core.c:674 nf_nat_setup_info+0x251/0x2b0 [nf_nat]
  CPU: 1 PID: 21673 Comm: loader
  RIP: 0010:nf_nat_setup_info+0x251/0x2b0 [nf_nat]
  Call Trace:
   bpf_ct_set_nat_info+0x81/0xb0 [nf_nat]
   bpf_prog_e4b00ba35d2f7a6b_nf_skb_ct_nat_twice+0x110/0x13f
   bpf_test_run+0x172/0x2e0
   bpf_prog_test_run_skb+0x2e5/0x4f0
   __sys_bpf+0x7f8/0xe90
   __x64_sys_bpf+0x1a/0x30
   do_syscall_64+0x5f/0xe0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

With panic_on_warn this is a DoS.

Reject the call with -EEXIST when NAT for that manip is already initialised,
before nf_nat_setup_info() is reached.

Fixes: 0fabd2aa199f ("net: netfilter: add bpf_ct_set_nat_info kfunc helper")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
v2:
- Correct the Fixes tag to 0fabd2aa199f (the helper that added the kfunc),
  not the later manip-type check (Fernando Fernandez Mancera).
- Drop the inline comment; the check is self-documenting (Fernando).
- Reword the commit message (no "confirmed check" in this path).

Found during a backport review.

Reproduced on almalinux9 5.14.0-687.61.1 with a BPF_PROG_TEST_RUN SCHED_CLS
prog that calls bpf_ct_set_nat_info() with NF_NAT_MANIP_SRC twice: without
the fix the second call returns -ENOMEM and WARNs as above; with the fix it
returns -EEXIST and there is no WARN.

 net/netfilter/nf_nat_bpf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/netfilter/nf_nat_bpf.c b/net/netfilter/nf_nat_bpf.c
--- a/net/netfilter/nf_nat_bpf.c
+++ b/net/netfilter/nf_nat_bpf.c
@@ -42,6 +42,9 @@
 	if (manip != NF_NAT_MANIP_SRC && manip != NF_NAT_MANIP_DST)
 		return -EINVAL;

+	if (nf_nat_initialized(ct, manip))
+		return -EEXIST;
+
 	memset(&range, 0, sizeof(struct nf_nat_range2));
 	range.flags = NF_NAT_RANGE_MAP_IPS;
 	range.min_addr = *addr;
