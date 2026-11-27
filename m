Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738610;
	b=Jjl7SEr5J7tH3aqda8hg+Ri/BsCjb25H5xmLH5z6MsvlMa6uIZa64vu/Eoi/Si5kfPuQ
	 xRS7IY6Z/+llxqP8d40QFczYl32BjZKDABfXpRpN1NRDGd1BxiWeoMjC0xhway3m2C50m
	 aM94xEFoYt66u0/53BLMLam5n+weE7eU36PMgibSGZHqEtJCYgdVnQhNlLUJKv3pLfEyK
	 QZw/1GZ5STcLmxfwR/v+eyjGyPqD5KOI8ebZX1jOzq0fahV6CystHRNZe1huKE7295BfL
	 mKFLw0QE2cL92m5UDe004q0ndxGzJkNsWBdxvKlQF4ktsOWVgTSv88v+WYkaPcCTMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9nVnoKawCciJJKvofe0ViAurGqoccYhIy4wdIXnHSVE=;
	b=DJFu6vnbwbKjgsiKjQPrJTTONq9s1FcZiBUd2uQk3T/CzSRCuAcWicJ34Eniah2zhwr9
	 +l+7TxdnJdYNV5ub4HWQVIdQvwsy9VlouKmt0jOrsU+XG6kMKO8dHCfBZlwSEurCbXLI0
	 EblkIbKbORbMe74yPbdS+RoY+38A5ow+QSO0UlAzh6svfUpx01O7tKaR5CudGnfJEcaw3
	 7t2RmGvR+qRj7aOPMZGRVzRjThcpXFkvIDBJRyupGuDXYgMoTHQlhD0tw7tcAArgCKGn4
	 hwGyZUFD3blTxuTzaqkcVXn0zDUVggsd38aV2OfXv8EicxuiHOrGUQbsQPfl4YdEjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTyRMsh9;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37054606A693
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37054606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTyRMsh9
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5347490f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738608; x=1796343408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nVnoKawCciJJKvofe0ViAurGqoccYhIy4wdIXnHSVE=;
        b=gTyRMsh9XGGeLgDZLXjO7XZSKbo+yBjLM9WRsFDN86Q2ovOeLCH4qChPqGozxhmVNS
         C2hqkmY72B9gawQh8BMCZ6/54ms0o4T9rs+rsOh2aIDIXYh6z9F6RyBrum53dxgrvaRw
         W/qFLObMtiCACdySief3G1IBZBuRQKL6je9gxQSBn1ObifSbv66SJclVPcGQPdSzX+Aj
         mc426/+ugAtnGKpvXPrRgCDd3nex+ulW9xLKvRye/jQHADqFebQQcpbRhgwiPPAddgDm
         NjIPr5CmPEsadmfz2cNBp3zC+g/dTY558D23aERp/PjEyOI5dvFcP3ytmzMbGoLxjM4a
         9H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738608; x=1796343408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nVnoKawCciJJKvofe0ViAurGqoccYhIy4wdIXnHSVE=;
        b=ciCRT+qMYCqzESnhrBVA1Jd2y42SFW8JVQ8QjTr3mXta3h2v6z17YP1G2++IDidoD5
         SKKYnO0LTOp5//d+hqnv9HefoHj4hCZF6z9BcrcIQBPJWGyRbrBS1fVJHQUu1M+eNWZZ
         vMy6oxyO//GP0P4nj8bnubSoGkXb2ihyoYO5mzuA4Z/NeJ2nfiJlO1TyOqrQW2WSJV5A
         8tXWb3nYaagRES+ctsTNt53o6p+QMBBr7k0pvP08usIo0ypFtqERprNpv8MECLeHi0ZO
         M9kMtrZcaj8byVhJsoGwxaA/Q01QN3AoToh710SqIPq6XEa62T/qzIFU/vQZWBSaSL9u
         IXLQ==
X-Forwarded-Encrypted: i=1; AL+hErHF9NJoYnRItUD6WexvLQp0iSc8LiYSS54ynWPdrk0ut0Dwr/+SP3fzIbq56UUgIOhOSm5vaTInvMj7l50=@vger.kernel.org
X-Gm-Message-State: APuU4Z81rWqlJHdN1rzhf2ynG009TsQGq6Tpr3DHs4RRNLZ5I64IMuBp
	cWx+Y2Pi8nateCcQ2akyAYSH83RWZZoBARINbFW9nM0o/ALyli5Civ0=
