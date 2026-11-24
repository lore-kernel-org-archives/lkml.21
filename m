Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514722;
	b=2iBxdbIndMPaAD4If3sqDBKe7QPT+cQvMbGoN6SVhmLTMtS/3/hRd2zpdPJrZNV8Eoj9
	 O1cZs03f0ynY0AWGqzHnnGx6LYkGilzeLfMsqi4al7HBsUB6MzjRcigNGqv51FT4XBGtj
	 BTBQLYGOXGXjjCPhFwDplXgPFVuCIytOVKil+6UswPCKnYBPaYmA5HkoMMGdEnIIExGyk
	 We3wqLmwts8vcG9ha55gfb5Sl559IiaAkc2hjn/3ldcvLpXJtD+n2lQHrhW0TS+68E/bw
	 oqa8pzG04se978weAt11tqt/Nc0IxMf/EoVZ3IBklqUBgQetHpU4TCqAYRw1ON/eW3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h8PsPIoWLmVL975tN402YNrehaZsdtj3RGMKgtoV45I=;
	b=zpQy5YvRa6MXlR93fUVM4UPYtiuLlQLiQHZo8eBZVrT8XccEBoYO2kPPyQDYghSi1sHL
	 IRivAYMI2Hc6B5+Z6Z7DG5CNF4cbVrPBXG3Gl+yf5VoGVfGQYP/Eb9B++5V0LpUJLlOXE
	 b9q6nl2/zFD/RdBK91J0CZOLBsSpS1WVSK1D7Dyl9mnErSl9fhXZMQ7o7QAvLLi8bO/fN
	 gsKgVpiYs8m7qj5Wg+R2vCGTRherx/U42BaYUE2XAhqYliJNjjq8mYHSIhyOoJ/sanesG
	 B5cXRZDFntoQDv6gZJhj5wgridcFfGBFXxiz8H27M597N4UOpz/Nq5T51znvbW57bIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6zIgd4v;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D6F606A680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D6F606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6zIgd4v
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38692f62b22so3976343eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514721; x=1796119521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8PsPIoWLmVL975tN402YNrehaZsdtj3RGMKgtoV45I=;
        b=I6zIgd4vipBGE58Y+aBvEx5V6bGiEwrccolR1pU3javgyO3WbtKBsMy+bEO+Sd/NM0
         fI1MTlumIi64kXVNpf86lyczVhjbkfCz4pTl9lBKQcRnlz1OpAed0rDRT3mXs/6AQSWT
         hEp0REyhACOQhxK7cRnqxTHwyTMl6jZKwc2cB8fvxnhDTXhoDOqUFVpp4x7gZvKllEOB
         3ivmXjwWp+wRiKn9clfoTN4KDYzNQevnFiaDWhIAjTK5N+t/i8sdWxIb21gqxy+4k4bS
         v0/lPue7beZN1+64sDQs26Q7co32P4Ocox5xH11bqL44p1cQAYQzenBE+luT+eJUGjT+
         t5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514721; x=1796119521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8PsPIoWLmVL975tN402YNrehaZsdtj3RGMKgtoV45I=;
        b=o1J6zeZdEQ9rUSTXZh4HLhV+PuPue6D9IxdWp/wYS30HaNhfx8lFUjn3xHcNWIFBNj
         IA/4jXXQscRKuNtyiuKxFKYnH5OgSR9oc3kfQe/CDlQeEBVdApQnwGXYu5aZLn5zlTnh
         PePv3AwNmBfN83XJ3E8boKpKRhzduL0wswf7YApv1cSeJFpLnki/r8qAgUSBxJfGrVjJ
         eL5Ojx0keWBzBywKSnqqVO6kRZV1gMRmdqNVhWhH970mD0AnoRsCrVKmdblL/PQKaBJf
         IOK7zu627gZpXOaHt5kAWRnyTgG9gsqB75nxdVLnY24IgErChpBhKppuq2gaBqNwAsWP
         10JA==
X-Forwarded-Encrypted: i=1; AL+hErH+XAf+mbUIjgHzvvIy2ShY3lfrzeEsH0rUbxG5gh2HqzLI58QqtClO/ZGPhgPGEb/6VZwK8tXjTOC8w/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zuMNseYzzk1fPRK92nyMfOHIlhZtaIXMV46/rDpNKjfLkRkZE
	bDMn918maZNe60sB34vHnwxLSfDhcA7rgLYItdPoW9T6BRhjFDZ3OO3pMVIcLg==
X-Gm-Gg: AZFdTZd8tVr3LJafjBf+7Xa97Rj/T2e93UneAqpsGNhuGVgSZqggKYU/fwLpbOmxhil
	MpACuf7Z+Gbz3G9fE0PqImCXMVgbte721uWbUIZMxZWKSM6+oe59ijaVfLrG4gRWhQCmVAxDUj7
	fCsPVualWGFwmQNGyXwxKAQFQAvOmS8mSGLbw6edeV6UDTnruhFsiwb6BimaKLNARV41IJUw3n3
	koB7wp3ezRf0Z3y3TPRgWuOLgzGQkqK8BGUPZWJqE8dmwc7ruqzwE/OnKXUQ88ews1656gJGwBE
	77DNmxK5KJYy9nCwHgdt7S9yAyRBKvWJiZHQNGE5iB8pQfxmaHlu754tlM1+Ls8Zv5oKIl1Y+Qc
	mPyXwsH+LpWkBes4Y1TTj3sqYgBBlcWFRg/qaN1GWHLRbSIigmWcF9tq9BRPWrR4grkYdXYBr1N
	Gope84KVG7SoBOUgnRXJwKN/XX4DcpWJGqgS9rBs4ijzfY0K5//zUOlss5TEFt+voG0RF7jzX/W
	Rc8OPnWqETiWG+8G7vIqp1hw5uNQ7rYJNR4KVLXysaBaEDOzpmU9XC8mHAqyAQe0WnQ2a5SdBy4
	LLCBtcSNTCwP65YXg/RoElaAsAs8hvhLMWxW8hKxua8/5HIUQoYYqjOY7yfU/dlF
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr13583566eec.39.1795514720624;
        Tue, 24 Nov 2026 02:05:20 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm19080284eec.18.2026.11.24.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:05:20 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: reject oversized exit_dump_len
Date: Tue, 24 Nov 2026 10:05:03 +0000
Message-ID: <20261124100508.1060692-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

When a BPF scheduler is enabled, alloc_exit_info() allocates the exit
dump buffer with kvzalloc(ops->exit_dump_len). bpf_scx_init_member()
stores exit_dump_len from the struct_ops map value without an upper
bound, so a length above INT_MAX reaches kvzalloc(), which warns and
fails, and the enable fails with -ENOMEM.

bpf_scx_init_member() already rejects oversized dispatch_max_batch and
timeout_ms values with -E2BIG. Reject an exit_dump_len above INT_MAX in
the same way, so that the map update fails before the value is used.

Fixes: 07814a9439a3 ("sched_ext: Print debug dump after an error exit")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 kernel/sched/ext/ext.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..6dfe70249a7d 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -9221,6 +9221,8 @@ static int bpf_scx_init_member(const struct btf_type *t,
 		ops->timeout_ms = *(u32 *)(udata + moff);
 		return 1;
 	case offsetof(struct sched_ext_ops, exit_dump_len):
+		if (*(u32 *)(udata + moff) > INT_MAX)
+			return -E2BIG;
 		ops->exit_dump_len =
 			*(u32 *)(udata + moff) ?: SCX_EXIT_DUMP_DFL_LEN;
 		return 1;
-- 
2.56.1

