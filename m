Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448488;
	b=dq/4JKKIhmMQGzo4+31155SIgFslVK3poMm6k6OP8GhC6ngCZhhLGA2xhfThRH986YZv
	 rKRlkIJUPKh/rehdWP9adGGBtxT2BMsSzdHuMihJZw1FbabAHnaM4MO0B4KeIx6Wshm8K
	 lTVAzsnkAnAdWrgzzBnyBHmoqZyuSC3GILI0vk17qFE2DRJOHI0c7YmPpAAELl4OcIKhW
	 8UpE+s+4iyp/mGXk2WG+kKam2rCuPy/blPxYccHpNNkvJOsuFtlOVbgPB9LsU6HSjC7je
	 TCBE8CAgYPzJ4PEtfwUyIRAYk5jcB0qjw5Ss3njHU6FhKST6sgNERdDRghf+q1WD3Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448488;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=8+/2WoxFdpcQdUsqbaVip+amN1KRS8T5dllu47RLv5o=;
	b=tyP4d0D6ieVQGCCLATQBWuh058bDViv+/GdoZ0EUswPxONCHsMpFecv5cjbTx85gVJ/t
	 BgOPFTpHv7V4xwmHRbZb/tw9/OsT7uxEuCi61L4S/CNASCk4Q9v/GvP7IVxGUILXIF5mw
	 5LxLCF8fU3bkUubPMKVuOWoZ+B9YheMOrRp/kstX5bnwOsHhgyHDCqkGByMpgw9230Jc2
	 bHktmZ+fW3cHNOTc+jMQBMlJaA4Tf8JPoYaxgP31wW81YaKmZDcq866KGNSXJMPz2tSgt
	 +1nLisKMNPPSpK4t19AqiOI+aWxAhZGSqJCqYCyItz2PK357dKpicC7Zffo/eVGbwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cPUAdIEI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MeRVOgbM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cPUAdIEI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MeRVOgbM;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEE2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cPUAdIEI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MeRVOgbM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cPUAdIEI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MeRVOgbM
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92E8E1F390;
	Mon, 23 Nov 2026 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795448485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+/2WoxFdpcQdUsqbaVip+amN1KRS8T5dllu47RLv5o=;
	b=cPUAdIEIrqM1kE3D/wgLateAtVuXGul9Gi1xOsSPgQ1JLo4wgf89AjtTF1M47E0lBDUy85
	JC3FpvCNHTPtevWbQ5xcW+etHvlEstYZSTrs1nu89l25yTNCm0bgUiF+bp6shIbSGz1G22
	NVNsxAwD7u6hUIYS2ZZgN0arqYyuvfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795448485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+/2WoxFdpcQdUsqbaVip+amN1KRS8T5dllu47RLv5o=;
	b=MeRVOgbMJEh/BOCD0ScBfVEUF9K5YqAqkyMRX/w/HHmCOcaa7rywBY9XW5vMRwS3JaHH+l
	0oQL5eePSq3xnLAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cPUAdIEI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MeRVOgbM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795448485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+/2WoxFdpcQdUsqbaVip+amN1KRS8T5dllu47RLv5o=;
	b=cPUAdIEIrqM1kE3D/wgLateAtVuXGul9Gi1xOsSPgQ1JLo4wgf89AjtTF1M47E0lBDUy85
	JC3FpvCNHTPtevWbQ5xcW+etHvlEstYZSTrs1nu89l25yTNCm0bgUiF+bp6shIbSGz1G22
	NVNsxAwD7u6hUIYS2ZZgN0arqYyuvfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795448485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+/2WoxFdpcQdUsqbaVip+amN1KRS8T5dllu47RLv5o=;
	b=MeRVOgbMJEh/BOCD0ScBfVEUF9K5YqAqkyMRX/w/HHmCOcaa7rywBY9XW5vMRwS3JaHH+l
	0oQL5eePSq3xnLAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 487CC1352B;
	Mon, 23 Nov 2026 15:41:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sULWCKVeBGvHJgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 23 Nov 2026 15:41:25 +0000
Message-ID: <f9d90595-d2cc-4c24-99eb-9e924969aa1d@suse.de>
Date: Mon, 23 Nov 2026 16:41:24 +0100
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
 <463a55e8-c2ef-4d83-94ff-7599c7d931e6@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <463a55e8-c2ef-4d83-94ff-7599c7d931e6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92E8E1F390
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,kernel.dk,lst.de,grimberg.me,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email]
X-Spam-Score: -12.00

On 11/23/26 4:32 PM, Martin Belanger wrote:
> 
> 
> On 11/23/26 07:59, Martin Belanger wrote:
>> How should nvme-cli determine whether the kernel accepts a key
>> description for DH-HMAC-CHAP?
> [...]
>> 2. Use a separate option for the key description, for example
>>     dhchap_key=%s and dhchap_ctrl_key=%s. nvme-cli would then detect
>>     support through /dev/nvme-fabrics, as it does for the other
>>     options. It also avoids having one string that can mean either a
>>     description or key data.
> 
> Hi Hannes,
> 
> A follow-up with test results. I added DH-HMAC-CHAP support to
> nvme-keysd and tested it with v5 in a VM, with nvmet over TCP and keys
> in both directions. Import, connect by key description, a wrong key,
> and a key replacement all work.
> 
Cool.

> For detection, nvme-keysd now uses add_key(): it fails with ENODEV
> when the 'dhchap' key type does not exist. On an older kernel, the
> connect fails with "Invalid DH-CHAP secret <name>", which is clear
> enough. So nvme-cli does not need a new option for this. A separate
> option would still avoid the ambiguity between a description and key
> data, but that is your decision.
> 
> One finding: add_key() with the exact secret length, without a
> trailing NUL, fails at random with EPERM. nvme_dhchap_psk_preparse()
> treats the payload as a C string and reads past it (the bug Sashiko
> reported), and base64_decode() returns -1. User space passes the
> length without a NUL, keyctl(1) too. Could v6 parse exactly
> prep->datalen bytes? For now nvme-keysd passes the NUL.
> 
Yeah, that should be addressed with v6.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
