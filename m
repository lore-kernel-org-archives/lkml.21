Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404300;
	b=RnyTZZFyTmHhrcxwFQ2ZHKrKkMIjzal2F7RbJQ7G1c6aAjKwcwHMybFL1sYbgAonh4Nz
	 ybPgyYZdwM9I/iEsCO2iOsAKeH0Jxmgnz0r8COFXtN+Z/RS/7sRcgaLfQ5mSfs9LPGoCi
	 vPM4vhFFXeC8M7nXVU9B4MjLjYeGHAfKYQnO6smdbPjmkYCuGjUFt/pKVge2cCUI3e0Ji
	 WlOB37T+YxvKQkrA5eEm8TiuOgQZxP37epm8DNM9HZIJOT9yNktWIgFPs3ja1gGZ0P9y7
	 4KyYKtKFJvhAhaUdG6BFIQjgEjc2ejGxttx3M8e23qoYr/Ag9X73I5m2sEQW7r5yZ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404300;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y4gpNl/F4g8MqNcRxKUr6EkppEWS08hp4eUzFz257Wg=;
	b=Ipxr6bCOhsWx0P7PH6Qoj5GZ3eoHisS+L/r76sllpgvXBzAQp/DUWe7bdze7VYNB2tBY
	 ZYI3ZQw5q++lrO22SFrplCXrX6Q3J2QrMvuIiJ7Kv0N69vP8i3VKQPYsj2NOzM6MCKcDQ
	 VQMbJE92UABl/ZixRsmMvhCZsk3XnspHWsy4btHhrHeoebXls0IIkEXS48UEi9a+JXERE
	 JwXNkHR/0qdxh3Q8kqZAED6zc9fp6EjkAKLmP1x5EYFHECJTUDhF7N5XDcYIFxTyK3Txt
	 LeCIkmYpmQm1oPawZhvG1ISYpqDhSO0IB5ayV1dWE5IWspL3Ni69T3ZQ9l+15XHxmrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WXpgajDD;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F81606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F81606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WXpgajDD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tJ210l8N53qwzKcff1TWVBhMVy3G/e0ZEpZqauOTgio=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795404297; v=1; x=1796009097;
 b=WXpgajDDpkPWT4hK6JMHBEpDO73iQqjMVH8AVheeatJXUmH57hySzGuBheYhb+1XnJrVsrTU
 g7//hZ9mKYH3YjJcyrBvpTk+AbNHpi5GiMoN11+NFEmA82M5Azh8ZwPR0wsyVghceEKJv6VlBJ5
 9vk2RzV0XuEYBZXysLtkM1vc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7762aa3ab8bb87af;
	Mon, 23 Nov 2026 03:24:57 +0000
X-Mizu-Trace-ID: 7762aa3ab8bb87af
X-Migadu-Flow: FLOW_OUT
Message-ID: <4299d682-8f93-4351-a651-2e7fa51b64ed@linux.dev>
Date: Sun, 22 Nov 2026 19:24:50 -0800
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
Subject: Re: [PATCH rdma-next v2] RDMA/rxe: Mask the SQ producer index read
 from user space
To: Shuai Liu <847807867@qq.com>, linux-rdma@vger.kernel.org,
 "yanjun.zhu@linux.dev" <yanjun.zhu@linux.dev>
Cc: zyjzyj2000@gmail.com, jgg@ziepe.ca, leon@kernel.org,
 rpearsonhpe@gmail.com,
 syzbot+fef38133c495aeb48297@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
