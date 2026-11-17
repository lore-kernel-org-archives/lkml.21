Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945581;
	b=I+rQNrDk0R9zaJikWU1ymtwkbgmrPbfDa0qpWHlqATZVwJ5b/3n9WBQFcCnWOeWogaGo
	 DK+cpZgaPA3hYG26uBVmV1QbdmPeivuANKDRSE8qZtIC0/4pLnXBpriIjPSfzU64AYEFN
	 m6F87aObVZsRYfiVODf+9gDQToU1YQa8UaflVrn3oWxzLtVDFwpJpl+SoFNOvNxHeuVYU
	 AQ6NduBy7irl5NlKwKvFp7T8b5Tu2N3Gfoa5Q8YbfKWjInBRCPcHk19lqM9R+XqaNGpBH
	 DdXDSaBvzPVcZD0e20hgSiI1c7si6crm9zZsxTII1w5H1dwT09JnUDl/c9RA3/fW5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=n+3lEqZFrEAIaz6BaymSj2rnmWToXuf3nkXT7gTYNKk=;
	b=W7EGZk3cbd4tUcreo6EdfhRjuENakKZdR9ntA/WpfP7TeralJ8MJ36TUXHQnM1hdV3WN
	 ZrhgLq3zDxohShNDW2wzr9MXQNvFQ1YUGdosVoqWwOoM8OjvEtuEHjRuNyA9Y8Z3KVBG6
	 Dxe4nK63XRsID0/XwrtMj6+JxuGUBDqED66kwDwiuc72k0ObWN1uKeItdub4B1Z+lZmky
	 9HQnJEnMRRVzGmkgK54MqXBX4aud2IMZlwF1pKsJwpf1lEKIT/PQB5Vu2B2Buf53ssleY
	 5VOFE4xUDSlouTB0QEs8g4sgizgK85Ca+2FuMW3rD3WNzHY7SoPWvpCsHx7T+F7lXOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=b8Q2Z1mD;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3247E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3247E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=b8Q2Z1mD
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55c4e670fc6so1861751cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794945579; x=1795550379; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+3lEqZFrEAIaz6BaymSj2rnmWToXuf3nkXT7gTYNKk=;
        b=b8Q2Z1mDd9Ew9x0d0evx5Z12+mhfwIFhgT2R7dOlwUZNhmA+2RT02nyRB0HDif8wXG
         LuRjZ1DavmvUn6xleG+3EgHgDA3omZbsrFMReVF1RItU+Inon9IGdndsfV9jrH//4tok
         QrwUWDBKn2ZiFQLWSubkdN15qQJQJND0RF0XGBBL+A6Y0bDeScMyJjitxoEZO5mXfxmx
         j2P6UBe+qzU4UjmKGXPecd5Vx4ahHN3WDZ0sosYlFcTxJ5QyDBeu40+aCYUpov/I9++a
         2dSTRT8YYhU3JE1s0U4xQv+3hMkIaPz55IEbJNtwIQjjrTfp5vyZ8MsLA7WWHdfkOAk8
         pOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945579; x=1795550379;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+3lEqZFrEAIaz6BaymSj2rnmWToXuf3nkXT7gTYNKk=;
        b=VcZr0rLALKJhGssIGoP/OgY1nOHAJDkfXejEqFgKtPVZwHi3vHmC3t50xmPQiBAv4w
         BEgzHXRid9teA+1obN3Me3eFIPZo3LRFmiFl56dIqVbIDk/jD8AP0ZEdOjTY+SJIO9QA
         NQ8cB0E75Ymrcgc4yZWQCms3MASAuHn44USU7oBHxp6DF5AQAz2NLfQvVefy25J1ISE5
         zozXeC3jbCwYw+i1vvH2mmC6awdGJCU5wCuWaXwTA53H0X8L2TyONM1PJzCzq8RMHPG0
         Fj8o9YK7LUOP1KcrzymnkpoZp0GSrxFXrhSVnuoih3SlcUMIgvsSTMOwT6sU/VWNUiGz
         9gnw==
X-Forwarded-Encrypted: i=1; AL+hErF+bSSxXdmWn5xzZsId9AVd1yhXGkwah+TU1jwqMRuHuHmNqGrhvQaH8TsZuGgEIa7NEa5lM7Ol5So68b0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GmNJ3dFaX1G5n7S56EvPQRqIJbMQaZJonM/OOA1Nj18/Ywqsd
	ua73ftpDv8bqXg9cDaH4xWc7Nu1WSGScWJHlVy+AcdNYaozYykQTHGTgfaQ8snvHMWg=
