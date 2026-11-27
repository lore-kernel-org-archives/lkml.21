Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745471;
	b=OdZega7XUkXroxYSf1cCXDEeC7C3PN8x1sfxKP3mISoAdhBUTtsk6nZ0WMtv1VlMiCJD
	 WeIrFUn6L5jUV05X0xwdm7yxqs7bQZX1sLppKW0ODRB0xdcDWefm74FAEXf3mY4lJLNj0
	 JivtnVhqL+JUza4nZOXJ6eSSDwEWsgNXTPtsjwCzmzMCti2SQMKPAITW74HvSzWbk+eG9
	 5JiRfPjpRqUUpJG0klMUy0BOpO1cOCk49TKWdvBmQQcwLof1qzwlawCJZkwv9JVPIpwAd
	 pBWc+Jz3449+h23sFsiL2cJCrc+gGh/j5JCXnxL6YBtCkp5nI4aMqXXPUrKTghHj8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745471;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=v17ApoUxmw4oIX3ib06cnHIG0pCYFw3usTIw/BBMT1Y=;
	b=jhTKLwOWwj503QWgFbibHuAs/yldfK0f3lsKsrFbJl/wzYc7t8qMvGUTBSN6dr13WV6U
	 fVQhAIrHL9g4BdBonxpa83ZQaC08AC86JxO7bqcltLJtyDO30EdGkoJMivad3z22x98Ek
	 97rHLma7v5dt3BP/VDACTCHefsHvrswW1E+PTvW+iibiONjhf3m6d0i2ARW98vdS7buIc
	 j+AvNwonoyFI9QE0rFwJ1j0KpiCzC82giDTtnnkxCmsjwYourq08J6nmhEsuG2w7DfZkv
	 1Kqioq1i+pCT3bmjSdE5Hlz6NNrxH8KFS/p+2b6rCStXQYEYcbV11lGSx3EoWZe+D2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rhxw0r2v;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92934606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92934606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rhxw0r2v
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795745467; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=v17ApoUxmw4oIX3ib06cnHIG0pCYFw3usTIw/BBMT1Y=;
	b=rhxw0r2vQ4lmuyQLa1oJVCu1jPjdYhowtlEkHMaLfe8LHnG4V8de96kybgX4YY46IpyvMM020nT0Uc0AkAjKp6IJfQSBGFhpqZce8Qy2CxUgK/j0jfu0uPuJ9H4O/Zu8uCB9XPWF2CS7TFGpyfK1A++jvwkbOkJcHSIUSaUvN2g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XFWG7vK_1795745466;
Received: from 30.222.32.233(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFWG7vK_1795745466 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 10:11:07 +0800
Message-ID: <843bc832-5731-4f06-835c-9594c53a4cd1@linux.alibaba.com>
Date: Fri, 27 Nov 2026 10:11:05 +0800
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
Subject: Re: [RFC PATCH v12 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: Heming Zhao <heming.zhao@suse.com>, sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
References: <20261125154626.22335-1-heming.zhao@suse.com>
 <20261125154626.22335-4-heming.zhao@suse.com>
 <sashiko-outbox-233793@kernel.org>
 <a9224bf6-9d1b-4fdd-9980-a70c39b11b57@suse.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <a9224bf6-9d1b-4fdd-9980-a70c39b11b57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/26/26 11:07 PM, Heming Zhao wrote:
> On 11/26/26 01:05, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 11 potential
>> issues to consider:
>> - [High] ocfs2: missing fsync tid and i_blocks update in
>>    ocfs2_dio_end_io_write()
>> - [High] ocfs2: buffered and mmap writes do not wait in
>>    ocfs2_unwritten_check()
>> - [High] ocfs2: ocfs2_dio_cleanup_range() fails on zeroed folios past
>>    i_size
>> - [High] ocfs2: missing IOMAP_F_DIRTY in ocfs2_iomap_begin() for
>>    uncommitted metadata
>> - [High] ocfs2: orphan entry and block leak on failed or short DIO write
>> - [Medium] ocfs2: overestimated metadata reservation in
>>    ocfs2_write_begin_nolock() for DIO
>> - [Medium] ocfs2: per-cluster multi-MB allocation thrashing on ENOSPC in
>>    ocfs2_dio_wr_map_blocks()
>> - [Medium] ocfs2: per-cluster w_desc kvcalloc, ip_lock scans, and
>>    duplicate lookups in DIO
>> - [Medium] ocfs2: preallocated extents truncated in
>>    ocfs2_dio_clear_orphan_locked()
>> - [Medium] ocfs2: stale inode state after lock drop in
>>    ocfs2_dio_upgrade_rw_lock()
>> - [Medium] ocfs2: ocfs2_should_use_dio() forces buffered I/O for
>>    sub-page DIO overwrites
>> -- 
>>
> 
> It feels like the more code I modified, the more issues I introduced.
> Furthermore, Sashko has started reporting performance issues.
>  

I'll take a look this weekend.
And then we discuss and come to an agreement which could be left in this
series.

Thanks,
Joseph
 

