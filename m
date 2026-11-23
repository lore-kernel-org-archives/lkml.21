Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448393;
	b=nqDI3o8ry4n7x7y6S6bJXFeP9JGgCdf0DidFMZOAF6v3dn0O8n+zc+Mk6z5aNp9WRrIB
	 xjMdkFoS/TAkvDTvLekhMCNX0X9P5o6uanROVdU1xoK/6rBNabo6TlC/MSmzol9qU/CHs
	 PXyy07lJ4HjsSmp9SzM+yUCR9YJ/FMCP9ohI5IuDkFPMnM1khNWCrhQk9ISXdx6n6KcdR
	 Q2Uj9Sc2XVw98x2XJJ54NGX6QwHo/gI4AqbG1jLpAsxt1KUWOmJZjePb1EYxar6JsVf0c
	 tIMcQXld8kCQMqrEQu0t4oQtTRB0svSUM0Uh9TXyYdxgznDzhcIkDtQw6PLOuvTxpNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448393;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=2Q7CdRj+MCvFMxohcbN3zjaqZjL02AoaQHV5q/7P7x0=;
	b=4ESQv+adSOfLhQ2LU63atJMngtXOolutEvEmwiuUPmwiFYwG84Z7Ef8KLF39v71+YQcX
	 /WU/h1kd1Kr9BUo4YmVN/Qf6ATflG2GiM6eZN6AfrkBnDJY9B66MNXBZFNFSJTVApwpDP
	 xKGdvqOn6+DN04hseFhrmbU7fsD2qP3VXxCiv/lzz2Lg9csACh6tOthrzu/iyKOROHgve
	 G/zI4ujxvL83rhK8LSde4QoVmOCvQZEfiifbycw2BJDU4t7hCzRirN8vzn7TIJHwxBjuv
	 M/smZKx7vBHjOX0MkeFTBxojhjQsPtj1A1scqOb9o8PmiXnUKdJySOw5AepkcTDq+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo799los;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HxRGKCHN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo799los;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HxRGKCHN;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78572606A6BC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78572606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo799los;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HxRGKCHN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eo799los;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HxRGKCHN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A29491F84B;
	Mon, 23 Nov 2026 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795448390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q7CdRj+MCvFMxohcbN3zjaqZjL02AoaQHV5q/7P7x0=;
	b=Eo799los/WG7AgHd5RxhJRtHLaKJ3337K8DDk/4oVdoGOKoSdS7aWAqndsWHs3ujMrLbU7
	FbVnO4JLwwQJ+CTE8o79NF2655MnJuc0oeXGDUo3oNuePLjvNywCliRYjk02b+sxwY91OI
	mjfbxbc6i6N5buSFKH0+Gd9a4hC0ca0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795448390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q7CdRj+MCvFMxohcbN3zjaqZjL02AoaQHV5q/7P7x0=;
	b=HxRGKCHN57bPD6a2nu5pf5xoUrfPk7AGqt44WWk+o65E+PQ9yCw3OJ53GuG0eD3QSzJffu
	Po0xyCI1mav2DoBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Eo799los;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HxRGKCHN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795448390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q7CdRj+MCvFMxohcbN3zjaqZjL02AoaQHV5q/7P7x0=;
	b=Eo799los/WG7AgHd5RxhJRtHLaKJ3337K8DDk/4oVdoGOKoSdS7aWAqndsWHs3ujMrLbU7
	FbVnO4JLwwQJ+CTE8o79NF2655MnJuc0oeXGDUo3oNuePLjvNywCliRYjk02b+sxwY91OI
	mjfbxbc6i6N5buSFKH0+Gd9a4hC0ca0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795448390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q7CdRj+MCvFMxohcbN3zjaqZjL02AoaQHV5q/7P7x0=;
	b=HxRGKCHN57bPD6a2nu5pf5xoUrfPk7AGqt44WWk+o65E+PQ9yCw3OJ53GuG0eD3QSzJffu
	Po0xyCI1mav2DoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 529791352B;
	Mon, 23 Nov 2026 15:39:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6OALC0ZeBGutJQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 23 Nov 2026 15:39:50 +0000
Message-ID: <5f994e96-c662-48c5-82c8-7940e2c0a872@suse.de>
Date: Mon, 23 Nov 2026 16:39:49 +0100
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
Subject: Re: [PATCH v5 0/9] nvme-auth: switch to use the kernel keyring
To: Martin Belanger <martin.nvme.dev@gmail.com>,
 Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
 <5aa50b65-c502-4b87-8f09-23a456e2ca6a@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <5aa50b65-c502-4b87-8f09-23a456e2ca6a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.00 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,kernel.dk,lst.de,grimberg.me,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.00
X-Spam-Level: 
X-Rspamd-Queue-Id: A29491F84B

On 11/23/26 1:59 PM, Martin Belanger wrote:
> 
> 
> On 11/23/26 07:14, Hannes Reinecke wrote:
>> With this I have updated the dhchap arguments to 'nvme connect' and
>> the configfs interface to either be the keydata (ie the original
>> interface) _or_ a key description referring to a pre-populated dhchap
>> key in the kernel keyring.
> 
> Hi Hannes,
> 
> How should nvme-cli determine whether the kernel accepts a key
> description for DH-HMAC-CHAP?
> 
> I will add DH-HMAC-CHAP support to nvme-keysd. It will import the
> secrets into the .nvme keyring, the same way it imports TLS PSKs
> today, and nvme-cli will pass the key description to 'nvme connect'.
> On an older kernel, nvme-keysd must not import the secrets, and
> nvme-cli must pass the key data instead. So both need to know what
> the kernel supports.
> 
> I see these options:
> 
> 1. Check the kernel version. This does not cover backports.
> 
> 2. Use a separate option for the key description, for example
>     dhchap_key=%s and dhchap_ctrl_key=%s. nvme-cli would then detect
>     support through /dev/nvme-fabrics, as it does for the other
>     options. It also avoids having one string that can mean either a
>     description or key data.
> 
> 3. Something else. add_key() fails with ENODEV when the 'dhchap' key
>     type does not exist, but this does not show that the connect
>     options accept a description.
> 
I think option 2) is the easiest. We already have support for that
selection mechanism in nvme-cli, and anyone backporting only parts
of this series deserves no better.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