X-Gm-Gg: AZFdTZf+iC1KCPRLONuVy2mgSw4khv9ak3qvo4f+k8gaDRM6nHy9AvjrkingY/lmqsr
	HCETrJqE7qb0uBOoO5/hTZBWPvX0Zifmx4G82qm5IvtKDwFjNw9pDttKLrmDozOmXLLdemN29Au
	ZOKzhNJ912qvSeuj/e6S+/YbTkznVIjOk2dzA2OKDLxcP+RdWpf1s8gh3qK4GvLAr4UpWSzeWMY
	PQbizmOqGwWdlzXeXPlTCPyjU6zkcTNWZcEsQS0VMUWx3t5ozBSJOlcIZ/h2kD4jy5H+/UJdvKS
	sm0U2aM40y+1KrWCQxqOZm76eDOeGLr/AK0ih7f0t0tNsNYV2VpG12GaJcCCoVqpoFY1e9oYQnc
	mJ0tVk+f16e584QglNToj1It50Ic5PDk45PCQu2xIjh+qijC8LRhEvQB/zjESTbDfmXiCSUUnck
	YaAl/XgnRP7beqgeMYiW6Y0H6BoU5IRsdhr7LhOsuqZh9/JbHPilvyIgOcQcjF4DxmIzHlCGP40
	PzldSQhE6pNo3y5U6m6lsyW0QQyqGD78dRHoS2PuoI7YYTtyFPy1leXgxjh88ZYB6qRVG24zE8Z
	ev+mYDeNs2Gk7os=
X-Received: by 2002:a05:600c:83ca:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb888176eamr461715755e9.29.1795738608524;
        Thu, 26 Nov 2026 16:16:48 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:48 -0800 (PST)
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
Subject: [PATCH v2 nf 3/5] netfilter: nfnetlink_log: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:35 +0000
Message-ID: <20261127001637.1026589-4-tristmd@gmail.com>
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

__build_packet_message() reads sk->sk_socket->file->f_cred without
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
 net/netfilter/nfnetlink_log.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index d923f2cb13980..d4fe9a12088f4 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -28,6 +28,7 @@
 #include <linux/spinlock.h>
 #include <linux/sysctl.h>
 #include <linux/proc_fs.h>
+#include <linux/fs.h>
 #include <linux/security.h>
 #include <linux/list.h>
 #include <linux/slab.h>
@@ -632,25 +633,23 @@ __build_packet_message(struct nfnl_log_net *log,
 	/* UID */
 	sk = skb->sk;
 	if (sk && sk_fullsock(sk)) {
-		const struct socket *sock;
-		const struct file *file;
-
-		/* The sk pointer remains valid as long as the skb is.
-		 * The sk_socket and file pointer may become NULL
-		 * if the socket is closed.
-		 * Both structures (including file->cred) are RCU freed
-		 * which means they can be accessed within a RCU read section.
-		 */
+		struct socket *sock;
+		struct file *file;
+
 		sock = READ_ONCE(sk->sk_socket);
-		file = sock ? READ_ONCE(sock->file) : NULL;
-		if (file) {
-			const struct cred *cred = file->f_cred;
-			struct user_namespace *user_ns = inst->peer_user_ns;
-			__be32 uid = htonl(from_kuid_munged(user_ns, cred->fsuid));
-			__be32 gid = htonl(from_kgid_munged(user_ns, cred->fsgid));
-			if (nla_put_be32(inst->skb, NFULA_UID, uid) ||
-			    nla_put_be32(inst->skb, NFULA_GID, gid))
-				goto nla_put_failure;
+		if (sock) {
+			file = get_file_active(&sock->file);
+			if (file) {
+				const struct cred *cred = file->f_cred;
+				struct user_namespace *user_ns = inst->peer_user_ns;
+				__be32 uid = htonl(from_kuid_munged(user_ns, cred->fsuid));
+				__be32 gid = htonl(from_kgid_munged(user_ns, cred->fsgid));
+
+				fput(file);
+				if (nla_put_be32(inst->skb, NFULA_UID, uid) ||
+				    nla_put_be32(inst->skb, NFULA_GID, gid))
+					goto nla_put_failure;
+			}
 		}
 	}
 
-- 
2.47.3

