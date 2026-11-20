Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176984;
	b=w8m7OCMkzctxHd7dZTwFGYDpTjxNplFoWsK9FgGOl7BWwySpTZe1+VxYjnrKqKiCIkji
	 e40AMct+WJqnJKPtRGyD2kxAkQ0RwdHZeKdh1MB18g6MOBWuU5RXjdU9RQ+J2t2FzdPgy
	 qA583KTtjU64gTmNMFeJL31K4lOi1U2ZHE7+OcwcJDJoA/B1mVQ1bvtjX/Uzvy8EX107a
	 vqJ4EciZ6FdC3xvY7KB1LaI2cAX1uubr6o74UlKUeYzjM+mjxWfxl3V6wINlPszNERxeK
	 bTDYISgsmdZNacrJNGbhEOTB4/F/BuvRNRLm66Ei5NUhWMo5/ivCnuy7/9cRodL6rcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IknLS1Izf6DM/sF56KVAF42vdnRgs47WGOTqobZZNJY=;
	b=GHxgGni39cynkseR/rx5y/7sn5vl7VZ95H/Ymc6OdL+IWFghG2Gcm5aTPwEuQhzw93cX
	 oFvyRit57SH9x6GxF74jMtJZeyFzq/f6Rndc/S4aWaSkYrT8QVD1PqvJAgB1fe3Y7PY/W
	 Z1YJVKkp0nmXv6ZeXlv6VSk+zwjW8i7Gze6o0zODc6QgtRhXrFgZ5w570NEc1srPPmlD/
	 tw0x3aHjHb6adAJFy9Pj8qr36kZ7WnSfetw1DysDFFkLFDcRWBCOuOvZGvJg0GKeqsjer
	 l/fs46HorzAHsIOQM+Wvm2HBSLM+4BZ5O4Iie7V9WLQESwK2IPZioESOARNow8a54Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=T9vD3ibR;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC20606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC20606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=T9vD3ibR
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb684859cbso493680a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795176983; x=1795781783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IknLS1Izf6DM/sF56KVAF42vdnRgs47WGOTqobZZNJY=;
        b=T9vD3ibRQLSip0fqBDuE3ADF/LJTrbPD5BVSPj9KnfEC11F7KshDIe2v6WWHxEIafs
         c6BIPIiVuyhtlZ9SW/y9+y27NLfofz0s+/JLD8SGcLCJKIJFz8/x4k1xqLA3QVRz8wWW
         QV++PBYMLf3HMfcXxHyc3xbLVg8v2g74m503hHYLvolnX7Z7AJjlRP3XurEEN0D5UEjT
         zRSLYxKBEUtNratmXQRf9290R88Br2oYWf5xLZn0WM/1EWIN6uDXr8tvrS0hFyy7nA88
         L6iiqgAGgZzH7iqKkoJnAzG5MeNZx3+O1qUfxRtOW2vE5N3qBQB3zQ0tQ6TafLQ9sIKM
         AMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176983; x=1795781783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IknLS1Izf6DM/sF56KVAF42vdnRgs47WGOTqobZZNJY=;
        b=0IixFXJCS6boZ/9xd6nmkbkkjd2iyO+NdQCIQXzAL3HZbYWHeKPSR3pj7NMH4CHRH1
         p2kwvzRnh9Bn0x7Jq+d0YATwyPAxWhupg8FUere1WYbJ2NfOBO6m6t+ZNf/q2jZbcMOn
         rbYU91fOjj1JtXKZhRyC7aY5cw4qfOZdsuJvTIp3devYCGs6wuaIKdIeImNBt5lKTQNu
         yEEL9U1NC18xjZDOwGUF0RdmQA5UQkS5n7PaQ6EiZn/aFwvcJyn2MAUyrOQDXXoGSyBA
         AB/bu0YcUXcS/T+NrPX5lh2l1Q0/JmsD3DOPvJDh0sBeb0n8srcz2c+KRewJXauHRfMi
         p2Kw==
