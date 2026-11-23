Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795411393;
	b=jFem3h0oaHpa3VMexO+wmR5/bqR5OldHyso0JYejs36v8VQXinP186Fh83bDZsVcBXBC
	 1Ovk9eGCo0TfJ2PZzMXgtV4HYbfmX3+iWBg5T8o8I0f3epQpEj6KoeoujN4hiKegVDugT
	 DjX5cqxfRywbjwMGsqFIJVot8HRIpXsqI2sZXY6jd45/F8dILXHikhQYnMREfhyBBQ0Fu
	 S7m9/RnPZc6GgSwFPIe7efGn9ToLFov9TKfhTlCLwzTGIsMckhrZIbTN2eWGVZQ43ehOM
	 aqG2ayFhKbg8mWFPII2IcyT5kCMBNuqteHin5lEpnA5/EF4iIzZr1lL119TZQ3sphVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
	b=U/v/7YzeqCE80K42H7pIZQCw5xv0kM+R7i9yOoI69Vp+aoFI5dNlBbr5wxBK+pEkdnyG
	 WFDE6SLwu3oZoG8Lcxl/lr8xsw41qNdOmqSxcsWoZLJchVhHahbXg2P6SUNaItPXDguWY
	 534qL3SXfh36sX0pl665Hdh2r0dD5/tiFPFvdlq7dzabvpJfSGHun9LPaKnaQP7a7hKL5
	 YNsYxxe6ysYmxwnccpLw7AsAj36GFoppUhrrfUbtwV0zjKeiPrGIdTnRQ9iH9wUKr9DaB
	 hvQtAlFy+44BQ52iDxYg1CYCWtTojDQQLhmz/k8sbZfxYwwuT+iUlspPfUjorPJF57A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwj+h2QP;
	arc=fail smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwj+h2QP
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acd239776cso23995401fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795411391; cv=none;
        d=google.com; s=arc-20260327;
        b=JLzoJlbG8Hh5Dn/EqQaGaZkHe8yXGp97qSiu53cnAYVxmccM8qVuBcLx01FKecEqYN
         1YgQsfsNc11vUKoEf5YBeKDPALWbqWS829uxiMaHPwVHct+GtavQRohijeMRQWxdOst9
         whMJvhJMgay5B8qNvpyk94jO6xkidHovOjDIwhyfkJzCn2ztG+O/KlwR8dIXGoaz168o
         XMQSV6mxQ5VIBZyJF3uQD6mmkeQgJSaeB1TGKvWkIoQZ4MvV6hm32w6Z/l8Ua/LXxLed
         /APAHhikGGI9HN+DqML3BHg1YNqVMje0gcPhNWpAK3XKwFoDsG3Clt1kE5pK4AjU8BpS
         NKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
        fh=XWPvn4cFsSv/Ir/rltVZ8vbZWEUqBuV+rSqM+Rh8e3A=;
        b=JHQFgPpdx1zVgLvBF8OCATiPuZLCvJgEUBj/4qIJ/b3Ee6/1MJ/zopja/kzdqBy8RN
         KEmKGj6CFolbymlfGfKuPzGqNmkSyKeDDk1kp50hEJqJ2oLxgtlqfVYTikmcnhi7u6Tv
         SHioopsjqSb+huFjr2ne9LR4QGbm/FBhiGsNxo3V9sBeHzLWAlWV7cluMF9PrnovfxEB
         M3X14agNKONGA2HKCdf0itHsj/0wRAssnK8JczV5Z12cDVwagHW16ODie4PVBAyx3SS6
         Ut05M6Y6iAhOgrhRmK55eAtvTdW7htIzegHfIjenz/oxnxVdsLoq8OSitR2dAgIy8b19
         WiZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411391; x=1796016191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
        b=Mwj+h2QPeqw6v8be7H58zceYRBdzZKvfvq6oyrHUkdqisW9TaJtZ0tgOg8vu8BUm+U
         UGIgY+DOf/aBCpAuS7FdqHskAk5H7OoxMjs0C09FknECuTQpq94Vd5xm2Ym1rmF7rCbn
         GNCHoF1hhDNLi4QT8By+TMCzderkFrpAUFR0LoI6wO8XBa7XsXwnhZ0zp7y/qUmu8GWN
         6fMXid99IZUF7kVzgl7PkDVjCS0IDGbU+kdw/mwgLopOuFk1nIpQPLh4b0LOPHcZVJXC
         VqObrIJYOOnc4980Dbz+DGtQ6h0LLXjARtrDzNddjPsUfP59MXLzpLp9r3SpjWB8jvPC
         plpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411391; x=1796016191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zj1KMJVaKNaumg9rUcx+XITIlfu/2H9J2RhD6HuzcNQ=;
        b=Egd1otGjNI1tvE0PJnfexL/UwsgZmitG4AGrCTV1R8ksV4D58eCjL03i3+g1uFPZ88
         lJ2WGC3J5QyNuifUWLDLO9DZjL96MIWH0W/XqjlQ++4KLaLmA+j1qSx6nKMLtoeRjkyB
         pEbMT28NIpxym5UTcVAJk0udUs4pgh8s1tEaDhGJ4AqfaS4+URTQ73tCE0RD10LqCUa/
         T+HW6IiUYTg0hlsPVaDVhy08gvEUPH7jSrSE7G+PPQRnoFghbsqkKamTqo18hRcvKdBX
         KCDKJywCcc9TdyhrIlcsnJD8e0wysoIkgfwC0VtKY1FfmEllXSI0e8IK7l9Mxh7YHXkJ
         SX1Q==
