Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738609;
	b=x9t+5hDhqo3UDcJz6i373PpX9zf4V5Sm7DAO7Qozngxfw9W0BOGJTw83fO2uZE8QKwQE
	 lyv1eeB/L+RVFOmFKARo0mazaEhriqRjVThEGlVmUCu9TCpVwGmS6IjNPmUYvyqAZy6f3
	 1b2uYMD/Ar12dZ3HDYL5YS9wUmVeJVcSEWEctSEcUD7uI0eb79E1b6Jq6B7rwjhUg761v
	 +ripvTj3OJhVoKNNYvRf8wflVo9wTbfwlP8vnFK9mP+4orFG4gtUZCGZchKEEgpxbQrhf
	 XkMbah6qaMtQwKvY5VcLTpOhCBXz/TRaSsjUPPJ/iyk1bN8Oddi8kGR95Yj5GaGXDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=npRlcaBUGO4zBESfN/npXWj8+rVH/w1YcWRi93JmvYY=;
	b=cWi4UnQLtisMtnypuKFsSdV77IMWQ9Egkdgz3i8yvw+csc4h8KuHh2R9c45oOsLl5Lxg
	 wycRb3Gt4dKoM8Ugl1N6KfW/oxJguY5ggj5u6bGsbD7gIRv6wXiCOrWJrdS8aSJZEULi6
	 dSNvV0L2/lLhDBKzs/mAU2YR67RPE3KIzab9jS5IvHvp4yeYLlrKotTrBGULGOeZ0nW8V
	 d0ZV+FcPpgoBTVk4Zu7M7YEN+pHGixyqH50v0Z6UXm/bWCpDIEMk/M8gXLVl+mi+txcHv
	 miVWZ9jW6HIzH/xyIG+4gES9zzHfw4kaG4YQIyWdAQl9aKLSuyBmgNxXYyP5ednqm0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYO8aFEt;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E3606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113E3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYO8aFEt
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5347485f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738607; x=1796343407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npRlcaBUGO4zBESfN/npXWj8+rVH/w1YcWRi93JmvYY=;
        b=PYO8aFEtgcaK2RPagOerewhpmmc0ZDfIuCpod+G7twgg2sk8nOtwoVzXqiOruClPIm
         ykZa2Gxh+SbdOb03Tk7Ecox+GJjbV9l2/iELPwatOZLCW6UmJZa8NAe8B/w/TKjjd6pb
         Z8lDEzwMElZT3VuGrs7870kS2fZ5W6L3Y1LHKxricIzTODmmgHGB8yL32QZKvtgZU/Ea
         c/FH6xopP1GpfrAy773fdIGxTM8VNlJBn431gWDOYNXBHbqBmwGj7RPl1BwxdeO7uPEu
         JszKhsTKy2u/qCKbWkAQnfWQfdvyXVGBNEX4EE1GUhwSFa4Z8PJSs1cVbio6w2uoB1CD
         pzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738607; x=1796343407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npRlcaBUGO4zBESfN/npXWj8+rVH/w1YcWRi93JmvYY=;
        b=s3vYxxoxcpNMjqOTZgQy85y+3+OAkWO20/0R70YFVTs7A5QyrCQ4+JEyOfNcyp69EL
         NpotwtXri4nL7hbiWCzScfc3FQYLCEMUHQ8Bw5OFYaAF4P2IsOZtA58Pn9qx3AW8g9gX
         LAJ8W/WUB323DJ40xnaBkAWZt6ccJdNYEu1FwY0SXMtvyleAb+4/av5/5ktwYn3819Xv
         56Vf56SN4X2UZ+vA6VbK67p/G2oejumhIOgdZ/VGNd0u1gImf3yP8WyR22kQ1nR264yJ
         IIMwvNNN3ttzlxy9JQ4hab7APtXjysT5l4i6G6oqPZ+LpcWSim8RYs+bBJEV7Xuxn2bt
         uN2w==
X-Forwarded-Encrypted: i=1; AL+hErEUtMY+34WQwknzHbll9nLTnVH9KmgkFlHhQwZUsJy1mtBkxwmHGUC0ojXhJ2wEyy5jTpkbOiAhWG3cXOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KJIXSzZN7TqPhTZlDHuW0xdW/CNgyB8qk5F/TXlUdU8TljSid
	YrwwE0gEoqANIRaZ/TbNBxwEWOocUNA0467M5ZXA1jxa+6xWk/uZcC4=
