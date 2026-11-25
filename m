Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643254;
	b=2FMUMjtbBW+as9YmDPuAU3dWxUED35KuKa0dMl4GG9u5I18h2EW0kOTTCP6LHYfdL2Bg
	 Vv5J8Gj5nNrADlyW1FsQhB60ufRtn6rC8H6VOV7RIbwj9p4LsW2oMMNw+AJS06LeYDmrm
	 cIODCIaO8H725YQf4S8v3mxzMRmFSvUauCUj71NtEmYfU96EpjlrhwssN+a5fM/R8A7iT
	 IgnXTGGXG5hjWkzvoJJB2cIKvgcmiHirAeuiyy2WYd1NCv7Ec6pkQGSYxO8uA3WJvLc9q
	 Fgj5wEWw0uKFqhFErkfV/NmLqk34fbVlREPwX+RBtbTmh+aChKaU2ODlJnW5nfgbQFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qYtfSV7pXPeTfIc4mFEoIenAEwjJso8HErV9eJ0iS/Q=;
	b=DPIKcgM746EsvlA2wOKBEhLR6hn4C9nK5/MpoelNRa+hbc0y91lTiPTSYvDj5QV3YoEu
	 av8RnLbsLXp1PKIrL8R4OGDhpgBllUxk2c9QtiqfvPCFXA29DBq4xtACL20Uy39X9KP7O
	 RkF2gTOFGyLrUSRgboe6NJhgcW2+Bt0u4jhWXZmPiAc0rg/J4NicnaUEoiWJlje9jVQUD
	 CH0B8quj/vFpOPZOew2kXlQ8wp2L7RrF7nYOOd8ZrrioLpmWu88qBP8UfvWssTu3KLErD
	 RtTkp89lvM8QqakndVfp5resY6/L+PU+pUetRZuOFPR/hO3jnXLtB7U/IvTnrQc0yjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=QhSgR6jf;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560FD606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=QhSgR6jf
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38699cf08dfso7608081eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795643252; x=1796248052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYtfSV7pXPeTfIc4mFEoIenAEwjJso8HErV9eJ0iS/Q=;
        b=QhSgR6jfKHc4KQuRrW28/UnwFauHpcwusBDSzItvH11mJAYX4ilqK4kQPo+RGc9P+b
         l7TQW9X/6+DH/ct2BvVRqHhNI2pprR63/itI1TTWOhIIy6TotVfu8p2lhIbMj3sBZKj7
         pwvgBfaST27s7N1+aFKIOI2ichwtiGqkAFOjaBMOG+qACgbMDTvc2zj0k+RQ1+Sc7jyj
         ZTSgpq7HTWLZqO80lFZq1uobzVzGYUScIwuS8KIqxy4lLTCMHsns02qz2o+c0LElwZF9
         vmuiXwHNSWK9y74b18KXGcCZOFqNq/Zuil/IuBnMrQhP5SM2HJ6Cw9lBKA3YEiA3v2do
         zfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643252; x=1796248052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYtfSV7pXPeTfIc4mFEoIenAEwjJso8HErV9eJ0iS/Q=;
        b=GQr+yHRR1qh2SeCx50+Nyvn/iPYVKypbB3OTbssEuDhl31lKIMfXE4wvBHk4P2BcxH
         2oEwZoWpPHuYbbneTurytq6HJKzbzJ1jQNWZ8tqeERG7IAeAuI1n1FGlZt29t+dEoPU0
         PlTnA9gAwdM4hhpbPlJXYuRVhaYGGsWdr14DqRBLE0FQh6IxthdHCx9hZObSIBGxmDcz
         4YJ6Q3/ZrOVzBFR9AzFPmuaf6BquaMosidJZqZj0bvwZSucteU61+stHFlm+bPVx5c30
         8tePtMrDZOT6I8Lc6x3FCZmvOA6sjlCZZuWAwle/oqxeATM0BCm070M9MRYJqC17YN8o
         dkMQ==
