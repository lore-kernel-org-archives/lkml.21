Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057843;
	b=qe3wnwRvP3Xqj4XLiTGd6t2cxpTlPbbGMjXi6agcdRxVWmJjT6FSYzxVoGP9dRVbVC10
	 0efZzlMx7LDdDVmjOBVvZn5zbdHQaaouOxxMq/qC7jbmq0/UcabxgTjBFn4/AlkhM8VDI
	 +XVdMbJw8+IIarb/S9iQEyfJx4XUU8igkhStCSMeV039PI4IEExExaJInUmnimEcThBPF
	 No+lEi4JdjaLARZDrKWNJ2mpHWoASCGx5S84p3Mue64LM9MIvaDbEf7LROp5ksyf0ELF/
	 ojnX1yBF3Xhn5/pdQRgFmjXbbOq0uU6Hebiwr0mUU37v1uzMzCAMn3IC0onMqjy3xbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kxxZFUyefVXfaK48eNDJdsq8mWd4zz3E9krdaJ2VCvM=;
	b=x7CAYbK60KHbUk08+JiQawN896iBHv8MFqAtC5cp0Q7RqslQGcNw31+k1FYKSI1qpJlN
	 WbHurN7evH01nitf4tTv+Ux2BZ9B8BOPtpFrGb0VprWM0oPpphwWQQ0zjEZ3zuPAfCw3K
	 jFBbdHcVCh0TdEIklNz4yDdua7TKPmn3a+hYxA6VsboXUyJ5ceKYk8zLtdJqnXR2xzc/n
	 REZMRzQJmTn4pdMFwJE06r6zSZsVk0xJ7LVIhYvDOqZyFSlXS8Gum28KCo+C1O+qWpqzw
	 ilgdQvUAG+zEi6c0ZzBPFmMFbeBIjGRnVpwXP0woSUM9AyFGo2bwBfErtjtlBQM8xRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AoRjtDeh;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEE7606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEE7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AoRjtDeh
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so2730329c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057842; x=1795662642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxxZFUyefVXfaK48eNDJdsq8mWd4zz3E9krdaJ2VCvM=;
        b=AoRjtDehDVC0XDWH/tR9BNWExsVls6W+Weu6wtoQ9SQUraHQsEz8fzv+kRWKnTdLZP
         MdxQJRCk8+x4F4VB41KrqALTCBCYTUF6MswbCP4g3GTFuCZ11g6bUynIPBugaS2v98jx
         1Av+ELt2TXfAVB6LmHANyECDLwP9BxIFjbBqeNhP5IDaI8dPey/12oj3TMITIckx0WQw
         momTyQUTSZg2hAbT0nULo3+ndAs+ywWBYO1A9VyezSfe/J/oKiQP3HUgi3HvSy3xrgbM
         1k8r5liggcf+D73GLaC3FMYPaJt01h+hgFRYRLGFcodlGm6t2xvz9eCz5y5RRyTyxEPL
         36fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057842; x=1795662642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxxZFUyefVXfaK48eNDJdsq8mWd4zz3E9krdaJ2VCvM=;
        b=z16+I6AgG+XfU6GbNHZgEdWSt92dhlhaILusfB7TDISC3dAT/iB4UT+nuJQX5f9+IS
         JKcRKgdjzI0x8JOA450chDStZUeRo230v2t5MvNGvk/ayBRYkUOXST8adaIOySUc6gpF
         cNxR7aMT7j7FlYD9Jh4uPMVOukjge+VKQlYKVqdblP3Dfti7tzqNt7I8VP2qx7sMEZva
         4LBZ5EZcH1Gj/McB/c8dLylzVo47yNvP5djkOuV+QZHvznYpgkCFE6mAgGMAozFG0rla
         LKa1fJl68inwNqQ8K8uPJZlpxHwHHEU7+frcBN11eR8Y5SnuukPTpgz2Zj8T1jLijzP3
         UH7g==
X-Forwarded-Encrypted: i=1; AL+hErHGHmD3298HdlqHNC6Warg9R9/cDocaYA8NzkSaa3L+lluIuAX99gSj+EiyzEMszp0LA88SyrELi41YKK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E757jBcZeORnTQjDrCbITsN0UFTIsdIxc1Wo5a8XqmY3poQM5
	ovT8bOe2BXPfVACd4MNJkUf3+cn+Z6gL3cCCidqvsiK2YiMivfrtva7P
