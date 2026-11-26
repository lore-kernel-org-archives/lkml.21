Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658970;
	b=xuvwD2DaKrfkMUinAKFzQIthudmhaw7wtQRfbrU++y0YeA8OIcQ9exh9ou0UFMIP2rgK
	 eh7HStsrl152nSmRh8XCWHJnsj73LxQY5C46KDcOwCI2uWPtZ1W6A6MP842lX/4C1LydB
	 9u00jduat1r9SrctqsFAiY2TJx5isRDnjuxVUQnv6vS2OiH7c1KNlCabmpwOlBC7MTZtq
	 ajErp6isHAxQsl+3ab8RcDwwjjrN1TyZ6V1tbQr6RD5RrqnGl3iNc51es9qzGDALmlkiy
	 Fq+HvhuJXZNd0k1yjCh0cnTn2/vb9nL+r1ETLsnBwx0waF56+qtpAcAGHnmQSahxbFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658970;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mmQ9TdwufADSMjphoIOqHkpU1Ow14KEhoo6cBeI4n9s=;
	b=ucChE9U8kLGUGuxuh3spo+1h7cEQbsoWZ8ojairtb0b9SsYw3lCqFTyLcZvsTydLm34F
	 V/NCdTnQb30sd8jPGzzlBKVEwCfoZtZ8ehutT/eKAcjuCHmZT9aXrJT7U6YdFaEGgg+86
	 J0hH4XTA36ZDtBKIc4mNGF+qooeOHS1aankHIwCpVP7YcN4lSDqrMbjBzm86H78jNs4B7
	 DHSCztG5E43obnxMpJWT6yNmUNp/5TdciJ+3G9lbO+k1FTnbpT7fOxLCUN9RN5aTRghoN
	 /TU86AiMHUFfKIPuZhNapRDefN2DNhmMsYIEuXUTsOgHwtlDU6kE/rdg9x6ou3H5wwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SLk4fzfy;
	arc=none smtp.remote-ip=91.218.175.123
Received: from mta0.migadu.com (out-123.mta0.migadu.com [91.218.175.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2928606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2928606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SLk4fzfy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lSkU19aRfOotCaRJSikienAlcbDkSFi5RTcpkW9r2Zw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795658968; v=1; x=1796263768;
 b=SLk4fzfyor6ze6Lu2/F0CvwYwEg3J6jIS8IILtzG1MZr5iYPJCa/RN/PH2Ff+9PMcg2vhlUJ
 rr9WraRUcl6BSWO4Xfb5dAzVjQY96AElgWWgUXnhIWjaHnnNoBvsM+qoJZn8ciSL8LNCxcvdOOi
 anU7Dg8LiMKahrE4Kg18dyks=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 62c2b253538906c5;
	Thu, 26 Nov 2026 02:09:27 +0000
X-Mizu-Trace-ID: 62c2b253538906c5
X-Migadu-Flow: FLOW_OUT
Message-ID: <a4f6abfa-0415-4b8b-bc5a-fb05c02ff7ac@linux.dev>
Date: Thu, 26 Nov 2026 10:09:22 +0800
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
Cc: cui.tao@linux.dev, cuitao@kylinos.cn, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH v7] loop: defer the queue limits clear to a workqueue
To: Bart Van Assche <bvanassche@acm.org>, axboe@kernel.dk, hch@lst.de,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <20261124031238.555291-1-cui.tao@linux.dev>
 <b48806fb-22a5-40da-a682-22e010c8316d@linux.dev>
 <f8d3056d-2950-428c-b5f3-c41b5fa10eb2@acm.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <f8d3056d-2950-428c-b5f3-c41b5fa10eb2@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Bart,

在 2026/11/25 00:56, Bart Van Assche 写道:
> On 11/24/26 12:10 AM, Tao Cui wrote:
>> For v8, my plan is to stop deciding whether to quiet a request at
>> queue_rq() time and instead quiet repeated failures at the point of
>> failure. The verdicts remain recorded for the lifetime of the backing
>> file and are cleared only on rebind or unbind. loop_clear_limits()
>> reports whether a verdict is new, and repeated failures mark only
>> their own request quiet. That guarantees the first failure for each
>> mode is reported, regardless of how dispatch and queue freezing
>> interleave.
>>
>> [ ... ]
>>
>> Does this approach look reasonable to you? If so, I'll send the
>> already tested patch as v8.
> 
> That approach sounds reasonable to me. If the verdicts are kept for the
> lifetime of the backing file, I think the following simplifications are
> possible:
> - The clear_limits_pending member variable is no longer needed. The
>   work function can read the mask with the unsupported modes without
>   resetting it.
> - lo_fallocate() can return -EOPNOTSUPP without calling
>   file->f_op->fallocate() if the mode is already known to be
>   unsupported.
> 
Thanks.  v8 follows with all of this addressed.

Both are in: the work item reads the mask without resetting it, and
lo_fallocate() skips the fallocate probe when the mode is already
known to be unsupported.

> Tracking the verdicts per mode also fixes the following issue in v7:
> clear_limits_pending is not per mode, so a failed discard suppresses
> the error message for the first write-zeroes failure.
> 
Right.  The verdicts are per mode and stay recorded for the lifetime
of the backing file, so a failed discard no longer suppresses the
first write-zeroes report.
> A few more comments about v7 that also apply to v8:
> - loop_clear_limits() calls schedule_work() after clear_limits_lock has
>   been unlocked. Can a request that passed the lo->lo_backing_file
>   check queue the work item after cancel_work_sync() has been called
>   by __loop_clr_fd() or loop_remove()? Since lo_free_disk() no longer
>   cancels the work item, I think that would result in a use-after-free.
>   How about calling schedule_work() while holding clear_limits_lock and
>   resetting the state before calling cancel_work_sync() in
>   __loop_clr_fd()?
v8 does exactly that: schedule_work() now happens while
clear_limits_lock is held, and __loop_clr_fd() resets the verdicts
before calling cancel_work_sync().  A verdict that passes the
backing-file check queues the work item before the lock is released,
so the reset is ordered after any pending schedule and
cancel_work_sync() cannot miss it.  loop_remove() needs no
reordering: after __loop_clr_fd() has reset the verdicts no further
schedule can happen, so its cancel stays as the backstop it already
was.

> - The code that resets clear_limits_mode occurs three times. Please
>   introduce a helper function. Is the reset in
>   loop_assign_backing_file() needed since __loop_clr_fd() already
>   resets the state and since loop_clear_limits() ignores failures for
>   a backing file that is no longer current?
I dropped the reset in loop_assign_backing_file() instead of moving
it: since d4fabede1da0 ("loop: remove support for swapping loop fds")
its only caller is loop_configure(), which requires an unbound device,
so the verdicts are always zero there.  That leaves __loop_clr_fd()
as the only reset site, so there is no helper to add anymore.

> - The work function freezes the queue and commits the queue limits even
>   if no mode has been recorded. Please return early in that case.
> - The changelog for v7 is missing. Please include a "Changes since v7"
>   and a "Changes since v6" section in v8.
> 
Both done: the work item returns early when the verdicts are already
reset, and the changelog has both "Changes since v6" and "Changes
since v7" sections.

Re-tested after these changes: a concurrency sweep at 2, 4, 8, 16 and
32 threads logs exactly one error per run, whereas v7 starts reporting
duplicate errors at eight threads.  Sixty rounds of mkfs-kill/unbind
stress also completed without warnings.

Thanks,
Tao.

> Thanks,
> 
> Bart.

