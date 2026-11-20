Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143373;
	b=44ZAOfuPmxprmJbU28m7hV6/FLy0PO43ngjuIsi1pXsw95KWMNtc8GtdxVl2QT/ZXuYS
	 DNzADR8Y5NoleUanTpkVnuGqYtBqfXk8xL7XvsUjPYTggb56WroiWFJRQ/k7RrZ5hJgJY
	 Nbnou3vxuXFNT1BxcT5BnE+/Fcl1pSyMPI+3SWAhh7jywqrT7WsNHb3SciZgHEDsSAmwT
	 r/posa6N7xw7qy7psthwH1C1xwKObDbc9wN/ZJwItHFeIQJwweOHNvjUno0B+hNNz/Mil
	 Rm4uSMLG8fk76DG59/luIaoRxk+yd9vs9SuWCc5CtB/VxQHRIIIx3MJ8zrGouwLBmSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2UPt9p34nIxWIkNf9Ri70NscQqBECXpPB2+yVfs1gWE=;
	b=y8/rqxCkEhiwLrTQwteJoqoX/GYAgRPBYSQVekLCLtYzaNPbiFqyOJ3kR/3fcLv3r4Es
	 5EsuDOr2goP1Wlr76cajl2gMuQJQacxarEPcG+e6xNttgtlZkbIw5LpCtoLwMXMf/9Vbs
	 cG8LFm82kMVIaUM6iBpSPAZjaCNagtA5oVpW8JmCk3hMiB4W/bZnR3lsDmNdmbtfWP9/t
	 VngJRlRo4v9Gv1K9w8QjNTk1C7QiATLKbFi50CUyEcoaFx6gxk/WqPrFNRX1NDVSEtxWb
	 F2Ljr/D1/rkwJzCDhjNNlKLba8Ztd6DYaxJWQe3y6AH5nluXCNMj3W8Vo39N4MgP15Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QJCXi2S8;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D0606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973D0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QJCXi2S8
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f02ee04378so3267005ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143371; x=1795748171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UPt9p34nIxWIkNf9Ri70NscQqBECXpPB2+yVfs1gWE=;
        b=QJCXi2S8pIOkLuyWzYBnJy3xA9Dbsn/ZiL1TRrB1V2x24lfN8a6gQZmfx82Vg4m4dz
         lfmlFnQomOFd0u/partG6wzlMwF5hKQEtYupveIOAF343i2WDqG+SYQEREGeVw3GeBJq
         0UZJslLBjJNCWEbHUiFrWI+Z7NnaKKJ8/XpSxuO/WS7gUisuB6f1o4zfFLy/33Wm1nyS
         i49PX0BL+n4sEOQucjgyTXUmIx2254ST23gBCgBo4LjyWnfLqgk4TbkraNa3aqCoXmy4
         FbtMZPy3yBJO7gaV9ds4N2z9chNn9F/cdh3VI89toDN06Ng+5nJIkiLkXC7gW241Lkbg
         1F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143371; x=1795748171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UPt9p34nIxWIkNf9Ri70NscQqBECXpPB2+yVfs1gWE=;
        b=QwDEOodMl2PxgiytnbUH0wvHs3Fx2p0fNzOaC9ITUMlDkReqnBlvWNBhYoSCWczuam
         2nPEkYkhjfVx8Kt0VZ4L1W4euQT4dbP7dJ2OvxL3OCWLHsAteXsWksYyJbPZvjpbrMUC
         4HG5w4VozbH9wMQgupd5zxjGczazfyrv83ISxC5vf9s/+9H6136O0PIeqsXZE/xD/XL5
         +0N/2CLw9tJVI3xNIonjopyGzPZmDFrWhcPhFaHdbZBNOMW0CpUB0yXArV9yOj47mA7p
         7ydgMlAbNUa8xbE+y0c72m0G/zK9sUEXndYOMAzYSI5n8sAzWcYbR95JREF8bGxopf4l
         rSFQ==
