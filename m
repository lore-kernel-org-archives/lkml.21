Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738610;
	b=YjhIxxDV2+jHZNiXoM8NEn0eNprJ/bTaIUnpP5bx9miEynUPMaVnlOdjup9sIh5ssec8
	 f1m3PoQn5fSJaUeEOiSM6fQqvM2uIbGUPsUkkZp0mcwQ6bau1aNZxjw1m4/vOOri0Fwdr
	 CNCxrJqmaj4PDyywdVh3npD7mZXAv8Usrl+RoguIPmCTvLqdW5XFoZn3GSToZCkmrEe6n
	 vdUsu0Tl8lUXXNcho8iYXD9JCmLEAQRJ3rof6g0zC4YWlPHptUoGMqxFlgVLkd0dYdtDu
	 aLjL9tbsEpSacucYImEzacTawr9C6IKv6Bqhs5E5WLA3G7KAhSeO2GNmAqsZxDDN9Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gye4YsbUN5yG8oY4A5kAtzWYZXrQDCSgln8D0vjm4yk=;
	b=tbYe2txGxFVfYKgsveB+lNvXASOhjRp5mO3E2mJaJrPYBi6Ll2aCtaHKm0ExfdO1vDgn
	 Jox0rnRM8rNmHvhm8g+fdYxU688c8lfIR0xXPv6Bi6Jzd5DTzcrIj/fwXvF/pNHA7q0dU
	 CZZ3w2K9dh/3US6KjNgiZKetf98+GhldZam9cgq+jeDk3DBoAN9lUZrnQeLJRq//W6zpG
	 wnVGuJcWmqlfVFtvCm0Ltd/tTL9Ep57dd5Zrew1bt91w5DEDX2JhuzUorZkZwPxhgml1e
	 YQ3da2KpZe3t5N74ahbna5gMmdPlpp8FqYcGYdjzbAIqTXv/+Gh2XD62Vi88W1ng3GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBThwLrg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0904606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0904606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBThwLrg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so62531225e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738608; x=1796343408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gye4YsbUN5yG8oY4A5kAtzWYZXrQDCSgln8D0vjm4yk=;
        b=sBThwLrgwtNi/8V+i5S1cCVxWVRMg+L2Y0aTjHRPpx8c8uWlF6atBR2a4U/9ViPF/N
         JPpZAwHvyB4+9tipx396YodjkCn+rOfe2lENaGPMNlBJ0GNCCehx/uyfqHfzRqdpFTgM
         cZRd1rPnlDFW3Hh1yCBYH1LINsqHDqMpBSNBvgHSHPFWMxvWohlyTz2QSXhZyL2b6z26
         M2sUHErEMu0C/DuQPOLPmluzICGiH2bVMJZs6cHx5AEdjCLX0As+kKmm+2oxoShPI3M1
         /R0I9yWT3Kl9v7nzj7MHwDKFIt7EoczG0wYfYnpGHyXXopj9zSMIhm9uBegyCilBOmxf
         GWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738608; x=1796343408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gye4YsbUN5yG8oY4A5kAtzWYZXrQDCSgln8D0vjm4yk=;
        b=PKhzT0+r1nIeoDG5NGERlAqSXgegWLF4laOawGr4RCb3XM4pjC8gPmAKmj/uv7vAd5
         qA2HQzQM1plksvDK6an+pdUDq6VpYxrXZBhQyIiYQuybm7D5YlJjL2HtJuh0lWQ0x/SK
         nfXecW743GJ8P8UG89PnXx7PQuN8642O68dhPVUiWq22f7RLUMQ7HVXsqRuv7fvfPgLT
         fe8D4Tzw0zWr4SaH5wxZbdYsm3qFwHgzCkDnFdTUyoRxuHyBq4r0go21Jla6EA44jJA5
         HSe+HKL8FYH4Mzeb84PblYw73w4iWZZTKKchHG5zM8ArauWZlS44ulvD1cTU5tMrB00V
         QqAQ==