X-Forwarded-Encrypted: i=1; AL+hErHOSyZS3MkL+8DefFETZyiUyYg4SPQPRJscgO1sCl9WrUuttChXT+R67xFeHo9lxHXYn8Ag6eRwtil6KCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FM+PLt2KDXNVu3+rG/LNJmQhkesgQ3W0ii/PkllfF+U9bBSMQ
	vBHu+r1C0kwv1YTCRpx9KbYi8vgwG5L8uZFSpkjTDJIoxAXqG59L/iRjR44pRRvuBXY=
X-Gm-Gg: AZFdTZdogiFmO0rRzzuczGJZzZU7xeMbbmpZQUYo9/E9HcnIE2VAkSO43k/5OXzbs24
	8InXUIVEh3zz2XPeSPrjDEpVtJmeYkS1YdkVqYGNte0RSrXrytWWa8Rfj+Xg80f3Ljq9jEXD5GD
	YMU5R+lk/9sWflNWi3iCtG6TCj+FjFSZex8qDAcoNLUk7mYeq6uiCi8U8VR+XtpiOWBC9kD8zbf
	8+Bt+RGR1dem0OcGFPI3JutRwlU+bv6YyXg+dMg5MhoJOGTq4zW91Ospx8ZfAUd67T4r6TNkFfo
	GsKa4s/KQL+jpMxJ9Ygp5q6VkQvuy40cUnB41QZNoMeH2zseh0uwGmF7E46/KZwJTgpt5Qd2R8k
	WvTkAhE1I4VXPyZeV5PB0l5QD6YqleOfNM4Anu+XyW+U0mjpgyix7sxnF6weuDrVsj/4SU1a8Kl
	AzAeDtVE7JFTL/M1l6cS4yCwIoONS/kD+HUEYiL+1atmq4P+w1Cbo+dLp2c9hEQ5y2hHlIRw35/
	sBTbECv9OvwNKdBf/OEE4DIuUYC2noOAVZSMDHl5M7UO0ejPvtXRQMmhUixQXHgNU6KBquVhkGe
	sxQUY2mYM0B96Sk3z+c1fDRNClsgZk0Vh45cwvkAze1Tlq5tMDAxZ46rGnU/36UXVp3iEN9hB8A
	mwFQ0U8wNhG8BRX3ULJtshJGVKbwR4euZlXFmuDTly10JmL7D
X-Received: by 2002:a05:7300:c001:20b0:386:d2a2:135b with SMTP id 5a478bee46e88-386d2a213e1mr2605327eec.39.1795643252198;
        Wed, 25 Nov 2026 13:47:32 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm100644292eec.3.2026.11.25.13.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 13:47:31 -0800 (PST)
Message-ID: <86fea5ad-43d5-46d6-b2e5-f93b8a6afb8f@kernel.dk>
Date: Wed, 25 Nov 2026 14:47:30 -0700
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
Subject: Re: [PATCH] io_uring/openclose: allow an empty path with O_EMPTYPATH
To: Jori Koolstra <jkoolstra@xs4all.nl>, Hengyu Liang <hengyul@cs.unc.edu>
Cc: Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125180817.3682397-1-hengyul@cs.unc.edu>
 <170898867.2781789.1795642036410@kpc.webmail.kpnmail.nl>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <170898867.2781789.1795642036410@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 2:27 PM, Jori Koolstra wrote:
