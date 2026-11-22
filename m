Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372239;
	b=kFSfOlKJTb1yjGsff//I9EPQNswhQ8U4oDz5aLOrfG2B8pT7wMPgQEPu4U4pSz+qEyJc
	 /zKjvqw9UBkvtMvsn7hmisODRtaSpfGVDR3DDgoqfYdBoZq4Ttl020rMLPoLAK7KLJB7k
	 myGXRJnHD5+4d4gwK9SB0NW3xDm/6Ol1O7uPrYgibzh/wHS7TYZ5+7NTQk9afbuZSOjc9
	 75PYSAxYONOiKWNxck1PdUQEfylIdgj/GN7bAo+QkgoKK7CLfbWYWjndtbo77VLq7uGu8
	 6g9tZvqEjCyr3T/Ms8JlEInyEjc9U1ndLgYvLARknj6vekAmZ+LAZ7r8BJZmIW7a8TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372239;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pA7ffUez8uXJBnmDtqlufiiusKMTxEu5kSaIrJvopak=;
	b=ci6+viNzUzsaj/dUBfn7Ohtx+uN6MN5+EEi0aFVfi6VdQbRbb0oehRLatK0Q4LlL4ttx
	 suejKtMrnyy3LP1faMHWTqTc1Ue9lJ2XSpXJEzdIbGI/SH/y2RvDkRc3vQYo3Jhiq6LIB
	 Z4nF2Rly8VFt/ggpPpa7KAk/vI8nfpx+TvgYiX5ibY013bNxEcbgKBn/+kO0+zPcc0XTj
	 YE/1dOwByt0SriF78YtJFEMOiuiBnYdkD3Rl/zd4c+x1hBUGTwLzKURyrPCAQ1K3jhuOK
	 mxISfnS+TwgyUitMjwB+e1Qb+4kR7pEs3rdyCZAoLvZ/1qWvJANVVnmhZLrHHJRhfaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c2BuQPRV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zp54qHa2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC82606A337
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC82606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c2BuQPRV;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zp54qHa2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795372237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA7ffUez8uXJBnmDtqlufiiusKMTxEu5kSaIrJvopak=;
	b=c2BuQPRV56VIcfg9FzQNqGsp7idWQZjM6U/Ouipd4IqSjk47IO236z9gSpY2fQpADgpOMY
	j4kN8/N0a+/rI1H2cxB5ipyuWo6VYeGweVlASwCuWa/3HSCHyjaz8WdK3E6/GS2c83q833
	U8iR9mom5MI3XzNjDA8stlILLg7VVBY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-b4a5gGeQNxesgOLfupqj6w-1; Sun, 22 Nov 2026 18:30:35 +0000
X-MC-Unique: b4a5gGeQNxesgOLfupqj6w-1
X-Mimecast-MFC-AGG-ID: b4a5gGeQNxesgOLfupqj6w_1795372234
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c504b52eed3so247804866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795372234; x=1795977034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA7ffUez8uXJBnmDtqlufiiusKMTxEu5kSaIrJvopak=;
        b=Zp54qHa2XbSNpYmpVS2e/ScVbRbv9eXZOjRnALT7+1QOrN+2khsNe9O+smjrq+3aSu
         f9BlpqYoDfj37FrDZEiOcB2r83rRvYCj1MT8ciGZuA8KW72X8ykNnx6TNuu5nY58b3Tl
         Ek5yqK1owtD6/Wa3g2sl3SCC3V8GfO5YAWMzef8QNryX/cSyprruWcXOCw3EsIwrPirQ
         Bn2pyezHaHDIdn9YeSnfdFsDsEKrsrj+KFX6ojmc5/zJcV8QfwYD6Nb7PGpXRL1lH8gA
         QQvqlNvMASfg1tcse5r2iPU8ZUEbFFU+QYWbJAokZX9euj7klDhBT0MtG36gclzADYep
         H4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372234; x=1795977034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pA7ffUez8uXJBnmDtqlufiiusKMTxEu5kSaIrJvopak=;
        b=acEd1TfZubWXQnYTCiKCFwhjehEgEcmrXuWXjZCThfkYMZ/eko7QHqbKwNdeKjohvy
         ZLrBYmp97v/aj2nvmzsrXyxkHw6RDpmp+AApgn8eQD4kCelwP8bSTrALeeuwoCNhg6I3
         Sd2JSfDFe1tVSWk/S7buHzH/+YQSCRhIgeiWO38muH5q8JgW1gRe3EJ7A6sjhFqz0dhT
         r4l5ADLHeXUIi2lfnK7QfhxKmdSODhRXGaCJ3y8bTQI8DYZjUJbCz6crsWh3LJj78YwH
         la/bAz/AW8U5VsDqjD4JUnLIGyUkoMH9HSGzdizhcScJTWVLfM/LHVedBW3JfRhGZc8U
         62zw==