X-Forwarded-Encrypted: i=1; AL+hErFvSGJ2gsNlBEp8v9FekmpCKUW0ePYY0K371xXGe+jbTNeuNoVqpVA2syCYbvxJnpQBfQLLUY+YPB5vPJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z83VYGC3Ayd4zNu9GhSu6mWIoG4xuG1a+007daU9OVMkJ/xs1Mg
	PfncCfjL7gpPU2F8GQxYnzEoiPP7ZnyTXmqyMNeRcIkUGaNj5Xwwa8Q=
X-Gm-Gg: AZFdTZda20u/nco9QCkpxNgugzrqzHI7AZsib8SIky/qQqsboaquj/Us16kdqoBTCys
	Hxpr3kjH13UFJvHuZS6EoUD13mAmgVbPZG7VvDDYuhJO3hkvepms0HyI1XmvViqUdNsUFpMDqpo
	cSVQgkU5N/M7ArqxnkBCuCwOni7P8ZEn/Flx5gfxsPhyLYDdIXA1TjnipqTrgobd5MCJ8gRPTbM
	F/d0oXE3UvsQQvH1tqo1ALm8XvYM8KJuSFu6HY6SiiiHX6BAJCtJnj3Avt8jNm3yDGz9w1qfWtj
	SAYpErzZzP/hiUoFPsgGjQWR5u4kdhNh1YERGjsrQpMXyEcVqw0wAsczbTkrZIHAsVPQV6CicnJ
	jRyyZxnKIo2YaWBqfY1ho9qM+I3NTI7sT0MP9ta3hvC+JrK+HsCxFSOK2K6X8/C97dCwXrSnQ46
	JgWqplbEnfwKRd3CpukDvDQawUrBIEQWgKMjQU/2Rj5sL1HuUeZawvzMRXq9x38vjE5bmQ4n5RA
	IFCrJh/Aawqu7WDSKFK49kLHvBrdlp6m5EYyfK1hxFlxfJtajlsGRGmY6OXWT7IDF7nNJcXJS1x
	JVHpEMvtcOWkTR0W
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr470420415e9.19.1795738607998;
        Thu, 26 Nov 2026 16:16:47 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:47 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	Christian Brauner <brauner@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	coreteam@netfilter.org,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 nf 2/5] netfilter: nft_meta: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:34 +0000
Message-ID: <20261127001637.1026589-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127001637.1026589-1-tristmd@gmail.com>
References: <20261127001637.1026589-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

nft_meta_get_eval_skugid() reads sk->sk_socket->file->f_cred without
holding a reference to the file. Since the file slab uses
SLAB_TYPESAFE_BY_RCU, a concurrent close() may free and recycle the
file object, causing stale credential data to be read through f_cred.

Pin the file with get_file_active() before accessing its credentials
and release with fput() afterwards.

Found by manual code inspection; not triggered at runtime.

Fixes: 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/netfilter/nft_meta.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index 01cfbaa365250..abf0bbce9bfda 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -17,6 +17,7 @@
 #include <linux/random.h>
 #include <linux/smp.h>
 #include <linux/static_key.h>
+#include <linux/fs.h>
 #include <net/dst.h>
 #include <net/ip.h>
 #include <net/sock.h>
@@ -135,19 +136,17 @@ nft_meta_get_eval_skugid(enum nft_meta_keys key,
 			 const struct nft_pktinfo *pkt)
 {
 	const struct sock *sk = skb_to_full_sk(pkt->skb);
-	const struct socket *sock;
-	const struct file *file;
+	struct socket *sock;
+	struct file *file;
 
 	if (!sk || !sk_fullsock(sk) || !net_eq(nft_net(pkt), sock_net(sk)))
 		return false;
 
-	/* The sk pointer remains valid as long as the skb is. The sk_socket and
-	 * file pointer may become NULL if the socket is closed. Both structures
-	 * (including file->cred) are RCU freed which means they can be accessed
-	 * within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	file = sock ? READ_ONCE(sock->file) : NULL;
+	if (!sock)
+		return false;
+
+	file = get_file_active(&sock->file);
 	if (!file)
 		return false;
 
@@ -164,6 +163,7 @@ nft_meta_get_eval_skugid(enum nft_meta_keys key,
 		break;
 	}
 
+	fput(file);
 	return true;
 }
 
-- 
2.47.3

