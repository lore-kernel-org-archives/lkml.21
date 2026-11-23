Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440185;
	b=4Pl3EjpPPP3KoKTDxcCrnzUNtp7AkwMGEuiaROOw2FE9ZiPjePQxD4FySndf04RCR2j8
	 W1A8CMhzKfOiCZqEhsca7CxmBFd0UvDWUJzFbRY1Bs/gXRtDGEVNIgQBcbTOK8pCBevCL
	 kIzCeAYcjE1tIPP9xymt7kLLHAEkHveivfULn3yFLrnsm1Ubt4YhjedyONtJ0Ofu1mKl6
	 TyGA061SgOM1GFdaVDWaC+A3Tn75nn/+P1ix+UntIAworC4Zfj7k7hpf0JDi1U8SXJ7Ts
	 0JXrwg+2o9UUI+nKijCsYlwE6ahCyaygr9F4QLY4dKYenpNCbzeCrZglqmHTj/irzlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nbErdJW+SNaylfayVOIrJtXlUrIgwuZjphA4JlETuDE=;
	b=KoAy4OGyIU9IvPXcK06rB6WMQTTt7PIQjSXAsVLtG1hY17JgUv/TSjvJIyk6XPk+Zg5R
	 ZGD/cB54JSNvcvcDjno7mgLZ/6Nc6rEEHo5IeajDrYJPa1Cfr255HumLyASN0PZMhG1yW
	 5l92uDhIxQy8Pr0P41Z5qpulMjaVjOPtusjkp0ZcdtKg8DS/J27Yn/qxpbUmDzqKAoiqz
	 iGfcFq6rPqNjVqtt12CHfp5eqTkOr7twRKT2lcMwQPeH754KVAFubDjjh3UyPI2Ab1mkf
	 dJgYU+zpfr5liSLMwCaPbLf9Jslg5EJeWZ16XRP08R/tGh0tICJsWW1fFIgd7lUOe8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvKduVVF;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444E2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvKduVVF
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so20967965e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440184; x=1796044984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbErdJW+SNaylfayVOIrJtXlUrIgwuZjphA4JlETuDE=;
        b=KvKduVVFXzelvUDiuGnGWupo8HvzrM9HWqhgSRthzl8L1HX7caDKwnzo53b83q3jkz
         cU3lM1pp876wIA6ggBhj8hZ4IfUZeilO64ZQ1YB9wnLJWP73VgM1pDjGK5cFNIP9hhW/
         E9PLUIauKlYPAYh+153uSjvZjmpQfZgQqaPEdL4NYnrXVRYO0XgnVZnGkPcmh2q/wW6A
         Q0x6zzK2q1ktEAZ5aCmKD+Wt3x7J0Vw3CIiZpbpYOjsiZ6qODqfVuJB+5LEZQknku2yl
         y4IZKRYn0uoon7KUJcvVTV/xFahtWuwRLWD2VJIndyHvQ6KeOhWk+qTE+vcHQQQnVZ4y
         SNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440184; x=1796044984;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbErdJW+SNaylfayVOIrJtXlUrIgwuZjphA4JlETuDE=;
        b=YrUzKtybTK5xWQMoq+QDsPRGTzx95+OphEd/yTll292zosAHpjIJd05Jh1gOZvgHq+
         9Li8++kQkqeSlxr0WcBZx0Yda7nbH8ZHix/EYMvjfAXl/ezyWddKqpbRBpITl6dRWsUX
         Xv/dzyEdXQNDabL9kAM8VK+xgGo/TJGWjLf/0K6FDCsMNwy6PKTj55bAbxsfomMcTMWG
         aNJsEFXlF+FhsgJrc94j8qYHSWpWYjaaSkBJLHh9cMrefyQlI3LcTbu6aWEtw+DmuBNJ
         /1W1PZuX+byqSqwIWk/7vDZ//PSwKvmESSYKaQv5I31UZcqVHbYrYrrvgEZhJK4h71/g
         M+Rg==
X-Forwarded-Encrypted: i=1; AL+hErEuGxkGqwKrIwNZfbbYon6wrWYUAUKKcDugh4s+eqHyAa5vYNX5LEZUFzHE8EKBmCS9GNBBfo/f/r0k0PY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jd660yGhbtvd21SyybGjniLgs4jRggx5J644zbh9iTto5REMJ
	i6/ur8nG4QLn9bzCV6CXGe884MmC2qvHE4n58U1VwPLZ3b9o5LGGKQ/0
X-Gm-Gg: AZFdTZfKJXNzivcLb14sHRt+M7GDgvMGgx/JkvlLLv5AIIZnZUI7crUaWh78478kued
	pvPz3IAP3FZ12DSn6SvKolDh/IKCF+PNbJ1r8qeL5hXbEKetNBGTB87qIuZoCrSxZ7n5fAvuszQ
	YKAtKdHKYf7sutChxsR5+lPSZLF2djF8pxlp+Z8pPh6zDCFUEFUVIeTxpnTzDnlJkmvD3+/0V8p
	+bSzch8adKMW2AvlG7tHcpFpht5TQ19FVdesV8U3n62RsV2C84NIT2xhK1Tg9Fn/VJi1/8TBKh9
	lkeSjitzu1xclsUB8p7rVz4Dzym1FZighfLCCsCmXqOV9+ZFZmWOCdExpErwcFRh6Qu1F6e5v6e
	Xx+awcWdHq9mnarNDH/nDGIK/v8L9TrhwJSIkkhqpzv38D5THf/ep72byoVF8PmUIKPYXpqBoFL
	fOA8okbJzK/PYMd+66JsP4rKQM1S+6969i5L95jvagfnd0apcdqCphKSSezcskafGse8lV1O9uW
	2FCEQsb6zubGfRUdvVyYwM8ZNHDaJx/1qcQizpvzRuySiA8SCzCLxuXSpr67NsiQ0ZL/4RWk1+v
	XVZgTI2bINz61mo7eVOi4q0JeouAN/LrbmfQCwWrGpk/0eI=
X-Received: by 2002:a05:600c:4f4a:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb8880015bmr267550845e9.8.1795440183501;
        Mon, 23 Nov 2026 05:23:03 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm546674425e9.14.2026.11.23.05.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:23:03 -0800 (PST)
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
Subject: [PATCH v2] kobject: fix use-after-free in tagged uevent broadcast
Date: Mon, 23 Nov 2026 16:16:50 +0300
Message-ID: <20261123132246.220476-1-omermetekaya0@gmail.com>
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

Closes: https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0
Fixes: 5c0941c55e5f ("kobject: reduce uevent_sock_mutex scope")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v2: Add Closes: tag.

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