X-Gm-Gg: AZFdTZeTpKiT3EoGoMq6Q/Pfk38cZKGS1tK/MuhXXG6/XKrAsZE/IgFvvkyWPW1g6Go
	NflAunpP+v7/dz8urti/EP+WCDdVNTtSZXRefYrlMxm4XAwBAyH6rJu+k8vMQILmr2FiHhRKLeQ
	6ebN25ylqk17mqkkIolwHbid7hKVz2qm+g1E0zT2N9TQWdi5KaV2OYFIbXh+tC7PuqJ46wX8kpR
	wspmYRPShMjMBf14cQKlfGJKEW5Hg9qRktOIpkpyDsIqdCzyJHVHlcsroJhSO9EQhoqvpE7e3U3
	B8+oOmi8oCV1r9Ozczu0Mw8h1GIqPrPUW9FmXgtuR9oZqBNvzcvNd2ywXqkJLq5ALUBfPCnJMrA
	hL2+nuqSiIt1pWnP/PLOGPRybZVr01O8H7we+JKTK7cH/XML6fgQzsZEcDU0SromxyHfj049FPN
	LKH3mL9GTXiyOEA3rOIoLjIS6vPofIzElmEyPxsF5rmVH6mgfGkr5j3KM9Kc7ot3u+FZ+ngXsXs
	98gfeN4E5efUUsYrB4GvP58TIfnMNmfkrSGEoXmprgV5svzTQr8K2hN70x6xJ+XhUAXCKmqxGX0
	WN14DdeBVYNPIs8=
X-Received: by 2002:a05:600c:5306:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb887ca0bamr418564775e9.3.1795738607398;
        Thu, 26 Nov 2026 16:16:47 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:46 -0800 (PST)
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
Subject: [PATCH v2 nf 1/5] netfilter: xt_owner: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:33 +0000
Message-ID: <20261127001637.1026589-2-tristmd@gmail.com>
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

owner_mt() reads sk->sk_socket->file->f_cred without holding a
reference to the file. Since the file slab uses SLAB_TYPESAFE_BY_RCU,
a concurrent close() may free and recycle the file object, causing
stale credential data to be read through f_cred.

Pin the file with get_file_active() before accessing its credentials
and release with fput() afterwards.

Found by manual code inspection; not triggered at runtime.

Fixes: 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/netfilter/xt_owner.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/net/netfilter/xt_owner.c b/net/netfilter/xt_owner.c
index 8f2e57b2a5868..75fcff0ce21aa 100644
--- a/net/netfilter/xt_owner.c
+++ b/net/netfilter/xt_owner.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/skbuff.h>
 #include <linux/file.h>
+#include <linux/fs.h>
 #include <linux/cred.h>
 
 #include <net/sock.h>
@@ -65,8 +66,8 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 	const struct xt_owner_match_info *info = par->matchinfo;
 	struct sock *sk = skb_to_full_sk(skb);
 	struct net *net = xt_net(par);
-	const struct socket *sock;
-	const struct file *filp;
+	struct socket *sock;
+	struct file *filp;
 
 	if (!sk || !READ_ONCE(sk->sk_socket) || !net_eq(net, sock_net(sk)))
 		return (info->match ^ info->invert) == 0;
@@ -77,14 +78,13 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 		 */
 		return false;
 
-	/* The sk pointer remains valid as long as the skb is. The sk_socket and
-	 * file pointer may become NULL if the socket is closed. Both structures
-	 * (including file->cred) are RCU freed which means they can be accessed
-	 * within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	filp = sock ? READ_ONCE(sock->file) : NULL;
-	if (filp == NULL)
+	if (!sock)
+		return ((info->match ^ info->invert) &
+		       (XT_OWNER_UID | XT_OWNER_GID)) == 0;
+
+	filp = get_file_active(&sock->file);
+	if (!filp)
 		return ((info->match ^ info->invert) &
 		       (XT_OWNER_UID | XT_OWNER_GID)) == 0;
 
@@ -94,8 +94,10 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 
 		if ((uid_gte(filp->f_cred->fsuid, uid_min) &&
 		     uid_lte(filp->f_cred->fsuid, uid_max)) ^
-		    !(info->invert & XT_OWNER_UID))
+		    !(info->invert & XT_OWNER_UID)) {
+			fput(filp);
 			return false;
+		}
 	}
 
 	if (info->match & XT_OWNER_GID) {
@@ -120,10 +122,13 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 			}
 		}
 
-		if (match ^ !(info->invert & XT_OWNER_GID))
+		if (match ^ !(info->invert & XT_OWNER_GID)) {
+			fput(filp);
 			return false;
+		}
 	}
 
+	fput(filp);
 	return true;
 }
 
-- 
2.47.3

