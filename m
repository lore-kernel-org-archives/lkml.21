Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697002;
	b=SJ8aqOqvSnAgDeLC6K/TnB6yD1kMEDi+WLjNFjwjNdisU4M3/odOXuk8oPXhcfkAweQh
	 E2u7bBuWSZorS+K46xgNGZ2VvYy5Bew7aVEIjc3G7i7JaArkwmimQ3S48bfBE3VqGY22R
	 DHEYQRjwMrZtpQdX/gKRKZfGvJho+ATnkYaFk1/uGwYS+reEm3LsQabx+vv0b0jscRizD
	 6DL+yiXm11XyWPeOAcO7REok5GvJhTnD/EyTggw9MXqKSDqtkSI3mDXUSPajiVyVy9txy
	 bzM5VY7OClojoar084IB1TZm4fgr3NDkHtsjLlKvplk/pJiCimi7ZCYz386OusHcOlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
	b=zTfAEB7r1lOoKaHQLR/Dug+KPYgMUggRacmfTMwHeIrCw5vagvzX9LnBtx4eFZPSVtRe
	 P6lXKF44nZhcwjL+pkuuRN3GQeT5oncRsGf7mok65my6IhUbGX14SalTSwmzMo0E4Vw5e
	 0GVCjuqeMWX6E7eavq5jvXKC7ucl6L0OQiEsKpduFeXKtaEeTia7tNlTCPenCrS3uIZOP
	 DbxeRHaRcTUFKM4fRk3ogn4BiwMIcbL21mqQMRxG1hEGTuD1xdeQiek8c4AgRClMwOJrm
	 8rSMxKksGPFxf/K7ZtF76WvpYArTdGcUnz7woFH59jFBDLoZHXhQ35/mGkzUKyySKRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O1Hx2dsu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D85B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O1Hx2dsu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso6061222f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697000; cv=none;
        d=google.com; s=arc-20260327;
        b=OSshsxOL8BpZMfYrBUPVMsx2sQo5q+QFv8ht7m/13mU95DbNihZ/0nfUe0nEuoaY5U
         Hn79KpdAe0Oofn1i7691fSic3MPu1RgqlkM7fVRJCy8XhvCzX7XZ5h6U33WIy++5esG5
         w9E7rZqGKd70o92qN7Q6pBntwvPM0EnBqG1CF4dMMQfQsUpVw+pyf/DsBptk2xHmtwSa
         VM6wytMLYcbvJ5M9jQ2sqBEDHJcxsWKcKdMqY8Uz8nk8+eX8NOBHGWZKoz5Vws5IaZna
         Tlh032AQzxUXnAOPzxhcQsn0TsnuaCAUzMWCaJUZRlN40FcYe6DL9e2iyQv5LrzQiS5f
         63Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        fh=M2W2/r/2+/LZ+pOY/jdW/hHrV6IRP7Bmp74OZS2BcB4=;
        b=ntvMOa7qNZcu3tOn/Px3URDQtwGwuJFu24jvk+AQ15n6OCCPWxcILEfns7UKUt/yo1
         2z80AtYH8U6q2sdKwziQ+oHpoxqYl9+gfrmHLOiO/BPNrzEBJdpieDYrtX+nDlR2FxFQ
         TqyNtBOnAauiQo0QY0P7qhMSmhDBdZJ3ml79tvzist+SrqLGu36pqJvfLdyU+tfIsyDl
         WgvLKXQGcHVgbzX6fQvNI88IEcZ+O49VZac5xSRLs+r54Qen3ErP3l7pGF12XpWheahZ
         k3qmtfdxl6gxWGzqzDLX2lU/bQBaZPa/VEkU6W0XS0yIdveFsxgajHdebSO06PD2hGG8
         q+/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795697000; x=1796301800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        b=O1Hx2dsuq10/oTIOFgdevzB1nCddtbfQ2o7VJksECNBoidtdLwaAR/syeHDZWp1w9/
         03KKURVL8fYcZo2CvY+L6Ogs5vAepAUn+WL8hKy6Hy/9xbM/JyLeHHmVIax8uiE9UINa
         GU0jwSZrg8cFzjLi9wo4y4gXbYsn3JXaX8Y1OPfjTTxtghFe176ExLWZbTggHc1oNuPY
         /8tsPOHhoyrfvDBhf7X87GtDcyfc0Z0yUB5+yZ1nv0BIeyMUHSGIIUfw6/MMkbFoMtLT
         vQMKU2ToW4NfSs9XP2lrrRlv5nwaSf72+WMH6R8CantHxXBQeQXVaY/eQQpfDolkFw97
         xlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697000; x=1796301800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        b=iwdYQlBbwY62/xSK8GYgqRcLT8YYmJb0+Lh8ZTviPRvKf/AuI9cQfycPgyBBqOBVLH
         NQXqVkgAFJYRQ/+Y2APsOoKMg/+wxNqbODn5wTka641r3YXNiGCYqumwDBnw9zgdu1yi
         mP+PBDs77Kd9BPvzaYhFdW9eXh0s1Ilb7nI2KIvTTNN2SImF9t9Qc8lahI8AFIskV7Ed
         H8CP+M6+zT/qKD/SvmXcGlGSmIIwzS7Acu0j/mji101LycSM3/jvNGo3xvNMHTSiiIJU
         3a/toWZTLaMsqPYh6hRsaGJOz2sr3C3ZnciGeTahrKrGttZE7/uj7AEdq2/NvkKj+unJ
         1BMg==
