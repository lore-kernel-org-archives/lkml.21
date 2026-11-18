Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983245;
	b=cJO74tikhqTsT3IuiEuvL46usCYLjMVrVVAI2xVtuCOuSKmVarF34eURB7W9rcUryd+F
	 aFyBuUZeD4ldyGLYDvkVmQxb30SKvOzmGVnOW1oP9v0g6HXg+90HgNntH2MCJ6aFwZ5di
	 4NptA9ZJXA/fiZKHK+YpHXsLbf945q3wPl+LcHKoMAKuVJmBiQXPtTCLFivv1rJQCm6Bk
	 Jfv9B2ApX73nhdN35NBhN5Wl9Z8oKNLWpXppuHtslIZjG1L1JYKPSJRQUsd6Cs+LpzQqn
	 bW+3fx5Uje0vo5y6EOyP0cyzDPsnFFME/q6SeNtj4YGxDh4ymiX+mNXTnPLRsyrwRdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7z2zaD9FhGQE52XLgJ6ugKxfSiH1puWP6hppmumNUXE=;
	b=dX9VwtK65KiT1F/R+FjRQRBtEr7B3hLsWcXtpNA3zfMGyXar93FV+KaCfskoCKPndo8/
	 7+X7TE6JSOIj5Bg3Mkh3IDsGHks0QTT1k7dMvdf5o8ivm1Y3c9v6Fw6VE6cAH6/OhhXbC
	 OiCLEwh0Jb+2RzM2A1Dpj5TlSJ7dvbs8WlyBXr8LuWN/jDZBscyZqnrEvXDyQucUVf3Z0
	 87tpyVQu+qoQosPDvvsEQoOcuOzXIeovLcZK/VyPtPH58envFNbRwYy7rQ6c8mnC7mm/l
	 c2t10oY/2GwVkFyYfvVFJCpKVwEaar7jIox4ZluafvaSDUUFgfZl6UPP2rizbfuN6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7IwsRBo;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA03C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA03C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7IwsRBo
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so970005c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983244; x=1795588044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7z2zaD9FhGQE52XLgJ6ugKxfSiH1puWP6hppmumNUXE=;
        b=x7IwsRBoydcdMDD+Flq5s/JnPlKTEaTAsAn2nfIjGaw9MBXsSkA2Nfw1JPuT/ZsYiO
         HFnNJEA/pLadXhW1Es4LkjsSrJk5cCs6GzQANCXo9CK0HEkNqwyA79/NvxV2VT1qN5wp
         ykphWF/0eZ+abm4urq7bmJ5tU3rsxPO0CwuSGB6CCcg0u09knvlleABa3/THBgY8JxSS
         k2yECAxi+hhOeO3KlJ/e2Y8XcfRLPLHadbCyN6f/pSkmNQU1Cs9yOgAA0h4mih9uOzBZ
         alWCisxdNxSdOk1hpRZvy0cA7ejdlDqC4Y++CwLE9zby1T9bxWTadwbAH7oyzSQNKuwW
         4rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983244; x=1795588044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7z2zaD9FhGQE52XLgJ6ugKxfSiH1puWP6hppmumNUXE=;
        b=M1sW02tOSCppPCpfAdZky35PVfw31qx2Wkj73u7X2HNAjfzOWVDgw1AAATWyA6lfXz
         Awvg6UNlfdVe2cAqNZ3sYqup/NQER0fd/N6LipFTWMMiX3OJF0WpvAeLInENis6wJbje
         GxU2oKVIOlecTWFi81UegZm8ILipxenKrcqEY2eynRsIkdTmYWR04aRMn1prsQc6b63D
         qLPmBZHCUqI/LoztU1Bbn7tyvKJievioCQYUybNrog1CQBh8J3d9P8QkA/qA2GK/7RH6
         41glM63SDXM1V2Wk29oC2y2DCwVOQQpWoSQyRt+XBc39w8kaHu3uE+v9185kd2VA32CH
         Dl2w==
