Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328288;
	b=BEKJ68VtQXbostqZ3RGZzvGbgRSOV/Pvxz3VLOsR2/FTeyl9LI7lM7Z0Jo5AsNHE1Osm
	 gJTnDL+SllyMkL/UokMZxdTeXArpySHaLTGJYkZtfzZZqHYarqyxWcU2mY6a7QKnQvAmB
	 Dq3sjTgy/vanmKocdznfuJ0XM3mvqG6AfLxuDSO93SdxUN20K2+1amXPDfCEnTt1+qbla
	 +pWkBl1fm5jvhJpvSRsXufNohVDAXL7D4uK8AKHblYTEwtEIOr/Ou0BSv7a9eKldcPpOc
	 /9uV4R/kDGWPr/a4n/mB3GmtTJM7rFJM6MWK0k9ZJY3/2tWeL/f3REtDSyTWHu0B+Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ay90uQj/01Rf6CTpvGUzFCHxlYs4mAlxviAstjZC/Vk=;
	b=IEe3vVMDVCgmzKuJdhcdfwCV2BFBWzM7iB/Em004ZoVEpFLcnD/TIAcxIDuIg33ZuwMy
	 6W1VZkXwjKKAn1uEKEmwPWdZdMulLLa2JT2qmD9BBS62udX2wlVP8msHCSN8zCJWR0BIY
	 iK4DxUaP7gbwZJMa25IDlVJ4cwqHtMY3cJlXE80mqKwqmAHRbeTCpNQaZ2As164wiyApa
	 EqBBK29IBTo6H4A+VtzU8KFm7c+AIMO/FqhRvNKQeB4qK2yZoMiFMzPGEc8DwQtM8wENi
	 pTP3U7QbWOhYthMvk0XZlYGvdqOyH/+HmP2XTZ2mS+R0pXTGgR9yBfU4PKBkPyHbxYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrOp0tO5;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13145606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13145606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrOp0tO5
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20113845e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795328286; x=1795933086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay90uQj/01Rf6CTpvGUzFCHxlYs4mAlxviAstjZC/Vk=;
        b=hrOp0tO5FEoaPGH34Hsn285SOigSb7tvW7z1R7dgG9icHhr74uF+v0g5rUd04YdXx6
         5P5GwRqWAoANKj8nrOmgZy5GFWK/vWrfeDiPV71QYRp/rmj4Lq7UzNdh0kmJAuD8SgYd
         Qm8EoK36fTs+zdGUXJCQoiQat0UZr4uf+3CZqM6IEwirGsw9xots7F84hmXQDW9yYg51
         xdTJUmFN1lkiQnuNs8vaYdaLbZ+a8g1fw8XMW9k22WxxVxlL/om/DVGEecr0HYf8k93A
         4YztuQSrnMZOUMmkdIwAGqIXOhO4sajtzQl7tIL4aR6hFQWcr5EpUNReo8+gqMvctI3A
         6L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795328286; x=1795933086;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ay90uQj/01Rf6CTpvGUzFCHxlYs4mAlxviAstjZC/Vk=;
        b=qd0r8rVaGSPQ/5YGRndLxlxcRsD7e4G16imfh7lQaQzM/pUkeCciUgR7BbO9KVgmzj
         C0OaOoiysIDoTjN5dCvbzFtnp0sOkvcnkDDghhJ1Xwu4NG87uccIEQUqyK4EQknsV6fe
         /NxSUvXbUKkatRKhCeOLjfdPUlXo+IxI85t8SzAAIKUsyRZgaCkX1sJXaOeVRNyuMAvi
         LdZoXJxdQScnHHRVoRQKYuynPCRAcRE+KxgrWEFpmQ2al5oLNyNZwv5wvEIWLrZ9Ozw0
         9oNjTG/3euqCxVcJ9G8AhjMK4Gzrc3p4M12IoCaSxk4BShOE6MuHQQRiSOmJTqOGrjpm
         MUAg==
