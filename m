Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043422;
	b=gUtrMwP7952UrTrz93C/R49XFhC3Gi9tFQVXVErIfXFTbPQz0VJStjX+l6dx+Rs0HBDc
	 2g7nTa/iDYDRxWRolNvx6s4I3CED0KNI4tiCqR7g16kDSWIizsf1/MAxM/EqnJ6uCsZ+g
	 iDHrBzUY3/7RCJArimQ8BESYo+SOxMfnF/oCpA/N+Wv8V2XYckhndpiHXhMbVzb4SFNaG
	 Lk5XvXl2TXSSaS9gNm/iZxTeLW+0U0ZETnsZAHMnOPiT1ObJ7zmf6ef7v8pQh9VoiTRe4
	 nmuv+dRcbHA50uXOu4TGjqIWW56aH7VGG5XXLPQ7I7Kzg+/cpRMbEEvvb1zxCh8g++A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
	b=y6ib7RxwFnPQbHP8jBmV8WyNs+/0nlvj6VwVHj8Z0AOsBcToPFj+ly1SbwyPiQWvNLWG
	 ftTlWjqDMPbDJzBs2eV78RpMlqC9GLa35i1GtnE0nUqBhNcFpaqLdhnKQ6e36XnGzyegJ
	 W3mNNMqmekw/teO7kdkQdrZIJjiF4pTvH7jPOKd4mF7zsNW113ez6lLprVOPcx2GTxqEo
	 YxWWuXU5PTIijM3cmR5cAbsofa6idCBcj8U8y3CcT1H08h+Wm/jTJbyD/1Pm2pw7UiUFW
	 GSJgGDRhYJ4edJA8UYltWfHm+UOfGfhr8UIMZ3ngSDd5N9pqORhXseA9SbiU4QWWHbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3c790lN;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3384606A941
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3384606A941
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3c790lN
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d30c054dfso16908501cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043421; x=1795648221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=u3c790lNESfkSxN3vUZxQRKuXR8a5cILECSs7EkIcK99ceeCRYuvkXg2msD0CTAvdl
         z1cE+3EXT+QqQEjiBiPmSQnDBy2Nils6YIj9rFvkSOXhVFelkN1reL/3nMLD5SdBILA8
         +HiHz8MBI8OTC1hl7M9KRHTBAqjkXH2EfwdIQ1htAE+MBHjFMWIz0BIoevTMTrZNtlgc
         qz5OYLAmxn7JGc8Yw4T/42H2tuiEo8Qu8L/wTIfBaQx6V5ngrx6EEcHShbkpVeC77zde
         jVtTIB8y3GlQax60J9GDzHvjE71u9X8L/ryQ2UF4pFPVVmB2GeXHxCJ+qyHlN/GYui5L
         Gugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043421; x=1795648221;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=lsbVJGj3jiq2AU+gDUp5K89qOwmDBW+t+mjoBIytgISMzi0RbIixMrWIiPS3/FfFBE
         JA2NXpyNdW9lbVSBDxVgGdjBuB0qB2DbsepPRgGDCPQDyrHjJNyJAhRtcrClWjZHwOvE
         7FuO2wYDAl+xvnfF9BWP3CKYf7/8BT9fJyGLBT7ag7/W3TtIsnHzWI1psoM2TNnuvaas
         d4iqa2v8J30pTkcIDUUB3q9mGNA3gWXngzVVKywMxDDDxBg04isWO791Kbfg/JlE2kZA
         00c9N/3MEVrPQak2UOHfw1xR7fQH3dYUBZsitV4XIPF9qFcf2+/Ga4dX8ZvMw+iT8sKQ
         kA+w==
X-Forwarded-Encrypted: i=1; AL+hErEITEptbgB0KwUA6SU93iVJPIIZssVNDHJGWrbIKnKBM/tSySAPWxddT1nRhyTVaxA7GNECR6OceD9rpLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CRkmKerU8D6K/szZXEfdh+SBBI3Q1DTXJbffYj/B1zmZg7TvT
	q2z+qI2bISWmCV1Pdl505K4KxjHi2st8BYWeJV4pVD2WF3eb0u58IyMJ
