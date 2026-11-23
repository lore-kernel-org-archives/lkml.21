Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436209;
	b=C+nimGLPal+4SjAPe4cXPnjrjqw9D83e94Stbp486eQDFBa3sVErfA9k66+XI/wM+OFJ
	 P0FPydZa1ZU+cXTUe1R3OXDudBHifs1e1dn01oehlePB26csXIpMxqEUjebhA0sxoNAg7
	 AC/4PvlOfd46dkMfsuOuCEnv/nWUHGhWiMcnnDHQH6uyRJvbrjQR/FqHqZuiQQZ5R5tgm
	 x+rlkzR3/u9XRW0vzvo3mclqwNiq/nzHmaIqgKQPmG5088sM3CB7Izd6BQgwkRIGcxFev
	 +WFbfoB6Kft70WS5uTuZuBT1U3qiU3mZIacAa8kK8i96yvVMh7QU9t8nc8YHqR1lwyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4OCxwaZr9TnfdRR/mUAU5CvloH0RPFSydGvfkrf2yc=;
	b=OPYazFUanBNf4dxW9vBD0elFiqox2ZquByWFahFbWfOoOb8V/c7ZWaVZWHDNhTBlCqEN
	 1znIo6GB+TBJx6+9oaWfgZotnqNbV1RWlO8tWTjPIk22kHNi5TmKvzGZmmNP/T6DvWEcn
	 K7EWVnZnLHPTZQg6+rS3V6opEcLlYD0YmQO2C7iatK8mQVL9alSTGZljQufHYbeZiSCpi
	 i3QNyJzpyNhxZFMfEZ2LRcgLpbpkYGlgzQbfScBslmqsLruMDPKlgUTLicUxLUJ5DbVO2
	 bpQt67Jjz02oizTFyvimaBkngmjbHlKIFVNTJfeSj8FampysdKa4xj7WiPYCKdf79QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=AZ+pu4fU;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB9E606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB9E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=AZ+pu4fU
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1755904a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795436208; x=1796041008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4OCxwaZr9TnfdRR/mUAU5CvloH0RPFSydGvfkrf2yc=;
        b=AZ+pu4fUW5C3yU0jWujygtb0exx8BPNC7PxGbFsDy6EZwM00MIooSzqsAG+tfUtz9P
         c8qX4iH4AYLbHTd5wMHTfxQHJsvUnbTmOZ/u+B9fW87beiOFKuo87jSU+vWF2qA81yb5
         5XwYD1pcT8I3dXzVpk7Y3sOk4cWThlJK0rnV4LcXuL9MzwNeLWlzomy2Nnwkf6qWGkJK
         lYK3uMdD1Wr7sw9ycsd4vU9MrjVFUQqNev/jI8pJjJdbEbJlv87K3v+Ic5E77oBegbwP
         rY+IajHI84UUcgs+8LONG8Ma4nD4nokoemb8n4XgmfvQduPO6WkD330hjMfmzLqnAzST
         UF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436208; x=1796041008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4OCxwaZr9TnfdRR/mUAU5CvloH0RPFSydGvfkrf2yc=;
        b=tXbxiCDxQAGgYHKdCwJfUGJ0U55xp6oArrdMpd8AKuyQaADgEjzhurS74Obuj6tOIT
         AAkgDJKqwSRnte7Zl0x2ddIDogiazDi9gI0Ji6woujwhEdpHJZG4urnfHrGFKJ3bPdAj
         g22bnlqD6cGMk5ucbZXOqy3PhLR/bpm5GH61gcsGadMy4yIU+eSdA0U4KmNL6MvXihSL
         8CiyYiNTyhb/MM5vk/YtKfu/Nx6AClU9TlZt0iuUk/HCqwbN1z/bx4OuydTibsGPUSkQ
         QuCD9w+G20CnW91HswIkPRLFbVUCrQw2fBoibXbaVkaoiIDvViFF7mUnFRb0tbqyAx1b
         gxyw==
X-Gm-Message-State: APuU4Z/sJ/IS9AnZxnycGOZ+lTGzB4G9dLOb9PqHEg64Ypeg6Aav0YhN
	Xsg5tfWxN6dICuMmPG2PWlk9fSo7dQ9lCm3+3I+DM6bpFz/uJ6pUDgx+CGxxVQ/iVE9jPHEJk2A
	cvObdOw==
X-Gm-Gg: AZFdTZeamu8n4tx8cuVWf+P+78+68H1d9AEI1bDJf6XBFCCiEsiH7as6iZEGTqna6Q1
	eusjQcf8tGGne7Ve85ZPeoZC28LwwZLEq21NoBiW7dGAW3n+vQTuM72NiQ5rFleegY0RxUKe9bW
	8wb3pFDBl2eSu6ZOZD9A/85N/FXFwYR3dyQB59xDV1YFfJK1prK0M3okItdJVHZaE4d7mfs0mof
	oZ+3WdVsI4gOnbrXjm1aGVcNQeNpy+gQ0Oufp6WYsb//SZNFIhRhYmhXiwsR3jxaMn1CdS8FK5R
	VwAFB90DAGeup9zXRnDw4kVK+FJobw70hK1HgQHv+OUU5QGV3FZ9FsMDw3qbSmDvjs7QilDS75L
	IZeZalna+HiqETReGp2nS4E5yNWtawLEVacmNqBBaMGIq8IUQShW+Dkh65i7kZ0JcTjCNlbg1w8
	JD8lz4Yug+R8EmAe/0YhJjGJdZmoqyqmgI9wj8Vn5C5HZ5XjsB2vbHh16WSaG1jtBqcIW4/tdvR
	N9YibSuZmM9i/YXq/iNyKooK4obxZ0bjl1VzQ2N22LStf+sfGs4gTrTpo4KzFDlaPPu2nO4jk9v
	QTBQ0fvAEWQW7hXDiCNrWInCwbeWpXg8/QDT88cM8HXpXW1EgUifiS+aiYzHEw==
X-Received: by 2002:a17:90a:e70f:b0:3b3:c8dc:a109 with SMTP id 98e67ed59e1d1-3b41c7abf75mr9733374a91.6.1795436208040;
        Mon, 23 Nov 2026 04:16:48 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([191.223.218.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm21112338a91.2.2026.11.23.04.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:16:47 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	akpm@linux-foundation.org,
	kay.sievers@vrfy.org,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH driver-core 1/1] kobject: reserve an envp slot for the terminator
Date: Mon, 23 Nov 2026 20:16:37 +0800
Message-ID: <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795426787.git.caoruide123@gmail.com>
References: <cover.1795426787.git.caoruide123@gmail.com>
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

From: Ruide Cao <caoruide123@gmail.com>

add_uevent_var() currently allows envp_idx to reach ARRAY_SIZE(envp).
This fills the final pointer slot without leaving room for the NULL
terminator expected by usermode helper consumers.

A synthetic uevent can supply enough variables to make this happen.
When CONFIG_UEVENT_HELPER is enabled, kernel_execve() then scans beyond
the array while counting the environment and may dereference arbitrary
data as a string pointer.

Reserve the final slot so an environment is always terminated.

Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struct")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
 lib/kobject_uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 1d29378d4f55..f7aa67d6ee54 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -673,7 +673,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 	va_list args;
 	int len;
 
-	if (env->envp_idx >= ARRAY_SIZE(env->envp)) {
+	if (env->envp_idx >= ARRAY_SIZE(env->envp) - 1) {
 		WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
 		return -ENOMEM;
 	}
-- 
2.47.3

