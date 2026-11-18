Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973747;
	b=l/+Y16eR3PcGi0J8bpvb7O6lLPYc+ddWdE0PpxraLW2KT1fS2LY6cYAN8yX66RWK0GbV
	 BmpoaLEd22oMJOivbXSZnNxwSzhjCeuzfJ4/Tx82KYgw8gQ+x9OZEjw8dYCnhHfNCjPCk
	 yEEHeVQDdXLYsPuNlKXTUERIdUkKZu7w57Xcd9GEFj1aAIlIUmTZg/NxeXY32MqWcqgQT
	 tEQbPEmOTDTsAmD+s5P56kiF2PvB86kLA00JPaabC3MTzNt60xgzf7zI7YvRkFkSAgzbX
	 HXUWHmWdcsGV0DHUfTQI/T5huvg1xOBR1LXiMv8fNt2OGSc8vpUc+yXJc7nxdovBtxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=IGZ1LY0R7muEviWN7fb4euvV9psptmj/QGERpFprukU=;
	b=iNQGmfYLjepwjZdGtcr/JwDW5Rx4wr7mK8xg1W0QMOTYf1jVVpp0Oq2QqFWIq2be/BJj
	 4ROoa2Yc4/SG+qZQfC5Pc0PKX1xl3oBygmsCUPBcfVA5uOnFaEC4NY+ina5hrRHSpYuvp
	 7bK7s5u7D9nGziRFu1K0GVBX7nyGyUrvY9YMYI24Pn8jOYOcM7EW7S0AZLojHtRO7Gf4b
	 3bXfvH/ry8ruosZEPLIpE6dK2FkS/9D62AQt/Rn+iKzHPfWLRoUzjH2U461kK2uE+meGd
	 aHQM/4g6JUsI7x/oGZa30P0L8dgPazxj2yGDOY5PWF4vs7zd5OJwM4dguKF4RnneSEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mPeUg6R9;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A56606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mPeUg6R9
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso294580a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794973747; x=1795578547; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGZ1LY0R7muEviWN7fb4euvV9psptmj/QGERpFprukU=;
        b=mPeUg6R9421yjKq8HMJfXGFNR/USS3ajLsGgaBCPa0Q8VD7nlR8WjXM7Z0LUUEYO5b
         zlu1yzTVKPYq0F4/VffGAv7KubezEqz7lZxCe7VznHjTq9Mq7O8DAHujtwQm6COtW2aV
         9YR0hsFNVrx8akhxKC3YqjyEJq36tFpF+fweqCJy4jfb8exhV6O7P6Jd3zVYk1CSIuTy
         IBIfd4mp44R6kJ9u2l7R3+H3QHsKPE32fiClZIWvfmkwDo6U5Idx3aulU1TrFCWdoC4i
         nwST+zuFxDOdrUK2FjQ96XHNxlkLjyZnVV/eUhz51A1LJdz3gwQEWTXKHNraRj8ZXxuP
         ieSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973747; x=1795578547;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGZ1LY0R7muEviWN7fb4euvV9psptmj/QGERpFprukU=;
        b=C7Zs0mZw4pKd9U2k2SE5th07vz4+GOm4vX/9c/CgsWEr3bi3TZYZa3ER539r+Drlyk
         5IlomUGtxSckFl2koZHMy+BVuv/OuuvQvi7BqTEJeVoBRp13ofx115aULgeqLB09R61r
         TFYEwUXWNk5c88R3yZLAITHAMxmvn7GFO+Of9tB/29cpK3lwei1yYM4Jbf0cItIW1nPk
         aeohbPgyB7CZwcfhKV124DHY0B1tm2iD052s2bbXcWVkH0UJEztRXBdNuD68FdBBpQ5/
         UB/vqC9OKTmFinFOdGSZWCtfTA3vhe7eF2dt5VVpq4v+gPzKCm320Wui1GfmSYKZUr69
         RhBg==
X-Forwarded-Encrypted: i=1; AL+hErHCW12jhZWFC8/cVmraYi81sJYwgkthLIP4unPkJVwRp7atRUw+UpMZMazKiDjF7KerYms5x4KAvfYKdH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4dbMa7BOmbmbBtGbNVFbWp5eYN+u1kRsZJ606ptvQxUl900mp
	/3SbIgi9UIiJdSUO0xxfvFXJFJu6f/7LPZZsx0fHi95xODNUXYagchYo