X-Forwarded-Encrypted: i=1; AL+hErEsEdPU6CJ/Z8/kk5cDR2RyhDy0XFoKd7jgjRSAUUTKqPRaL+ysF4eS5IcvBgmzoK4FEk9E9q1Z/K8ogak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a5Wb6x1I5MUZ8lvlpdATQ+PgVy6tnjeSntTZpJgHxcfDDxEt+
	dA5G26kCQK/AhF9xtzbFq06eUlaovKbckkAKc5Aq510j83fEo6i1KJiOXBspC7CPcU2GnYhz11K
	brqCybs+qI6qZ/r0sjMLQP1OrliAvtgmqYdfW43Jo
X-Gm-Gg: AZFdTZd1Gnfjm9cHrdff8DC3ygtShzni4AqiGYx41+oFqkPmr6Fj7xT4QCMhYAmGm1v
	H0eobfngLQuJW6LtXzK0gmXQrBaphsPqjZ5480Drth6eiZBGfSPK/y2yrg4LByYtgHJLu6vqi/O
	+nHKxjdRjvuzHaPEcszvdrY2m/jt7Pbp37/1gCx10Q1WziS+0BEDdKa9vOktX14GYRqb37vGu40
	QqOhfcgII3a3EWPKxpmQcr5AaQmnTI9+ZbVcWFqnWO2yp9nuHG/G5LMPdwEo8B7aBYqUsvYFauT
	6Smwc+3EJlezF4uGZDeYPItd++8CqO0iV+q+mXJSHZBr3+27GV3WY0Uo6JNrQ3YKZ1e9WhLu4mU
	YtxHl0nX/Ff719fT8KdNiCkF2hfAkNw4uC3lVK/ZsCqu3jm7pbGN/Le50/tycKfAbLBCQ6FEZLA
	39bccG20h8M36+SJ/jG2+p4JYlhpzWj6wWf4tI0R/3gt/i
X-Received: by 2002:adf:e00f:0:10b0:491:d224:aa78 with SMTP id
 ffacd0b85a97d-4abb27275e7mr29748444f8f.26.1795697000100; Thu, 26 Nov 2026
 04:43:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
 <20261125181752.2027207-1-aliceryhl@google.com> <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
In-Reply-To: <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 12:43:07 +0000
X-Gm-Features: Aa3M54p00DMhUzh_tewZfWZ2hi0LG_ZMSKy1ua0nr0PKeO0HqjITQRZNecEPYTM
Message-ID: <CAH5fLgjvFXX6oZRkH9OFCun4eNGWKkmoeCfVK3_16Yc75dfRkw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:22=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 25, 2026 at 06:17:52PM +0000, Alice Ryhl wrote:
> > What I'd say is that this isn't the only way to spawn work on the
> > workqueue. This utility is intended for use-cases where it's convenient
> > to do it like that (e.g. because the queue is defined before the work
> > item in the same struct). We already have another way of spawning work
> > that uses different ownership rules (e.g. self-freeing work) and that
> > mechanism would not go through ScopedWork.
>
> This is your design and you know this area far better than I do, so pleas=
e
> take this with a grain of salt. That said, I wonder whether the interface
> is more tortured and twisted than it needs to be.

Always happy to discuss! Thanks for the question.

> Workqueue lifetime seems to add a layer of ugliness, at least going by th=
e
> restrictions on ScopedWork. Wouldn't that be relatively easy to solve by
> adding a percpu refcnt to the Rust wrapper of workqueue and tying work an=
d
> delayed work items to it? Dropping the workqueue would wait until nothing
> is pending, and cancelling delayed work items before that would be up to
> the user. Work and delayed work items would then behave the same way and
> be usable on any workqueue.

I'll take a step back for one moment. The previous version of this
patchset did not have the lifetime in question. Adding a percpu
refcount doesn't resolve the issue that made me add it, unfortunately.

The problem is: if we drop a ScopedWork early, then once
cancel_work_sync() returns, we may free resources used by that work
item. Obviously if the work item is still executing on some workqueue
after cancel_work_sync() returns, that would be bad, as it would use
resources now freed.

Originally I did not think this was an issue. I assumed that if
cancel_work_sync() returns, and there was no concurrent resubmission,
then it would no longer be running. However, this is not true:
https://lore.kernel.org/all/20261118-ordered-wq-cancel-v1-2-916e01f9affe@go=
ogle.com/

My fix for this issue was to add a &Workqueue field to ScopedWork and
enforce that the scoped work item can only ever be scheduled to that
one workqueue. By only ever using it with one workqueue, I know the
non-reentrance conditions hold, and so I know that when
cancel_work_sync() returns, the work item is not running anywhere, and
hence it's safe to perform cleanup.

Of course, there may be other ways to enforce the non-reentrance
conditions hold, which could let me get rid of the lifetime. But the
lifetime is there to handle the cleanup before destroy_workqueue() is
called case, so a percpu refcount does not come into play.


Alice