X-Gm-Gg: AYBFou2Ml+5ump44qjZe/ukawFmSrU663jAL2BFWrA5DIFA5xMPi9uD4MiET2tHA/5Y
	a193RhkVQlLGg+WhWCRqiqOTx1hWzqJkdvgENJD7NEuvzRIhBWW1E8BMLqTTHq/0bLdrH6q8Oj4
	xWJ3TZE7fxv/2zrjqdgQDHY+gMq8rTP3AUfZCI3BS4txZhQUGL1Uxf0Jzx1Z7qZ+59GP9KuyXXQ
	trVsJB2xUu4yN8Xdv1OedjleOE4vcAJSsbYnnjfroTYQ40EYWM5bk7z/e4HFeCi2LVzA5KVXboc
	OIZasjeANLbX6Q9gAEq3mEqvLW8F4N2dOJBsM8XUi5PxhiOMx4WJaFOXJtGgtcVkzxg3oiNc+FD
	yiFE1EcvoT05UJyWyPsaUbWq0Kqx7GTfdEFYzf9lmdgxxBgOBjnc485IQkQT1EwOyRf6idp9Bpl
	/79jphDSkGr51QE6F8Im4XhXy0MzySlFILxamXwv13dD/4kbp3UP6xLHaZn+qTz3zAcldkcKqo4
	6KV9RRjnXGW/K1DZCXFQhv4xSlV+bSJGYUK0n7HIAn/sh6odbWaro2QXtR+CaxtoHsPBE45Aocg
	vw28d7ki/kx/nfKjjMAZY5YL23wsmphezBGSUhz2SwIn5eGlcj4cpgmAQbsg2Fkgmot439d8UCJ
	9AN0DdK50MMYZVr8hYoLm6gJ3JlM/
X-Received: by 2002:a05:622a:480d:b0:536:72b4:b84c with SMTP id d75a77b69052e-55d5a4d0b40mr5934331cf.27.1794945578703;
        Tue, 17 Nov 2026 11:59:38 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d59035c81sm4825961cf.12.2026.11.17.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:59:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/mempolicy: fix copy_nodes_to_user() for odd inputs
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
 "David Hildenbrand (Red Hat)" <david@kernel.org>, 
 Gregory Price <gourry@gourry.net>, 
 Andrew Morton <akpm@linux-foundation.org>, larips <larips950@gmail.com>, 
 stable@vger.kernel.org, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jackie Liu <liuyun01@kylinos.cn>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <avx0Ci5uPW_hF0Jk@pazuzu>
References: <20261117142628.3931151-1-arnd@kernel.org>
 <avxnIQTcFni9G4IN@gremlin>
 <541a67af-3b45-4d5d-ac4b-c741850f92e1@app.fastmail.com>
 <avx0Ci5uPW_hF0Jk@pazuzu>
Date: Tue, 17 Nov 2026 14:59:37 -0500
Message-Id: <179494557732.482102.7719202079181127037.b4-reply@b4>
X-Mailer: b4 0.17-dev

What about the following:

--- 1/2 mm/mempolicy: convert maxnode to a bit count in copy_nodes_to_user()

Converts maxnode to a bit count on entry to copy_nodes_to_user() and get_nodes(), fixing the compat KASAN stack over-read and stack leak. Fixes e130242dc351, Cc stable.


Subject: [PATCH 1/2] mm/mempolicy: convert maxnode to a bit count in
 copy_nodes_to_user()

Whenever maxnode - 1 is a multiple of 32, compat_put_bitmap() reads one
more compat_ulong_t from the kernel nodemask than the caller asked for,
and writes it past the end of the caller's bitmap.

When the kernel nodemask ends there, that read goes past the on-stack
nodemask_t in kernel_get_mempolicy(), and its low 32 bits are copied
to userspace.

With CONFIG_NODES_SHIFT=6, 64 possible nodes and a 32-bit caller
passing maxnode=65:

  BUG: KASAN: stack-out-of-bounds in compat_put_bitmap+0x122/0x130
  Read of size 8 at addr ffff8880150d7ec0 by task mpoltest/241
   compat_put_bitmap+0x122/0x130
   copy_nodes_to_user+0x14a/0x250
   __ia32_sys_get_mempolicy+0x1b0/0x2b0

Convert maxnode to a bit count once, on entry, and use only that in the
rest of copy_nodes_to_user(), so the compat path gets the same size as
the native one. Do the same in get_nodes().

Fixes: e130242dc351 ("mm: simplify compat numa syscalls")
Cc: stable@vger.kernel.org
---
 mm/mempolicy.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 4da1cb8777f68..390a31a99b4ff 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1673,15 +1673,22 @@ static int get_bitmap(unsigned long *mask, const unsigned long __user *nmask,
 	return 0;
 }
 
