Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019989;
	b=wwkQ3a7Net3aGwAW/AdBJVWVC693EBfMGbXoKPPErnvdXj/s81+wRSWTzln04rrjo9vz
	 LkxPynhoTSoW77SrbFENJY+DIbXncLKomdlbQaR8jn6Fn4/cFSBcgCyrzWiB0cfWrALip
	 Xsd4r9B33xBP9WflcZwy65QMBo5bgV2GsB4Fr9cLLo4uJpgOOtFdPDADywJRXCkUk+Gju
	 V4x3zL2daQLjGesNFJ+NE0RqKUTENfcNpivJTgMBgZRp9ixFrGiu3pKn+op8bw+qXUnvW
	 v54I/2bStaNiI2223iRrxy5s9JrIAytJG/x2UU58zH264Z+stUlAp31rs6T6mY8FaoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=y0TMrCzbGMAXa1cTU4qckddvOIHma2PxgVYHTYEMX2w=;
	b=fidFeE1WKr64v4E7etRGZ4bCqB3jLutoj9IhRbWS/1vBBEkz4k2bVigaYEr4nqgRFlT6
	 bT3630pcT/Ns5DyuK0yfG+vxdYkgiHZPz1w4zV7rqqeLj57MQezN2Y9vtQ3svgqNGqDaz
	 imnUEqhF4rGAAYP8cR4VXcUEbWkr6VNnI3Uakr2acRpTWkbYiX6iDbMzhFf9mCnVvIQvt
	 gulTeM/d7/0rfx0VHdJUgtwx4DBpgLMFZfupl91bZItwZWyjEqxHTxJrIQr7zM//tMnqv
	 +GpvN1AGY3tvWsPkggr+s98uM3h4xg24aaLhoKc5L0d+gL36XFAq11iQgQ5UWEIV1MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=E2MyY97I;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C130606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C130606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=E2MyY97I
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so2188199a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795019982; x=1795624782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0TMrCzbGMAXa1cTU4qckddvOIHma2PxgVYHTYEMX2w=;
        b=E2MyY97IaK7EIbtBNaVLxa+z7XuY4/4AGso9YjgYYgpjkuOqR5LhFecy9cjZu0OGtF
         Mk6hujlebYW/uKXKjpxKKJrwIQf0fZyUZRa0/RRi4MbhF9bQaCHHcJ3rtmqp7P/yE16T
         5TZTuc7weUhgz++UFJKOF1s0z922xbloa8JTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019982; x=1795624782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y0TMrCzbGMAXa1cTU4qckddvOIHma2PxgVYHTYEMX2w=;
        b=RY8jgLC4p0zVKIVgVtGSsD1wPGU77ToDiETFA5adyAoqm66pZ50+vxvlJ7VKmTRDpC
         4l+kuzHn2caTkDDgDfxHYSNPsvBFOX9W2tnA3zqaWGWduYK+x7LCEyUIqT2C/lACBwH9
         vvOmpepUy19IefZJGLCfi/kgehjdE6BfFAVlo2EcDhg92KN60VD5mkx2fuSMHoNfpG/2
         zuaU3igmuDwmxIg3mWObYMFvTQbth477Evnlw0+ECLffSjdhTjIlBlhD5phhv0F+b5Qm
         Jcco5erTSVlo+Bo1Nz09JoPkGeNy5Eo8omYyYLPLNCq/xeuiZFPJj9I2HvGq655X+fbc
         6y6g==
X-Forwarded-Encrypted: i=1; AL+hErGNYNIG/5oVR6w6EUafFLC3yda81byiVf3m+8I2aczwN1vmqMejzyPVkg2EY7vF5o/GoOFrgsvwGd8zfUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fAY3E2TZY9fC+mgeTumnOfd2mh1VbqcqELqXQvD8/IoH8eikF
	HqnVMtu0yjtFmDZnNhUwFbIIbySxoZw8YcbkRE8mEDeai3xSjGnwwrHAWEVafFHtgP5PCUNL8WF
	LP/utKh9HPQ==
