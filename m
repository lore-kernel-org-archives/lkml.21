Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681308;
	b=HsHfw4yEjOm1srwt0HZIM92xTi/I5Ozv6k83t1N+fBhc/foDbs+QgyVB/10xMTSpF4XS
	 jzdmIhfFathP9L00WGABsJihm+QRRdOQ7w4vvvT1R9uywvfACfjO0I1tpF8r7TtXzpOqA
	 uL823kGIUF2wGmT3H7jNcCeISospeUU6KzY9FQ9ZdTT6gRw8ZaUV50Cptj2R52G4LOPLB
	 Q88yESdmy5uttXjW2Gl6CmtPCro6Pbhd6EhAm6c3afAfnQkq2CFfZuT1oocBTfMrpiOdl
	 3reylX3uaHr48FxlPUb56z6LXYHw18pYBcyAV/lfyStYhHZPbn1hHV38xpUn/Z1fStw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NZUUDlK21QbpfmhVJS4mqW4ooCEC0s8E+OILSSqFgxs=;
	b=mRfMF41ZVAMNO4ZYvtFSHFD35HNZxWwJinhqh+psMU+tF25teT33tQNlpOf2D1kRg6+2
	 PqO0+j3aNfa2AYXaUaCS1+/7MV/SOaD9CaecX/LARNwD62ECNLUnbjyMRPTXRLz6y1VRd
	 qy/kHlFKPZxyq2uZIRAxpiruW3dKfzlNZ0TGnlEKsM3jdb4Z+HUhMmqGtQ6/dLX7wxWQU
	 rrSjJuxb2bIDhBVu/fNfb4VtONnRpFr7wiKIpSrWm7UQs+ugXAJnKFvi44P+xGkfzcCKi
	 XyX8GzwvrmqiO8Jyn8MltQIJOwSZW3S1pPSkjYiY4LY1MYOMpakNWHpuABdSxo03MuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=clyso.com;
	spf=pass smtp.mailfrom=clyso.com;
	dkim=pass header.d=clyso.com header.i=@clyso.com header.a=rsa-sha256 header.s=google header.b=YwuZI6Zp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CB606A691
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0CB606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=clyso.com header.i=@clyso.com header.a=rsa-sha256 header.s=google header.b=YwuZI6Zp
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5118deebcfso998585466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795681305; cv=none;
        d=google.com; s=arc-20260327;
        b=DaW+KM+ALZhibr67azVsWpEFwxALpH3bn5/5t/x84OQMtgM1JT2vufsRc0GuWfsboD
         BIe60L3b8QmemIa/ehSzghHVU0p6TCffF6KFCPVjQ5fdjlnzzlIYxdrs6iMelP23EuOY
         jTAx9nStnWYTyoxVs14mKa3tv3STOlHWAKb+CSGeqQPXkh43zayTKoPojGPel27FG67O
         zblsKBLB8xQn14nsfNPadPv1vphahcbDCrZb8OhUFnhcLKSnThPj/hTZLbQjpF7hna2a
         hG+WHqXRr9N/+Jpvsrgyuv1MxHhT12VWCONG5md0HvfcGN+byW/RA0h/9PEiAoq91nrD
         FPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NZUUDlK21QbpfmhVJS4mqW4ooCEC0s8E+OILSSqFgxs=;
        fh=F3nCJto+rWOVQNevC8RDVoXic/7glq/l7UnAPlHkLE4=;
        b=PKZ9/kR2RRmhkdLT0NBIvwzrFA1fNMq16evn3h6rq9bV9w7N0+ncGb33n4OhfpV25v
         VqqIKxpQPdTPxbCpbl66em4IdLV0wtmnlsGUznFh6GdO2b9NrO9tSEDuMXBkauJfdvrK
         C1MpQ5BwvbH6jrbrbD2Q5X/d3j8lRx7WwUp9eokB6FkGuJGa4FGPyMFpqNkuUTXxZ0ic
         wu3qUPc3C/ExFKgMk2snLZECn55pBM3aHavDbkWrEitUnAMAU+SbuCbhIQCUyRWCKAVm
         4+T8QuZbHnlaWzA1fJ8wGw31qD+xtMDgDqilDNyX89cx4AxUtqDqeI5+HVVoIhhxTMgO
         /GFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1795681305; x=1796286105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZUUDlK21QbpfmhVJS4mqW4ooCEC0s8E+OILSSqFgxs=;
        b=YwuZI6ZpM919k6nH2v2fVUb3FDPQKFxhdDJI+1AxCwRcgaW9//87lnnbpPyKYBS+Af
         r357thmGpj33LeE6ujpc7Jjzzrw0fQV82HhOX1rWMBtsvQbkth5gncGqptf8PkMVzsTw
         IRVRiNJZigGHDTTj9EHYZCM/5a00PrxegsGtWSjxHrU3KytZQrneT1Hs68fIkfNxot4R
         pW7luhTKTUvAihxTMsSMIHK0jN69R/pyZWsOQsHLrtJ16OnBiXopb6Thlict3Jr4aBCk
         pB3AKHU9RNy2sLBQc0GPIXfbnHjYoyjcOCSNfYcMc1xYbzoeTCxnF9xlf7Dsh8LqoqlD
         D61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681305; x=1796286105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZUUDlK21QbpfmhVJS4mqW4ooCEC0s8E+OILSSqFgxs=;
        b=2WsKW/ot50G2KvDxFS3NMOckqZLC3sIeD0IFM49BnLT9oOi4xEhOSbmZsn4s/KqK+X
         VbN7DJVCrUvXVpDGLqgSpXlksyHRwkuerxTHkmZWc9AZl0IcWgeb6xyVCLzg6IIOlhYn
         6qIDw2VmJhJK8EEPk/LfHJ//Sj/P6WnbWWm/WfoDEtP0TRvq2KzKN3fvmJLg77tVCFRn
         WS7SP1YEzECqiugvDzYXNjWv3GNrPXHtHXSmuqYufi43lJBRQ6mV9uCFCflT2O8HiIXw
         SE3GfT5ap7EC00YopWW04R+uR+EM6LlQcLKRs97iPLs+/ptCFJanbcktpublHwapMf99
         UCdQ==
