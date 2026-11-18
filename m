Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966028;
	b=wO2cvLxZZw6kk+Zcuk/S0pZU26aZDI8zYYqRCQ/Icr09kT3LxEFfx7OgyyJBngp0aedj
	 ZLRzinQ/qKGqEMe1dxts2O4bazATcnacLHlPazUt3DwSKIstR2hxDJC36plBZ7Oma3kKW
	 pjobzepWDTn2k4/as4WYYh5OT/d+EroAPv+VjU+mPLzP/gmvqvpCNI8Z4uCTTYhdDHKEr
	 arXcPPrA8lIg50nsd4Cdf1v/AyRkEivUGzYFXQnJ7oSjwnqElkfltHZR9T85rf+S6uQoS
	 c2CoLy6CJixy2zl2zcIDGK8oJCKJonRDU+YfmiEtpOZwU3hkRwUJ9N+oE1aulkB5aDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SxcXbI9XhZfS1kfEzFct3yWAv0DYCjmun4csSwtv05Y=;
	b=3xK980ASa3O03WMPoThmWgQT7qv4TWaKipm/HHJV77IH8EhRCRxoc2KGo7IQ3/58oxZO
	 ReqDuIJMTELLKP7DgOOYA61E9Ukv5XgBgij6AuSZvGOUpV3XMkGuyM2A13EY6L0kcwVdR
	 yNs6Nt/rtV4vzjQROU6drCqxjML2wv9IgCMFKwh8sjZ9Mk6t9y3JL7bLgNA+hmALl7NMU
	 Y8imOqqUoIk/XIHLyVN3EpOTF2dK1v95GItXtKYW0ccecD1ETnwI8z+ZiGQfZLqpxRxyh
	 hUaZgHLyiBzutmcLV1BSbFXH6sUsHrv4xeXDo4kUXHysWvYFxfjE28MCFOGx/Z+kmvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XSsfJbCc;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CDA606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CDA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XSsfJbCc
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4b563403c7eso146085fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966027; x=1795570827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxcXbI9XhZfS1kfEzFct3yWAv0DYCjmun4csSwtv05Y=;
        b=XSsfJbCcEH1/iw8CNio1gQ1TmUe2a+ADtB4hc3Stqijr3FvkyQ6NXWq+WkEezOfKYr
         qbPteYsq4l6Ly/0hQiOBELltv8WvUY23G31u/owQayKRmatA7DpTMHDnazBKWk2arh+M
         j2UPI/cKyy+iCR7sQmgOqeUQ3wsJHMQIOXeGh/AbcuOqGI8mv/9Hp9WPgcTB+OqmgYu9
         LkOjny97Q7KsBrdTTeMbOAEOX2mXQanHE9HiL5IKR4D/XM0tHaGxYrRdx/vGDoBQqEcW
         2esoo2bnwZLX/OYw86udRrOfU/+P61WMHKCx+U1/LFPUpmGihIvJi8cg4bMV/jCVyazi
         /ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966027; x=1795570827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxcXbI9XhZfS1kfEzFct3yWAv0DYCjmun4csSwtv05Y=;
        b=l0UtHKQ7nmNdh3VNfNQ0FtaSnhNSojur4O381MDzSx3BqzWamqvIhnhTbO+gtzqPVd
         8mocGGBEzybLvbHkZ9Lp+zz8Wwqqm7ZYsHY1PpwjOUvZpR8G7Qmo7vHpkiMDciMYHfje
         eriV2mP4tE6x7J7Lz86C4x7qskDSjf88Wwp+2MsNJFud9x5ri8Qm5cjRlrxnqx1R3ddE
         ArpadozYG93DTXRqza7YncgtuZtfXmECDLiDz/MWg9DPOm78BPengTBsdmOd7rEieIPq
         wHUtiOQo4smSYDo5Gqg1rTDc56qqkD6/X8Hkqt9TTPnTKdQUQu4XoF3GiW1///dzJjpy
         WYxA==
X-Forwarded-Encrypted: i=1; AL+hErHXR4UWDFo/r8VhP7OqeLbagLofGoKPww2p3+mJfityPFDe//8Uvlp6membt54U2UCEz185XkK+fxYl2P4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zbcOkaOOh2sM0l4UW7HfeUoaohYxeZiAYPME1j9z6OlWnISE3
	l2uV2Es6E+iTSG9RI55zsXis1uHN4GpSFfdX/mlXqzd+XjWpnOCgmqQQ
X-Gm-Gg: AYBFou1WK+Uo7oIcraUY1FAgp/FXJCXYDZXN3CBcDtkS/66YmUV4SGEwFKczfQEs0iS
	xR/VvgWNt5vLTgAtfdXGZFmee8Nwq85n48YkRZlu+79flrcVzBTtp9o9lmkVtInvJqzzwiocyey
	PJL/WQ0WIDK/gY3qP1Q+ykjG58y6vZnCrI6FGzfjkzj/nOGdife45bO9AqrZEBPT6h93kBhft2Q
	by2vXdnDfpFpqB6O1RvydE5JCW+PoVksMZKQaiu4MfMqSnStArOj001eIuA7lZkapiGawUdaMl4
	v6w+soSRZh0ZQeR74t0vEZ6yN+Etov8R3tJ05o2mO65ivNWxRWqqmhfsIxooBOyY6An2AeenOfz
	dnPx+qc0qEkenwB+vOZDXnEpqpT94eDghFlb0J1u1QXSZjimv2z9MPVem6GdTM8Amre27E23a9A
	XxZ1ZjTXQKKTG0ba9Z9EbQrJarbQWubcHbZa61PaI+9uiKEv+WASXHLkg6wpxs2U61SMB1xYT9J
	s9UdrKsEZtBaa3Gw205I90dU+BuTGHSEAlHW9bydI9nTv7RexZz4H2EoUTwuOizMhMrvOMkZrqm
	wR790erDFi5hwYyfye3xl7gjKYYOsSq8UsAhvsKu/x8+x60BDnYwutOCrAH5JzBMHTucST4M80Q
	wo//UW/lM15TUhZWJsnvDVv4e9F7j2+u5H929+mmgVZlm0/LArirClQ==