X-Forwarded-Encrypted: i=1; AL+hErHfvdBwHpwGrrKRtOOUEnZ6+ZP7cIKegcnQXtV6okuYpOrIG1DMn9VTSW9JiSuasEIEigZGZEE1m+EAUpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KqBJ+650C6kGcsbsyScpIXpgiC3ANYfwrZxMIWhi31vLt/ict
	ozZyiROpCAau8EqjEwBSbrszn8ZtlLLN8h3Ds3/ogKS/O33PNsSQ4mMQ
X-Gm-Gg: AZFdTZcvwQ+YXewUTmafqy4HJxnD3lvrN1EmJ1Hcq9MqiNcDPS6SfC5KG9lAmn+z4H7
	eF68hmPduTRf8UxNGwiZ9PJNKXwncK5AUYrI03sLfZndd2NRthltWmI6RoPPIErJ8F3XbaXSkC4
	pInL7FjcpGJBMzxqLk6czQeU9pxnbQjXKezQo7oWffV1iBR+w28mXvevs9GCPkaoKdCILcVPEih
	KOibFeaGWJI832zPq3K13PcxT297VFTzv17tnm1+JR8VlLdBobErVcR+786DmiYP+gQ07pwj69c
	oZDzxMynjF4/tbppYscnjSEkdiRiyHhiY//6HuTDY1fCZyza8aLZkwdTzvcq8a9uL5ZvuezufMj
	g1/xPFvq2Aej8PRLfjp5cui9hvuDZAjb5J89azOudDkmArAh2y4ftDjs3FUrNmIAI9Nb33zFfVD
	aDiSNOw3InZWyoJDzVOubwYbFpvXTa3nR91xuqrrJoMacec3q5sEj5eBSkq6VoKibvtBM8Fmfxu
	48c1EvAMZPIy0wX54ZAjjd2nZSYsbVknAKEjK+/Hv8sxgGvlWQ1HaokDj8y5yA5KUxkXSsqN2lT
	J8tuE3eYUixp5QxSIrHSDoRKJA==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr179340275e9.6.1795328286170;
        Sat, 21 Nov 2026 22:18:06 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm147735705e9.2.2026.11.21.22.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:18:05 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	edumazet@google.com,
	brauner@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] kobject: fix use-after-free in tagged uevent broadcast
Date: Sun, 22 Nov 2026 09:17:46 +0300
Message-ID: <20261122061751.178540-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kobject_uevent_net_broadcast() accesses net->uevent_sock->sk without
protection in the tagged (namespace-aware) path. During network namespace
teardown, uevent_net_exit() frees the uevent_sock while a concurrent
kobject_uevent_env() call can still reference it, causing a
use-after-free.

Extend uevent_sock_mutex to cover the tagged broadcast path and the
netlink receive path, serializing them with teardown: in
uevent_net_exit(), set net->uevent_sock to NULL under the mutex before
releasing the socket. In the tagged broadcast path and in
uevent_net_rcv_skb(), check for NULL under the same mutex before
accessing the socket.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: 5c0941c55e5f ("kobject: reduce uevent_sock_mutex scope")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 lib/kobject_uevent.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..fd61307c045e 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -411,9 +411,15 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
+		struct uevent_sock *ue_sk;
 
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		mutex_lock(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							     action_string,
+							     devpath);
+		mutex_unlock(&uevent_sock_mutex);
 	}
 #endif
 
@@ -743,6 +749,7 @@ static int uevent_net_broadcast(struct sock *usk, struct sk_buff *skb,
 static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 			      struct netlink_ext_ack *extack)
 {
+	struct uevent_sock *ue_sk;
 	struct net *net;
 	int ret;
 
@@ -760,7 +767,13 @@ static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
 		return -EPERM;
 	}
 
-	ret = uevent_net_broadcast(net->uevent_sock->sk, skb, extack);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	if (ue_sk)
+		ret = uevent_net_broadcast(ue_sk->sk, skb, extack);
+	else
+		ret = -ENODEV;
+	mutex_unlock(&uevent_sock_mutex);
 
 	return ret;
 }
@@ -804,13 +817,14 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	net->uevent_sock = NULL;
+	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns)
 		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
-	}
+	mutex_unlock(&uevent_sock_mutex);
 
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
-- 
2.56.0