X-Forwarded-Encrypted: i=1; AL+hErH0+kvzX3E0OGdvCA0ejGnv7izDCF/DXwBAHe1YumQMfItByPxMXeAKDwMMHsluj7Yrt+Jo0oWuyWE4pwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zyZTckjhehBZnNeeAXws236l94mUtkwjYRxpXAC4uBGT3yTQL
	48/HCWPwBM3GBJJz3+Q7r5DfUGbr4GCeK1Xipxapt0+o2/B3aIsXDim+Y52SvKpvKyc5wOWi7Uh
	aXkwTNDM1SRG34EkvAssxd6zK3QE7nkg=
X-Gm-Gg: AZFdTZdcQm9wbMVyNLxelH0MuzAHPqlHU18RlOxnsHfxF1NDxEgFkJPRNB+IjQDVkbq
	gEbnRf1iRpcM/liC/nHkI1QfTvkxIG7xXVJUkkhV781PugymL0tf9U2wL99k+e6iCzA4vdBzhel
	S9Ca1VJuCWBTxMxHvFI/szaODnlXxH+LgDFsyfB1kL3AFSTjIyJ3cagc9qiVQCbtiHuvIQXleiM
	ReqHKyudYX1PNGNF4fHqBKAuyn/bWuo6I2o2Q24i6r+HTR2t0rLeonSkx74QkGpcluM/UcA1zti
	HZk+ky8qFQrlZPe6LmTYrTW8Zewb7nByEL5aUruN5Oy4t3mY0tZ0YPgvEqQG76uFFmETrQybSw0
	5ebW71x96HMlkKk/yP3zWXEYUy9J2in0StKjZmeenMcNzkJ9D8xK5P+/Q0ow=
X-Received: by 2002:a05:651c:4186:b0:3ac:efb1:6def with SMTP id
 38308e7fff4ca-3ae7f9f7df0mr23250971fa.12.1795411390729; Sun, 22 Nov 2026
 21:23:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106054811.281798-2-oss.patchbox@gmail.com> <add2bfe5-0d8a-4b64-a8dd-5e02be00e425@oracle.com>
In-Reply-To: <add2bfe5-0d8a-4b64-a8dd-5e02be00e425@oracle.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 23 Nov 2026 00:22:57 -0500
X-Gm-Features: Aa3M54o18bPzB_y6cN5ZyBXSDft40ObSb8CAiNsU_ZagFcTkH4vNqu9TTbhSp9U
Message-ID: <CAGG=RgDLSueREjeeyw09oo8ttLHN2VYUC0qEDv+HYFUrSo0LdA@mail.gmail.com>
Subject: Re: [PATCH v1] vhost-scsi: do not validate vrings during endpoint teardown
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review!

On Sun, 8 Nov 2026 at 14:05, Mike Christie <michael.christie@oracle.com> wrote:
>
> Can you describe the bug a little more?
>
> If we have done vhost_scsi_set_endpoint successfully, are you saying a later
> call to vhost_scsi_clear_endpoint could fail the. vhost_vq_access_ok check
> and not teardown the endpoint?

Yes, the first case is what I meant. Sorry for not explaining the
failure path in the commit message.

Since a543346b96a1 ("vhost-scsi: reject delayed virtqueue setup"), I/O
virtqueues that are not configured when SET_ENDPOINT is called remain
without a backend.

VHOST_SET_LOG_BASE validates the new log base only for virtqueues with
a backend. Therefore, an invalid log base can be stored in an inactive
virtqueue even when the ioctl returns -EFAULT. A subsequent
CLEAR_ENDPOINT then fails vhost_vq_access_ok() and skips teardown.

I reproduced this on current mainline (8dac6df92a2e) with KASAN, with
the following sequence:

  VHOST_SET_OWNER
  VHOST_SET_FEATURES(VHOST_F_LOG_ALL)
  VHOST_SET_MEM_TABLE
  Set up vq 0, 1, and 2 only
  VHOST_SCSI_SET_ENDPOINT             -> 0
  VHOST_SET_LOG_BASE(kernel address)  -> -EFAULT
  VHOST_SCSI_CLEAR_ENDPOINT           -> -EFAULT
  close()

After close(), tpg->vhost_scsi still points to the freed vs. Linking
another LUN triggers a KASAN use-after-free in vhost_scsi_do_plug().

I also reproduced the in-flight command UAF described in the commit
message. A delayed READ completion after close() triggers KASAN in
vhost_scsi_release_cmd(). The READ has to be queued after the
VHOST_SET_LOG_BASE call, because device ioctls flush in-flight
commands.

With the patch applied, both reproductions complete without KASAN
reports, and endpoint teardown succeeds.

Without a successful SET_ENDPOINT, no command can start, so the second
scenario you mentioned is not what I meant.

I can share the reproducer and full KASAN reports if useful. I'll
include the failure sequence in v2.

Thanks