X-Received: by 2002:a05:6870:a085:b0:494:9d42:1e26 with SMTP id 586e51a60fabf-4b76259ab67mr1083197fac.54.1794966026915;
        Tue, 17 Nov 2026 17:40:26 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b73f876f2bsm947039fac.2.2026.11.17.17.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:40:26 -0800 (PST)
Date: Tue, 17 Nov 2026 19:40:18 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "Martin K. Petersen" <mkp@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
	Mike Christie <michael.christie@oracle.com>,
	Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [PATCH RFC 00/18] scsi: target: Add target_core_uring, an
 io_uring based user backstore
Message-ID: <av0CAptnbIZP-53U@fedora-laptop>
References: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>
 <avprIhtn1TuYLX1b@fedora-laptop>
 <20261117024640.3184554-1-qiliang.yuan@linux.dev>
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
In-Reply-To: <20261117024640.3184554-1-qiliang.yuan@linux.dev>

On Mon, Nov 16, 2026 at 09:46:40PM -0500, Qiliang Yuan wrote:
> On Sun, Nov 15, 2026 at 08:32:02PM -0600, Ming Lei wrote:
> > This is ublk's uapi re-implemented inside LIO: FETCH/COMMIT_AND_FETCH
> > per tag, pread()/pwrite() with (qid, tag) in the offset, and buffer
> > registration via io_buffer_register_bvec().
> 
> Yes, the interface is modelled on ublk on purpose.
> 
> > 1) If LIO is required (vhost-scsi, FC, SRP, iSER), serve the device
> > with ublk and export it via target_core_iblock. Same per-queue
> > io_uring, same user copy and zero copy path, no new uapi. Please
> > benchmark that configuration, with UBLK_F_USER_COPY and with
> > UBLK_F_AUTO_BUF_REG, same 32 queues and threads.
> 
> Done, with kublk from selftests/ublk (loop target, -q 32 -d 128, "-u"
> and "--auto_zc") behind target_core_iblock, against this series with 32
> queues. Both serve the same 2 GiB file on tmpfs. Same VM (32 CPUs) and
> fio jobs as in the cover letter, three alternating runs, median.

Can you share your setup? It is supposed that you run fio from VM,
otherwise you can just compare ublk with scsi backed with tcmu.

But if you run fio from VM, I believe you can setup virtio-scsi backed by
ublk block device directly, which should cover your requirement, or maybe
I miss something?

...

> > 32 threads against one, over tcm_loop with data in memory, measures
> > only the hand-off. Please run a real fabric and explain the -13%
> > single job result.
> 
> Same fabrics, data in memory, TCM/USER against this series with one
> queue (one server thread) and with 32. Over iSCSI:
> 
>   workload               TCM/USER  1 queue          32 queues
>                            (MB/s)   (MB/s)  change     (MB/s)  change
>   4k randread, 1 job          138      157    +14%        155    +12%
>   4k randread, 4 jobs         538      679    +26%        685    +27%
>   4k randread, 16 jobs        720     1101    +53%       2631   +265%
>   4k randwrite, 16 jobs       859     1228    +43%       2161   +152%
>   1M read, 4 jobs             756      799     +6%        765     +1%
>   1M write, 4 jobs           2263     6075   +168%       5379   +138%
> 
> 1M reads over iSCSI are limited by the loopback TCP connection for
> every backend here (retransmits and zero window stalls), so that row
> says nothing about the backstores.
> 
> And through vhost-scsi:
> 
>   workload               TCM/USER  1 queue          32 queues
>                            (MB/s)   (MB/s)  change     (MB/s)  change
>   4k randread, 1 job          201      237    +18%        238    +18%
>   4k randread, 4 jobs        1095      902    -18%        843    -23%
>   4k randread, 16 jobs        957     1119    +17%       2865   +199%
>   4k randwrite, 16 jobs       749     1098    +47%       2599   +247%
>   1M read, 4 jobs            5373    15317   +185%      56532   +952%
>   1M write, 4 jobs           2064    10948   +430%      27074  +1212%

My question is actually why there is regression wrt. 4k randread:

 workload               TCM/USER (MB/s)   uring (MB/s)          change
  4k randread, 1 job      426 (409-463)      369 (366-384)         -13%

Maybe you can focus on single job perf only, which is easy to compare and
investigate.

> 
> On the single job over tcm_loop: one fio job submits from one CPU, so
> only one queue and one server thread are in use and it is one thread
> against one. The TCM/USER handler finds the data area in its mmap and
> takes a whole batch per wakeup, while the server here issues one
> pwrite() per read on top of the io_uring_enter(). Counted over the
> whole system during that job, that is 1.1 system calls and 0.27 context
> switches per I/O for TCM/USER against 2.2 and 0.39 for this series.
> 
> > 2) If the goal is iSCSI for userspace storage, keep the kernel out of
> > the data path entirely.
> 
> The goal is the fabrics LIO already has, vhost-scsi and tcm_loop as
> much as iSCSI, for setups that run TCM/USER today.

When userspace target becomes more efficient, I'd suggest you to think
about why these applications can't be improved or refactored for the
potential (bigger)perf requirement.



Thanks,
Ming
