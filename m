Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000617;
	b=4uk8DBWAX3LHc9g4Ow6CWaM8tZ2NoAwnOIeRtulOo4VrWALfw6lLczYpkROAcRy81864
	 VnS8YNshaD8pI9z63IcBZWEQGZGx8NnHaHYMxvzmIm/l79s51QLxGEpRVMqHwSPVnhKvU
	 4E7OO3mm4J0iODs2YdT1EPw2dgX/E5j5ABC9OWlY941EM8bTMXZOR9//lL/0FPETv4unY
	 050sEMn9rPKoZVWfF3ycFe45YV0MdiS5iJePivl/H9rSTDpnyJ0/8e3OGvwtGQmEWDJ5E
	 eXr6w+nR0y/n33sl5zS47tSlFZxkwR540NkIuj8e+XFUaaWAtbrPAstMNhaJst8OwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VdBK9iPCpdL4SaGML/svEnUVQsDV7jsVMj4rTVCaMEQ=;
	b=idURfeqlHmszwZqZ/4iuKGUW9W7/7C31YSxAmwQkrvR/m68hSqSxmhDDEj0fnt0qvgCy
	 Q2KPLCplngwhvFx+1DJMdS9MfrmB7HiSD8okTDTG+7+CFTZ1V7PlZOJLqW9Ea/Nz40q16
	 T3yZZRqZxWXmu19sg49hEiqdScQQN+Mm5dK6PBxRGVUHnWx9l7NQBuL//yd3HKLWghvws
	 A4XiUeaVdM4nInQu22369v4pJJ+8ss2T13UsCBj4oc9H/4xOpe6RvcD9h3rZIktRp5hEz
	 ZfG9zN8KKcDPGTw3GKVDbBYmKGHWoDNvbr0HyAIyNP6YqsYn29Jw7/w8wOE9qvBFUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CnbFd2fo;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6F9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CnbFd2fo
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso7774545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795000615; x=1795605415; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdBK9iPCpdL4SaGML/svEnUVQsDV7jsVMj4rTVCaMEQ=;
        b=CnbFd2foIc1oP4OQ+apE2+PUd8KhbCuov0KPVg6H49pjv3XxrZ0chRd8fFEo4IzCfU
         wyLRlrpnxS/eAB8q8r2DVSttlIn6STnYOMtUi+60CnXVALhmXCdujG63j1PnzXy6P1S0
         XkqUd15s+lkpVUD/GDZaFYVv7QQLT2a/R56lgjgLsFQG2jaiq4rTaQqKNO04FRjR0qDZ
         whBjXblsWfzMiVxHo3KL4ZB/muJ+nfRJCEb6S/3Gg+bx5WV0mhTIM77xmVF4VsjEpa7x
         OXJIIRwi4spArEDSI11y2mU+tRW7hwbH3pDkZmIuIOorrmjyFlsTMar8E/wCpi76AQMX
         e8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000615; x=1795605415;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdBK9iPCpdL4SaGML/svEnUVQsDV7jsVMj4rTVCaMEQ=;
        b=axJn8wQFBBuE4htbW0A7hHIaFacvsdh8yQDV7k+dsXfnDVe2mTUyX/0DCyRjgR1TJw
         1GQp9Gi5Hwtp8YbzuIF29LtBqTaQ7w5oVWtiXEEX+R1uuVxao7thkSAxP+YCdVO/9reY
         FR4ZuqDw3iEBnIf7aIRR0uvVQC+fgTtBUb2wtv+yvDq3LuIisVaZHWa1JrVUw4JFo6G5
         71bdIzr3e81Y12b8imEfxOvYsrX3VbzutoYkB5u6xEbbL+S3OqwKC6V3H6aYCEHsfOf1
         8XI+b7sA9KLigF3w5At3dQ7HhlJfESTRVhkdFwPjXRsgj1J7pohVHIaC5IHlUvU27PDo
         ykaQ==
X-Forwarded-Encrypted: i=1; AL+hErFGvFe40YADyoJAvmNWmelyV6J+Tn2wyeWRT/ok2LUZl8+I1aJtRbyWmG+Ay8chRHBSfw5+/2laLicn4nY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N8/hUkLluJryrL7hZQO1TRKrn4KfkMopYeWWzdgvwb6PHHwml
	nlheemX6ard6tvIjZ21yMPhA9RNqK4kCwVQo1xGRiMg5KVOw7gRjcCtrm1/C+8w4u/mMeqZTEB/
	WB4zOFE+5/tgZXc8YLg==
X-Received: from wrsw6.prod.google.com ([2002:a5d:4b46:0:b0:4a5:1c26:11b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d06:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb7da14a3bmr43246995e9.12.1795000615091;
 Wed, 18 Nov 2026 03:16:55 -0800 (PST)
Date: Wed, 18 Nov 2026 11:16:53 +0000
In-Reply-To: <0d26baaa-92ae-43ff-9a76-a81cad624dcf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
 <20261117-tyr-remap-2mb-v1-1-2a8efd4c8180@google.com> <0d26baaa-92ae-43ff-9a76-a81cad624dcf@kernel.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118111653.448550-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/4] rust: drm/gpuvm: add GpuVa::data_ref accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 08:40:20PM +0100, Danilo Krummrich wrote:
> > +    /// Access the driver-private [`VaData`](DriverGpuVm::VaData) associated with this mapping.
> > +    #[inline]
> > +    pub fn data_ref(&self) -> &T::VaData {
> > +        &self.data
> > +    }
> > +
> Why data_ref() instead of just data() or a Deref impl?

I guess this came from mirroring UniqueRefGpuVm, which uses the names:
data_ref(&self) and data(&mut self).

I think it makes more sense to rename to data(&self)/data_mut(&mut self)
for consistency with other similar APIs. But we should also update
UniqueRefGpuVm if so.

We don't want to go the Deref/DerefMut route because mutable access needs
to return a `Pin<&mut GpuVa<T>>` which doesn't work with DerefMut.

Alice