X-Forwarded-Encrypted: i=1; AL+hErHPzB3OhlLxiGbMnQ5CSoGVluscbpHOUqgsq68aVEby2HlbLLqCz4CBLlkP+7Z4reAsJn7jnaeG04wjV7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hgl9oRfQGPdbkXAml/op2RWPPaspw2fWt6XjfNwarIDE9upvM
	0W4kMuCqyrCUAEkVrYRNHET6+wVmWcsCNKUNV3t2OvWjmYiu4njbte2BrXLGvX8TH47zpQ/+XT3
	fihHp9NRBB8Y94wDb0T/7jIS2S34QA2YHRsFUGyHNFSDwLDSCETFb3v3LOl05FTxS9ZyAMgsA+a
	cU
X-Gm-Gg: AZFdTZeBax0Gvbzb+IqDEEovGJTVyUdxNQBbM7fw0FtXWeSEh2AHbP/G4DkOXoGUSW3
	Ppit/QdykdBu3nYIe984RkPga7NaLnI5jF2QhoEPiFFjNadZSsjSJVx+/DTELL19Hk/TtmGGK0n
	WzkZwLL6sgbA/OVAvd1sCkeneuHFW17/DyU2jGUnBLDrm46fEihXh7TaO6EewQa7+hJVLp9Gkzo
	rz7LH0GaUSc3/vWAVyo/ZAl8QL3wLZSU5RwcCcZkDB6HUw5EvTWU8+zsHGmgzk9xVB8h9JaEClR
	TVl8irRcrwbDfZq+8KJFK6MkWp00eDc6MHBJya8vYgsCuXQ/8TgG3l5xxYA3qOuOVvKctqUak9F
	epI7RlCFl8IpOuLAlDMJN4mipaOjNexCUGtUbe5oed/b5vm54cJt2eiBlNyJ8AjUK1mim1ah4+j
	oWiiQlrsedrBAUOep1vjU2diCdmgNCyAvtMG7AhF09Oi5+rdAQD/7mDTZjkSe+atQFLZuLN2Gnm
	emV0Poc7OqBtdoq/91bcdQ+ZE9tGpGPlZPb9cbbrX0mVVvzZmVO
X-Received: by 2002:a17:906:b7d2:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c513a82d478mr561179466b.22.1795372234417;
        Sun, 22 Nov 2026 10:30:34 -0800 (PST)
X-Received: by 2002:a17:906:b7d2:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c513a82d478mr561178766b.22.1795372234058;
        Sun, 22 Nov 2026 10:30:34 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea5b9dsm331447966b.47.2026.11.22.10.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:30:33 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Xiubo Li <xiubo.li@clyso.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] ceph: reduce mdsc->mutex contention in the cephfs kclient
Date: Sun, 22 Nov 2026 18:30:31 +0000
Message-Id: <20261122183031.1299267-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120-ceph-mdsc-mutex-optimization-v7-0-a4eee70e0038@clyso.com>
References: <20261120-ceph-mdsc-mutex-optimization-v7-0-a4eee70e0038@clyso.com>
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

Hi Xiubo,

Thanks for updating the replay path and snapshotting the send counters.
I think two progress races remain:

1. Replay can miss a wake if dispatch ownership is taken again. Replay
   selects an in-flight request for session A as busy and drops
   mdsc->mutex. An already-dispatched forward sets RESEND, and replay
   sets REPLAY_WAIT. The original sender can then clear DISPATCHING,
   consume REPLAY_WAIT and wake the waiter, before restarting on an open
   session B and reclaiming DISPATCHING. If replay enters wait_on_bit()
   after that reclaim, the second release will not wake it because
   REPLAY_WAIT is already clear. Replay stays blocked while holding A's
   s_mutex.

2. A fast forward of an async create can make the submitting thread wait
   for itself. If the forward arrives during the first send, the sender
   consumes RESEND and restarts in ceph_mdsc_submit_request(). With an
   already open or hung destination session, it sees the nonzero forward
   count and waits on CEPH_DENTRY_ASYNC_CREATE_BIT. That bit is cleared
   by ceph_finish_async_create(), which the same thread cannot reach
   until ceph_mdsc_submit_request() returns.

Could the replay waiter remain wakeable across a new dispatch claim, and
could the async-create retry avoid waiting in the submitting thread before
it has finished the local create?

Thanks,
Alex

