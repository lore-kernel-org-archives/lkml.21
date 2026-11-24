Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795517756;
	b=yH8p5f6y/vTupOYvo9Cuq8slhSzNp3wcWo0g6M/+ii2Z7CfMFFmpuG24Z4dzqE+zbhrb
	 62ooFi9aBysNoVSa3yaC4BH7D5oAa2JyGkk9yO7A3U0Lx+dW6m6IhTI10KqfN0Bhh/2CH
	 m4aaSsb+BhqYaixnq0qUexYb53KlOwj0yQxxreOfoMtZNF6grQGlN/x/LlkyOBO9saQJE
	 gLUMTJbGZP8twP8km+GI6N2trXNZ/HQ7orfswo5sK73fXKqLwqXw7azUdmF6+/wiXxdRH
	 41ocAZBqFDBFuQa2QRViMEqUQzkVoj9DHgbXI69HES+bn1nnqYLYTNmaBzu/lXogD6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
	b=ui3bLDYAv9UbihRr/h2W30oDlezGrDU12cpK3stb2anAs8LWWo5p/krwMBDF71dVLdM0
	 0CihGAZBvR0pwTEOsZtQKsQOvgKIIOGb3Mb8d+rr0mbs6OjCwSmyDP4yGs417e8Uh/3QI
	 iLZxzgy4MYNMSr/hbCJz7dSKNLcQBlR55fDtAnhMuz55iHheGsukYuMZQiMeMY8vwJ60n
	 iOwq35Zos+ASa+MGG2q+4qfxTIgHC1z7jEVyREHZr1A38op7kbIc1kroFhhVRxzIh0s4v
	 Tnz5C85QLihzHADrCGqBomIXo2DmmQRbTK/33xt8F+cVcMRA8/t4HUTn1DAfigQRAIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Wip4E6dx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34F606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F34F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Wip4E6dx
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55c304f7031so57368951cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517754; cv=none;
        d=google.com; s=arc-20260327;
        b=Hscd1P3e05bEqcrfcvIKlZAFquzChYY8t2KBq/G1HZS8j0qN/ddtoD1/5XtyKUoBgU
         5duysEhpyO9+vC6I//oG4D0SJozuy9YdViaDpErgkKOtJWspWZqXmJ15rkol33xT0lpn
         ozptT33MhNKSa/0sRLw64gqhYISOaqr7NryEW9QLY//T72DxVfDTD/Js5y+1HKvH5Z1B
         2B+o8ZOShHbPTPvbwQYPjKafXRjtfMtgOXOXM3M26Kl8rTuh2bVaZMw9YqR5w57Xu+zf
         zL3UzzqMotzQnhYDSdJbMRFlSRoMOFMvOJWHRrWUcNnx7tg7ACfiRUCeuI0nGZrdxlCG
         QH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
        fh=uNru0qmPEKFftdMkbccx93cDF/hS1Nb2vymhTwxLGVs=;
        b=R2+MUo5OLUqaHeqYH2Gxy/NWnXdvMUzVwcTOkVGfKXc5VJQl909FKOYnV5NMb96+cV
         QwicqZ9HWtohhaTV6WC+IlrU2ZBTG0xKXLHZUg4wAgyLCxvZ1YJGzEc+zrtYbRQhJ7II
         B6vrrFFUCZmv+9z+1TFjgWdf9BQt494oxYJQqBGBIg9DW88LfyPlSDPMYYdATxJzDpWV
         HenLPY+ZvrNyc4tNlcvCpVzx+9vNx+l6SsCfaXaeRprncretm8uSi9y5Zuyyk9tGSXZH
         84WFxfZzVfi7DfW7wu2Ki+Obecxv8Qj5CWGYBPE2/b+YAwGRXkjmgfcOtqDH8x0+b0Fe
         ExMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795517754; x=1796122554; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
        b=Wip4E6dxiWFVbt1L04It971uqQTKbiSj9IOndK1OLhIEk0KTSTbb4/018jrBaQRk8S
         jfSQit1DJnLOimAHzQ2m5BCXPAin4CVW3H7X7RX1nMx2Sbrg8496nVO29xMFdR9MqOip
         QGLLxLoJKacfZI61yVwInyF6/zagKjAohFeWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517754; x=1796122554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
        b=Q4oIDKVyWLLYCfIS3UXfxHl3zC67fjafxMaV3YZZ+M3E72NMomWTy4ZgsBOc9VIjPe
         tLYQrELMHKT/5ny72dnYgakFH2vd4yfXGN0oLImvDc6Q0p8S9+tVm1165GePJH3prE6M
         wc/fp1F1MCCrkdZY7VxUvvOjvLTtg+8Nyx0EMp6ne+iyS7rrm8Vo1tc2Vzu3iE7ImxUA
         1t27ROITEek8lqUrUSWaSsapZoA6GlP6OzplXq7W9cUhv69si+3qS1lQWd66KrSZbsAk
         G60mU2cAA3zHJvOnBule1I7cvhuIM72dLH332EY2rSAJu83goCjBgypyLDo+nnt/tUJX
         RSqg==