X-Gm-Gg: AZFdTZf4k1b32+oh6f/zFq7JWONPjNIXSVjzGH20c+d7iQPxgRfeJRyRkqlJIWqkp9Z
	do9t1cdUYoye8yMTLFFh/4fXDfiCydxfLpHxNtH90QrtOn8+5RXmAYuxSeVb4LUBu6SPNNiy3LJ
	wiSL6+WXtPcKc3HZp/mHkWruLk/yROD0Sc3YDniPLrQRK1yFbX/t47Tu0gUjBZdFv1qvYQ+MUOU
	7LLun8g3TTvOO59WqQdQWjtCJJYhLF1Z99eJkVg3NUH6sgw+pmiVcByZWBCtXh4XlSgG4P1qjA8
	I/wFyqGsKfsh7fhsG/BRMjk+TvVKEoG30ocIEomiiY+sWukhaqi71Np2ppsP3Zb9y5LOXmPdg1W
	mRGtnWRzPH4jnDvz5CZYq5IDI1bL6p81mU71yC6Tk8RZ/z/0z0N9ZardWU/LDcG6aD4mi2F1Wbh
	BvCaBUXJ/vCwaQZNlUzPRruztVkTBtG0knBxc1znA8uOQ/5wF+gc6F41t8ZGoMVRMCz86BKaF5j
	QjDSrp1N6b/OU6ydVzJi7GLKBHGMK6VViO8gbv53fqseRviKwlnxG/T2h6fSzh2jUk2TvNKqzYU
	XxYfd2X1h1g9agPcgbneLQ7D3cnMp5D+QwVJpWdBQHNJr8VQogSkDjJUNmpih0q8KQ6akUar4Zc
	ZXYQ5Onj1jaCGTdE3hSbudJVLeAGBmkBOHPI=
X-Received: by 2002:a17:90b:384b:b0:3b3:be94:8ddc with SMTP id 98e67ed59e1d1-3b3d074d683mr1339461a91.12.1794973746755;
        Tue, 17 Nov 2026 19:49:06 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62930a5sm5279125ad.66.2026.11.17.19.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:49:05 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 03:49:05 +0000
Message-Id: <DMY136RTAL9Q.2WQSZ57W1YLV2@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kurt Lin" <lylin1023@gmail.com>, "Hui Zhu" <hui.zhu@linux.dev>, "Hui
 Zhu" <zhuhui@kylinos.cn>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Barry Song" <baohua@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Fall back when
 memcg_proactive_reclaim data lands in shmem
In-Reply-To: <20261117170704.1146730-1-lylin1023@gmail.com>
References: <20261117170704.1146730-1-lylin1023@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 17, 2026 at 09:07 AM Kurt Lin <lylin1023@gmail.com> wrote:
> After writing the file, check memory.stat and move on to the next
> candidate directory if most of the data was charged as shmem; skip only
> when none is left. Give each candidate its own cgroup so that stale
> stats from a previous attempt cannot interfere, and poll memory.stat
> until the write shows up, as reading it does not force a stats flush.
> Fail the test if memory.stat cannot be read or never shows the write.

This is overkill.

>     To exercise the polling, FILE_SIZE was temporarily cut to 2 MiB in a
>     128-vCPU guest, which keeps the write below the flush threshold.

So the test with 32 MiB didn't hit it.
Pls don't add code just because a bot said so.

Here is what I mean. I didn't compile it:

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
index c76a7eb..334bfa6 100644
--- a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
+++ b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
@@ -53,8 +53,12 @@ static int alloc_pagecache(size_t size)
 	fd = open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
 	if (fd < 0)
 		return errno == EOPNOTSUPP ? -EOPNOTSUPP : -1;
-	/* tmpfs hands out shmem pages, which are not reclaimable without swap */
-	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC) {
+	/*
+	 * tmpfs hands out shmem pages, which are not reclaimable without swap.
+	 * overlayfs hides the type of its upper layer, which can be tmpfs.
+	 */
+	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC ||
+	    stfs.f_type == OVERLAYFS_SUPER_MAGIC) {
 		close(fd);
 		return -EOPNOTSUPP;
 	}
diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfa..2ba0791 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -30,7 +30,8 @@ struct reclaim_args {
  * being available, and a read-only mount cannot host the file at all (EROFS
  * applies to root too). /tmp is tmpfs on many systems, and test_progs is
  * routinely run from a tmpfs working directory, so both candidates need the
- * check.
+ * check. overlayfs hides the type of its upper layer, which is tmpfs for /tmp
+ * in virtme-ng guests.
  */
 static const char *workload_dir(void)
 {
@@ -40,7 +41,8 @@ static const char *workload_dir(void)

 	for (i = 0; i < ARRAY_SIZE(dirs); i++)
 		if (!statfs(dirs[i], &st) && st.f_type != TMPFS_MAGIC &&
-		    st.f_type != RAMFS_MAGIC && !access(dirs[i], W_OK))
+		    st.f_type != RAMFS_MAGIC &&
+		    st.f_type != OVERLAYFS_SUPER_MAGIC && !access(dirs[i], W_OK))
 			return dirs[i];

 	return NULL;

pw-bot: cr
