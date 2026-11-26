Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663656;
	b=uscL/zr7n2xIwzvnVLnNDM0R3FZIC+gzXZrG8fwQOZlHpUKkVYxuBb+vpgQkjwKXWJwB
	 wPg+p7ktvViZJdhT1md/U4KyYSgPRFRCE0VlIVklB2G9QlG3EBh2W4KHHVpUBqpw19C/r
	 rdJbca+XpblLFMGCr2VEQCsor+ZAzX0CiaMFrS/3eU0U+SYylmgYOjWGcBi8Og5YBLI/v
	 EN5FkDtnZLE7MX00g1SPawLmgduyJWhGdNmu8Qc3baUpC8U012y5dlo98VR6GJs4hN5el
	 1e7KPwwcNy/HRf2nJIFqSOQ/R2lfdlhUc00Cbz0msOyDJ9oy4DTdTYvIg8tYUKVdKpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rHPmMuoGHNMoQTUIGEVMgOH3fqXjK9wihPYFz2zN4Sc=;
	b=lcJVEeFHI+Jn66ePmN+ZQQqfv9yzqTeYZrH4PIbE97sHbKCASVa0VlVbpm0IHMxjzipq
	 sAc+l7+ycXLNCrkXLR/D6USCYmgFzpWOMieiw5OTB3jk+gTJUlwfY3YVG8msaUjDVL3GK
	 zKLYmfQsNODc7OszfLih+SbmbKFxYKY1GgbIX1u2iZLmGK7aXYF0sSlLXWPdlxtVt6dUW
	 oCPSDLvXrnKzqwCKMgjX/uTyrENh9NH8hAMu9358MjPZxQ/a01RRTPgQem1zaLdqbhxCt
	 fc6xKYF385IV+V5AKuiAgKEkbX9IBY6KZraUh164Zo5AZ3hzjwJeeB/CzCT89G73VvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=mOF0oNNZ;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316CD606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=mOF0oNNZ
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-943e8d35f74so643716885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795663655; x=1796268455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHPmMuoGHNMoQTUIGEVMgOH3fqXjK9wihPYFz2zN4Sc=;
        b=mOF0oNNZ7zs4Aflx2JGqonO8/xWxHuYidUjZ2cXNSL2HJFvmPErd+/XT/bwZ9/u19H
         rXwNWDgMgagZ4652a7bQon6GVV/l3rQPuI1FNb3FGlyxc++Kl80Fgv42QF3dpcdN5POD
         MZUOrP0XoID851f0LINFrM+XtrXg7KmU7VzTDHP9byeGICZuelsX3SCcWaDuVft98DUX
         9CGHs+ShgHJwvlYnTtIGMDBUFB0W5BHv6Jl7isdyWjjVuiODJGCmUcoNt6f7MfqTTFTN
         NSH6LbnlFYs5a8Gfni/3Pd8Py6KWWWFeZWGO/0S//hKen8TCG+OvxS71cyKESt5cItks
         U1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663655; x=1796268455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHPmMuoGHNMoQTUIGEVMgOH3fqXjK9wihPYFz2zN4Sc=;
        b=bSSvSjkQhpmTji9chBo3XTJKIcr7L3Z1mVv4XnFjFYGukGMEM9I06L/OEPG7fkfNr7
         MzMcxnXUILI/7nT3KrePfgBqqxZIGOkU+DuOmHPDDDBVylUtYzzd98j/JLmC1qjY/lPa
         e181fDluIK1Iji8GQAAFIpy9hNKe9geOjQZu/CbQqxVkiQgMorLfKodABkL8jE+VQQnT
         tiHT9SNZSjK5ny6YP3J8/TZzQYispHssxgdOa/zuggd7uZlbkmRZ8lIJIVl/dRohyP/1
         ZKXpWWVMH/6lbX2W1go9WmzIKoOqQscdw4WmTjToLA4DtpjnDG1vspUW/jbPKj6ONJUZ
         LoVQ==
X-Forwarded-Encrypted: i=1; AL+hErH93pA06BoQk/PPu6yhLgXfvMKAswJwuppoPKWK/vo0Zg6fqxSHus9s6wF/HKAcukTuVGUb+TuZYtd/pzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9It77g1FmdK3RmW1P6DUBHYJmNj5fwcQUkftgB2po+QXtxHIYo
	Z9w8bMs64c1XGVKxGyaGdpN4J+IrWvAb9oI8fIzDZ83CYwCCu60eXgmdlyIEFUJIjan4SIo7JLC
	dOyzy0Q==
