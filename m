Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769335;
	b=Lb0Pjz3cYfGOoXEQIqW/kkwIv7errS4MzGZWiiukZOSn5luJ6W8yKGGB8KictYOwWL87
	 f/67drjkyIDFvJyISDBuJ60EQutx4xp3zextQNQIXB8Rx/EykGGzo62QUXy4D9qSGfWlg
	 xmFZ9jHfkc7j2PvI3+A/Cy/GfoTLoIAJInO0i0pPSFtsWqg1mdmPSKLzIbIV4EZyvoRgZ
	 EwpAoLpff5s/xoerBd4vPiIoosK5DCsV123dH4Q1SbSpSDWupahJNZAGjxk349aYhsL5g
	 h/qusmeqpXF5zqNWvTjmzGJullYZ1q531OBUDPp5IksZqRWaXOXFbYeM7oPWjq9feiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V20sSYH+TxrCV4unQJ7dg7ZdaFxiFFR+LbaIUnR8j9c=;
	b=xfv/NYeWVQy9VHV/W5RT0V4D5+VvQ5uFYTWJipTumDgGNY3KBY22j2WYLoujrJc3XArq
	 2uucdTAhws6vWOrZvJIsu+IM1hAQoHY4w/G1bSsqOs0QB8wFaUlCRYZarYWdSVXFxEpgp
	 0AR180dBYupW+b4fiiZ/UGVPJhwH1B7P8nbBMf15+I5E9TShq2YmWBC0jpMWvrKfiBLdf
	 o8ZRatH97TSu67f1esp1fAJBsrIyw8zlXxRqYunpcpcXSSIInBGlCEqqvOikTBqwmV57t
	 0ngwXJwE24l2owY/ouoon8qLOEMimLG+FFnFlMT359FCyMOgHSjhEuPSFpZ4em+ZLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rv1OPzlL;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B2606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rv1OPzlL
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso4857630a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769334; x=1796374134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V20sSYH+TxrCV4unQJ7dg7ZdaFxiFFR+LbaIUnR8j9c=;
        b=rv1OPzlLkeMojQwNzlK+naiity0+ZhuvitsfuYoiZykqG7hyKze1YUcsQxa5pVh7pB
         ClC8NqEi2LoX9Gu5KsdHslyQwBffNItV2Phv1HQuYFabj0PurZIHGu8upGbDJQQ3gafV
         6/FGJ83mkeV+P7Te5KQuDrIt2OupsaKqUeuqEibGamitTgM4lnwh34YE5mrTNvAriFpn
         4yfPfS/jmW++py4tRKwH/wMfr7FMbNCfo8nkn4VF9BTYeTH56WUpJ/3F2mXsZ14xUY1L
         k8jyhUVgICEsnwAaJhL3pKJlPsGSQvwC+W4u3dZiXGqzcpnPpVGtCVio4chZikqXbDbH
         e/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769334; x=1796374134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V20sSYH+TxrCV4unQJ7dg7ZdaFxiFFR+LbaIUnR8j9c=;
        b=Ay8ROE7zlczOYHs/wjwD8r8ZN+yrOM4Uc63TATUuT9K1jvy71nfCwISfJkS/1r21x7
         eF6fn4JRvdMkuQXMbVrH1Tfo8gRi4m0bq3k8g5skkuGW9Ml2NlWXAx+k84jZrusY2OrE
         TTPQgFnKc78+adD16hB18s2cyY6C//T13t/LPkRLvGRCL9hUVkNr8S3ZE4jXx+aiEzJU
         t3CsL282OXOPJ2XnTOhE93Wc4I0G/Ex4eikaxeFb5hc6glNeVfiLhiXO38ajNuGKvqGV
         /NzS9RoPux7QQBUmJQ7LbDRbuZ3EarNetMy/J2YVAX1kKkvOdS7PoTs2YxqmvTFvXILb
         lxZQ==
X-Forwarded-Encrypted: i=1; AL+hErGNNZ+znY8VmIQbId8wGysvdZrXyT72Sk9e3hxzjf8D73dhf/UV7Tk5DirQdWZgPLkWW44bQedbNUO8UMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IuYVql9nPnvsT4MnWen1+JlNwMIdBXdNYiOJYtUL7cyZ7ZEa8
	wAgc2eKxetylrPSY5OnoOfN6+ntoMKhPEY0/hjDd+AzSRbGAJC6C5Kgf
