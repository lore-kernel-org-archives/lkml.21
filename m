Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870169;
	b=1PGIJoMzD+uOW868p9/QWlFGZyxRMHDEmDuTB8XfSadI54Lq8o6B6NPP8gwezPBWyKAA
	 XSSa/ITbsrXaijNYFnGvLFo6Kbbmf9gemgP0KHI+mNuZOOSXrhEpeWpnjKKMxu5z9M8Ib
	 BweMJi7np5iqpBHOmiCYoznoKTkIu6N3rL1n8zNmANGiUCdqls+3bcFqpoIuwtT8rremK
	 X1zE5xmsUFImjCGgauDZHqlVJpQV3XdP/7bpE4oPbP8zen6FErpMcw0tDeNJmLNUqzOV7
	 +SzCz6jR80YP7i9ol2khUFz2Wy3NESYh3xaILR36wy7aSB5B/dIlxO9g1fVArTj4VQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6m9F/kK+ArXr5VmjxLQQJDoEj3wCb0egZOi1qUsbEAo=;
	b=mMyUTsEVrUkn8VM0epKyV7yzhqC8O3Q1HrEG/F39gbfTRz7dHj/QyF6bi3VCL4jyzMyb
	 2bN137VNr9yEdvOiShaBISOhmG0w9cpm5tBLYKYqW5kAU3rH635E08NrE5uUYZWwwCPRU
	 LCz4/BXrzuYAODINPiZPHPp+AxqiotwcILmM/PKShiJ5Z7KA5gT95c9fEIP/DKXfdBwIw
	 02lAIREvlZvz533KIZZXlwv3eFACT6XzAr5FrwqMsB1FLUBX03bAu61WHKdc5DkVJFw/D
	 Ux1WzxTNZGri7P2Yap9LO/FN76pMQoOXEFnO8C+nzTrcJXKL9XdSGvVYyVHVCjv+1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3ZIjZ4T;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3ZIjZ4T
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so14634673c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795870168; x=1796474968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m9F/kK+ArXr5VmjxLQQJDoEj3wCb0egZOi1qUsbEAo=;
        b=A3ZIjZ4T/ZCppyXMMcqSkTfxh5A45EFbq6gUp3Hx3mYXlVHzoes0bQm0jdC+bMsq4Y
         hPGr3IMW5RwSzL4mhAmM+asQXfpZWeAIIp/cPP/G707Wd76uY/7Epu+rHQeIa+qPNvMZ
         iS7AUxuFAiugm0wLz8RqG7h/smO3ZqU1GxxpJIhCEKmneNbuBxZhCA8Wjpc28ayk6sBc
         ZHHOBsWFZL53i6sPe8e4V3Sot449vkeH1x/DRzV9A2wLm7iK+GGiA3KfpuzjsblgfxkS
         N+eUYsAoWLDFj8pEkjmwFdGIPyQD6spOlcqpXtjxgyZkFfjX67+vUrkOccKc8x7DCoeZ
         Wucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870168; x=1796474968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m9F/kK+ArXr5VmjxLQQJDoEj3wCb0egZOi1qUsbEAo=;
        b=W2O1rOU2aH301Iqu5NcNW6kXvH0IHRvnKCW0ROQnv9KuNOmIm5gmR2nHeRWVPSbQwL
         WlnkpiO0d0UxU06BsMvSyLSivzWEZ5GWg8EL8cugtQ/qXGNao+q5YTNGcUN2UDM+YRib
         FRTvO5VR01GY5wx41NJpZPPcFiwr+eRWM4HpaS8IW42M0pj7g7oIg5r4XEyfCeghvQ6e
         HUYL7FkEErPN6/s5kB9oxyAZZr44FtU3yEZtu9D0F9TQiIGwrvuS3OyGY9rHGmEOFJsX
         lLj0KS5tpFGRqqOqxYPC5+AlhUeOzAPIwE0+E7yzCqTDA/tPEYep2fJkUrr4QTIoYIpC
         ENbQ==
X-Forwarded-Encrypted: i=1; AL+hErH7vxB7RayrIhvIl/n+vqNv1tMeG9PBMBT3cKCVt8mG4nCguQB87IgRb2OQgFVRLhdYqWmhYnoqgbxj5Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nqgi2Xb6I/WPZmxOi+WJVfNPRB9Jtx0BOvEcSZJ0DtBtG66Xe
	xnkD9Peicelws7k+eCi3rqkDbWhDzfHG02yI5OjneyxkN9KAyhv+nw6X