X-Gm-Gg: AZFdTZczr3DIYxflrxMYQxoK6KqbHtUJqOcgCJtz5gayt7hW1QWtxZ4xJVmrCqmyHIc
	OwPmdYOpVaFHr1X/3RmYvmcx6ppFfOLPXxgkz1/jyn5lhK6Bac1RyTKpdHSuDlTP7JIbmnNaaXa
	Z7YJnRyKjnokHP1DBZfJTogS5xfIGTiqeB5ob7BSdETwVO3WJw9ZU0p6iaMvL8dJKsxf1/Wvv7o
	rvhb76PvAL7hZ9dFhNbM/u3jzYweP+lzYw1ahrWsjxagb3rNJl0/z8iLi42lcudwuONskU2Rq+I
	0M1peTv7NX83xCmZ8/caYOMVNWcMwLshxKtxU1l+/1FuoKOsXRizLExboZtt3fKWO47TInOfYm0
	9OdI//Ck8jwI+l13QsbcMLjiqCJlx2qA2OftTVJp1fv8BqKbBltC9bdMVQoBjohL4axZ6LSaXQq
	5jvO/medVvUfy2ZY6p+JczMkBPuX3RMNG+WFaUKAKgTL9EAqSU6wEK3w7qs/xD4dIVwtwItPZMZ
	uth89BIGBUBuZ+bfjxNrF/EBaktIayG04sGHuFC6rPr6Glk+bLz7fSGpvzD+ZS8gHthEggZudtd
	bpoDzMwSP5FkVvlL8x/PZ5YbbiTIzw==
X-Received: by 2002:a05:620a:a8d4:10b0:93e:c03c:c2ab with SMTP id af79cd13be357-94a0327418cmr649897185a.20.1795663654963;
        Wed, 25 Nov 2026 19:27:34 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38319asm1470186885a.16.2026.11.25.19.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:27:34 -0800 (PST)
Date: Wed, 25 Nov 2026 22:27:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 2/4] usb: gadget: gadgetfs: fix ep0 setup abort and
 unbind state races
Message-ID: <c304b43a-0a75-4408-8cce-9f4e6a1c5a59@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com>
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
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com>

On Tue, Nov 10, 2026 at 12:13:23PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> Several ep0 state transitions lose setup abort notifications or leave
> the file descriptor in an inconsistent state when control requests,
> disconnects, or unbinds race with userspace I/O:
> 
> 1. ep0_write() drops dev->lock while copying an IN payload from
>    userspace.  If a new SETUP packet arrives in that window, the stale
>    response must not be queued for the new transfer.

The window can be reduced but not eliminated.  After all, once dev->lock 
has been dropped there is no way to know if a new setup packet has just 
arrived.

> 2. ep0_read() waiting for a delegated control OUT data stage only checks
>    dev->setup_out_ready, so it does not wake when a new SETUP packet,
>    disconnect, or unbind aborts the transfer, and can consume a newer
>    transfer's payload if dev->state re-enters STATE_DEV_SETUP.  In
>    addition, gadgetfs_disconnect() overwrites STATE_DEV_UNCONNECTED
>    before next_event() checks for STATE_DEV_SETUP, skipping setup_abort.

The problem will not exist once new setup packets are prevented from 
aborting older control-OUT tranfers.

> 3. Early returns in gadgetfs_setup() on oversized OUT requests or a busy
>    ep0 request skip setting setup_abort when aborting STATE_DEV_SETUP,
>    while ep0_poll() clears setup_abort before ep0_read() or ep0_write()
>    can report -EIDRM.

These should be relatively easy to fix.

> 4. gadgetfs_unbind() leaves queued events readable in STATE_DEV_UNBOUND.
>    Delivering a queued GADGETFS_SETUP event after unbind puts dev->state
>    back into STATE_DEV_SETUP after dev->req and ep0->driver_data have
>    been cleared, causing a NULL pointer dereference on the next ep0 I/O.

How can an event be delivered after gadgetfs_unbind() has finished?  The 
unbind occurs when usb_gadget_unregister_driver() is called, which 
happens when the user program is closing its file descriptor for ep0, 
leaving no way for it to read any events.

And as before, these issues are all totally separate so they belong in 
separate patches.

Alan Stern
