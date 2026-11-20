Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143493;
	b=lRL7R3Q1+4swDgJ34zldjgyvvXciOgvX6OqZoRY0Cv+2l7uMDZsAXttFyE1SPz6IazjW
	 lebh3/SjUAodGjadliJDvfcttwPeIdirfUHQAlGOX1pnidGIccqYCW7xa7l2egggPFDKy
	 LilcJemh/4bTliZElP2leGLY6C73Npv9VyWm5zhqGU20gQTqPTGxtyY5S60SHfYloyoNJ
	 3ImUSLCGVxoEikwG4rb5I0np7zs9Q0Vup0ZEoBuvFuUapqleuSsEpBI7gZ5FH44V1pcl6
	 lH4RnZ1hHD7hxXkWAZA0PIMM7ce6eo8sdS0bwJ4A/CLnmgYweo7OcdW1KWlS8qH3Fuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xk4cQ5w6rgcfSik2vkPhBRPqtZG+6WqFpZrQIqGQzLA=;
	b=QEYnk75oit83iEPAVdORjQIQWgXGUHXsj0LnleH70d815+HfrI+9qFpI56qxIz+xKnCt
	 uKWNB39AlIK06pzFuE6WQSv3RobBWPz1Qqn45+QSlG7sfQeSriho5mMr4Jvoj/IrG/Pdw
	 ChFe4JxbUKn7747JrVhGh4mm8imLog7VTICDPk5f7hEoyYNzrLMHIPIN04Q3AfUESXgFb
	 gFsvdPabXYMOlrJ56DwfSeA/8PZasIu9wHlaE5EyHLGfWe9NgywprpaYMUScuctN6cX3t
	 b/eDZMHfcVOB2rqtg6UM/w6zamuz5PlmCCUfJIvlLF5jRqPgKPE+436H+ebm1JLxzog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BUVPr5tA;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36B606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C36B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BUVPr5tA
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a594d313a3so350011b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143492; x=1795748292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xk4cQ5w6rgcfSik2vkPhBRPqtZG+6WqFpZrQIqGQzLA=;
        b=BUVPr5tA/GDGUvNmvkf9zBno8hsXhS2dof3oq2DgcvLjI72Xl1/iDHoAtKcQSE3ZH8
         Gzrv99TsRoyRzM/SGocDbJZcjZkiFZdc8tpGJWEgrroVFiXMEOJOvTXLq9h0qNpteOvK
         GSGic5dgZ3Y36HTIIncdM/FssiNbG/LHGXjETa2ZEme9NSZdLoOUYq7pkLqg0P3AHS2K
         GA9e50ANFu6kM4MuiEjB1s3bCweq2U0ehx2Uat8HvC1BDbHSLihC2H1cY0N96aEaHITi
         Y8PQ//lfppvRhx5P7NFpxhgDdmdKP0alSeeCnPkMgTbvRWQLRDc2UWYcfMXAr9pYFta+
         BmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143492; x=1795748292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xk4cQ5w6rgcfSik2vkPhBRPqtZG+6WqFpZrQIqGQzLA=;
        b=BiEUSO0wWuUmdYbzAH69C4AufV5xVzDrsdsU6dmFvCpAmUMW7uS6OoCWddwXTj7RI2
         ADn/mWMZAHUQwg7nbCz3n97q3qobLB/Fni+tAAftdasmXXhn86/opUkda+L4qfxY0mqk
         eTOFIVfGHbjjzmlsZtzAhUPfY57IKsFs5dNSm9xMj/wAgxT7MxNer7472qUOIoDeumXW
         ABbgDoyskydZKbkq3adCUGfeFFDUm/24EVWtGnRnd/Olx0D0M6RRd1IjCaHKsh2/amLM
         qnuDzVN1rmYvUP4WTOUb/zFbVptDghLWzHDoIu19huEstt0YZfKNhBVxQMnSyiwRti/W
         6EDA==
X-Forwarded-Encrypted: i=1; AL+hErFaLEx2MaPzXZJSwoR3ksiwubAYzZKQt35uWeNau/HQtNwWcZxMsc8PT3fAxm9lHM3xs/O9mvehX4jb5c0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9crqqAsZKgPybWDC4yQT7d9CMttXE7qpR+Lh/R5ucwk/htlz1k
	aG+W2kRFgVFnb5uM00T/w2b44yp7Wh1yecpyP86HmAk8wExMtwWk4hsck4zJAkre76mO4GIT8d/
	MOa9bTX7NrZ9YalKndugzEbHmtIDl19L6NDtaEnm9r8FNamdu8Yw/SzcsV1etJhpxe7qXqk/gqO
	rFWsAs