X-Gm-Gg: AZFdTZdw49pkWhjty5QyirpB6nC/HIVekNrw7R7fgU6S4WKTse6vUcaD62T5Fyt8CwG
	Ih2xLNjKjpB/+bDyBcLk+S5m0heHi6tPsBd4lTq7TdNcSoxGgyjIRrmbQGsCM3zIgD0tdKj7to/
	qKN02LB0AqXS3DyvIniJ3YewN+ZdnojhnS47O6sZYxaTj+A4j+8Sl+IP0OowUE6xwYsYfd4En1K
	cQ/Dsa0546ZepT4TsMWjHJ2jxlJXcpAt55/8lJz6RSGJZNXTd5rvoDfWVvuzq96PK79heVgJt9Q
	3k+YoCu7Xn8vGo2TOSM0VQxaPk7n2ncj9HUICCBj0TE98ZcR7dWN85We45nPkha3LYsc77JTb8t
	xbjjqFY+dq7s+j6VYodIfpb6P0rlrrOTr8WchC2QcW8zES4+nQ0y9KHxld85SimfiW0fqSToVBf
	lNcwOCyes7ghf9wjW8NBWamxl5gsgSaYyfJpUOUl+jcW3uZCbv5F+LaHynpR+spypD5yGNU57GH
	MfM16clsbXq4xo7vs2eSyOWA/GpTp6tvHnWzu/7sXVhrRGAVZb8XaOTwtUKvAuGZP55+NsM994L
	6EIlqXnyWtSjcR99UgvLU8vI94Q0hxUDJSP3kG2Wt244wLAh/SU2bZY55sTEUtPjfJ1BjV18VBi
	JttJmpgfCltexu2X+ebOQYDrWFvMYsfNbKZvgHLiCo5d3OZ2Sy3AOIx/c
X-Received: by 2002:a05:701b:2604:b0:1b5:49da:b93e with SMTP id a92af1059eb24-1b5568bc648mr26837484c88.26.1795870167859;
        Sat, 28 Nov 2026 04:49:27 -0800 (PST)
Received: from bass-virtual-machine.. ([23.154.84.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b59d8c0cafsm10855049c88.7.2026.11.28.04.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:49:27 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Wu <wuqiang.matt@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>,
	baijiaju1990@gmail.com
Subject: [PATCH] objpool: fix missing acquire when reading slot->last
Date: Sat, 28 Nov 2026 20:49:22 +0800
Message-Id: <20261128124922.3900189-1-hanguidong02@gmail.com>
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

__objpool_try_add_slot() writes slot->entries[idx] and publishes it with
smp_store_release(&slot->last, tail + 1). __objpool_try_get_slot()
checks slot->last with plain READ_ONCE() before loading
slot->entries[idx].

Because idx is derived from head rather than slot->last, there is no
address dependency to order the entry load after the slot->last checks.
On weakly ordered architectures, the entry load can be reordered after
smp_load_acquire(&slot->head) but before the slot->last checks, reading
a stale entry from the previous ring cycle:

  // Initially: head == last == k, entries[idx] holds old_obj

  CPU 0                         CPU 1
  -----                         -----
  // __objpool_try_add_slot()   // __objpool_try_get_slot()
                                head = smp_load_acquire(&slot->head);
                                // reordered before slot->last checks:
                                obj = READ_ONCE(slot->entries[idx]);
                                  // reads old_obj
  WRITE_ONCE(slot->entries[idx], new_obj);
  smp_store_release(&slot->last, k + 1);
                                while (head != READ_ONCE(slot->last))
                                  // sees k + 1
                                if (READ_ONCE(slot->last) - head - 1
                                    >= pool->nr_objs)
                                  // sees k + 1
                                try_cmpxchg_release(&slot->head,
                                                    &head, k + 1);
                                return obj;

CPU 1 then returns old_obj while new_obj is lost.

Use smp_load_acquire(&slot->last) in the range check to pair with
smp_store_release(&slot->last, ...). The initial loop condition can
remain READ_ONCE().

Fixes: b4edb8d2d464 ("lib: objpool added: ring-array based lockless MPMC")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 include/linux/objpool.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/objpool.h b/include/linux/objpool.h
index b713a1fe7521..8350302d6e15 100644
--- a/include/linux/objpool.h
+++ b/include/linux/objpool.h
@@ -144,7 +144,8 @@ static inline void *__objpool_try_get_slot(struct objpool_head *pool, int cpu)
 		 * that is equivalent to 'last - head - 1 < nr_objs' as
 		 * 'last' and 'head' are both unsigned int32
 		 */
-		if (READ_ONCE(slot->last) - head - 1 >= pool->nr_objs) {
+		/* pair with smp_store_release() in __objpool_try_add_slot() */
+		if (smp_load_acquire(&slot->last) - head - 1 >= pool->nr_objs) {
 			head = READ_ONCE(slot->head);
 			continue;
 		}

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.34.1

