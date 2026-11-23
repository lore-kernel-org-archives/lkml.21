Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452047;
	b=zm1FXOGWwzCj1osCNhGR6xQa+OCmlZBY/FavMPsg1uBQvnrJVXR1Seak7Z+sON8i5emz
	 LTuwzKKnaTZtaDmMft26UIAchnQJ3UFV95OxbrSVIad+jgJbKxHk+vYVrNIpXcouHPhYh
	 ytv3w/jK6DR+WTy5+Xq+/OtUi50yNhBrbYO60FdeN9TG2Q947ehZH3aTc4VWKHYEYDQ3t
	 VCLyRcpgjujN8vr7zQEljW9yfSRnEO/bQUnR3KezvxZ5hDgEEUlnRO8t1NavoUY5ZbdjT
	 zA422B1bNosNQwPOXZggpkNJmlfpBeNBSu0KkgKSu13yGHFGzH2Wjgbl7M0qaBfZNJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P5/ZiEeoOQolEtqZd6duqT2B+ydqubbd46Mv2EwUK7A=;
	b=gUeLwgQxegknl/gSX880ywCEH9dj0M/kj9QyWRO4sidzKJ2H3fg494ruZUxbdybQFX9Z
	 aHgOkjFAfiZ13oyUXYjZVfwtTATk9DN1vofL6u4Ma1A5SAG3dmP4QLButeTT3UPV9EtOv
	 1AwEFPhl/rwYhn2C+TmXlY/RzGlMYfyxXYfBxp30pb4ce+J1aHKxXhnLjeUalyRkL7BTW
	 wEf4NZp9Cob3JANVgigMNkOmYsoJ6udrGymdblmT81iL9QDl7qNGaGitVKjubXUMyR6QI
	 hYsAPYofMeE5RriqOJ1xDU2wL5qfmZ717Z6RdyqqYjCyUZlmUzm3sl3IU0h0AZ2SquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbpMdQoi;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E3606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbpMdQoi
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5162098c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452046; x=1796056846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5/ZiEeoOQolEtqZd6duqT2B+ydqubbd46Mv2EwUK7A=;
        b=vbpMdQoiG9qBH8Tl6U7EVOleFGxsrHTy0mVYXW6H+MRhrHrfwiAVBAdwZayZumctqK
         TjAfKEAnfrjr4j6oEW/cEYCOBj1+AV19XLVfz2mSeSpyi0+JFw8DFQVJXbtbFtagdP0E
         baE/uVWY9vzZstUi/ZpsJ07RzWunWb//7HKrxuNGitcvwHrLPXNwaPmXzMWgE05nLAQl
         sS5QwQMzgs4+UdkcXzbn4Mt8ueUsE5U3xufdoU+dhEZlXnDT4P/6Pgpg9X3SJxrhdr0E
         djNugvM++2GRtA2GnhQMsxjY3VIrtZO8oloUIyWEZKFD/GXznbLz5MwpfhzUqzgwVZ/R
         a8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452046; x=1796056846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5/ZiEeoOQolEtqZd6duqT2B+ydqubbd46Mv2EwUK7A=;
        b=m+oaDsxYDpv2LKEY6I3o+oEAG1UN4jvjJlKCyN/Ldw+412H3196rmtp2O+pgE8HOnc
         CfUQ5qNmLQDyKLX4ppRUS4524IqWznCQL5Si8FLXaN2SjiunNUBEY/CEgG3jFJTZIKU7
         ER7BjOOvJuh622g7Khs2W0MrVLwxKVDgFQoUVMdsBBVyqdMv2rvD0qL5O3Zq9m5bk9pp
         4/mqu6EmdIEO7o5YThtot63O79J6JyXRxe42YAApzQScqQWKax4q6pCFCi3ZICF4hVXK
         +QsEsF0B6G9CVHUOvXgZuxRI4nOYeatzXz8Xb0a4/ld0U/TGfngyy8upIuWdk2feGYM2
         NzBA==
X-Forwarded-Encrypted: i=1; AL+hErHW0GbwDdwlyuS79NmVHGkakWIUPVZMERdsq7hJUVcM6zD3hTVvYS043jc09u0NyZo9NL6H4YqXOUyyQ7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SBvokA4xRZesFxexJ+zAS/dBA/EHagKOYRZOv8bPB1xnW92Vz
	z7bpBD6pkv97oBn4pAOvv1WB35qQmA6Uem3GlTCv7XOiFzXOoPZFtVH+