X-Gm-Gg: AYBFou1L5aDvHMSd640mWb32asp/IQ5qy6sl1IdB6YNmO/2gDB4rqtV2aZOAnu8d3u6
	Vi/HA9Mj+58d28oBj4oHFVL4Jhk+6WlcMRtye5kG2JZvpsSaQNPM5gFG1uogl1F70PyYY641T1G
	O7C4QH/W6uUMN0cWnzPf9q75PT0jsYfyXdWtE2y2i8GAmbPVl/NaG2eBeXgpwyapxMnPzeJPG1+
	IT7pluhcVs+cDMSnPRCLCI5dqLCEAaUWj/vjzXT8gmrJHlFsF2qZe2hup4afW23emXtOYDfirsK
	Sdg/NOMRhr3lD/8cxUNYztm+5kQdfC+gu5duhFgQtyjDdAQKSVm5tPReNB13fA2GdKnv4krSjtC
	assEbvo6JysRFPowgkm7rBaJHwNHvgNQlOVTjsKR9BddCksuK99UCodw2gjaTcc8CXuuBdgDElZ
	o8gHoyqEE6hjXrpVgduUfprku1w9woUm9Y460iavGrlQBXYq9Tx2KNRcJhbxXGo7rhAQBr5u8yo
	c+WkyVcqo3h297RyP6b9PX/jA/qghyi0W+1c2Pp0kGG1st3Co3ElzVG3EJTGP8W2yeFsMZHXnzL
	LdMx0x55R+QHTitB02XZOiz/Dr8SaoLvj3BNkw==
X-Received: by 2002:a05:6a00:238b:b0:89f:5ac6:32f6 with SMTP id d2e1a72fcca58-8c87c387eccmr1558329b3a.24.1795143492408;
        Thu, 19 Nov 2026 18:58:12 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm749647b3a.31.2026.11.19.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:58:11 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [RESEND PATCH v1 0/4] Expose blk-mq tag sets through debugfs
Date: Fri, 20 Nov 2026 10:58:02 +0800
Message-ID: <20261120025806.1065295-1-lei.chen@smartx.com>
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

Block debugfs provides views of request queues and hardware contexts, but
not the tag set they share. This series adds a tag set view for inspecting
configuration, CPU mappings and driver tags, with links from request queue
directories to identify queues using the same tag set.

The series first removes a stale CPU mapping comment and moves driver tag
allocation and reclamation from individual request queue initialization to
the tag set level. This gives the debugfs tag files a lifetime that can be
coordinated with tag allocation and release. It then adds tagset/<id>
directories under the debugfs root and links each request queue to its tag
set directory.

Tag reads hold a debugfs active reference only while copying tag fields to
local variables. Releasing it before copying to userspace lets tag file
removal complete even if a reader faults on its user buffer and needs I/O
to a frozen queue.

Based on Linux v7.3-rc2.

Testing on a 192-CPU x86_64 host with KASAN and lockdep enabled included:

  - null_blk queue growth and shrink under concurrent direct I/O and
    debugfs reads, including 100 cycles between 1 and 192 queues.
  - Shared tag sets, shared tag bitmaps, three-map configurations, and
    repeated device teardown and recreation with old file descriptors.
  - Unmapped tag reclamation with 256 poll queues: tracing confirmed
    allocation, reclamation, reallocation and reclamation again for
    indices that became unmapped as the queue count changed.
  - Task-local allocation fault injection, including hctx allocation
    failures that rolled the hardware queue count back.
  - NVMe loop with two namespaces, 50 controller resets and data-checked
    direct I/O. These resets retained the same hardware queue count.
  - userfaultfd-controlled stalls in tag reads: null_blk queue resizing
    and NVMe loop controller deletion completed while copying to the
    user buffer was blocked.

No KASAN or lockdep reports were observed in these tests. A hardware queue
count change with NVMe queues already frozen has not been tested.

Lei Chen (4):
  blk-mq: remove stale comment about non-present CPU mapping
  blk-mq: manage driver tags at the tag set level
  block: expose blk-mq tag sets through debugfs
  block: link request queue debugfs directories to tag sets

 block/blk-mq-debugfs.c | 298 +++++++++++++++++++++++++++++++++++++++++
 block/blk-mq-debugfs.h |  22 +++
 block/blk-mq.c         | 143 +++++++++++++++-----
 include/linux/blk-mq.h |  13 ++
 4 files changed, 445 insertions(+), 31 deletions(-)

-- 
2.43.0