X-Forwarded-Encrypted: i=1; AL+hErHNrKmN+QJtWM3whJ/FUl/7jYyW+C+BncibhnWx2EkPivf5jf4R+AVkQP7F3QXxtydhVzjgEeN2ojLwOE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MgKqcLfOICHbwBf62RV5jHjOW3qECGx38ceohdAXSI0QQr9co
	/twI/dzOMXdOzMn4Il9s4gMIH0KPy8JgOKosP91bhwN+RqIF49qevc5XMfpo7pP9cjdyNlBddDx
	yNklJQ8Fex3ovnkVixlxfhW+aUdg6UB50PJ2Luq/wlNM6Xk4IUWVyiF2DVw==
X-Gm-Gg: AZFdTZfHu4512GrCd9PzXFkT5GRpaN82SEA/IeAfQcHUC98XVOJ3lE/mjvCP0JCFxUg
	UttcdGHjPVGRXMEzyEebJ8BBTO3lhN+nHvLTZo17utn5w7S1+2YnUNBd/cR7ocVOtf7PklsT/N/
	xluRqiBb7OH5dQ3HFlvtjVEQiPA1TZLGwN9rp7zD66iAOR7PpO1onHgQfvYKY4vOA2LCDFf1P70
	8CwGc5XYDXLXhfqk2Vl7YKGH5r1f6c7WWO7WWul4alLZOL9SaiY1fbvw6boWB8+KSTd5+esrKwC
	6VffKRdrxl5jNc6wFGf2kwZkKJPB320IwgAyng6BS1e+CKaA7x6hck4illdNfzBDtp1s/nk2zDm
	XKnI6rzYUiLgOordakGz2LhsWP9NUW3SvgaXz5B1wbGsMkmDkj3CucL4ES8oAijrLJ807
X-Received: by 2002:a17:906:3e1a:b0:c41:285a:46a9 with SMTP id
 a640c23a62f3a-c513ac9c0cemr1257993266b.46.1795681305384; Thu, 26 Nov 2026
 00:21:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-ceph-mdsc-mutex-optimization-v7-0-a4eee70e0038@clyso.com>
 <20261122183031.1299267-1-amarkuze@redhat.com>
In-Reply-To: <20261122183031.1299267-1-amarkuze@redhat.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Thu, 26 Nov 2026 10:21:34 +0200
X-Gm-Features: Aa3M54r-jUA4kRbzICmARrKNu4zgaRg9H00nhYxjp7KGsW56Rhnghts4qNSZFIg
Message-ID: <CAOJNxRJoSVBW25M5Pst7xxG5RYU1u6aXrH73FX91QXWGOLk6_g@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] ceph: reduce mdsc->mutex contention in the cephfs kclient
To: Alex Markuze <amarkuze@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

Thanks, both races are real.  I reproduced each on v7 (the replay
kworker hangs in wait_on_bit() holding s_mutex; the async create's
touch waits on its own CEPH_DENTRY_ASYNC_CREATE_BIT).

I will post v8 after the perf runs.

Thanks,
Xiubo

On Sun, 22 Nov 2026 at 19:30, Alex Markuze <amarkuze@redhat.com> wrote:
>
> Hi Xiubo,
>
> Thanks for updating the replay path and snapshotting the send counters.
> I think two progress races remain:
>
> 1. Replay can miss a wake if dispatch ownership is taken again. Replay
>    selects an in-flight request for session A as busy and drops
>    mdsc->mutex. An already-dispatched forward sets RESEND, and replay
>    sets REPLAY_WAIT. The original sender can then clear DISPATCHING,
>    consume REPLAY_WAIT and wake the waiter, before restarting on an open
>    session B and reclaiming DISPATCHING. If replay enters wait_on_bit()
>    after that reclaim, the second release will not wake it because
>    REPLAY_WAIT is already clear. Replay stays blocked while holding A's
>    s_mutex.
>
> 2. A fast forward of an async create can make the submitting thread wait
>    for itself. If the forward arrives during the first send, the sender
>    consumes RESEND and restarts in ceph_mdsc_submit_request(). With an
>    already open or hung destination session, it sees the nonzero forward
>    count and waits on CEPH_DENTRY_ASYNC_CREATE_BIT. That bit is cleared
>    by ceph_finish_async_create(), which the same thread cannot reach
>    until ceph_mdsc_submit_request() returns.
>
> Could the replay waiter remain wakeable across a new dispatch claim, and
> could the async-create retry avoid waiting in the submitting thread before
> it has finished the local create?
>
> Thanks,
> Alex
>
