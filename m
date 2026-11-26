Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698807;
	b=FNyTPJdut5a/U+OZLzIJrLH9bwtPUisbDB4WXeD9FNXmL1/4QSvSLMfB+jzBmqQwBnCz
	 SqRSo3NbgLMYOlKnh/ktjmvYJn5jXesRjxYqS54lSIjU4fuNhBIkXpixuoCeGXXUeVelR
	 UJCddpdpm7LiEi0D/6PVlAOr6LFAal+NyjIuRRoQiy6x1DGO69vzj3yUvR0Hrc2XjNEcx
	 yBoZV47XpzM8t/36FYPgB1LjBL7W+Hv2erZeKo7OgLkEcfp40fuokIwLZSiHIRJiDd4o7
	 WqTIM4CPR60REHuFnp/cfe9hN5k3Pn8zkutjlbO99NzhZYQDUKpadKcAKLWbq36/6dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=45M1pglWyzJAfT+SzxQfEEVe/IyIyurkT0fnn9e5xvc=;
	b=FASYlxky5cx54E+l8EMZkIUwyRis5VtQgdlnoOaaD4VMfoIeAo3skYDUajovLuE8Gxvv
	 3QvAwL5Z1MmT8B7CGknFpAS1757FW9pyAG+KXiSdUhzkBUm7JozFDQZPttncSruP8oGDf
	 hI3z9bvoGzvE+2ODzWVr2eyiNCV2L8s2nDZC3ABIzbB6xjJ1Q3gsT92LuKxx3yHl559uE
	 +iK4VciIwmsK1ioIweqU2K58JhoZCa2q0r7PHmfmt0UIZNZRyepCwEpKEIEG8VUYm5Iaw
	 W/+8Sa6uC9FiIslhVfN9yeJjf0FRR66KJugdAlBqKGLGxdM3zLAgMd/A7mJVEw1elYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJyNfUAz;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49AB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJyNfUAz
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso6092435f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698805; x=1796303605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45M1pglWyzJAfT+SzxQfEEVe/IyIyurkT0fnn9e5xvc=;
        b=DJyNfUAzWCoUZaHPCGXoNx2PHzBS1sxXZWwwQ8JxZ6e+pdyeJXAUSqYxV1WEDFHtN+
         jEz7LoSzhwdAPUXI5jfFdsbBdtDtKNgnCrPoYN7aqtpdHBV3Pmj+ZgudAXWUZv7yQ+Ki
         woAqTh0b0XYKbwd4d3K6/ZTBkrTjBnHtg1nxjd+LR1xdu1mj15qnVQG3wnzfYaBgt0m7
         NZwtHdwa6UQ+QHINK9GukPP+cJiLc8xz4FdInsyM7fhPzUgbxsjUxH/HmOt0LgTCTFL/
         bDkYHuP0R4Nw/QvBorzDL33vkfZwk4pDLWhlZHGWI5V9yL3Hbehgoj/GFW5mC7tCKSHb
         J48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698805; x=1796303605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45M1pglWyzJAfT+SzxQfEEVe/IyIyurkT0fnn9e5xvc=;
        b=mpDSy+B1oZhrhSqgw+7Tw55aiCmTJsITlDx+Bd+pdtTxb+S69K8puE66bkeUDDyyVg
         jxUdnXmx5VdCZ0niGKSKl//PQbEZJtyPfxBb/54+RWeJLL6FJzLNAaQt2oeFxHHMeNa0
         fOjTKWsHqTD9k1WC//ytXBqh6okWvfItYq6TismeWLGzhr+OSYGTE+Pwk+4oSsnyzUXW
         bB6prynbDBe1sL6hjLlnoBHApO7uimWvF4yuxOhufqm+lsBKw0OaFGxLzt+drfhStgnc
         xz5Fhq0dRxEpV9+zXXFR3ous5qUDXcYBmaiBbdZA+I1QhDybjkAuM8OcACwDQBDftvnM
         qOIA==
X-Forwarded-Encrypted: i=1; AL+hErHu6sh1Z30DzQUs2HJoI1KYsTOQlT/8bmm12p5QFdgat8Xn5861ybM8PHusXnVvGTaDYcwuuk9BkV88KuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u/NOw5JGWNaVfVjcDWmVXWLCXRldixFaPJ8xDJ+v36t3hXg1h
	6bHPKiBae7dG3A5PkgrR5dWtRa//TWjgGh0S6JnlWt2BMnBNEizxI9B2