X-Gm-Gg: AYBFou2REbRsTPHf61ZOHTXNmak74Sz2Bmt8pZ7uUOFsx2zoPafBA2KdYK8J02zroBy
	Ofxs95AmTBvzvkWwgE5ro24QQAN2b5UcR9QC8tmjSbIbR1pBnw6zX44kpERMfZq4GoFKCKgf/aD
	/VrAZX8Dk1RnDmIUlG6oAozQD4ioArHika91nU2ikJfzkgaDLu41vUZmyFdAZy4/Oj0B3zQBe6M
	mwxLI511pxWiM0bB2NO4cVUsgnP9TOKZJI/jWH1XKElZHlTQMzrunOnF4fafGLr/arGmMb07Itf
	P5/fc1GYMXAVlAFwuy33UhlMDEXPFev8pyCjAVEhHKNsvC9BNXxt1jrn6px2SqKwnyy6bLtMMkO
	vG4BS1IeUkWE/DN5huGfHKrYmZhIrNNB39b8aOz+Cwmx1wL6oiZQ9F10d9XrauXQwt6wuEcnl7I
	ZEa9LsX4Rd2eJkNBAEwhZ6vyjxY4peCEsNxpm/U5kVlGyQNqLjn4MZdk+3HBuJ2wMPrdyu1ERqU
	sO7v6OiT4pNBn4E8LFIQKfXEnObR5SoLWedmXxST7BKlndU2F5E62nnAF60CcbXmYlCPmuJX0W3
	WO5TH21BkgxUwYIbAcOiU8stYZhbeMMYNJfh1iX0tkUUp57eZniJcfHipX57ki/FZMq1v/G3gpa
	GBwU=
X-Received: by 2002:a05:6402:4546:b0:6b7:8b02:726e with SMTP id 4fb4d7f45d1cf-6b859b7994cmr4057589a12.18.1795019981475;
        Wed, 18 Nov 2026 08:39:41 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b889c2379asm1349484a12.17.2026.11.18.08.39.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:39:40 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so471715066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:39:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfafmmK9VQQp16+FKILNBZrPXkViGIPoUDdZTsTclGFip6irEMQyvw16W2NiM45BhD3poDF66Tt90y4D8=@vger.kernel.org
X-Received: by 2002:a17:907:1c9b:b0:c4d:31be:1f27 with SMTP id
 a640c23a62f3a-c51260bf92amr3511966b.9.1795019980203; Wed, 18 Nov 2026
 08:39:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com> <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
 <avyODoFhZ_M7YDU5@redhat.com> <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
 <avyVwg-5ef-pXZkG@redhat.com> <CAHk-=wjJF8uZLfVbbqei9-fhs9K70i2OnVreCV-rQF9EGKAxJg@mail.gmail.com>
 <CAHk-=wjqParwoB8wb9KfGVpbwUwvKvObpLOo=XPM0GGfkn3ibw@mail.gmail.com>
 <av2juQijIISJAgyf@redhat.com> <CAHk-=wg4RgBYZcUU+c16XxdZ4UbAaazJkUS=R6=tpN4xUBdDRw@mail.gmail.com>
 <av3SmRMGDLVAwMzK@redhat.com>
In-Reply-To: <av3SmRMGDLVAwMzK@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Nov 2026 08:39:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wifUn5X6LeT+-A3mW9JtDcfx2x-5xsWpTxXzThibsK6Ww@mail.gmail.com>
X-Gm-Features: AclHuK8yADyTYfgQF-cxDlxPVAPrNzQpmw9eeowiVPqEa19tx8pNj1uFwz9vJyA
Message-ID: <CAHk-=wifUn5X6LeT+-A3mW9JtDcfx2x-5xsWpTxXzThibsK6Ww@mail.gmail.com>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org, 
	Mani Tofigh <mt4022@columbia.edu>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 08:30, Oleg Nesterov <oleg@redhat.com> wrote:
>
> On 11/18, Linus Torvalds wrote:
> >
> > Some duplication - with explicit naming of the locking status for the
> > special cases that are called with the lock already held - is much
> > preferable to dynamically doing the locking
>
> OK, this was my plan B ;) I'll try to make a patch this week.

I've applied my cleanup patch in the meantime, it was obvious cleanup
and I didn't want it to cause unnecessary conflicts with anything you
do in this area.

I haven't pushed it out yet, I have a few pull requests pending that
I'll go through first.

          Linus