X-Forwarded-Encrypted: i=1; AL+hErHIi+S+FakpzQIhfGKSrLobCqiFp6lK8asBVFqFQXYVAoCjxkF1xFlL50GJqLsRvk5ZRM2W8IaXkQ3oPyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LaNmgI8smI/HqpDdVAkz0mAKo2fWLGs4VGC8AbBlT0EVLIfyi
	GpbpZfz+wnavLP6mjRsJi5ShN2PQQSjqwIJJVOZU83s5dsaSoZx52wWb
X-Gm-Gg: AYBFou3pJT5/q3TnV2tlh9XJ/PcjA6P3nqfmQij4JRCOE3Ra1ise5mFbmXSV2ABb4s6
	R3GkCYoJyBToPLJIgjnlpie24bosHhdDmDJ+At/JcUlOPrvhspmrupDI2C2cdTZlzrmXt/Wacaz
	uhHMsej4rYHCpFgGkYjxciycVCKAh03ETzlqgVj+tJh/MMAjZrnYoZBpzo6pZpjTLSqBvHda3QV
	XlsYgZhnHZP0Mj33qj7qmCr+u6aiD6Jtu9JwzUoO92CF4y1/o51Ofcns5Kb5E+ffJ9N68CH8N2C
	0eon6WPvG14lwAoUb2Y2jiYkFnlG1KV1AtpxeKIgvOhLULaS1dvg1Ltm9cfwWiMbZqfU0A096zB
	EFkIMS+ujxKe30W8yUQfDvmkuI48OBDJ9CzXEvD238fpuybbvPkFNTaUR+CPrxb/C15wWPSBWii
	onHgKNkR89t5mfqNv98LW/Kec081td6lfOlHce+7heckq+3lwUs2WmDNfAH47iXQ1WOLFRXdPhz
	lnmdXpvBlykZ8ueyenEc4Sfi6bf57fqPOJ3HgAP8xGYTg15uxYQIFJ9kjYMKieKiIjs3Xl27gU+
	8jqVn6XWPmxAiwRdvt3XwAm8Rli5OsAE0ugjbi0=
X-Received: by 2002:a05:7022:b88a:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b543d06698mr1557626c88.34.1794983243728;
        Tue, 17 Nov 2026 22:27:23 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm3608663c88.14.2026.11.17.22.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:27:23 -0800 (PST)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net-next v2] net: avoid hashing the namespace pointer for device names
Date: Tue, 17 Nov 2026 22:26:52 -0800
Message-Id: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
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

dev_name_hash() salts device-name hashes with the network namespace
pointer. An unprivileged user can time SIOCGIFINDEX lookups for chosen
missing names and identify collisions with a resident name such as "lo".
Ranking this collision pattern across possible KASLR slides recovers the
init_net pointer and thus the kernel text base.

Use an unsalted name hash. Each network namespace has a separate hash
table, so this does not change lookup or namespace-isolation semantics.

Found by AI-assisted code review and reproduced unprivileged on an
unmodified kernel without fault injection. The reproducer and networking
selftests pass with this change.

Fixes: 8387ff2577eb ("vfs: make the string hashes salt the hash")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
Changes in v2:
- Pass NULL instead of net_hash_mix(), which would expose a seed shared
  by other per-network namespace hash tables.
- Target net-next, as requested by Eric.

v1: https://lore.kernel.org/all/62774f8c6cbad549d1a95f88df99ab7745d7f6b8.1790917676.git.zcliangcn@gmail.com/

 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d88af07aea29..12100fbf9022 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -195,7 +195,7 @@ static inline void dev_base_seq_inc(struct net *net)
 
 static inline struct hlist_head *dev_name_hash(struct net *net, const char *name)
 {
-	unsigned int hash = full_name_hash(net, name, strnlen(name, IFNAMSIZ));
+	unsigned int hash = full_name_hash(NULL, name, strnlen(name, IFNAMSIZ));
 
 	return &net->dev_name_head[hash_32(hash, NETDEV_HASHBITS)];
 }
-- 
2.34.1