X-Forwarded-Encrypted: i=1; AL+hErHr3b5XtcSGvcaWInHR64S8xBZxjXIxfF5JcjjGtAKcfKqDUbKZCXfRca59RW1y4ROA4/fnE8spbfNgg1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mHt8Zp5p7Dv9UMqC1gG0blCl6gqXGIHrdpmh2Ui1WSJYOXXtC
	QrqDmXwd2VipLnSRMVRhUohf1IR4wcKxjEkYKMWGKFAtyZ8nO1d4bG7iQgJ3703JqmU=
X-Gm-Gg: AZFdTZdB7Z3EV2gbY3Vg/FJMsfhbJ09GA4+yah6/n4uysAtENoGHJFX+bA4ndOjiXKG
	WuFtcQCfIwwoUNMNps4KM5ZABbdI7dwDIzTSoag3dfNx8arFiHT0XBSCbZmKu9ZpQckml99tJle
	WsRrBST3K3hY2klRUN2/3HIIozozT0lEJ2N6/D12JLjHMC8rouzWh1cxGzMRVHEanSUpHcWLOez
	XsQbkgPnBx1EU18H4aEhujRbDlNmJ7udrzG7XC+TNqQtEBNYSgVbMq99iv5pxgFNwoVtZGqIiPd
	VEl6iKy1Uss8ys05PQAdgoQ7hjwwlpsJRzlBVli5aNbz9L28a9HRCXfB0g/TbKlY0DFOjuWsZ+n
	KbHX/ZXEpujf0B+GE/sDcZNhYLUdGPzs5sLmL6lAhVT8oc9aZcNpGxjLV80pS0N7rNp55xDfV8o
	6h6VlPZA63ZPJjTmaneLs1hSBAIgFDjsKkwOjC5a2fxCsl2vUqn0ewaQm9wFgkGUJBMNb2myQJd
	BBhkSNAD3xU7NEcLYEvhEA7W4vTSJUcFZ3NKGbaTbMC1+cYCF7aQWO4RRfWMopJVgj8Hp0fIU8P
	DM7KqcfHdltIYy2xc/OKsJF4jhuQ8sYAaOtN
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr2658990a91.17.1795176982660;
        Fri, 20 Nov 2026 04:16:22 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm4463146a91.1.2026.11.20.04.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:16:22 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v2 0/2] tpm: Track the response read position internally
Date: Fri, 20 Nov 2026 19:16:12 +0700
Message-ID: <20261120121614.978396-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

tpm_common_read() uses *off as an index into priv->data_buffer.
nonseekable_open() makes pread() fail, but an IORING_OP_READ request
still reaches tpm_common_read() through loop_rw_iter() with *off set
to sqe->off, and a plain read() racing a write() reaches it with a
stale f_pos. Both allow out-of-bounds reads and zeroing of kernel
memory.

Patch 1 moves the read position into struct file_priv, under
buffer_mutex, and ignores *off.

Patch 2 adds a kselftest: an io_uring read with sqe->off inside the
response buffer must return the whole response from its start.

Blocking io_uring, suggested in the v1 review, is no longer needed for
safety with patch 1; I discuss it in the v1 thread.

Tested in a QEMU guest with swtpm and KASAN: the tpm2 selftests pass
with patch 1, and the new one fails without it.
Claude Opus 5.5 was used in preparing this series.

Changes in v2:
- commit message reworked per review, read()/write() race trace added
- add a kselftest

v1: https://lore.kernel.org/all/20261117104838.2650999-1-rmustafin@cloudlinux.com/

Rustam Mustafin (2):
  tpm: Track the response read position internally
  selftests: tpm2: test that io_uring reads ignore the file offset

 drivers/char/tpm/tpm-dev-common.c        |  11 +-
 drivers/char/tpm/tpm-dev.h               |   1 +
 tools/testing/selftests/tpm2/.gitignore  |   1 +
 tools/testing/selftests/tpm2/Makefile    |   4 +
 tools/testing/selftests/tpm2/tpm_uring.c | 131 +++++++++++++++++++++++
 5 files changed, 143 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/tpm2/tpm_uring.c


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.52.0

