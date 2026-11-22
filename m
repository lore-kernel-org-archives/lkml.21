Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364941;
	b=IuFLquVcRqoPtRF60PFyUnaNbwlc703oiI0VUEglY0K5tLuW4Q5QOkwrwD2w4QVeupZA
	 H1ARF2w6b/KqyHMBStim1A9HYUoMb7KbQoP8L/wHzR3WCpSGVUsDONISRMQ0/TBbcN5mX
	 PW9DKlibXdtOXXMExOCtnTweihJRBYzz3ktUHnthduibUdUxfnVGub7m8KczPIxyGzCjK
	 +iJGEcYknM1n2yb50mJhdGkf8DK/bEaFcbglRHdbdBzV43m88CaZMmh05cNI/sKsr6TvG
	 QhstB9jz83YJYtDLL5LvI5yS0smd1gcLEDzrq8FTsjOIHMyrqY9dTw3og4swzASheFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u54RhPh31KUc6Mfc10ElYw3foIWIoI4CAHG9i2sGAtg=;
	b=amACyF+eyDWNFCJNrqpUqMLKLavluPdXjLZpsXPlRP8R7b8t7RPjrQsSvbd1LSpfxb11
	 bnfDDXgOigYxW75uFDCqsUdDA4a/AfnwJYSFU9pgW2UDoA87vZ505YCyOMzJt7Dn7vxOQ
	 9lz+hKQO+gbJXv7KvYegLAxJdSatig6sd5udmMvr4GoFPAlI+9h3TfbaEnc18SYipmJ1C
	 27cNROt3IQklvrOy625V9Al6vzTpxWHWOTLFVBgpEztTro7AO5TZiF31a047ubx7/hysJ
	 l5xuZUgjjPtkT67Ms/JagbEG0rHmWhtk3EbOVaCM5ddDBFKfJMeX9R1/EH6h21sU+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quD4BYCc;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F2606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71F2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quD4BYCc
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05b210703so1106590b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795364940; x=1795969740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u54RhPh31KUc6Mfc10ElYw3foIWIoI4CAHG9i2sGAtg=;
        b=quD4BYCczIn20H71M1ek8V1tvx7D334/7+k7AnuKagUB4BMWfGzVI4e9xcWDx/egRk
         z5YyaiFK86ipmH7iK6YAxXA7D98G6nPJtabW3lSn1n29sMuc6fqvs/4VOWLICVYP+mmm
         F3QJz3JltyXBiH6CYg9YDbZtwt1v4sLkiAGg+XQkxFGXAKLrgifNDarBAgnUaNXxwqKY
         Y8BqBRsa9bhaJazr/2vaRBPJTNKK7Bz6lkWatYnFyGJ0TiJlGs+I38/bDBLlBFjxO426
         QUQ71JkEHoRj9N7DQWhzji45B9ZS4br/cjc/GkyaEA7Cb8TTKJERhK3agK/lTbZt7kLQ
         wqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364940; x=1795969740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u54RhPh31KUc6Mfc10ElYw3foIWIoI4CAHG9i2sGAtg=;
        b=aUsYZYXFdVFf4Ij9TC/8rDCU13eH1yiFlv1pffnLwLgPD0JVMB3Agl/yFnEXpUTf8A
         3jyLmi5SGdYSuxjdenwYhl0yqBgrEWQZ1b0SjaUr019xMzBirSy7IZ5EX19tnw1Js/tW
         XGsndCjfn/CKdiYMHfu9q3ibTwUC/v61s+aNAn7MTKcJQOJElODMKbreqaxJsBgpPVeZ
         IZU8u5v7z5JgVwMP2CqyFZ/AW532kpco0ORRhTG5d6yKwrNIY9OkueSoNWyEf/1OF1jt
         I4cvVOqhyeM4dm5d9jIId8gtHWYrXhCDWabZmTC8qQQx4bBIGxJ1k2MNsOCZYVptgeo3
         xOhQ==
