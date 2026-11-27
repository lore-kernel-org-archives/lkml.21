Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738612;
	b=qPuPOq/bNl4AlXQ3EvUSPZmtFUKOTSJ35divjp45B/Jv8MYBe2n5AR3z8K9JnzCw/0a2
	 RUL3zv1k3CzD1b2QmVSlO8CHoJPnsmf2HNFckwef/t7IrbLWt5fzrVkJ+n/xCrbADE2+5
	 C6TSEyuIgS5sZ1skv3NLr9IyIUWi9irUTCMqea68t77ZU/KtZudTtR38nrmxOd82D7vfv
	 1aQ+DCcKsrkmXl4LVguLKrQHcSMTQWrAQ0QeamF53KGNRf2sPI903HDN4FHL7E1heKVSs
	 ifsMixiM+pQ7r8KmIXRdZwaVf7w0bxuNV+IVrw+ilfJ2zwzBTBnEaeYF+om0+w6ew4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FRTP8FO/eHZGhtNodRe4fi46UFA5HdjhjKCVqbUUh2w=;
	b=qaXLXS4e8z39JloJQjTleHcBuPeQQs2e8AKK7JDZE5n2/oLHpJmV2dE0oLraeOjk4v1x
	 68WsP9J3sWv9IO33FzxZs6N4nsUQIncyNXsCb1IHsp6myqcQCqVo+fc94Wa0EqkwvnCSo
	 G9mkN4/UVIgc6DuyN7j7CkL3OS6EJDpMPcmRWvhYvptnxE8W5UuyuJEqLvdHCR7ATm1Wy
	 gcz2NZBk863Wq3l6ZjK2wIJ0t5vE/w25x3kpz6+KKcoqK8cHkFW86Mhsvb9tF6I/C/zjn
	 YJo5jtCIAEUa63M8eX5cv0eySQa/bDFCrHy+uP1KjwN8Ge4bZPjBiFUZJ6d5ZhuuXhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T34DF08R;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C84606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C84606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T34DF08R
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4487820f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738610; x=1796343410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRTP8FO/eHZGhtNodRe4fi46UFA5HdjhjKCVqbUUh2w=;
        b=T34DF08RkclBqCp86/pbXD7dB5z9Qafib6EkPNsHvOuXnehvWwaTdcE+BsNxucSDfN
         4XsiBrWPynipFk+C/A2q8pjqaO0JWTyO/4qFJJAfxRecIRgjZE9BV2rW32JTVL3RiJs6
         CX8H0ARMJMDU09Bgr7ecaj4f9gF5bLK14MHa8L/j7a2mta74dKOEGWGJTNr5Z5Rg45jc
         QxtuHA968TZBD/zSTWXWYmeCCxeo9TL9xLdX25vtHMOHZkfSMN/htrrVL/XHzo93Rguw
         RvX3UmmWD8IhqExnbs4ia/wPAQxDcfUQY/UHDbYdYmTaujoz6Ogq5Ui17UB7WdIOWdKb
         k5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738610; x=1796343410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRTP8FO/eHZGhtNodRe4fi46UFA5HdjhjKCVqbUUh2w=;
        b=oxK8dkzIIquv5Ah+QSeF5Zn8cwWYzLg5C5YF2nUNoD6II0kfjJ4/vFEv0sm5zu9g9Y
         cJ+80vBDQjyKt4DP9j6FnoMQ2ywiMkYOA2SblrUrvbsEmxE1x6yTRgL33x6rvqD78S60
         cMgFE9I9TIO6bOZeO0DXeO7GFiWj9wYkcOd6+nynC25UXElvVPnvy4cSknD5YJUqlJbk
         I8LBQwMatLlI4wzMrnCPP+m6HBLhbxtx5+UAw5wXThBlTP91x0YChqfE8ZLZsOo7ZgKz
         eMxMR+mssVXOg7OgbW2Kv5k54VGRhBcHElSRo96LY4obaVEp3FSO3BNLAQa8TXxfS0f8
         LOgw==