X-Forwarded-Encrypted: i=1; AL+hErELwq6qieDnEnIYDkiPwglTPiV1BtjNNCQaR3Tyk7ckSlQhyARAWqnDug/sKpkp/GUJbuZ+O7ZLwsjEq/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V30kuUhzgJJUkxgf53Odvvlz1kXkK5EekixlAIyTOBeucezKi
	JZbmNyFTieHJ8io+c5C1qY9X5j97FeLhezt2l5Yg4jrlgP9+X3/p+gwY8rP5xBXBzpWoC1VvCeA
	7ZFAG1Hu5C+nmpiWhekbC5IyHCDjwwiQ39n4DTYdEJLMlFBo2Fc1Yl1IsGhA=
X-Gm-Gg: AZFdTZf8xW2tEbrurWZ/fMYHh5WhSdsvGk97V5zYQSTQ1Y3iCzGtvorCLIpQynfj8Kn
	ue+UpElzR+nL+aT6IZmyEIqxdizCPZO9+TwlFtffGkwMsQAELKVfbEokdj5sDDfXoGcpv9JiU2s
	gXOOx7tI963n8LBSzx3Mfk51pfijvhagegns9yiuh3XbeWRbCT8kbOEajuY1eMLKuqNXXUR1Leu
	B/x0TyXHB6lRni+tHXA2Xs7MjPkd+bQYCDClx5PXyUnjxBofxcoMLFDbxSdfYlTSL6CtwGJvvEb
	XqfuEN4ZJ4u+CAnWi2JzMgpwFTbnWZNEZz/tCqmFfNQ5JQnMBKi9pMUCltblg2KHMOuDQZ1CYqi
	Zvuh7/aOI0/pDSK8JgHApWW5mXMLmLASNIzUHd6gaiMdeVH8pxuPhK9UC6Oy44xRRVelAT2FAKV
	RSH6IG9AEG6cP3nq2tMv3kbwfWbTIbEItAAJsG1dEAfbJdN2EFgUvt1VG8pwiANALnSJKqgg8ic
	23zLREC0eRpGASYrzYD8lkxGv53JeOfgQvGq1uaGHpD7mE85RlvgTu8/TqN+dmWgUfJc6Qmkkuu
	zxVh29aIOY9Qu1tIocxqjZun+wrxjEbZb4ArIZ+KiJMzBFCWIV4pBrbDF0g=
X-Received: by 2002:a17:90b:2688:b0:3b3:cde6:d8c8 with SMTP id 98e67ed59e1d1-3b41c955b9dmr1262506a91.46.1795143370698;
        Thu, 19 Nov 2026 18:56:10 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5546461a91.8.2026.11.19.18.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:56:10 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v2 0/5] Expose blk-mq tag sets through debugfs
Date: Fri, 20 Nov 2026 10:55:59 +0800
Message-ID: <cover.1795143228.git.lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009030111.57784-1-lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com>
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

The block debugfs hierarchy currently exposes request queues and hardware
contexts, but not the tag sets they share. This series adds a tag-set view
for configuration, CPU mappings and driver tags, links request queues to
their tag set, and links SCSI tag sets to their controller debugfs data.

Compared with v1:
  - Reworked tag allocation and reclamation so the debugfs objects have a
    safe lifetime across queue initialization and hardware queue updates.
  - Added controller links for megaraid_sas and mpt3sas, including helpers
    that build relative debugfs targets and serialize link updates.
  - Folded the stale CPU mapping comment cleanup into the tag-set changes.

The series is based on Linux v7.3-rc2. The tag-set debugfs implementation
was exercised with concurrent queue resizing, shared tag sets, device
teardown and old file descriptors, allocation fault injection, and KASAN
and lockdep enabled. No KASAN or lockdep reports were observed.

Lei Chen (5):
  block: expose blk-mq tag sets through debugfs
  block: link request queue debugfs directories to tag sets
  block: add helpers to link tag set debugfs to controllers
  scsi: megaraid_sas: Link tag set debugfs to the controller
  scsi: mpt3sas: Link tag set debugfs to the controller

 block/blk-mq-debugfs.c                       | 378 +++++++++++++++++++
 block/blk-mq-debugfs.h                       |  22 ++
 block/blk-mq.c                               |   8 +
 drivers/scsi/megaraid/megaraid_sas_debugfs.c |   3 +
 drivers/scsi/mpt3sas/mpt3sas_debugfs.c       |   4 +-
 include/linux/blk-mq.h                       |  24 ++
 6 files changed, 438 insertions(+), 1 deletion(-)

-- 
2.43.0