References: <tencent_5B9FB1BCC8EF36C5E2128B7D4D54B867480A@qq.com>
 <tencent_BEE58D9BBE7109C47C2796DDF5A4B958F609@qq.com>
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <tencent_BEE58D9BBE7109C47C2796DDF5A4B958F609@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/11/20 19:46, Shuai Liu 写道:
> The send queue producer index of a user space QP is stored in the
> queue buffer which is shared with and written by user space. The
> requester reads it without any validation in req_retry() and
> __req_next_wqe() and compares it against its own local index which
> is always masked.
>
> The requester stops processing WQEs when its local WQE index equals
> the producer index. If user space writes an out of range producer
> index into the queue buffer, that comparison can never become true.
> Once the QP is put into the error state, rxe_requester() then keeps
> flushing WQEs forever: the flush path advances the WQE index with the
> masked queue_next_index() but the producer index stays out of range,
> and each pass calls rxe_qp_error() which reschedules the send task,
> so the loop never converges. The send task holds a reference to the
> QP for as long as this lasts, so ib_destroy_qp() waits for the QP
> reference to drop until it times out after 50 seconds and the
> WARN_ON(!ret) fires in __rxe_cleanup():
>
>    WARNING: drivers/infiniband/sw/rxe/rxe_pool.c:212 at __rxe_cleanup
>    Call Trace:
>     __rxe_cleanup
>     rxe_destroy_qp
>     ...
>    rxe0: qp#17 rxe_destroy_qp: cleanup failed, err = -110
>
> Fix this by masking the producer index with q->index_mask when reading
> it in queue_get_producer() for QUEUE_TYPE_FROM_CLIENT. This restores
> what producer_index() did before commit ae6e843fe08d ("RDMA/rxe: Add memory
> barriers to kernel queues") replaced it with queue_get_producer() and
> dropped the mask, and keeps the requester, the completer and the queue
> helpers, which all compare the difference of the two indices modulo
> index_mask, consistent. rxe_qp_init_req() also initializes
> qp->req.wqe_index from this value so it gets validated as well.
>
> Masking the index in queue_get_producer() instead of checking it at
> the two requester call sites was suggested by the Sashiko AI review of
> v1 of this patch.
>
> Verified with the syzbot reproducer in QEMU: without this patch every
> destroy_qp hangs for 50 seconds and hits the WARNING above; with this
> patch the reproducer runs cleanly.
>
> Reported-by: syzbot+fef38133c495aeb48297@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fef38133c495aeb48297
> Fixes: ae6e843fe08d ("RDMA/rxe: Add memory barriers to kernel queues")
> Signed-off-by: Shuai Liu <847807867@qq.com>

Thanks a lot.

Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Zhu Yanjun

> ---
> Changes since v1:
> - Mask the producer index in queue_get_producer() for
>    QUEUE_TYPE_FROM_CLIENT instead of checking it at the two requester
>    call sites, as suggested by the Sashiko AI review of v1. This also
>    covers rxe_qp_init_req(), which initializes qp->req.wqe_index from
>    the same value, and keeps the requester, the completer and the queue
>    helpers consistent with each other.
> - Point Fixes at commit ae6e843fe08d, which dropped the mask that
>    producer_index() had, instead of commit 5bcf5a59c41e.
> - Reword the commit message: the flush loop never converges because
>    the WQE index is advanced with the masked queue_next_index() while
>    the producer index stays out of range; the req_retry() reset detail
>    in the v1 description was inaccurate.
> - Update the subject to describe the actual mechanism.
>
>   drivers/infiniband/sw/rxe/rxe_queue.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/infiniband/sw/rxe/rxe_queue.h b/drivers/infiniband/sw/rxe/rxe_queue.h
> index c711cb98b9496..fe65aecc60464 100644
> --- a/drivers/infiniband/sw/rxe/rxe_queue.h
> +++ b/drivers/infiniband/sw/rxe/rxe_queue.h
> @@ -106,6 +106,7 @@ static inline u32 queue_get_producer(const struct rxe_queue *q,
>   	case QUEUE_TYPE_FROM_CLIENT:
>   		/* used by rxe, client owns the index */
>   		prod = smp_load_acquire(&q->buf->producer_index);
> +		prod &= q->index_mask;
>   		break;
>   	case QUEUE_TYPE_TO_CLIENT:
>   		/* used by rxe which owns the index */

-- 
Best Regards,
Yanjun.Zhu