X-Forwarded-Encrypted: i=1; AL+hErHYQz6Rv3SxvLQHG65wqchgdhN5MKZMctEMWSydeMtldNLhaHfEP1pL7jZFwGqRbdSEqDplJuz1h+yEN8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bP0OICsy9QsdqNFi42D2SZfqxD6WXNIdlRC5cklqHsNDUB0IB
	Z+oGKart/hBOR7+OdwNl+5wXiDQjXyRdB+1pLKR2ATCY6fmwmBLaZKjn63DtLA==
X-Gm-Gg: AZFdTZdbMZVNjzi+f7tUdWAjHZiQLmIdBwQQwgbq0TjglRBbiZ3WQNlkCcCzaaQg8r/
	SzMcioO3WMZsLVLAXnoEFIj7G5Gqyi9rc1EhdEqFRM4sAR1U1mntErMgc5K5f3cZsTKqZcMvv4J
	/jk7/0+I71aEYoNxvH1CeJcfkRNNmaDIiESsoklsH0/oTRzEmFYS6g3g5l6B7uoumEsn+/JgoON
	L8cqAHmlRyBk44CQOkxbICH6QZchlilchJtJiLhViAgx9uAE9C5F+P/hEo34hWGvYkFMZODt+H7
	0OQ+T/ZO8+6p1/TZvpcdv5DFM89aK46Yj8tO8Q3YTHJ0naMqvENN7ezhdY/h8QH4mUYptGR+wcL
	x4tsBozZr7Ost8+VjtZKK/B975zIGpcJDczENRYf7zZxLQwPAKTSJcQbVfJYal3zVxTqG9mCD4W
	ASGJrAwR5MR75FQPwTSSlANsFneCdxG7Up+uxs7tQbmeMQ4nr3anelRCVouQP6Kvwe0DLMfNAkH
	e/3W00AygIqMin15y46DVudme9+a/KHwfiaZZzEJl1ZFZKuNychD7otnEQjTHQzGFdrs/HI4Pga
	W8D31/1tnxlpCBHWLxv5XvWP26IsWNPeOaMIFIejtqpJvBwGhowgoDMjUGVzjMg2kNSvoX8=
X-Received: by 2002:a05:6a00:3ccf:b0:89f:feb6:5d5d with SMTP id d2e1a72fcca58-8c87c95b6b8mr8202972b3a.33.1795364940056;
        Sun, 22 Nov 2026 08:29:00 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm4219437b3a.1.2026.11.22.08.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:28:59 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Sasha Levin <sashal@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: cgroup: fall back to an unlinked file without O_TMPFILE
Date: Mon, 23 Nov 2026 00:28:17 +0800
Message-ID: <20261122162817.2012387-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261105011824.1143947-1-sashal@kernel.org>
References: <20261105011824.1143947-1-sashal@kernel.org>
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

On Wed, Nov 04, 2026 at 08:18:24PM -0500, Sasha Levin wrote:
> get_temp_fd() creates its page cache file with O_TMPFILE in the current
> directory. On filesystems without O_TMPFILE support, such as NFS, the
> open fails with EOPNOTSUPP, and with it every test that needs page cache:
> test_memcg_current_peak, test_memcg_min, test_memcg_low, test_memcg_high,
> test_memcg_max and test_memcg_reclaim.

virtiofs is another one: run from the kernel tree shared into a
virtme-ng guest, the O_TMPFILE open fails with EOPNOTSUPP and the same
six tests fail.

With this patch on cgroup/for-7.5, test_memcontrol passes from virtiofs
(15 pass, swap_max_peak skipped as the guest has no swap), and from an
ext4 directory it still passes as before. No cgroup_test_* file is left
behind in either directory.

I found and tested this with the help of an AI coding assistant.

Tested-by: Kurt Lin <lylin1023@gmail.com>