> 
>> Op 25-11-2026 19:08 CET schreef Hengyu Liang <hengyul@cs.unc.edu>:
>>
>>  
>> Commit 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
>> made build_open_flags() accept O_EMPTYPATH and turn it into
>> LOOKUP_EMPTY, so that openat(fd, "", O_EMPTYPATH) reopens the file
>> behind fd.
>>
>> However, io_uring also uses build_open_flags(), but __io_openat_prep()
>> still copies the name with delayed_getname(), which rejects an empty
>> name with -ENOENT. As of now, IORING_OP_OPENAT and IORING_OP_OPENAT2
>> accept O_EMPTYPATH, but fail on the empty path this flag is meant for.
>>
> 
> I think you should leave the reproducer from the commit message.
> 
>> The issue can be reproduced with this program:
>>
>>     #define _GNU_SOURCE
>>     #include <fcntl.h>
>>     #include <liburing.h>
>>     #include <stdio.h>
>>
>>     #ifndef O_EMPTYPATH
>>     #define O_EMPTYPATH (1 << 26)
>>     #endif
>>
>>     int main(void)
>>     {
>>             struct io_uring ring;
>>             struct io_uring_sqe *sqe;
>>             struct io_uring_cqe *cqe;
>>             int fd = open("/etc/passwd", O_PATH);
>>
>>             printf("openat: %d\n", openat(fd, "", O_RDONLY | O_EMPTYPATH));
>>
>>             io_uring_queue_init(1, &ring, 0);
>>             sqe = io_uring_get_sqe(&ring);
>>             io_uring_prep_openat(sqe, fd, "", O_RDONLY | O_EMPTYPATH, 0);
>>             io_uring_submit_and_wait(&ring, 1);
>>             io_uring_peek_cqe(&ring, &cqe);
>>             printf("IORING_OP_OPENAT: %d\n", cqe->res);
>>             return 0;
>>     }
>>
>> Before that commit (v7.1), both calls fail: it prints "openat: -1" and
>> "IORING_OP_OPENAT: -2". After that commit (v7.2), the result is:
>>
>>     openat: 4
>>     IORING_OP_OPENAT: -2
>>
>> This patch will copy the name with delayed_getname_uflags() and
>> AT_EMPTY_PATH when O_EMPTYPATH is set, as io_uring's statx already does
>> for AT_EMPTY_PATH.
> 
> It ain't a sin, but try to avoid "this patch" references.
> 
>>
>> Fixes: 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
>> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
>> ---
>> I found this while comparing the behavior of different kernel versions.
>> I used an LLM to analyze the problem and to draft the patch and this
>> message, and I analyzed the result myself.
>>
>> Tested on io_uring-7.4 (0659e44ce739) with KASAN and lockdep. A test
>> that runs 24 cases through IORING_OP_OPENAT/OPENAT2 and through
>> openat(2)/openat2(2) now gets the same result from both (32 of 42
>> results differed before). The cases include O_PATH and regular fds,
>> AT_FDCWD, forced async opens, RESOLVE_CACHED, a direct descriptor slot,
>> a bad pointer and an unprivileged reopen of a 0600 file (EACCES). The
>> liburing open tests and the openat2 selftests pass on both kernels.
>>
>>  io_uring/openclose.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/io_uring/openclose.c b/io_uring/openclose.c
>> index 24cf3ce2e2bc..29fe31f16a2b 100644
>> --- a/io_uring/openclose.c
>> +++ b/io_uring/openclose.c
>> @@ -54,6 +54,7 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
>>  {
>>  	struct io_open *open = io_kiocb_to_cmd(req, struct io_open);
>>  	const char __user *fname;
>> +	int uflags = 0;
>>  	int ret;
>>  
>>  	if (unlikely(sqe->buf_index))
>> @@ -67,7 +68,9 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
>>  
>>  	open->dfd = READ_ONCE(sqe->fd);
>>  	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
>> -	ret = delayed_getname(&open->filename, fname);
>> +	if (open->how.flags & O_EMPTYPATH)
>> +		uflags = AT_EMPTY_PATH;
>> +	ret = delayed_getname_uflags(&open->filename, fname, uflags);
>>  	if (unlikely(ret))
>>  		return ret;
>>  	req->flags |= REQ_F_NEED_CLEANUP;
>>
>> base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d
>> -- 
>> 2.53.0
> 
> Reviewed-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> 
> @Jens - You've pulled this already, I don't know if io_uring appreciates reviews
> after pull. Let me know if not.

Always appreciate that, the link is in the commit too so it'll be
discoverable after the fact as well.

-- 
Jens Axboe