X-Gm-Gg: AZFdTZe5G9RiQ74JyZE09Li3asVqbr0vlqRzPyVoE/sPpTtBOMnO62WpcR2zv5XUWwu
	MGQ6lbhiaD08fIMYNSRTlhQtEQuvkA9/vk4v+RFZZkgMIWKGL5ok59pUX3GzZQeHG6LBG1grETz
	NNKirx+zROYACBNz7UQX+t2ImDuJFzgaTC3oB1rdK7zKIWvv9Ui2k5m/+Fxu434l/bASW5kPiPC
	CSn2eVDObtBFDsYJiLh8a7pmses9R1Nf2O73aQblwC29zan0qWZde3hUoaiUf55QNdHeqsSnHB2
	PWRyGtggNut0YnDIxj5zMl0bZk1F/ZsJHMtYhRUy/kK0PBjA0BP/xp8vWhkD2SXJFRHgc9azCgZ
	iAY2h5RResyYKkvdnWQc1qHaDA8GGnhEcEM5HrYAaVuR7hKnQeYFPyot+gTfY8u8Q/TTSXajzZg
	Slz8F/5mbgdj3LzK4Mi1PcUOfaKmjeHBVfITtvLgvxdTA625ydlBwKSCvx6IUSusgwmTxG0spN6
	jW7C30l2AIE7hodc7OS7N0HXr/Esd8OevKSuHXQvKAQbxOzRZ47VrjGR4ZErm19h/A+CuVXpkbY
	9N1w/fMeCIdcw5IQmv2LiV+riuM1duAaOwH+YlZy5/3AR00TuPFxPpGY26MY14k7MLW6B2B5tfI
	YzOxwgaJkM2M=
X-Received: by 2002:a17:90b:390e:b0:3b4:fcba:8f7d with SMTP id 98e67ed59e1d1-3b4fcba9627mr7869895a91.29.1795769334244;
        Fri, 27 Nov 2026 00:48:54 -0800 (PST)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm12289058a12.30.2026.11.27.00.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:48:53 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v6 0/2] f2fs: enable buffered RWF_DONTCACHE
Date: Fri, 27 Nov 2026 16:48:43 +0800
Message-ID: <cover.1795746008.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788795700.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com> <cover.1788795700.git.qiwenjie@xiaomi.com>
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

This series enables buffered RWF_DONTCACHE on F2FS for one-pass streaming
I/O, where retaining the transferred data can displace more useful cache.

Patch 1 marks dropbehind write bios with BIO_COMPLETE_IN_TASK. Normal and
dropbehind folios may share otherwise mergeable IPU and OPU bios; the flag
is set when a dropbehind folio joins a bio. The block layer handles
deferral from unsafe completion contexts.

Patch 2 passes FGP_DONTCACHE to the buffered write folio lookup and
advertises FOP_DONTCACHE, enabling buffered reads and writes. Internal
write_begin callers that pass a NULL kiocb remain supported.

Tests used x86-64 QEMU/KVM with two vCPUs, 2 GiB RAM, and an NVMe-backed
F2FS image. Each attempt transferred a 1-GiB file sequentially in a fresh
guest, with memory.max=255852544 (244 MiB) and memory.swap.max=0. Normal
and dontcache each ran ten counterbalanced rounds. Values below are
arithmetic means of the ten runs per mode. Write throughput excludes the
final fdatasync().

Throughput was:

 Operation  I/O       Normal MiB/s  Dontcache MiB/s  Change
 Read       1 MiB         4137.96          5869.38  +41.84%
 Write      8 KiB          686.09          1752.24 +155.39%
 Write      1 MiB          714.91          2161.02 +202.28%

Average memory.current was:

 Operation  I/O       Normal MiB  Dontcache MiB  Change
 Read       1 MiB         197.26          13.70 -93.06%
 Write      8 KiB         214.22          13.15 -93.86%
 Write      1 MiB         215.20          19.52 -90.93%

Mean reclaim counters per run were:

 Operation  I/O       pgscan normal/DC   pgsteal normal/DC
 Read       1 MiB          200999.7/0          200888.4/0
 Write      8 KiB          201136.8/0          201120.8/0
 Write      1 MiB          200899.3/0          200883.3/0

Scan counts pages examined by reclaim; steal counts pages reclaimed.
memory.current includes all memory charged to the workload, not only
file-cache pages.

Dontcache left zero target pages resident after reads and one 4-KiB page
after write synchronization.

Changes since v5:

- Rebase onto the F2FS dev branch, adapting the bio tagging to the
  sub-folio merge paths and excluding metadata-cache I/O.
- Drop the Android 6.12 backport results, as its dropbehind implementation
  differs substantially from that in the current dev branch.
- Add memory-limited read results and update the write results,
  reporting arithmetic means of ten runs per mode.

Wenjie Qi (2):
  f2fs: complete dropbehind write bios in task context
  f2fs: enable buffered RWF_DONTCACHE

 fs/f2fs/data.c | 10 ++++++++++
 fs/f2fs/file.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: b61a029304bb5531312ebc133b2a895d14dc3fee
-- 
2.43.0

