Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437131;
	b=FmNPznW8EXWcGzuyGls+Jmp0Bkq+havGTEcLopwXkYRrNpLLOTnp1Z1sBlXVd58MEoSI
	 d/2rzMNVMttwGnnabRYIDhG7rJ9vaMEeDfdnRQDBfxjS+6eUwegaWDeAcz1MQDOsMP5pd
	 OPvTPdDMxstwFC1J3KOAogONaY5R5kgwxIeR+/Ih9JdFtD0sLYdkJe+uUhqXkhGxpzjXo
	 4udzqw+Bes8i9GZWsQmZP3RAsBDYA5+f8rQ8+GK8UnbiY4wdVMKRtrQnqCFpV55/neMUk
	 sq7CpEeqdKJYecrOLkCXnYUxRktt0+ezt0Vi7vsUGYev2pMFFaktqwUz0EgjKX6rrgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437131;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=GXsf2YpWeH+pLBRb1dWf4IhbUqVIagdm/URVt4SeJbg=;
	b=EHXNJXfGmlKG6jOukRLtdT0wuDA81cAvBYyTqtksL2gOlKWLINUeBS2xuZpbehHyAWWN
	 Ap6qlto3RcssrypPShlT9wLd7KBta2gYhGnZaklBpApUqXyZKRBTo6nlxUyqV4YJVm0cr
	 bOsvjY8prABw+BsjIz/9dgswk4gCou+QWm8DC8T/1yQ5aRZ/MajzimColIFDA9vN69Vs5
	 jDb7OLSb1kVwVuYXUcMZNhYc3xAJ1BpEcHElRuzFBZ2am5qaC3aoSujDxE9mfN3gOqM9A
	 G68bRWQOgrDrZ8la7tcYQJI44tFxRHZ2CYMCvZo/fkoRuEn1ZS8Ayc5X2Z5w0MbJkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eBxjqRXr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eNqzpyKE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eBxjqRXr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eNqzpyKE;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB01606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eBxjqRXr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eNqzpyKE;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eBxjqRXr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eNqzpyKE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 297ED1F7F4;
	Mon, 23 Nov 2026 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795437129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXsf2YpWeH+pLBRb1dWf4IhbUqVIagdm/URVt4SeJbg=;
	b=eBxjqRXrOy8fsSWRCFuuiujYFiyAwqJE4GhWRwuVlzi3F3AmOqQu5cUQxZdtRAEX0U/41e
	yO+rm6uuZn7Fnql17rX/UquJSnlxe6ybIyWYUVhBk+CCLAVkoHBcT+R9GqQWINQoCAk7xW
	gbYeT/Rqh6rUo/iVSGWwDqhEF8H3QHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795437129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXsf2YpWeH+pLBRb1dWf4IhbUqVIagdm/URVt4SeJbg=;
	b=eNqzpyKEAUWqG8nr0nYqPsttjzRzxpi5E0C9A6bLed0jjhZppNm2ICBg0To52IpQI2g/y7
	zyA/qAZQnrgnSRDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795437129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXsf2YpWeH+pLBRb1dWf4IhbUqVIagdm/URVt4SeJbg=;
	b=eBxjqRXrOy8fsSWRCFuuiujYFiyAwqJE4GhWRwuVlzi3F3AmOqQu5cUQxZdtRAEX0U/41e
	yO+rm6uuZn7Fnql17rX/UquJSnlxe6ybIyWYUVhBk+CCLAVkoHBcT+R9GqQWINQoCAk7xW
	gbYeT/Rqh6rUo/iVSGWwDqhEF8H3QHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795437129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXsf2YpWeH+pLBRb1dWf4IhbUqVIagdm/URVt4SeJbg=;
	b=eNqzpyKEAUWqG8nr0nYqPsttjzRzxpi5E0C9A6bLed0jjhZppNm2ICBg0To52IpQI2g/y7
	zyA/qAZQnrgnSRDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA1D513532;
	Mon, 23 Nov 2026 12:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oZj1L0gyBGvWYAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 23 Nov 2026 12:32:08 +0000
Message-ID: <5416834a-313e-46fc-ba01-0430592e82e5@suse.de>
Date: Mon, 23 Nov 2026 13:32:08 +0100
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
Subject: Re: [PATCH v5 1/2] nvme-multipath: apply delayed_removal_secs changes
 to a pending removal
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Nilay Shroff <nilay@linux.ibm.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev>
 <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,linux.dev:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/19/26 12:07 PM, Qiliang Yuan wrote:
> With delayed_removal_secs set, removing the last path of a namespace
> head doesn't delete the head right away. nvme_mpath_remove_disk()
> queues remove_work with the configured delay, and bios submitted in the
> meantime wait on head->requeue_list in case a path comes back.
> 
> A write to delayed_removal_secs only takes effect for removals that
> start later. A removal that is already pending keeps the old delay, so
> clearing the attribute leaves the queued bios waiting until that delay
> expires instead of failing them, and lowering or raising it doesn't
> move the pending removal either.
> 
> Requeue a pending remove_work with the new delay when the attribute is
> written, cancelling it first so that the module reference taken for it
> carries over. Have nvme_init_ns_head() cancel the pending removal
> before it drops subsys->lock rather than after, so that a write to the
> attribute cannot requeue the removal once a path is back.
> 
> With delayed_removal_secs set and no path left, the attribute is
> changed two seconds later and the head is removed after (mean of two
> runs, min-max in parentheses):
> 
>    delay (s)  before (ms)            after (ms)             change
>    30 -> 0    26655 (26537-26772)        8 (8-8)            -99.97%
>    30 -> 5    28298 (28094-28501)     5514 (5510-5517)      -81%
>    10 -> 30    8112 (8106-8117)      30376 (30106-30646)    +274%
> 
> A direct read queued before the 30 -> 0 write fails after:
> 
>    before (ms)            after (ms)   change
>    26607 (26450-26764)    4 (4-4)      -99.98%
> 
> Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
> Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>   drivers/nvme/host/core.c      | 7 +++++--
>   drivers/nvme/host/multipath.c | 6 ++++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