X-Gm-Gg: AYBFou1zEFCE5qVnvEH8YqGmUCfyAcP0oqadeHo9aPHpP5pKPxsssxz6PI2QBBJlu/B
	dQXTXCbA3k6K9d/7yJlooubUaDoo75Uin+u79RJXT58bt8XwAiJhlqQ0SRKTC/jrNqL/GmXeIBP
	E7lfYmGrC/1j+QsUj0ModnsQionAfLb1+JvjU1IVoQ0ulV3e0HcTY+MynLbzjN5m5eWtVfWGSOG
	XZxOOmT9GSQLPOo+K6zetMG3GtoDqXRnO+FFRqGpQ2uqXg3XM0la4cAOS/xj5Vs+v2OK+eS9XvZ
	96Shvo8UliK3S6Ed5rU/DDkEjn6jVNZuxim6P6D/2dJBvumsU0CxaHq83riPByZAxxSuYRVp7tL
	Eu6l6Il43jjW8GLr/VeRy1ZWQPkCONkaSchdJCrqVTERNitEfTHcx0NN05IipOHdyjs68ueDgcQ
	vXqrydmVCAfhHkK0d+pXOMiA3EPO50As8ZaDXmz5Eai8S7cCCGjpA/tMXkyrNf4QywAQ6Jk8DOI
	o2GPYLcTDB9g4lmH+s3E7Sz9hVP+f91Xusu/qeiz/a9lGzjC79qne6yeZhNq27E333S7AAbHmMB
	CplnxTXsbwYyPyyonQW4MYZBa0I/izDP2MvpNRh5RyfZZZctzz0FWP0/513ua1M/QSn6i88bC9d
	YPp2TD/9Ge7M2DWbFi0V2Tyg0gZKUDtkVxtp7wcNVS0wbkKKU3Sm+dJZxvlQUIVc=
X-Received: by 2002:a05:622a:5c10:b0:55d:3201:3083 with SMTP id d75a77b69052e-55d5a57f044mr66912361cf.26.1795043420721;
        Wed, 18 Nov 2026 15:10:20 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b24b0asm10772451cf.9.2026.11.18.15.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:10:20 -0800 (PST)
Date: Wed, 18 Nov 2026 18:10:19 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 =?UTF-8?B?6Z+p5bCR6Ziz?= <shaoyanghan@deeproute.ai>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.342e1ca56d449@gmail.com>
In-Reply-To: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
References: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
Subject: Re: [PATCH net v6] af_packet: avoid waiting for TPACKET_V3 copies at
 retirement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jingxuan Xie wrote:
> TPACKET_V3 retires a full or expired block while holding
> sk_receive_queue.lock. prb_retire_current_block() takes
> blk_fill_in_prog_lock for write to wait for in-flight skb_copy_bits()
> before publishing the block.
> 
> On PREEMPT_RT a read lock can be held by a task that has been
> preempted or is running on another CPU. The packet path or the
> retirement timer then blocks on the write lock while holding
> sk_receive_queue.lock, and the receive path resumes only after the
> copy completes. This was observed as a receive stall of hundreds of
> milliseconds in a PREEMPT_RT deployment; manual inspection found the
> same unconditional write_lock() in both the full-block and the timer
> retirement paths.
> 
> Try to take the write lock without blocking on PREEMPT_RT. If a copy
> is still in progress, leave the current block and its metadata
> untouched:
> 
> - the retirement timer re-arms itself and retries after the configured
>   interval;
> 
> - packet allocation returns NULL, so tpacket_rcv() drops this capture
>   record and accounts it in tp_drops, while the original packet remains
>   in the network stack;
> 
> - a later packet can retire the block once the copier has finished.
> 
> Do not dispatch the next block while the current block is still open.
> The existing lock order and completion ordering are preserved, and no
> new state or worker is introduced. The trade-off is a higher capture
> drop rate while a copy is in progress; original traffic is unaffected.
> 
> Non-PREEMPT_RT kernels keep the unconditional write_lock(): there
> read_lock() disables preemption, so the writer only waits for the copy
> to finish, not for a scheduled-out task to run again.
> 
> The stall was reproduced on QEMU arm64 SMP PREEMPT_RT by delaying a
> copier after frame reservation: without this change the next sender
> blocks until the copier is released, with this change only that
> capture record is dropped.
> 
> Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>

Reviewed-by: Willem de Bruijn <willemb@google.com>