X-Gm-Gg: AZFdTZcHcJAR6SDzLzwfa5CqgXMDkuo/Ccwq0ky7hG8erbrzGE+xbqaAa0Z4+K6lbin
	B2NQ1EZrfAM314JtfdB1JN3ekZpzu+2VcSpL4hK9I0ef6SwtUfaZ3yYWPJpWm9OcQUTxzNu8NXC
	kOQ7zY24R8Ly2aIVbpeNoXGxg6qDLF9AaoYBslIx1XJyBwsSZClm94d0TycQcoLQAT1GmPcrVzn
	4zwHN7Ye4gdKp4zuv9XPGd/3baryVO5r3IQEQsh0S/V9O8+gy7vgW29sv2509VKP3SZM0cY9H74
	WOlx0p+9IcSs0ju1lrSCB5NLVNjrqLBPjsdiU7VaLiX+qod/YI2qq0YnXrYGZ18pCgc04gAEjcs
	D9XY8iHiE4X+pcsyZ9OlWqNCkcHSYCQ3Wgu1ieIIaNfBWjkvQucj2ug8d+h1VxAut1iA3rnKQ5i
	y5QvQ7QIWEqoHTdyZdYiHhUdkzCRVxwd3xKjO+RUGCxfyFn/6YIlNwkroUb4wOk62F/M2bckt9G
	bh4T0bzcSlGQ4s1loqioved5ibiHSFcQu35t9FouWiDVmQzhGF/cR8pLOQVAD5Wtu7USWVjOQu+
	ipxtRieppyksygHeqfzJrw+3cWLEpWh+bU5jy6NxlTMDb6BlCMgV6Cyycz3hsqvz6NStapILXnL
	PZvIB9jL0uuzG/jPpIdLfEQ==
X-Received: by 2002:a05:6000:4812:b0:4a9:1b17:4f34 with SMTP id ffacd0b85a97d-4abb57f7036mr38287533f8f.50.1795698805223;
        Thu, 26 Nov 2026 05:13:25 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm41679091f8f.58.2026.11.26.05.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:13:24 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/2] bpf: account for local storage map elements memory
Date: Thu, 26 Nov 2026 13:13:17 +0000
Message-ID: <20261126131318.470837-1-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit 7490b7f1c02e ("bpf, net: bpf_local_storage memory usage")
introduced bpf_local_storage_map_mem_usage() to compute the memory usage
of local storage related maps but left the accounting of the allocated
element aside. For users of these maps, the elements can quickly make up
the majority of the memory usage and make the reported memory usage
quite wrong.

Walk the bucket's list to count the number of elements in the map, note
that concurrent insertions and deletions can make the count imprecise.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 kernel/bpf/bpf_local_storage.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
index b12fcec47ffa..6fb95503441e 100644
--- a/kernel/bpf/bpf_local_storage.c
+++ b/kernel/bpf/bpf_local_storage.c
@@ -792,11 +792,19 @@ u32 bpf_local_storage_destroy(struct bpf_local_storage *local_storage)
 u64 bpf_local_storage_map_mem_usage(const struct bpf_map *map)
 {
 	struct bpf_local_storage_map *smap = (struct bpf_local_storage_map *)map;
-	u64 usage = sizeof(*smap);
+	struct bpf_local_storage_elem *selem;
+	u64 nbuckets = 1ULL << smap->bucket_log;
+	u64 nr_elem = 0;
+	u64 i;
+
+	for (i = 0; i < nbuckets; i++) {
+		rcu_read_lock();
+		hlist_for_each_entry_rcu(selem, &smap->buckets[i].list, map_node)
+			nr_elem++;
+		rcu_read_unlock();
+	}

-	/* The dynamically callocated selems are not counted currently. */
-	usage += sizeof(*smap->buckets) * (1ULL << smap->bucket_log);
-	return usage;
+	return sizeof(*smap) + nbuckets * sizeof(*smap->buckets) + nr_elem * smap->elem_size;
 }

 struct bpf_map *
--
2.43.0

