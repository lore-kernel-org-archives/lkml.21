Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310358;
	b=rlQbYIxL20MOKaYYpMValB2ZtUqFpQhvNdbJMpsAWLji0jiefzH/vGrJ7Svpt5NwpqBg
	 FdzmjqVtff83SJSFgQDxAVGNQ7JTTMavJjhcdyV5btnw0sXxiy1BKZ8yTTS75Tcassoy8
	 t1b3BzD/8o8aUy+ORruBDxs00iXYDi5GQ5nFbEcxfhE9WJF0eUcwAyhA2GZTPAuLOqmCW
	 mB5U7vOgOif44WNJISrH//KU9w2s9ZiDzVM8UxlE9xxwcxONI6RFlKuZ8TmRyzqPw8Atm
	 t7Om9YvegGRiVgO1QuHbi9nyBpqcpesBWL1oBi054H8xK9Miu9rqrN73O20wnQMwMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310358;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=anvLIQ/gAVabMUhFwRkaKGx6MGoQfQXTcBbd/iuWriU=;
	b=swgcWunZAtY/0RGIx/8d51HBymFvQUQ+5J0zLAlg0vlrtprqNCLRchOuoZEneA0cmTQi
	 9+NGEVyYj7rPEXRv7GtORXYs813uiZRlWuhylDaQfUWfPSbbbo0K1LgrZZlDLPxUo80ZK
	 0dOLxY6VM5fFimgGjXWmpDVguW1ev2mXWOqplEMCMsyQ/Fk0q44fefIW4qQZaE3FQGBN9
	 LlGhUFLdls7FiYdI85yHCeFXD/7zin+L8pcW6sXUgSAGhTlQmlJB9hc3s0DxEZp2WTT56
	 lUFnzAIb8j5BN7f/iLH+2CoCJkkbsSbzS5yatuh2RwnSZcWkZXgxAR6cZi10r4ptYtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNZfx+Up;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA361606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA361606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNZfx+Up
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795310356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=anvLIQ/gAVabMUhFwRkaKGx6MGoQfQXTcBbd/iuWriU=;
	b=RNZfx+UpVCXvVhdBPLHG70KQH4LAO0f4EkyZAjkHi7S6jc8c4LZlMRH8BxWJaAxXQrvmqM
	mkeI6HF+50FEOg4kC/lm+1VFYtxf3oBFIskFHxi4GA9CQMx6yeRt1crcsEe9XUfp2yekr3
	+b7bDBSXGpaZo8xzgJcztxf2ECGkR/E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-5zWvLQCYMx-y__GcH6rhNg-1; Sun,
 22 Nov 2026 01:19:12 +0000
X-MC-Unique: 5zWvLQCYMx-y__GcH6rhNg-1
X-Mimecast-MFC-AGG-ID: 5zWvLQCYMx-y__GcH6rhNg_1795310351
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31602180035E;
	Sun, 22 Nov 2026 01:19:10 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AFC0D3003E88;
	Sun, 22 Nov 2026 01:19:05 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>,
	Chris Leech <cleech@redhat.com>,
	Seiji Nishikawa <snishika@redhat.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] nvme-tcp: remove the direct send path
Date: Sun, 22 Nov 2026 10:18:24 +0900
Message-ID: <20261122011826.1959697-1-snishika@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hannes suggested removing the direct send path in
nvme_tcp_queue_request() while reviewing commit 5db358f3a7f9 ("nvme-tcp:
fix io_work priority inversion when send_mutex is held"). This series
does that, on top of nvme-7.4.

Patch 1 removes the direct send path, so io_work is the only sender.
Patch 2 removes send_mutex, which has nothing left to protect after
patch 1.

The direct send path was added to cut latency when the queue is idle,
so I measured it on two machines with 1Gb NICs. The target is nvmet-tcp
backed by null_blk (irqmode=0). The host runs fio like this, 60 seconds
per run and 3 runs per case:

  fio --name=qd1 --filename=/dev/nvme0n1 --direct=1 --ioengine=libaio \
      --bs=4k --rw=randread --iodepth=1 --numjobs=1 --cpus_allowed=2 \
      --time_based --runtime=60 --ramp_time=5

Average of the 3 runs at queue depth 1, latency in usec, "patched" is
this series:

                      IOPS   slat   clat    lat  clat p99
  randread   base     4153    7.1  232.3  239.3       277
             patched  4154    4.7  234.7  239.4       280
  randwrite  base     2472   24.5  375.6  400.1       553
             patched  2460   14.3  387.6  402.0       570

The send time moves from slat to clat. With the direct send path,
io_submit() itself sends the command on the socket, so that time is
counted in slat. Without it, io_submit() only queues the request and
returns, and io_work sends it, so the same time is counted in clat. lat
is the sum of the two, and it changes by 0.1 usec for randread and 1.9
usec (+0.5%) for randwrite.

At queue depth 32 with 4 jobs, both kernels reach the 1Gb link limit
(28.2k IOPS), so there is no difference there.

On the same two machines, I also ran 5 controller resets during a 120
second randrw fio run on the patched kernel, and fio finished with no
errors. Separately, blktests nvme over tcp on a VM with an nvmet tcp
loopback target gives the same results with and without this series.

On a 1Gb network one I/O takes about 240 us, so a difference of a few
microseconds is easy to miss. Numbers from faster networks would show
whether it matters there. I am posting this as RFC so the performance
side can be discussed on the list.

Seiji Nishikawa (2):
  nvme-tcp: remove the direct send path
  nvme-tcp: remove send_mutex

 drivers/nvme/host/tcp.c | 60 +++++++----------------------------------
 1 file changed, 9 insertions(+), 51 deletions(-)


base-commit: 68099cf27253a8c89d703a282d3d811446d9453b
-- 
2.56.1