-/* Copy a node mask from user space. */
+/*
+ * Copy a node mask from user space.
+ *
+ * The nodemask syscalls take maxnode as the size of the user bitmap in bits
+ * plus one.  get_nodes() and copy_nodes_to_user() take it as passed and
+ * convert it to the bitmap size, nbits, on entry.
+ */
 static int get_nodes(nodemask_t *nodes, const unsigned long __user *nmask,
 		     unsigned long maxnode)
 {
-	--maxnode;
+	unsigned long nbits = maxnode - 1;
+
 	nodes_clear(*nodes);
-	if (maxnode == 0 || !nmask)
+	if (nbits == 0 || !nmask)
 		return 0;
-	if (maxnode > PAGE_SIZE*BITS_PER_BYTE)
+	if (nbits > PAGE_SIZE*BITS_PER_BYTE)
 		return -EINVAL;
 
 	/*
@@ -1689,31 +1696,32 @@ static int get_nodes(nodemask_t *nodes, const unsigned long __user *nmask,
 	 * if the non supported part is all zero, one word at a time,
 	 * starting at the end.
 	 */
-	while (maxnode > MAX_NUMNODES) {
-		unsigned long bits = min_t(unsigned long, maxnode, BITS_PER_LONG);
+	while (nbits > MAX_NUMNODES) {
+		unsigned long bits = min_t(unsigned long, nbits, BITS_PER_LONG);
 		unsigned long t;
 
-		if (get_bitmap(&t, &nmask[(maxnode - 1) / BITS_PER_LONG], bits))
+		if (get_bitmap(&t, &nmask[(nbits - 1) / BITS_PER_LONG], bits))
 			return -EFAULT;
 
-		if (maxnode - bits >= MAX_NUMNODES) {
-			maxnode -= bits;
+		if (nbits - bits >= MAX_NUMNODES) {
+			nbits -= bits;
 		} else {
-			maxnode = MAX_NUMNODES;
+			nbits = MAX_NUMNODES;
 			t &= ~((1UL << (MAX_NUMNODES % BITS_PER_LONG)) - 1);
 		}
 		if (t)
 			return -EINVAL;
 	}
 
-	return get_bitmap(nodes_addr(*nodes), nmask, maxnode);
+	return get_bitmap(nodes_addr(*nodes), nmask, nbits);
 }
 
 /* Copy a kernel node mask to user space */
 static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
 			      nodemask_t *nodes)
 {
-	unsigned long copy = ALIGN(maxnode-1, 64) / 8;
+	unsigned long nbits = maxnode - 1;
+	unsigned long copy = ALIGN(nbits, 64) / 8;
 	unsigned int nbytes = BITS_TO_LONGS(nr_node_ids) * sizeof(long);
 	bool compat = in_compat_syscall();
 
@@ -1726,12 +1734,12 @@ static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
 		if (clear_user((char __user *)mask + nbytes, copy - nbytes))
 			return -EFAULT;
 		copy = nbytes;
-		maxnode = nr_node_ids;
+		nbits = nr_node_ids;
 	}
 
 	if (compat)
 		return compat_put_bitmap((compat_ulong_t __user *)mask,
-					 nodes_addr(*nodes), maxnode);
+					 nodes_addr(*nodes), nbits);
 
 	return copy_to_user(mask, nodes_addr(*nodes), copy) ? -EFAULT : 0;
 }
-- 
2.56.1



--- 2/2 mm/mempolicy: size compat get_mempolicy() copies in compat words

Rounds the compat copy size to BITS_PER_COMPAT_LONG, so 32-bit callers
no longer get 4 bytes written past odd-sized masks.


Subject: [PATCH 2/2] mm/mempolicy: size compat get_mempolicy() copies in
 compat words

copy_nodes_to_user() rounds the size of the user bitmap up to 64 bits
for compat callers too, whose bitmap is an array of 32-bit
compat_ulong_t.  

When the caller's bitmap holds an odd number of compat words and is
larger than the kernel's nodes, the clear_user() of the tail writes
four bytes past its end. 

Example: a 32-bit task asking for a 32-bit mask (maxnode=33) on a
2-node system gets 8 bytes written.

Round the compat copy size to BITS_PER_COMPAT_LONG, so it covers exactly
the words the caller passed.


Fixes: e130242dc351 ("mm: simplify compat numa syscalls")
Cc: stable@vger.kernel.org
---
 mm/mempolicy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 390a31a99b4ff..cddca1db3d9a1 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1725,8 +1725,10 @@ static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
 	unsigned int nbytes = BITS_TO_LONGS(nr_node_ids) * sizeof(long);
 	bool compat = in_compat_syscall();
 
-	if (compat)
+	if (compat) {
+		copy = ALIGN(nbits, BITS_PER_COMPAT_LONG) / 8;
 		nbytes = BITS_TO_COMPAT_LONGS(nr_node_ids) * sizeof(compat_long_t);
+	}
 
 	if (copy > nbytes) {
 		if (copy > PAGE_SIZE)
-- 
2.56.1