X-Forwarded-Encrypted: i=1; AL+hErHsviOD+VMHx9QROcsBVurl4xMhFQdpozaeXNuWCEyHynO1sSdMFJXO6YiTcxIL2utu/oGcSiR9LPaE92A=@vger.kernel.org
X-Gm-Message-State: APuU4Z936nkqvEgFLLyVRKrhMqyta3nKyOi4tJvmaIsHOrlXbUAxlBqS
	h/m7d+TMOf6DddFdhSw8INWahuXf9rUAhPuyL8X2zlzQl7m8kst5Y3A=
X-Gm-Gg: AZFdTZfuh7VroRkHLcqNAJmXFEUhYO/WisloNdVpBz/MpB+tuxFsr8L5D9yrAwy8qP6
	IC8WNwdOVc4fQ3gdWlZ1jEQFqJM/y4kfzhXyz51p3uoEuUelMPOTVjEufXEzYpj216dZYZq4WwF
	XT9DDcHNaTGuuZu2ubc+xtmlbR87RBS0caDx+3T9rbn6nGrGGvm8U4FCDAuAP1M7LlGP2ekViVO
	scLN9Civj2qHzyfLoYENzs+lzPA0Bu+FsN0/4Z6fXBqyDOHlSfLQQo1EIuMo8xM5jCGixRhJItp
	Cjvpeze2yGCoWj3U2wAXY63Gb2laBrX6gTi6r2brFdPaUP4T7VW3PqHnUtYrKC0ERHV/CLe5uiD
	R8laNdUnE2RCp5BxhEBs7fsaiDQ6sL1Us1OYk/hGLBB4kZ2aGqPh6cDVmVDfqSThWpzscCcttku
	sk4Yh2ird0a0ZeafMPTn9kvto01m+4Rgq1PDnXlchSSSX0Gg7keAOJaiHDG0MXRFJwy3O9e5khn
	fo3vW+MEUEgrtoz99EBQJLrKvUGtTUvwUBWt5wzUGkK8H/Zk/Kc514Di0D/SU14AIo5wfMA+03s
	jJpYbQQevZLEu4I=
X-Received: by 2002:a05:600c:6298:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb88934652mr434988635e9.27.1795738609584;
        Thu, 26 Nov 2026 16:16:49 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:49 -0800 (PST)
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
Subject: [PATCH v2 nf 5/5] netfilter: nf_log_syslog: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:37 +0000
Message-ID: <20261127001637.1026589-6-tristmd@gmail.com>
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

nf_log_dump_sk_uid_gid() reads sk->sk_socket->file->f_cred without
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
 net/netfilter/nf_log_syslog.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/net/netfilter/nf_log_syslog.c b/net/netfilter/nf_log_syslog.c
index c3fd398ffcd77..dd15409100eba 100644
--- a/net/netfilter/nf_log_syslog.c
+++ b/net/netfilter/nf_log_syslog.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
+#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/skbuff.h>
@@ -168,25 +169,24 @@ static struct nf_logger nf_arp_logger __read_mostly = {
 static void nf_log_dump_sk_uid_gid(struct net *net, struct nf_log_buf *m,
 				   struct sock *sk)
 {
-	const struct socket *sock;
-	const struct file *file;
+	struct socket *sock;
+	struct file *file;
 
 	if (!sk || !sk_fullsock(sk) || !net_eq(net, sock_net(sk)))
 		return;
 
-	/* The sk pointer remains valid as long as the skb is. The sk_socket and
-	 * file pointer may become NULL if the socket is closed. Both structures
-	 * (including file->cred) are RCU freed which means they can be accessed
-	 * within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	file = sock ? READ_ONCE(sock->file) : NULL;
-	if (file) {
-		const struct cred *cred = file->f_cred;
-
-		nf_log_buf_add(m, "UID=%u GID=%u ",
-			       from_kuid_munged(&init_user_ns, cred->fsuid),
-			       from_kgid_munged(&init_user_ns, cred->fsgid));
+	if (sock) {
+		file = get_file_active(&sock->file);
+		if (file) {
+			uid_t uid = from_kuid_munged(&init_user_ns,
+						    file->f_cred->fsuid);
+			gid_t gid = from_kgid_munged(&init_user_ns,
+						    file->f_cred->fsgid);
+
+			fput(file);
+			nf_log_buf_add(m, "UID=%u GID=%u ", uid, gid);
+		}
 	}
 }
 
-- 
2.47.3

