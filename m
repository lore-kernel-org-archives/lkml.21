Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540226;
	b=G6W865oZMMlXPP0K/UnLwUctqYDLVeUZy1Ru3dN8QGMjqC0eLlOMES8as67MOR4sozOf
	 07znWzCWMJJkdj7dgy6r2PyRbO9fubJB2TrGfRPcdp275sVP3dsSAAt7ODDvDPp5Z1AQM
	 lYYe6HcJ883un/a7T1b83k1vambcCUmViXOQPUyDn+jDqy9lImf87doLFhDAgVwKRY76E
	 9KdrffVVSFxCn0MJflbCCX8tU/HMtk3K8h2RB4lfbAqCI8e+IJq2oyjedIIP9cFaUF/iK
	 XNC2feGP3/N5DSwpN+wtms6X1KObEByhadnJIsnxpxscHrXUOBDa+nKgEk4VcTUaQrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540226;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=YmiOZ9jE34SxzURKngNYElesZIMTc/ECsCU/qgrMmZ0=;
	b=SzCd+tInDaCaqacQixVCVKcUN0v5U+InjYy8ba/cScHycSjmO/RVkg/4VlKfQLgY6Gx2
	 JAoxMOrITL267Xfudp5+Z3Cc4PQplfgdU5SOBa6nevjuwsJog5eEpYFCTUBVt8FeWFYQd
	 vi0dnJIMyN8OV5WpHgkaMp8FDo0KlXFeQ6jTSsSHlBWCE8gaQGB6YlXroQHYfcjL5okAi
	 j0ihkh9FHu6FtHLJlu9IsVdlsQtzADA0E2vQzv8kZ5MqhyOOo0RaYot1ussH3gy7FljIm
	 gNnJLnpWyyDQ8ewTK1v2grw8LD09U9fEjo1Jvo54RsZ0IWqVU7+f2kjOPysBfTTNCIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ouOKBGiW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MT6YexHp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ouOKBGiW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MT6YexHp;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9BD606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9BD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ouOKBGiW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MT6YexHp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ouOKBGiW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MT6YexHp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58F5A220A3;
	Tue, 24 Nov 2026 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795540224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YmiOZ9jE34SxzURKngNYElesZIMTc/ECsCU/qgrMmZ0=;
	b=ouOKBGiW5ZoEhaJv4o7JA1xOX8qZNE6RBZA5oqIfW8Exk/9UZfsVnJdB0HjgWIpv00ZQr6
	7QJsQQULlqg8nKayzD5Pao1ThAHdSS9cCUCoIuDAQNg5mfznmyqmULx8JegzMzbxuGseQX
	y+U3RSrjOvkj8emujkw8G+nnuMN0L7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795540224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YmiOZ9jE34SxzURKngNYElesZIMTc/ECsCU/qgrMmZ0=;
	b=MT6YexHppHoEfuAuG45dEEkVYWpWK9NGB27mHQf8G8wdsJULHUFWOowrEBo80Er3JbQA5v
	P/vO79+zIQ5iHwCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ouOKBGiW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MT6YexHp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795540224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YmiOZ9jE34SxzURKngNYElesZIMTc/ECsCU/qgrMmZ0=;
	b=ouOKBGiW5ZoEhaJv4o7JA1xOX8qZNE6RBZA5oqIfW8Exk/9UZfsVnJdB0HjgWIpv00ZQr6
	7QJsQQULlqg8nKayzD5Pao1ThAHdSS9cCUCoIuDAQNg5mfznmyqmULx8JegzMzbxuGseQX
	y+U3RSrjOvkj8emujkw8G+nnuMN0L7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795540224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YmiOZ9jE34SxzURKngNYElesZIMTc/ECsCU/qgrMmZ0=;
	b=MT6YexHppHoEfuAuG45dEEkVYWpWK9NGB27mHQf8G8wdsJULHUFWOowrEBo80Er3JbQA5v
	P/vO79+zIQ5iHwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7F481339F;
	Tue, 24 Nov 2026 17:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0SH6KP7EBWsYVgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 24 Nov 2026 17:10:22 +0000
Date: Tue, 24 Nov 2026 17:10:21 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org, 
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Naveen N Rao (AMD)" <naveen@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
Message-ID: <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
X-Spamd-Result: default: False [-13.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 58F5A220A3

Holy cow the CC list is stale.
Fixing some up.

On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
> On 11/24/26 08:00, Nikolay Borisov wrote:
> > Resending this with the hope of either getting it accepted or
> > arriving at a consensus what exactly is missing so that I can take
> > it from there and eventually get something merged. As previously
> > mentioned this results in real problems for confidential guests both
> > on TDX as well as SEV-SNP.>
> >  arch/x86/Kconfig |  4 ++++
> >  mm/char-mem.c    | 10 ++++++++++
> >  2 files changed, 14 insertions(+)
> 
> I'm still OK with doing this.
> 
> But I didn't want to sneak an mm/ change in via the tip tree. Any mm
> acks or naks on this?

For what it's worth, I don't love this fix. Yes, it fixes issues in /dev/mem,
but it:
1) skips any other potential problem spots (I don't know which)
2) open-codes random CC checks in mm, which is kind-of regrettable

OTOH, it's unclear to me why that CC check is needed. If configs select
STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
in iomem_is_exclusive, etc. If not, could the CC awareness sit there
instead?

/me doesn't know much about CC other than *if you touch something you shouldn't,
it goes boom*

-- 
Pedro