X-Gm-Gg: AZFdTZc38f0geJSMebPZOFt1nI03TLXoyUgIOqw0D/0SiLW5vlRG0Cbyx8mtbvuKJHO
	OMtcFzXD9sJABGTF+DXZJvrZNz6gokcLVrQjwusjYWn3+Z8+W0oDMfKtLQgLiwW1ExvRUJcOvgJ
	+O5V1deBBnrmSy9L7kVZpBHhyBrYV8Ujq02l79CI0oKi2LhkiHYSp/v9R3aco7HmH9MzasxvfnD
	vze1O7W+8l1NHsY20IH8eRfILsFXYnflto64UHqGUXj6AAMRhcxi4E6hl7jpFe1xTxNnDhmQDgA
	rcU8aDxvuTZ76Mldt+DzLMHvvnsRjUgjfZVz1L9D3K5bqN+1SpA2YCh4l1NR4Ld3LVwyLs1FWJD
	Kf2Lkd9TTsj0nlASQTkBRFZRe0SZNMZ/eS0RZdc4yCT0EYsed7sVI/A6fJJPJbBJKL6p8rfcnLI
	pQquJYcCxphxkPNvKgE/r5s5NdAxexniyO6gXYaA+JRPvnKuLp2T09tv3wTJv1FEpkL4M8MSvAF
	IBFcKhZEouO8MUWYTRbruvoij0eUiFCeJAxMnR23OYTh+xxdsQUGHkUuF4cxRcJZZu+8Bn89xt9
	A+1WCs9TgjyQtDx02hWvCKeWBKmOQ25fIAJqxZuznv2FGIKrBbXNF7Qv9Z3a7q++KCLEpaTH+Iq
	Q/aPV4b2M
X-Received: by 2002:a05:701a:844e:20b0:1b5:6c13:c76c with SMTP id a92af1059eb24-1b56c13c7a8mr6689110c88.15.1795452045824;
        Mon, 23 Nov 2026 08:40:45 -0800 (PST)
Received: from lounas.tail428e48.ts.net ([157.131.129.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm33225486c88.13.2026.11.23.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:40:45 -0800 (PST)
From: Louis Thiery <thiery.louis@gmail.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com
Cc: ming.lei@redhat.com,
	dm-devel@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Louis Thiery <thiery.louis@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dm: clear REQ_DM_POLL_LIST on embedded clone bio
Date: Mon, 23 Nov 2026 16:40:21 +0000
Message-ID: <20261123164021.463361-1-thiery.louis@gmail.com>
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

When a polled bio is split across a target boundary (for example a
dm-striped chunk boundary), dm_split_and_process_bio() re-submits the
trimmed remainder of the original bio and then calls dm_queue_poll_io(),
which sets REQ_DM_POLL_LIST (aliased to REQ_DRV) on the original bio.

When the remainder subsequently enters dm_split_and_process_bio(),
alloc_io() clones it into the embedded io->tio.clone, inheriting
REQ_DM_POLL_LIST. alloc_tio() only clears REQ_DM_POLL_LIST in its else
branch for non-embedded clones, leaving REQ_DRV set on the embedded
clone that polled normal I/O uses.

The leaked REQ_DRV flag is misinterpreted by lower layers. On NVMe
(where REQ_NVME_MPATH is also defined as REQ_DRV), nvme_start_request()
calls nvme_mpath_start_request(). For a single-path namespace where
ns->head->disk is NULL (with CONFIG_NVME_MULTIPATH=y), dereferencing
disk->queue triggers a kernel NULL pointer dereference:

  BUG: kernel NULL pointer dereference, address: 0000000000000050
  RIP: 0010:nvme_mpath_start_request+0x28/0xc0
  Call Trace:
   nvme_prep_rq+0x5e0/0xa90
   nvme_queue_rq+0x40/0x1a0
   __blk_mq_issue_directly+0x45/0xb0
   blk_mq_try_issue_directly+0x85/0x100
   blk_mq_submit_bio+0x6c9/0x710
   submit_bio_noacct_nocheck+0x127/0x330
   blkdev_direct_IO+0x230/0x680

On stacked DM devices, a lower DM layer also sees REQ_DM_POLL_LIST
already set on the incoming clone and treats its bi_private as a dm_io
poll list head.

Move the REQ_DM_POLL_LIST clear out of the else branch in alloc_tio() so
it applies to both embedded and non-embedded clones.

Fixes: b99fdcdc3636 ("dm: support bio polling")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Thiery <thiery.louis@gmail.com>
---
 drivers/md/dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1881d8611..79972f17f 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -628,13 +628,13 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 		if (!clone)
 			return NULL;
 
-		/* REQ_DM_POLL_LIST shouldn't be inherited */
-		clone->bi_opf &= ~REQ_DM_POLL_LIST;
-
 		tio = clone_to_tio(clone);
 		tio->flags = 0; /* also clears DM_TIO_INSIDE_DM_IO */
 	}
 
+	/* REQ_DM_POLL_LIST shouldn't be inherited */
+	clone->bi_opf &= ~REQ_DM_POLL_LIST;
+
 	tio->magic = DM_TIO_MAGIC;
 	tio->io = ci->io;
 	tio->ti = ti;
-- 
2.43.0