X-Gm-Gg: AYBFou1ffHvBBnIlsrV/wANrFZTtvGxpP9MMyyPWgw5ZffUnO5gQULm+dBtl6ivzvFd
	olPQnjTpVXPqFltzG10KnEJz/gnSWVqeMoBOsnuHgMXlvxKtewnNcBxDnQZcLnrD5km9LcscRyp
	8ySN052DEfCp3AiDaV3H7c7SDsAqXQ1afyJ5UTnqAxKQJpZXQfgVYw+1v38P+KDai5NwwSGGHRX
	GxgiksHzOkWErPMdU3hZTEtoECaNQpgtfrhH8Bq3IAbWGDh0y3Iq9dgzpcbDaocDYpspDnmgGe5
	m5G9+3RzoZMVJbGTzX+4xNrkyxq2X6nB0vgf9sMiQlQYN6hywMLhlEgVGnYmAGJ7vGFX4uGpCu0
	DBaO3xGFncDgdBYSIp9KLgJVg7BTHxi+ygxCHq7tckDU9TcxUnZKw+1qf8Al6Cf6VV4CGR0i1wK
	nQE6wARQxqC09t/gpe0mLoj8hsCICSyIyVqjRc/cDsG5MF2itxd8lRgXaWjs80C4O7KG9YHVSEL
	2mEzK1fL2D1ragoCgRtBf5jO6sjNS6NOUCEWDDTIK15tbPdbJfGyaAn0/cCUcxn9s2v7J1d+ITT
	QkuLcIlYcXq/I4s+ZKgTwzokxq0pBvqF3qnGZhX0weTS7gNrBA==
X-Received: by 2002:a05:7022:e2a:b0:163:a197:722d with SMTP id a92af1059eb24-1b543b193camr5961447c88.4.1795057841422;
        Wed, 18 Nov 2026 19:10:41 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15028118c88.13.2026.11.18.19.10.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 19:10:41 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Ding Feng <dingf3ng@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] fs, zonefs: ignore RLIMIT_FSIZE values above LLONG_MAX
Date: Thu, 19 Nov 2026 11:10:24 +0800
Message-ID: <20261119031026.7985-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
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

generic_write_check_limits() and its zonefs copy store
rlimit(RLIMIT_FSIZE), an unsigned long, in a loff_t. A soft limit
between 2^63 and RLIM_INFINITY turns negative, and every write then
fails with -EFBIG and SIGXFSZ:

  $ bash -c 'ulimit -f 9007199254740992; echo hi > /tmp/f'
  File size limit exceeded

Patch 1 fixes the VFS helper (write, pwrite, writev and copy_file_range
paths). Patch 2 applies the same fix to zonefs.

Changes in v2:
- Hold the limit in a u64 instead of an unsigned long. On 32-bit,
  "limit <= LLONG_MAX" was always true and clang W=1 warned, as the
  kernel test robot reported and Damien pointed out.
- v1 patch 1 was applied to vfs-7.5.misc as bc0dc4379463; v2 patch 1
  replaces it.

v1: https://lore.kernel.org/linux-fsdevel/20261117173129.61028-1-dingf3ng@gmail.com/

Tested on v7.4-rc3 (20eef29b7c84), arm64 tinyconfig in QEMU, with a
static test program that sets the soft RLIMIT_FSIZE, writes 2 bytes
and copies 10 bytes with copy_file_range():

  soft limit            unpatched           patched
  1024, 2^63-1          ok                  ok
  2^63, 2^63+4096,
  2^64-2                EFBIG (both)        ok (both)
  1                     short write, then EFBIG (both kernels)

Built fs/read_write.o and fs/zonefs/file.o with clang 19 and W=1 for
arm (multi_v7_defconfig) and arm64 (defconfig): v1 gives the robot's
warning on arm, v2 gives none. The zonefs change is compile-tested only.

Jun-ichi Takimoto reported this in 2020 [1]; no fix followed. It came up
again while proving pwrite(2) against POSIX with Frama-C/WP.

[1] https://lore.kernel.org/linux-fsdevel/8F9EB913-3AC3-4D89-9DA3-427029F6D211@kba.biglobe.ne.jp/

Ding Feng (2):
  fs: ignore RLIMIT_FSIZE above LLONG_MAX in
    generic_write_check_limits()
  zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in
    zonefs_write_check_limits()

 fs/read_write.c  | 9 +++++----
 fs/zonefs/file.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.55.0

