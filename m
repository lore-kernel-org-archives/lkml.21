Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715673;
	b=v72Mp5uXEzTgtRpVr/CJdY1cInaYG3O4qFK5puO4B3wjiWOSQhUr4M8M86OTEnEQTWAJ
	 VSwDlVlALuRujtOweV6CMyIQcsg3GeL0uQ9XiSwJMuClwD3Ew9MBA60VvpC4wf6+C6Qob
	 qLfjl8eEQWa10WN5ayc9Wm3wzCcUFoOnRaQOU7UjbZgtXmPTm5GL9oLhYkJG/rMYwwC1m
	 sQkSHAd9OChdm8j9OEpXe91n0wjJnZoYygdr81RVczrImXom/rGy5RwSarqX27FBDAZmC
	 mBA45g9oDAKqnLT3ufWQTYt3EDuDI7BjjFt9qeSZBeETxVow+Xa8WAh6tnvEanswBgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6pT4BOJ1u+pEQkim3pAQgfIOTjhMx/55ctOIhC3tiy4=;
	b=sOulh54uSwHy8OMvxmjpC6pCw2Mj5vu8zPmAK8lMbN6ADLcwxhRzHoKnAs+A4t7/BL56
	 qPi5Ga0skIKt67r1fyRIQw2mkk2pJ9hUJo03qGNlgTmtSSzya9pMQ899/yb7soMkkVGFX
	 YM838sMoemlSkp80ZXdfr/jxXkzJRwJwyZzpiwOPpsE+gg4ZdT5Dh+tFo0nSh9Nf9hX8e
	 6lHzDV47bLhoKTHvkhoQNJzBazSOCeS4O+173lT14h8v9PwSYBnFOkW8KahHznAI7+qvw
	 f1gy3zsHa4voM2sN4Mk0GGpdrXQPCKbyEw+rDUsAWczPlJ9xw6jmQcq5sA+E9Qq1fFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fr1j5NRI;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fr1j5NRI
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b335eeb340so63325837b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795715671; x=1796320471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pT4BOJ1u+pEQkim3pAQgfIOTjhMx/55ctOIhC3tiy4=;
        b=fr1j5NRIQLgDHbr5rSu8Vulgm/o3PP/Hp2+3/XBrHWa5BEvP3RLRTRiUnvTuocq9ag
         ua1CTGWdOIXrotXj+h09sOBvU3SagDDsEE1z1RFn99takf6jjMchaBxyqBVl9URXcoXM
         K3btSwjENPB2rkHNx0kaRg/gmjAZwtxtPSY7CLT69a6NVocRSsuWySD7XrSUUBBsLLPv
         Rdwv9h82hWiIm8PY47rL1WorkpD/r2fmWm9fwyJ9vFPn1us4XKj+Aw5qYfveiHhMDNgz
         Cni0TBoAoz8dEqH4t+Ke70E9W2j2KXK3y90XYYwDnwfHYVg/Kx1vpRBX9ZdhyZygQg2N
         J0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715671; x=1796320471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pT4BOJ1u+pEQkim3pAQgfIOTjhMx/55ctOIhC3tiy4=;
        b=kzZ+sn7gzOCABb40G1IgRDAbBdGwNBIYQJ7/g9zljVyMx8M/rdhQS+jt1fDPF+IVTB
         /KFXiRlpVo32GOHwVJNPOY4I5aCWL024matKVpfHI4yuoIE6OwEk+v6JSy7ZWuzGO8AU
         lRMblQoOmAwHEUdyn4Oiu6sepvzf4K+7RCxfMpn/XmcwqgG4uzAV1D9Oudio09IOT7OU
         SXMsOfXXQIlwoPfYooNqtApWZTLb8CGPsGP+vpoVoBnYS23D4dr57SiE+cu4VJGnjMul
         KRS9dtxBEUUKRTo0e5gtPjfW3bGrORwxheVit6xnmwFNxXunOQb+2kgtJU/ZrvesgXk3
         JVwA==
X-Forwarded-Encrypted: i=1; AL+hErELuxxOiGGk6iaHq5Gv8FdRRxl9LGpWqhXtgYMQLycsREn/4okIRtecse+ytQlnZHj72kNj6Ps8Nuxz4rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rq36ZPwBzOenpHEFjLUxshuV/cM1h/t8anmvD9k2nupjYPpmd
	XGMqs6WBplg+1alaJenRg1QKMhA7vnrtL1+x43jZ4IbuHAGo9lkC5JE=
X-Gm-Gg: AZFdTZc6f/y9P801wkaPkjc3kJmMCIetFvH4rRSokrTVdYO1zOG3ggyxN2rG1tjLVcr
	xBlDhaq30aVrDUc0UmPRuldMSz5x5G61XVPEq5kvG0T1TUGLfQRNq+lSNnZ+JVoDnOVdFIEjmEX
	7+Ovv6Qr3BqbUWOH/jnc2GPJiW/97TrPE7/VkAoDkz3ylR7DsgBdc+WeasHrrn77jt9+lF6EjJp
	rEmYwA+3jRpuz0cLdzihCdfYwz3DGJWPPKk+tdk1WnzacjchUh/HvKm1Vcqlub3XXxDRhgQXuYc
	ETOxs6iLFITp4OAfDS9pzJZdGwRHfmuktEPDLfb3DfHeV9OxUe8W4F23BQr6hHQ9NaQC+ThDTjv
	GQY58d/ILTeMBv9Q/Ki/ED9Ca6VYiY7p5BYEhWNmYMytC69GafbYMRxupcSi9saFs6fPP5+7zPc
	jqi0jkkyoq/yweY7JWfS+trRQHFvAzvRG5xFUAui3rCn2SR2Rc/W+L5/R7nrptZLFDOoeK9Ny7Q
	QbbC5XdhWLYn6g8FFwjjBJ1WOSCq5HrUhhUsvagCELKW2QiNiQwYD4+NRY+k4B0aYDeSNHJNJPd
	8HSwHri77vM9dg==
X-Received: by 2002:a05:690c:9b09:b0:8b4:a39e:48a2 with SMTP id 00721157ae682-8b520436896mr80575217b3.21.1795715670603;
        Thu, 26 Nov 2026 09:54:30 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354770sm88243017b3.42.2026.11.26.09.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:54:30 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH] ramfs: drop unused includes from inode.c
Date: Thu, 26 Nov 2026 11:54:29 -0600
Message-ID: <20261126175429.1035841-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
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

inode.c includes <linux/highmem.h>, <linux/time.h>,
<linux/backing-dev.h>, <linux/sched.h>, <linux/parser.h> and
<linux/uaccess.h>, but it does not directly use any of the symbols
they provide. Drop them.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 fs/ramfs/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ramfs/inode.c b/fs/ramfs/inode.c
index ef91b933d4e61..a8c14fca06561 100644
--- a/fs/ramfs/inode.c
+++ b/fs/ramfs/inode.c
@@ -25,17 +25,11 @@
 
 #include <linux/fs.h>
 #include <linux/pagemap.h>
-#include <linux/highmem.h>
-#include <linux/time.h>
 #include <linux/init.h>
 #include <linux/string.h>
-#include <linux/backing-dev.h>
 #include <linux/ramfs.h>
-#include <linux/sched.h>
-#include <linux/parser.h>
 #include <linux/magic.h>
 #include <linux/slab.h>
-#include <linux/uaccess.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
 #include <linux/seq_file.h>
-- 
2.47.3

