Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686792;
	b=SkBplObqIqjfiitUP8vHxUYigFk5TrA0pLqbmop00G3yiMXXAPl+EHoQaG+twZlDpkOJ
	 UCds7NI+wBB01Ptjt4F+hlzmp7OVVG1FUGBnMJ+9IYP84YXx2DnlIEPCVuVtP8QDHzEGW
	 G9CHSeKKjpL4zN1605lMKfiknvlO9VzU1PPXRbuizNf+ij7GDG4NjPsW5HDxe/NpV/xGU
	 8vNSdCAZ3UP4Bm2mn6WJCEgROfMyP/fdRRumxIMRY9nbwhEsaeUcMfwBLaxkbQiNtTVa9
	 ysio1EKQqJ3CdCG9dNL52/UfsjU0bNMcJ9A0JYCVnSonvuE0kQg89UmW/HMURuMoSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686792;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=nVFUNPjBLd3knA7cF5uD5do1cnjXeZIrWqKFIW90WSU=;
	b=4m8o9ZS6DEojgWZzouBheSbqOvYWQenhrO4eJls8bcPD3EKvDV7iZbJ0+XSab9EPJ1DA
	 unoL5/XSO5xjNdQtFGoBywGsFfOxaiotUrHYAd669PWE95//uYIOguxIwe5N8Hl4ercgu
	 X/N4QaG7RDTj03rpkHZs8Q8je736ORLphiFfLhvEqcNiAFuq1Z6kwvlWQQTRftq3F5a9c
	 0wq29k9w2WxURxNE7At9otKbuyJsLLkKd1PmbZnW8ROHOBn+/zX+dWC1MeGGWZI5oStGT
	 lUk7XBk0ipi/XNMmQ2ntvqfBGvUl4BCmSsdvPOhsUG4TgdThCC98hZpSnke311DNkFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Su+P5e3E;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QWcC8PlN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Su+P5e3E;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QWcC8PlN;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0755B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Su+P5e3E;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QWcC8PlN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Su+P5e3E;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QWcC8PlN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E7F051FE7C;
	Thu, 26 Nov 2026 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795686790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVFUNPjBLd3knA7cF5uD5do1cnjXeZIrWqKFIW90WSU=;
	b=Su+P5e3ErP86uZbVS0upFNjy1GzvvRQ2LHzgYkfJr3cTRPvrxixpWpMZDFlkixaT0WcxAl
	jWn+ualMP0TXiOP75NrzxfOtfL9UL2jQtAF3sp0xcymCx+3mE6ILbzSSvuGKLD9PhGqfwp
	wa1KdJay1kTXm4inpKIMYNx7VTJkt74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795686790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVFUNPjBLd3knA7cF5uD5do1cnjXeZIrWqKFIW90WSU=;
	b=QWcC8PlNMlMVRlR3pNTS/CCm4xQYk4BaMdsUGR4R6AdE4wEEGzBjDlbnNlLrUT0Hb9R7mp
	1C+pMys/RpN8NaBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Su+P5e3E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QWcC8PlN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795686790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVFUNPjBLd3knA7cF5uD5do1cnjXeZIrWqKFIW90WSU=;
	b=Su+P5e3ErP86uZbVS0upFNjy1GzvvRQ2LHzgYkfJr3cTRPvrxixpWpMZDFlkixaT0WcxAl
	jWn+ualMP0TXiOP75NrzxfOtfL9UL2jQtAF3sp0xcymCx+3mE6ILbzSSvuGKLD9PhGqfwp
	wa1KdJay1kTXm4inpKIMYNx7VTJkt74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795686790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVFUNPjBLd3knA7cF5uD5do1cnjXeZIrWqKFIW90WSU=;
	b=QWcC8PlNMlMVRlR3pNTS/CCm4xQYk4BaMdsUGR4R6AdE4wEEGzBjDlbnNlLrUT0Hb9R7mp
	1C+pMys/RpN8NaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADFD9134C3;
	Thu, 26 Nov 2026 09:53:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wepDIoUBCGvXfQAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 26 Nov 2026 09:53:09 +0000
Message-ID: <d812cfe1-f5bb-412b-85d4-a355cc34c848@suse.de>
Date: Thu, 26 Nov 2026 10:53:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-tcp: limit the direct send path to poll queues
To: Seiji Nishikawa <snishika@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: Chris Leech <cleech@redhat.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261126063255.3240292-1-snishika@redhat.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261126063255.3240292-1-snishika@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: E7F051FE7C

On 11/26/26 7:32 AM, Seiji Nishikawa wrote:
> nvme_tcp_queue_request() sends the request directly from the submitting
> context when it runs on the io_cpu of the queue, the queue is empty and
> it can take send_mutex. Commit db5ad6b7f8cd ("nvme-tcp: try to send
> request in queue_rq context") added this so that an idle queue can send
> the request without waiting for io_work to run.
> 
> Since then this path has needed a series of fixes for races and
> priority inversions between it and io_work. These are
> commit 5c11f7d9f843 ("nvme-tcp: Fix possible race of io_work and direct
> send"), commit a0fdd1418007 ("nvme-tcp: rerun io_work if req_list is
> not empty"), commit 70f437fb4395 ("nvme-tcp: fix io_work priority
> inversion"), commit 08acb54b063a ("nvme-tcp: defer TLS inline send to
> io_work") and commit 5db358f3a7f9 ("nvme-tcp: fix io_work priority
> inversion when send_mutex is held").
> 
> On a non-poll queue, the direct send path makes almost no difference to
> the latency. fio with libaio and 4k random I/O at queue depth 1 over a
> 1Gb network, with and without the direct send path (average of 3 runs
> of 60 seconds, latency in usec):
> 
>                        IOPS   slat   clat    lat
>    randread   with     4153    7.1  232.3  239.3
>               without  4154    4.7  234.7  239.4
>    randwrite  with     2472   24.5  375.6  400.1
>               without  2460   14.3  387.6  402.0
> 
> lat is slat plus clat. It changes by 0.1 usec for randread and by 1.9
> usec for randwrite.
> 
> On a poll queue, the latency becomes worse without the direct send path.
> The submitting task polls for the completion without sleeping. When it
> runs on io_cpu, where io_work also runs, the kworker that runs io_work
> can send the request only after the task is switched out. This happens
> once per request. fio with io_uring and --hipri at queue depth 1 over
> the same network, on the io_cpu of a poll queue (ctx is the number of
> context switches of fio in one run):
> 
>                        IOPS   slat    clat     lat      ctx
>    randread   with     5017   4.72  193.95  198.67      553
>               without  4179   9.35  229.70  239.05  251,318
>    randwrite  with     3619   5.60  269.94  275.54      542
>               without  3621  10.62  264.53  275.16  217,806
> 
> For randread, lat goes up by 40 usec (20%) without the direct send
> path.
> 
> So remove the direct send path, except for poll queues. The other
> queues always send from io_work, as TLS queues already do.
> 
> Add a queue flag, NVME_TCP_Q_POLLED, for this. nvme_tcp_alloc_queue()
> sets the flag when the queue is a poll queue, and
> nvme_tcp_queue_request() checks it.
> 
> Suggested-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
> ---
> Changes since RFC:
> - Keep the direct send path for poll queues. Sashiko pointed out the
>    cost on poll queues, and the numbers in the RFC thread confirm it.
> - Drop the patch that removed send_mutex. Poll queues still have 2
>    senders, so send_mutex is still needed.
> 
> RFC: https://lore.kernel.org/linux-nvme/20261122011826.1959697-1-snishika@redhat.com/
> 
>   drivers/nvme/host/tcp.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