X-Forwarded-Encrypted: i=1; AL+hErF0pCMts+NrnNWCvDnljifTu3gzLqnUDMEPd8apyqN7yGcJADQKGM9WAB/pyf3OLPJODBlRcgzKwoFYKMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qoAOUK+dMr9QWVBgYPLVxqKbL+wL8vnhQ9yZvUOSjjG6ZLl0b
	XOhpK87M6jnlUEh/i4uDCOJDMpANay9ggPC+jknUZKpkFTcDLbxJB/2FLstsUjt3IJO3DYig4KW
	1UWQoO9XHVq4wc7Fg/cCXG9VT0JI53kGpgZ3MbzMghg==
X-Gm-Gg: AZFdTZdqtnfMaj6aIIPknh6bE/MwZe4NcvOsnkb9qmPf4wLLiSYsR//nwVM4upYWeDD
	GItHpCahlaebZ9L2nrIpbcshpzlO2mPdzyVWILX0mSP8FWgcGZ4ZhXvrp7gbdRvNRDt5Ov8w96U
	cduCLXTyfRgtb0S8tp1zeoGsLv5n0W4U8IlwpwH7RbEjpd9b5RbYfVZ+2UqdUCiaTFKG6hruVWJ
	T4Ybe4vLCUH7AO8VPytfCFG3zdlZSDsByUmM0H1uLunuFg8Q11qKdbCgmTochRB7EtuhN6U0GVL
	MLhxn9qMPxuYVOO55Mb2AtOjDMPiCtNWmhCb93GPBp7Qa5B2OL1uLd+nHQ5aZgW2jniOuHm4jQY
	NPfYN7xV/9Dmq+Hl37acmdtJCDNnhTn1ubeo0TevLrAsZmNs8zSlWuapOkg0aICyFXQ==
X-Received: by 2002:ac8:5d04:0:b0:54f:50e7:6d69 with SMTP id
 d75a77b69052e-55d6fbfc728mr265521821cf.1.1795517753910; Tue, 24 Nov 2026
 02:55:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6c6cea56-1af2-4a37-b081-83244d5e09cd@kylinos.cn> <20261123063609.82014-1-q.h.hack.winter@gmail.com>
In-Reply-To: <20261123063609.82014-1-q.h.hack.winter@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 24 Nov 2026 11:55:42 +0100
X-Gm-Features: Aa3M54r7eAE856Qdq3AsqWMUaoTcqR2q2T6lCT40Ts3802VL14VNSmjueVArc1E
Message-ID: <CAJfpeguspTb0w7DK8-4ALHMcHbH0+Qs8nfh78mOJRwN3VQcAdg@mail.gmail.com>
Subject: Re: [PATCH v5] fuse: virtio-fs: fix lost wakeup on a full virtqueue
To: Qihang <q.h.hack.winter@gmail.com>
Cc: Li Wang <liwang@kylinos.cn>, German Maglione <gmaglione@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, virtio-fs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 07:36, Qihang <q.h.hack.winter@gmail.com> wrote:

> On -ENOSPC, add the request to queued_reqs before releasing fsvq->lock,
> as send_forget_request() does.  This prevents
> virtio_fs_requests_done_work() from checking queued_reqs between the
> failed submission and the insertion.  Both callers can then return
> immediately on -ENOSPC.

Applied, thanks.

Miklos
